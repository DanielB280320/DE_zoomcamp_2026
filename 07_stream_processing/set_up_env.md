## Environment setting up: 

    PS1="> " # Adding this variable to .bashrc to create a new line when using the terminal.

Setting up: 

    pip install uv # Install uv

    uv init -p 3.12 # Initialize a virtual environment with python

    uv add kafka-python pandas pyarrow # Installing required dependencies

    uv add --dev jupyter # Add jupyter as dev depency

Specifing the python environment to use: 

    .venv/bin/python # When creating a uv, the path where the specific python version is stored. 

IMPORTANT: To avoid problems when using virtual environments, its recommended just work within the dir project when we created the uv, if not it probably will not recognize our uv and can use any other within our system files

See all the logs when initializing an image: 

    sudo docker compose logs <image> -f

Create, delete or describe topics in Redpanda: 

    sudo docker exec -it <redpanda-container-name> rpk topic create <topic-name>

    sudo docker exec -it <redpanda-container-name> rpk topic delete <topic-name>

    sudo docker exec -it <redpanda-container-name> rpk topic describe -a <topic-name>

To use a dependency/packages without installing it we can use uvx: 

    uvx pgcli -h localhost -p 5432 -U postgres -d postgres
    
drivers to connect to the postgreSQL database: 

    uv add psycopg2-binary


### PyFlink: 

Flink is a streaming processing framework/platform that take care retrying events when there is an error or when events arrived late. 

When using Flink our consumers will not be running locally, instead, will be running in the Flink's cluster. 

Setting up PyFlink: 

    # Downloading required files:

    PREFIX="https://raw.githubusercontent.com/DataTalksClub/data-engineering-zoomcamp/main/07-streaming/workshop"

    wget ${PREFIX}/Dockerfile.flink
    wget ${PREFIX}/pyproject.flink.toml
    wget ${PREFIX}/flink-config.yaml

Change the owner of a dir/file: 

    chown <user> src

    # Identify the owner of a dir/file and additional info
    stat <dir/file name>

    # What user I am
    whoami

IMPORTANT: When we are creating the flink image, we need to set up all drivers for the different connections we will be using (eg. PostgreSQL db, s3, gcs, redshift, bigquery, etc.) 

Executing a Flink job: 

    # example: 
    sudo docker compose exec jobmanager ./bin/flink run \
    -py /opt/src/job/pass_through_job.py \
    --pyFiles /opt/src -d

    #example:
    sudo docker exec -it <jobmanager_container> flink run \ 
    -py /opt/src/job/your_job.py

    # example 3: 
    docker compose exec jobmanager ./bin/flink run \
    -py /opt/src/job/aggregation_job.py \
    --pyFiles /opt/src -d

Window Time functions with SQL Flink: 

    All four window functions produce the same default columns: 
        `window_start`, `window_end`, and `window_time`.


    FROM TABLE(
        TUMBLE(TABLE events, DESCRIPTOR(event_timestamp), INTERVAL '5' MINUTE)
    )
    GROUP BY window_start, window_end, PULocationID


    FROM TABLE(
        HOP(TABLE events, DESCRIPTOR(event_timestamp), INTERVAL '1' MINUTE, INTERVAL '5' MINUTE)
    )
    GROUP BY window_start, window_end, PULocationID


    FROM TABLE(
        SESSION(TABLE events, DESCRIPTOR(event_timestamp), INTERVAL '5' MINUTE)
    )
    GROUP BY window_start, window_end, PULocationID


    FROM TABLE(
        CUMULATE(TABLE events, DESCRIPTOR(event_timestamp), INTERVAL '1' MINUTE, INTERVAL '1' HOUR)
    )
    GROUP BY window_start, window_end, PULocationID

### Quick Comparison

| Function  | Window size    | Overlapping | Closes on              |
|-----------|----------------|-------------|------------------------|
| TUMBLE    | Fixed          | No          | Fixed time boundary    |
| HOP       | Fixed          | Yes         | Fixed time boundary    |
| SESSION   | Variable       | No          | Inactivity gap         |
| CUMULATE  | Grows to max   | No          | Max size boundary      |