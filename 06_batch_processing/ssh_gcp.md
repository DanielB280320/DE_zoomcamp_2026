## ssh access with gcp: 

We need to create first a .ssh directory if it doesnt exist in our host machine. 

    - ssh-keygen -t rsa -f gpc -C daniel -b 2048 # Command to generate ssh key in our local system (linux); It will generate a private key and public key, also the private one never must be share with anyone. 

path to enter ssh key in gcp: 

    compute engine > metadata > add ssh key
    
When adding a ssh key in our project, all the instances (VMs) inherit the same key.

Connecting the gcp VM from our host: 

    ssh -i ~/.ssh/gcp daniel@35.224.182.183

    htop # Access the resources of our VM

To config the access to the VM from our host we need to create a config file within the .ssh directory with the following set up: 

    Host gcp-vm           # Connection name
        HostName 35.224.182.183 # External IP of the VM in GCP
        User daniel       # User we defined when creating the ssh key
        IdentityFile /home/aniel/.ssh/gcp # Path to the private ssh key


    sudo apt-get update # updates the list of available packages from the internet — it doesn't install or upgrade anything, just refreshes the package index so your system knows what's available and at what version.


## Installing Spark: 

Spark requires Java 17 or 21; to install it: 

    https://jdk.java.net/archive/
    sudo apt update
    sudo apt install default-jdk
    tar xzvf openjdk-21.0.2_linux-x64_bin.tar.gz # Unzip java
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
    


