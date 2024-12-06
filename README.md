## Prerequisites

1. **Start Postgres Database** on Docker or your host device.
2. **Sample Data:** Use the sample data from [PostgreSQL Tutorial](https://www.postgresqltutorial.com/postgresql-getting-started/load-postgresql-sample-database/).
3. **Download the Data:** [dvdrental.zip](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip).
4. **Extract** the `dvdrental.zip` file to a directory.

## Setting Up DBT

1. Create a Python Virtual Environment: python3 -m venv env
   
2. Activate the Virtual Environment:
  On Linux/Mac: source env/bin/activate
  On Windoes : .\env\Scripts\Activate

3. Install DBT Libraries:
pip install dbt-core
pip install dbt-postgres

4. Initialize a DBT Project: dbt init

5. Create profiles.yml

6. Debug the Connection: dbt debug
Ensure all connections are successful.

## Data Modeling with DBT
1. Create Schemas:
Open Postgres and create schemas for medallion architecture:

\c data_warehouse;

create schema dbt_dev_raw;
create schema dbt_dev_intermediate;
create schema dbt_dev_mart;

2. Create Raw Models: Define raw models and write them to the dbt_dev_raw schema
3. Create a sources.yml file:
sources:
  - name: public
    database: data_warehouse
    schema: public
    tables:
      - name: payment
      - name: etc
4. Create Intermediate Models: Define intermediate models and write them to the dbt_dev_intermediate schema

5. Create Mart Models: Define mart models and write them to the dbt_dev_mart schema
