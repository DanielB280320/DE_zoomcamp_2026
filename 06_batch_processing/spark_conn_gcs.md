## Spark with gcs:

    # Copy a local file to a remote location in a bucket in gcs.
    - gsutil -m cp -r taxi_data_pq/ gs://bucket-spark-2026/taxi_data_pq  

Spark gcs connector: 

    - gs://hadoop-lib/gcs/gcs-connector-hadoop3-2.2.5.jar # Spark gsc connector

    reference: 
    https://docs.cloud.google.com/dataproc/docs/concepts/connectors/cloud-storage?hl=es-419

    Download it from gcs remote location to our machine: 
    - gsutil cp gs://hadoop-lib/gcs/gcs-connector-hadoop3-2.2.5.jar gcs-connector-hadoop3-2.2.5.jar

## Submitting Spark jobs to gcs with dataproc: 

    #example: 
    gcloud dataproc jobs submit pyspark gs://bucket-spark-2026/Spark_job_code/Spark_local_cluster.py \
  --cluster=de-zoomcamp-cluster \
  --region=us-central1 \
  -- \
  --input_green=gs://bucket-spark-2026/taxi_data_pq/green/2019/ \
  --input_yellow=gs://bucket-spark-2026/taxi_data_pq/yellow/2019/ \
  --output=gs://bucket-spark-2026/revenue/data_2019

Spark Bigquery conn: 

    Reference:
    https://docs.cloud.google.com/dataproc/docs/tutorials/bigquery-connector-spark-example#pyspark'

    #example 2: 
    gcloud dataproc jobs submit pyspark gs://bucket-spark-2026/Spark_job_code/Spark_conn_bq.py \
  --cluster=de-zoomcamp-cluster \
  --region=us-central1 \
  --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar \
  -- \
  --input_green=gs://bucket-spark-2026/taxi_data_pq/green/2019/ \
  --input_yellow=gs://bucket-spark-2026/taxi_data_pq/yellow/2019/ \
  --output=trips_data_all/data_2019