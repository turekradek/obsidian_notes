**Lecture: Ingesting Data from Blob Storage to Data Lake using Copy Activity in Azure Data Factory**

**Objective:**

- Understand the requirements for ingesting data from blob storage to data lake using copy activity in Azure Data Factory
- Learn about the building blocks of a copy activity

**Requirements:**

- Ingest data from the Eurostat website into Azure Data Lake Storage
- Extract the GZIP file to create a TSV file

**Building Blocks of a Copy Activity:**

- Pipeline
- Link Services
- Source Dataset
- Target Dataset
- Copy Activity

**Pipeline:**

- The pipeline orchestrates the execution of the copy activity
- It defines the sequence of activities to be executed

**Link Services:**

- Store the connection details for blob storage and data lake storage
- Allow the copy activity to access the data sources

**Source Dataset:**

- Defines the source data to be copied
- Specifies the file name, type, and structure
- Can specify the folder structure to be copied

**Target Dataset:**

- Defines the location where the data will be copied
- Specifies the file name, type, and structure
- Can specify the folder structure where the data will be saved

**Copy Activity:**

- Copies the data from the source to the target
- Can handle GZIP files and extract the data
- Can filter and transform data

**Integrate, Run Time, and Triggers:**

- Additional concepts that will be introduced in later modules
- Integrate with other Azure services
- Schedule the execution of pipelines

**Conclusion:**

- Copy activity is a powerful tool for ingesting data from blob storage to data lake
- Understand the building blocks of a copy activity
- Need to know how to create pipelines, link services, source datasets, target datasets, and copy activities