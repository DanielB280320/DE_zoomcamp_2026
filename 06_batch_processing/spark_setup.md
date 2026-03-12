## Installing Spark: 

Spark requires Java 17 or 21; to install it: 

    # Install Java default version: 
    sudo apt update
    sudo apt install default-jdk
    
    # Install Java specified version: 
    https://jdk.java.net/archive/
    tar xzvf openjdk-21.0.2_linux-x64_bin.tar.gz # Unzip Java .tgz file
    export JAVA_HOME="${HOME}/spark/jdk-21.0.2" # Set JAVA_HOME
    export PATH="${JAVA_HOME}/bin:${PATH}"

Installing spark: 

    https://spark.apache.org/downloads.html
    export SPARK_HOME="${HOME}/spark/spark-4.1.1-bin-hadoop3" # Set SPARK_HOME
    export PATH="${SPARK_HOME}/bin:${PATH}"

The previous variables must be added to .bashrc to maintain its values each time we initiated our Linux system.

Before initializing a Jupyter notebook,  we can specify the python path where to find the pyspark module/dependency: 

    export PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"
    export PYTHONPATH="${SPARK_HOME}/python/lib/py4j-0.10.9.9-src.zip:$PYTHONPATH"

To unzip a file: 

    gunzip xzvf file.zip # for .gz files
    tar xzvf # for .tar.gz / .tgz files

        x = extract
        z = decompress via gzip
        v = verbose (show progress)
        f = specifies the filename

Linux commands for manipulation files: 

    wc -l filename # see the number of records in a fiel
    head -n 101 fhvhv_tripdata_2021-01.csv > head.csv # Select the first n rows specified. 
    ls | wc -l # Count the number of files within a directory
    tree -lh directory_name 
    zcat filename.zip
    
SparkSQL order execution: 

    .withcolumn()
    .select()
    .filter()
    .groupby()
    .agg()
    .filter()
    .orderby()
    .limit()

## Creating a local spark cluster: 

    ./sbin/start-master.sh # start spark master
    ./sbin/start-worker.sh <spark master url> # start spark worker

    URL='spark://de-zoomcamp.us-central1-c.c.project-0c3c5223-416f-4242-b0f.internal:7077'

Submiting a Spark job to local Spark cluster: 
    
    spark-submit \
        --master="${URL}" \
        Spark_local_cluster_conn_gcs.py \
            --input_green=/home/daniel/notebooks/taxi_data_pq/green/2020/ \
            --input_yellow=/home/daniel/notebooks/taxi_data_pq/yellow/2020/ \
            --output=/home/daniel/notebooks/taxi_data_reporting/revenue/2020

    ./sbin/stop-master.sh # stop spark master
    ./sbin/stop-worker.sh # stop spark worker
