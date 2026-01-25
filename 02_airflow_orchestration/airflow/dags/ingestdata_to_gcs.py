import os

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

from datetime import datetime, timedelta
from google.cloud import storage
from airflow.providers.google.cloud.operators.bigquery import BigQueryInsertJobOperator
import pandas as pd
#from pyarrow import csv as pv
from pyarrow import parquet as pq

#Dataset URL and local path in docker container
dataset_file = 'yellow_tripdata_2021-07.csv.gz'
dataset_url = f'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/{dataset_file}'
path_to_local_home = os.environ.get("AIRFLOW_HOME", "/opt/airflow/")
parquet_file = dataset_file.replace('.csv.gz', '.parquet') 

#Setting GCS variables:
project_id = os.environ.get("GCP_PROJECT_ID")
bucket = os.environ.get("GCP_BUCKET_NAME")
bq_dataset = os.environ.get("GCP_BIGQUERY_DATASET")


def format_to_parquet(src_file):
    if not src_file.endswith('.csv.gz'):
        print("Can only accept source files in CSV format, for the moment")
        return
    table = pd.read_csv(src_file)
    table.to_parquet(src_file.replace('.csv.gz', '.parquet'), index=False)  
    #pq.write_table(table, src_file.replace('.csv.gz', '.parquet'))


def upload_to_gcs(bucket_name, object_name, local_file):
    storage.blob._MAX_MULTIPART_SIZE = 5 * 1024 * 1024  #5 MB
    storage.blob._DEFAULT_CHUNKSIZE = 5 * 1024 * 1024  #5 MB

    client = storage.Client()
    bucket = client.bucket(bucket_name)

    blob = bucket.blob(object_name)
    blob.upload_from_filename(local_file)
    print(f"File {local_file} uploaded to GCS bucket {bucket_name} as {object_name}")

default_args = {
    "owner": "airflow",
    "start_date": datetime.now() - timedelta(days=1),
    "depends_on_past": False,
    "retries": 1
}

#DAG definition:
with DAG(
    dag_id="ingest_data_to_gcs_dag",
    schedule="@daily",
    default_args=default_args,
    catchup=False,
    max_active_runs=1,
    tags=['dtc-de']
) as dag:

    download_dataset_task = BashOperator(
        task_id="download_dataset_task",
        bash_command=f"curl -sSL {dataset_url} > {path_to_local_home}/{dataset_file}"
    )

    format_to_parquet_task = PythonOperator(
        task_id="format_to_parquet_task",
        python_callable=format_to_parquet,
        op_kwargs={
            'src_file': f"{path_to_local_home}/{dataset_file}"
        },
    )

    local_to_gcs_task = PythonOperator(
        task_id="local_to_gcs_task",
        python_callable=upload_to_gcs,
        op_kwargs={
            'bucket_name': bucket,
            'object_name': f"{parquet_file}",
            'local_file': f"{path_to_local_home}/{parquet_file}",
        },
    )

    bq_external_table_task = BigQueryInsertJobOperator(
        task_id="bq_external_table_task",
        configuration={
            "query": {
                "query": f"""
                    CREATE OR REPLACE EXTERNAL TABLE `{project_id}.{bq_dataset}.yellow_taxi_data_202107_v3`
                    OPTIONS (
                        format = 'PARQUET',
                        uris = ['gs://{bucket}/{parquet_file}']
                    );
                """,
                "useLegacySql": False,
            }
        },
    )

#Setting up task/job dependencies
download_dataset_task >> format_to_parquet_task >> local_to_gcs_task >> bq_external_table_task