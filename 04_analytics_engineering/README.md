# Summary: Analytics Engineering - Week 4 Data Engineering Zoomcamp

## What is Analytics Engineering?

Analytics Engineering emerged to fill a gap in traditional data teams caused by recent developments in the data domain:

- **Cloud data warehouses** (BigQuery, Snowflake, Redshift) lowered storage and computing costs
- **ETL tools** (Fivetran, Stitch) simplified data pipelines
- **SQL-first tools** (Looker) introduced version control to data workflows
- **BI tools** (Mode, Google Data Studio) enabled self-service analytics
- **Data governance** changed how teams work and stakeholders consume data

---

## The Role Gap

### Traditional Data Team

**Data Engineers:**
- ✅ Prepare and maintain infrastructure
- ✅ Great software engineers
- ❌ Lack business context

**Data Analysts/Scientists:**
- ✅ Use data to answer questions
- ✅ Writing more code
- ❌ Not trained as software engineers

### Analytics Engineer: Bridges the Gap

Combines:
- Software engineering best practices (from Data Engineers)
- Business understanding and data usage (from Data Analysts)

---

## Analytics Engineer Toolset

| Category | Tools | Primary Focus |
|----------|-------|---------------|
| **Data Loading** | Fivetran, Stitch | May share with Data Engineers |
| **Data Storing** | Cloud data warehouses | May share with Data Engineers |
| **Data Modeling** | DBT, Dataform | ⭐ Primary focus |
| **Data Presentation** | Google Data Studio, BI tools | ⭐ Primary focus |

---

## Key Concepts

### ETL vs ELT

#### ETL (Extract, Transform, Load)
- Transform data **before** loading to warehouse
- ❌ Slower to implement
- ✅ More stable and compliant (pre-cleaned data)

#### ELT (Extract, Load, Transform)
- Transform data **after** loading to warehouse
- ✅ Faster and more flexible
- ✅ Leverages cheap cloud storage/compute
- ⭐ Modern approach for analytics engineering

---

### Kimball's Dimensional Modeling

**Objective:** Deliver understandable data to business users with fast query performance

**Star Schema:** Fact tables surrounded by dimension tables.

#### Key Elements

**Fact Tables** (Verbs)
- Measurements, metrics, business processes
- Examples: sales, orders

**Dimension Tables** (Nouns)
- Context, business entities
- Examples: customer, product

**Priorities:**
- ✅ User understandability
- ✅ Query speed
- ❌ NOT data redundancy elimination

---

### The Kitchen Analogy

| Area | Restaurant | Data Warehouse | Access |
|------|-----------|----------------|--------|
| **Staging** | Storage | Raw data | Limited (skilled users only) |
| **Processing** | Kitchen | Transform raw data into models | Limited (skilled users only) |
| **Presentation** | Dining Hall | Final data presentation | Business stakeholders |

# Summary: Introduction to DBT (Data Build Tool)

## What is DBT?

**DBT (Data Build Tool)** is a transformation workflow that allows you to use SQL (or Python) to deploy analytical code.

### Purpose
- Takes data loaded from different sources
- Transforms raw data into useful formats
- Prepares data for business stakeholders and data consumers
- Outputs to BI tools or other applications (e.g., machine learning workflows)

---

## Data Sources & Architecture

### Typical Data Sources (Company Use Case)
- **Backend systems** from company infrastructure
- **Front-end data** from apps (user behavior data)
- **Third-party providers** (e.g., weather data)

### Data Warehouse Options
- BigQuery (used in course)
- Snowflake
- Databricks
- Fabric
- And many others

**Flow:**
```
Raw Data → DBT Transformation → Transformed Data → BI Tools/Applications
```

---

## How DBT Helps

### 1. Software Engineering Best Practices

DBT introduces professional development workflows to analytics:

- **Development Environment**: Sandbox environment for each developer
- **Testing Framework**: Built-in testing capabilities
- **Documentation Framework**: Integrated documentation
- **Version Control**: Git-based version control
- **CI/CD**: Automated deployment to production
- **Modularity**: Reusable code components
- **DRY Principle**: Don't Repeat Yourself

### 2. Simplifies Data Transformation

- Removes complexity around data creation and environment management
- Automatically generates DDL (Data Definition Language) and DML (Data Manipulation Language)
- Handles table/view creation in your data warehouse

---

## How DBT Works

### Example DBT Model
```sql
-- A DBT model is a SQL file
SELECT 
  column1,
  column2,
  ...
FROM raw_data
WHERE conditions
```

### Execution Process
1. Write SQL/Python in DBT model files
2. Run `dbt run` command
3. DBT compiles the code
4. Executes against your data warehouse
5. Transforms raw data
6. Persists results as tables/views back into the data warehouse

---

## Two Ways to Use DBT

### 1. DBT Core (Open Source)

**Characteristics:**
- ✅ Free to use
- ✅ Open source
- Install locally via terminal
- Command-line interface for running DBT commands
- Handles: SQL/Python files, documentation, tests, compilation

**What you manage:**
- Development environment
- Orchestration
- Deployment
- Documentation hosting

---

### 2. DBT Cloud (SaaS Application)

**Characteristics:**
- Runs DBT Core
- Web-based IDE for development
- Cloud CLI available
- Environment management interface

**Features included:**
- ✅ Development environment (web-based IDE or Cloud CLI)
- ✅ Orchestration (production scheduling)
- ✅ Logging and alerting
- ✅ Hosted documentation
- ✅ Administration APIs
- ✅ Metadata APIs
- ✅ Semantic layer
- ✅ **Developer plan is FREE**

---

## Project Workflow

### Starting Point (from previous weeks)
- Trip data already loaded in GCP buckets
- Master data table for data enhancement
- Multiple data sources combined

### Project Steps

1. **Raw Data**: Load into BigQuery tables
2. **Transform**: Use DBT to transform the data
3. **Present**: Create dashboards to expose data to stakeholders

```
GCP Buckets → BigQuery (Raw) → DBT Transform → BigQuery (Modeled) → Dashboards
```

---

## Key Takeaways

| Aspect | DBT Benefit |
|--------|-------------|
| **Code Quality** | Software engineering best practices |
| **Development** | Sandbox environments per developer |
| **Testing** | Built-in testing framework |
| **Documentation** | Automated documentation |
| **Deployment** | CI/CD integration |
| **Flexibility** | SQL or Python support |
| **Options** | Free open-source (Core) or managed SaaS (Cloud) |



