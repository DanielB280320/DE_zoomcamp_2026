# Bruin Data Platform 

## What is Bruin?

Bruin is an **end-to-end data platform** that consolidates multiple data engineering tools into a single platform. Instead of using 5-6 different tools, Bruin handles:

- Data ingestion
- Transformations
- Orchestration
- Data quality checks
- Metadata management
- Lineage tracking

## Tutorial Learning Goals

The tutorial series covers:

- **Bruin project structure** - How projects are organized
- **Pipelines and assets** - Core building blocks
- **Configuration** - How to set up pipelines
- **Materialization strategies** - Different ways to materialize data
- **Lineage and dependencies** - Understanding data flow and asset relationships
- **Metadata** - Automatic and manual metadata creation
- **Parameterization** - Using custom variables in pipelines

## The Modern Data Stack Problem

Traditional data workflows require multiple separate tools:

1. **ETL/ELT tools** - Extract data from sources, load into data warehouses/lakes
2. **Transformation tools** - Clean and transform data, create reports
3. **Orchestrators** - Coordinate when and how different processes run
4. **Data governance/quality tools** - Ensure data accuracy, completeness, and consistency
5. **Metadata management** - Track data lineage and governance

## Bruin's Solution

Bruin eliminates the need for DevOps expertise and complex infrastructure setup by bringing everything into **one unified platform**. All logic, configurations, dependencies, and quality checks exist in a single project.
