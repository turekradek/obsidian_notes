Sure, here are the notes from your text:

**Solution Overview**

- Data will be ingested from the ECDC and Eurostat websites.
- Data will be transformed using Data Flows, HDInsight, and Azure Databricks.
- Transformed data will be stored in Azure Data Lake Storage Gen 2.
- A subset of the data will be pushed to an Azure SQL database for reporting.
- Power BI will be used to create reports from the data in the SQL database.

**Technology Choices**

- Azure Data Factory: Data integration and orchestration.
- Data Flow: Simple and medium complexity transformations.
- HDInsight: Complex transformations using Spark, Hive, and Pig.
- Azure Databricks: Complex transformations using Spark.
- Azure Blob Storage: Store population data.
- Azure Data Lake Storage Gen 2: Store data lake.
- Azure SQL Database: Store data warehouse.
- Power BI: Create reports.

**Reasons for Choices**

- Azure Data Factory: Provides connectors to all data sources and can orchestrate workflows.
- Data Flow: Easy to develop and maintain transformations.
- HDInsight and Databricks: Scalable and can handle complex transformations.
- Azure Blob Storage: Cost-effective and can store large amounts of data.
- Azure Data Lake Storage Gen 2: Scalable, high-performance, and secure.
- Azure SQL Database: Suitable for small data warehouses.
- Power BI: Rich features for creating meaningful reports.