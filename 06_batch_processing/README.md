# Batch Processing

## Introduction to batch processing. 

### Overview

Week 5 focuses on **batch processing** and **Apache Spark**. Topics covered include:

- What batch processing is
- Introduction to Spark and why it's useful
- Installing Spark on Linux (via Google Cloud Platform VM)
- PySpark (Python API for Spark)
- Spark features: DataFrames, SQL, Joins, RDDs
- Running Spark with Docker
- Deploying Spark to the cloud
- Connecting Spark to a data warehouse

---

### Batch vs. Streaming

There are two main paradigms for processing data:

| | Batch | Streaming |
|---|---|---|
| **How it works** | Processes a large chunk of data all at once | Processes events in real time as they occur |
| **Example** | Processing all taxi trips from January 15th at end of day | Sending a trip-start event the moment a passenger boards |
| **Week covered** | Week 5 | Week 6 |

---

### Common Batch Job Intervals

- **Weekly** — process an entire week's worth of data
- **Daily** — most common; process everything from the previous day
- **Hourly** — process everything from the previous hour
- **Sub-hourly** — e.g., every 5 minutes (less typical)

---

### Technologies Used for Batch Processing

- **Python scripts** — e.g., the data ingestion pipeline built in Week 1
- **SQL / dbt** — transformations covered in Week 4
- **Apache Spark** — the focus of Week 5
- **Orchestration tools** (e.g., Airflow/Prefect) — used to chain batch steps into a pipeline

---

### Advantages of Batch Processing

- **Easy to manage** — workflow tools allow parameterization, scheduling, and retries
- **Safe to retry** — since processing isn't happening in real time, failures can be re-run cleanly
- **Easy to scale** — can increase machine size or add cluster nodes as data grows

### Disadvantage of Batch Processing

- **Delay** — data is only available after the batch window closes *and* the pipeline finishes executing. For example, an hourly job with a 20-minute pipeline means waiting ~80–90 minutes to act on data from the start of the previous hour.

---

### Why Batch Still Dominates

Despite the delay disadvantage, batch processing accounts for an estimated **80–90% of real-world data jobs**. Many business metrics are not time-sensitive enough to require streaming, making batch the practical and convenient default.


## Introduction to Spark: What is Apache Spark?

Apache Spark is a **multi-language engine for large-scale data processing**. The key word is *engine* — Spark pulls data from a source (data lake or database), processes it across its machines, and writes the results back to a data lake or warehouse.

- **Distributed** — can run on a cluster of tens to thousands of machines working in parallel
- **Multi-language** — natively written in Scala, but supports wrappers for:
  - **Python** (PySpark) — the most popular choice in practice
  - Java
  - R
- **Primarily for batch**, but can also handle streaming by treating a data stream as a sequence of small batches

---

### When Should You Use Spark?

Spark is typically used when your data lives in a **data lake** (e.g., AWS S3 or Google Cloud Storage) rather than a data warehouse.

### Decision Guide

| Situation | Recommended Tool |
|---|---|
| Data is in a data warehouse | BigQuery / SQL |
| Data is in a data lake, job expressible in SQL | Presto, Athena, Hive, or BigQuery external tables |
| Data is in a data lake, job **too complex for SQL** | **Apache Spark** |

> **Rule of thumb:** If you can express your job as a SQL query, use SQL. Use Spark when you need more flexibility.

---

### Common Use Cases for Spark

- Complex transformations that are difficult or impossible to express in SQL
- **Machine learning workflows**, including:
  - Pre-processing and feature engineering
  - Training ML models
  - Applying/scoring a trained model at scale

---

### A Typical Spark Workflow

![spark_workflow](/pictures/spark_workflow.png)

