## Spark with gcs:

    # Copy a local file to a remote location in a bucket in gcs.
    - gsutil -m cp -r taxi_data_pq/ gs://bucket-spark-2026/taxi_data_pq  

Spark gcs connector: 

    - gs://hadoop-lib/gcs/gcs-connector-hadoop3-2.2.5.jar # Spark gsc connector

    reference: 
    https://docs.cloud.google.com/dataproc/docs/concepts/connectors/cloud-storage?hl=es-419

    Download it from gcs remote location to our machine: 
    - gsutil cp gs://hadoop-lib/gcs/gcs-connector-hadoop3-2.2.5.jar gcs-connector-hadoop3-2.2.5.jar