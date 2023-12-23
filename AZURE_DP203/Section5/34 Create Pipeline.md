**Module 2: Data Ingestion from ECDC to Azure Data Lake**

**Key Points**

- This module focuses on ingesting COVID-19 data from the European Center for Disease Prevention and Control (ECDC) website into an Azure Data Lake.
- The data consists of daily reports on confirmed cases, deaths, hospital admissions, and ICU admissions for several European countries.
- Data ingestion is done using Data Factory, an Azure data engineering service.
- Data is copied from the ECDC website using a HTTP link service and stored in a CSV file in the Azure Data Lake.
- The pipeline is configured to run daily to capture the latest data.

**Exam Questions**

2. What is the source of the COVID-19 data for this module?
4. What type of data lake is used to store the ingested data?
6. What type of activity is used to copy data from the ECDC website to the Azure Data Lake?
8. What is the name of the pipeline that ingests the COVID-19 data?
10. How often does the pipeline run to capture the latest data?

**Additional Notes**

- The data is copied using a copy activity in a Data Factory pipeline.
- The source dataset is an HTTP link service that points to the ECDC website.
- The target dataset is a data lake Gen2 dataset that points to the Azure Data Lake.
- The pipeline is scheduled to run daily using a trigger.

By understanding these key points and exam questions, you will be well-prepared for the Module 2 exam.