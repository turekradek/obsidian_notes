[EXAMTOPICS DATABRICTS CERTIFIED DATA ENGINEER ASSCIATE]([Certified Data Engineer Associate Exam - Free Actual Q&As, Page 1 | ExamTopics](https://www.examtopics.com/exams/databricks/certified-data-engineer-associate/view/))

Question 1
A data organization leader is upset about the data analysis team’s reports being different from the data engineering team’s reports. The leader believes the siloed nature of their organization’s data engineering and data analysis architectures is to blame.  
Which of the following describes how a data lakehouse could alleviate this issue?
 - [ ]  A. Both teams would autoscale their work as data size evolves
 - [ ] B. Both teams would use the same source of truth for their work
 - [ ] C. Both teams would reorganize to report to the same department
 - [ ] D. Both teams would be able to collaborate on projects in real-time 
 - [ ] E. Both teams would respond more quickly to ad-hoc requests
- [ ] POINTS
 - [ ] WRONG
 - [ ] OK

Question 2

Which of the following describes a scenario in which a data team will want to utilize cluster pools?

 - [ ] A. An automated report needs to be refreshed as quickly as possible.
 - [ ] B. An automated report needs to be made reproducible.
 - [ ] C. An automated report needs to be tested to identify errors.
 - [ ] D. An automated report needs to be version-controlled across multiple collaborators.
 - [ ] E. An automated report needs to be runnable by all stakeholders.
 - [ ] 
- [ ] POINTS
 - [ ] WRONG
 - [ ] OK


Question 3
Which of the following is hosted completely in the control plane of the classic Databricks architecture?

 - [ ] A. Worker node
 - [ ] B. JDBC data source
 - [ ] C. Databricks web application
 - [ ] D. Databricks Filesystem
 - [ ] E. Driver node
- [ ] POINTS
 - [ ] WRONG
 - [ ] OK

Question 4
Which of the following benefits of using the Databricks Lakehouse Platform is provided by Delta Lake?

 - [ ] A. The ability to manipulate the same data using a variety of languages
 - [ ] B. The ability to collaborate in real time on a single notebook
 - [ ] C. The ability to set up alerts for query failures
 - [ ] D. The ability to support batch and streaming workloads
 - [ ] E. The ability to distribute complex data operations
 
- [ ] POINTS
 - [ ] WRONG
 - [ ] OK

Question 5
Which of the following describes the storage organization of a Delta table?

 - [ ] A. Delta tables are stored in a single file that contains data, history, metadata, and other attributes.
 - [ ] B. Delta tables store their data in a single file and all metadata in a collection of files in a separate location.
 - [ ] C. Delta tables are stored in a collection of files that contain data, history, metadata, and other attributes.
 - [ ] D. Delta tables are stored in a collection of files that contain only the data stored within the table.
 - [ ] E. Delta tables are stored in a single file that contains only the data stored within the table.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK

Question 6
Which of the following code blocks will remove the rows where the value in column age is greater than 25 from the existing Delta table my_table and save the updated table?

 - [ ] A. SELECT * FROM my_table WHERE age > 25;
 - [ ] B. UPDATE my_table WHERE age > 25;
 - [ ] C. DELETE FROM my_table WHERE age > 25;
 - [ ] D. UPDATE my_table WHERE age <= 25;
 - [ ] E. DELETE FROM my_table WHERE age <= 25;

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 7
A data engineer has realized that they made a mistake when making a daily update to a table. They need to use Delta time travel to restore the table to a version that is 3 days old. However, when the data engineer attempts to time travel to the older version, they are unable to restore the data because the data files have been deleted.  
Which of the following explains why the data files are no longer present?

 - [ ] A. The VACUUM command was run on the table
 - [ ] B. The TIME TRAVEL command was run on the table
 - [ ] C. The DELETE HISTORY command was run on the table
 - [ ] D. The OPTIMIZE command was nun on the table
 - [ ] E. The HISTORY command was run on the table

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 8
Which of the following Git operations must be performed outside of Databricks Repos?

 - [ ] A. Commit
 - [ ] B. Pull
 - [ ] C. Push
 - [ ] D. Clone
 - [ ] E. Merge

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 9
Which of the following data lakehouse features results in improved data quality over a traditional data lake?

 - [ ] A. A data lakehouse provides storage solutions for structured and unstructured data.
 - [ ] B. A data lakehouse supports ACID-compliant transactions.
 - [ ] C. A data lakehouse allows the use of SQL queries to examine data.
 - [ ] D. A data lakehouse stores data in open formats.
 - [ ] E. A data lakehouse enables machine learning and artificial Intelligence workloads.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 10
A data engineer needs to determine whether to use the built-in Databricks Notebooks versioning or version their project using Databricks Repos.  
Which of the following is an advantage of using Databricks Repos over the Databricks Notebooks versioning?

 - [ ] A. Databricks Repos automatically saves development progress
 - [ ] B. Databricks Repos supports the use of multiple branches
 - [ ] C. Databricks Repos allows users to revert to previous versions of a notebook
 - [ ] D. Databricks Repos provides the ability to comment on specific changes
 - [ ] E. Databricks Repos is wholly housed within the Databricks Lakehouse Platform

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 11
A data engineer has left the organization. The data team needs to transfer ownership of the data engineer’s Delta tables to a new data engineer. The new data engineer is the lead engineer on the data team.  
Assuming the original data engineer no longer has access, which of the following individuals must be the one to transfer ownership of the Delta tables in Data Explorer?

 - [ ] A. Databricks account representative
 - [ ] B. This transfer is not possible
 - [ ] C. Workspace administrator
 - [ ] D. New lead data engineer
 - [ ] E. Original data engineer

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 12
A data analyst has created a Delta table sales that is used by the entire data analysis team. They want help from the data engineering team to implement a series of tests to ensure the data is clean. However, the data engineering team uses Python for its tests rather than SQL.  
Which of the following commands could the data engineering team use to access sales in PySpark?

 - [ ] A. SELECT * FROM sales
 - [ ] B. There is no way to share data between PySpark and SQL.
 - [ ] C. spark.sql("sales")
 - [ ] D. spark.delta.table("sales")
 - [ ] E. spark.table("sales")

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 13
Which of the following commands will return the location of database customer360?

 - [ ] A. DESCRIBE LOCATION customer360;
 - [ ] B. DROP DATABASE customer360;
 - [ ] C. DESCRIBE DATABASE customer360;
 - [ ] D. ALTER DATABASE customer360 SET DBPROPERTIES ('location' = '/user'};
 - [ ] E. USE DATABASE customer360 
- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 14
A data engineer wants to create a new table containing the names of customers that live in France.  
They have written the following command:  
![](https://img.examtopics.com/certified-data-engineer-associate/image1.png "image1")  
A senior data engineer mentions that it is organization policy to include a table property indicating that the new table includes personally identifiable information (PII).  
Which of the following lines of code fills in the above blank to successfully complete the task?

 - [ ] A. There is no way to indicate whether a table contains PII.
 - [ ] B. "COMMENT PII"
 - [ ] C. TBLPROPERTIES PII
 - [ ] D. COMMENT "Contains PII"
 - [ ] E. PII

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 15
Which of the following benefits is provided by the array functions from Spark SQL?

 - [ ] A. An ability to work with data in a variety of types at once
 - [ ] B. An ability to work with data within certain partitions and windows
 - [ ] C. An ability to work with time-related data in specified intervals
 - [ ] D. An ability to work with complex, nested data ingested from JSON files
 - [ ] E. An ability to work with an array of tables for procedural automation

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 16
Which of the following commands can be used to write data into a Delta table while avoiding the writing of duplicate records?

 - [ ] A. DROP
 - [ ] B. IGNORE
 - [ ] C. MERGE
 - [ ] D. APPEND
 - [ ] E. INSERT

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 17
A data engineer needs to apply custom logic to string column city in table stores for a specific use case. In order to apply this custom logic at scale, the data engineer wants to create a SQL user-defined function (UDF).  
Which of the following code blocks creates this SQL UDF?
 - [ ] A. ![](https://img.examtopics.com/certified-data-engineer-associate/image2.png "image2")
 - [ ] B. ![](https://img.examtopics.com/certified-data-engineer-associate/image3.png "image3")
 - [ ] C. ![](https://img.examtopics.com/certified-data-engineer-associate/image4.png "image4")
 - [ ] D. ![](https://img.examtopics.com/certified-data-engineer-associate/image5.png "image5")
 - [ ] E. ![](https://img.examtopics.com/certified-data-engineer-associate/image6.png "image6")

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 18
A data analyst has a series of queries in a SQL program. The data analyst wants this program to run every day. They only want the final query in the program to run on Sundays. They ask for help from the data engineering team to complete this task.  
Which of the following approaches could be used by the data engineering team to complete this task?

 - [ ] A. They could submit a feature request with Databricks to add this functionality.
 - [ ] B. They could wrap the queries using PySpark and use Python’s control flow system to determine when to run the final query.
 - [ ] C. They could only run the entire program on Sundays.
 - [ ] D. They could automatically restrict access to the source table in the final query so that it is only accessible on Sundays.
 - [ ] E. They could redesign the data model to separate t - [ ]  data used in the final query into a new table.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 19
A data engineer runs a statement every day to copy the previous day’s sales into the table transactions. Each day’s sales are in their own file in the location "/transactions/raw".  
Today, the data engineer runs the following command to complete this task:  
![](https://img.examtopics.com/certified-data-engineer-associate/image7.png "image7")  
After running the command today, the data engineer notices that the number of records in table transactions has not changed.  
Which of the following describes why the statement might not have copied any new records into the table?

 - [ ] A. The format of the files to be copied were not included with the FORMAT_OPTIONS keyword.
 - [ ] B. The names of the files to be copied were not included with the FILES keyword.
 - [ ] C. The previous day’s file has already been copied into the table.
 - [ ] D. The PARQUET file format does not support COPY INTO.
 - [ ] E. The COPY INTO statement requires the table to be refreshed to view the copied rows.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 20
A data engineer needs to create a table in Databricks using data from their organization’s existing SQLite database.  
They run the following command:  
![](https://img.examtopics.com/certified-data-engineer-associate/image8.png "image8")  
Which of the following lines of code fills in the above blank to successfully complete the task?

 - [ ] A. org.apache.spark.sql.jdbc
 - [ ] B. autoloader
 - [ ] C. DELTA
 - [ ] D. sqlite
 - [ ] E. org.apache.spark.sql.sqlite

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 21
A data engineering team has two tables. The first table march_transactions is a collection of all retail transactions in the month of March. The second table april_transactions is a collection of all retail transactions in the month of April. There are no duplicate records between the tables.  
Which of the following commands should be run to create a new table all_transactions that contains all records from march_transactions and april_transactions without duplicate records?

 - [ ] A. CREATE TABLE all_transactions AS  
    SELECT * FROM march_transactions  
    INNER JOIN SELECT * FROM april_transactions;
 - [ ] B. CREATE TABLE all_transactions AS  
    SELECT * FROM march_transactions  
    UNION SELECT * FROM april_transactions;
 - [ ] C. CREATE TABLE all_transactions AS  
    SELECT * FROM march_transactions  
    OUTER JOIN SELECT * FROM april_transactions;
 - [ ] D. CREATE TABLE all_transactions AS - [ ] 
    SELECT * FROM march_transactions  
    INTERSECT SELECT * from april_transactions;
 - [ ] E. CREATE TABLE all_transactions AS  
    SELECT * FROM march_transactions  
    MERGE SELECT * FROM april_transactions;

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 22
A data engineer only wants to execute the final block of a Python program if the Python variable day_of_week is equal to 1 and the Python variable review_period is True.  
Which of the following control flow statements should the data engineer use to begin this conditionally executed code block?

 - [ ] A. if day_of_week = 1 and review_period:
 - [ ] B. if day_of_week = 1 and review_period = "True":
 - [ ] C. if day_of_week == 1 and review_period == "True":
 - [ ] D. if day_of_week == 1 and review_period:
 - [ ] E. if day_of_week = 1 & review_period: = "True":

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 23
A data engineer is attempting to drop a Spark SQL table my_table. The data engineer wants to delete all table metadata and data.  
They run the following command:  
  
DROP TABLE IF EXISTS my_table -  
While the object no longer appears when they run SHOW TABLES, the data files still exist.  
Which of the following describes why the data files still exist and the metadata files were deleted?

 - [ ] A. The table’s data was larger than 10 GB
 - [ ] B. The table’s data was smaller than 10 GB
 - [ ] C. The table was external
 - [ ] D. The table did not have a location
 - [ ] E. The table was managed

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 24
A data engineer wants to create a data entity from a couple of tables. The data entity must be used by other data engineers in other sessions. It also must be saved to a physical location.  
Which of the following data entities should the data engineer create?

 - [ ] A. Database
 - [ ] B. Function
 - [ ] C. View
 - [ ] D. Temporary view
 - [ ] E. Table

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 25
A data engineer is maintaining a data pipeline. Upon data ingestion, the data engineer notices that the source data is starting to have a lower level of quality. The data engineer would like to automate the process of monitoring the quality level.  
Which of the following tools can the data engineer use to solve this problem?

 - [ ] A. Unity Catalog
 - [ ] B. Data Explorer
 - [ ] C. Delta Lake
 - [ ] D. Delta Live Tables
 - [ ] E. Auto Loader

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 26
A Delta Live Table pipeline includes two datasets defined using STREAMING LIVE TABLE. Three datasets are defined against Delta Lake table sources using LIVE TABLE.  
The table is configured to run in Production mode using the Continuous Pipeline Mode.  
Assuming previously unprocessed data exists and all definitions are valid, what is the expected outcome after clicking Start to update the pipeline?

 - [ ] A. All datasets will be updated at set intervals until the pipeline is shut down. The compute resources will persist to allow for additional testing.
 - [ ] B. All datasets will be updated once and the pipeline will persist without any processing. The compute resources will persist but go unused.
 - [ ] C. All datasets will be updated at set intervals until the pipeline is shut down. The compute resources will be deployed for the update and terminated when the pipeline is stopped.
 - [ ] D. All datasets will be updated once and the pipeline will shut down. The compute resources will be terminated.
 - [ ] E. All datasets will be updated once and the pipeline will shut down. The compute resources will persist to allow for additional testing.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 27
In order for Structured Streaming to reliably track the exact progress of the processing so that it can handle any kind of failure by restarting and/or reprocessing, which of the following two approaches is used by Spark to record the offset range of the data being processed in each trigger?

 - [ ] A. Checkpointing and Write-ahead Logs
 - [ ] B. Structured Streaming cannot record the offset range of the data being processed in each trigger.
 - [ ] C. Replayable Sources and Idempotent Sinks
 - [ ] D. Write-ahead Logs and Idempotent Sinks
 - [ ] E. Checkpointing and Idempotent Sinks

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 28
Which of the following describes the relationship between Gold tables and Silver tables?

 - [ ] A. Gold tables are more likely to contain aggregations than Silver tables.
 - [ ] B. Gold tables are more likely to contain valuable data than Silver tables.
 - [ ] C. Gold tables are more likely to contain a less refined view of data than Silver tables.
 - [ ] D. Gold tables are more likely to contain more data than Silver tables.
 - [ ] E. Gold tables are more likely to contain truthful data than Silver tables.

Question 29
Which of the following describes the relationship between Bronze tables and raw data?

 - [ ] A. Bronze tables contain less data than raw data files.
 - [ ] B. Bronze tables contain more truthful data than raw data.
 - [ ] C. Bronze tables contain aggregates while raw data is unaggregated.
 - [ ] D. Bronze tables contain a less refined view of data than raw data.
 - [ ] E. Bronze tables contain raw data with a schema applied.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 30
Which of the following tools is used by Auto Loader process data incrementally?

 - [ ] A. Checkpointing
 - [ ] B. Spark Structured Streaming
 - [ ] C. Data Explorer
 - [ ] D. Unity Catalog
 - [ ] E. Databricks SQL

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 31
A data engineer has configured a Structured Streaming job to read from a table, manipulate the data, and then perform a streaming write into a new table.  
The cade block used by the data engineer is below:  
![](https://img.examtopics.com/certified-data-engineer-associate/image9.png "image9")  
If the data engineer only wants the query to execute a micro-batch to process data every 5 seconds, which of the following lines of code should the data engineer use to fill in the blank?

 - [ ] A. trigger("5 seconds")
 - [ ] B. trigger()
 - [ ] C. trigger(once="5 seconds")
 - [ ] D. trigger(processingTime="5 seconds")
 - [ ] E. trigger(continuous="5 seconds")

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK

Question 32
A dataset has been defined using Delta Live Tables and includes an expectations clause:  
CONSTRAINT valid_timestamp EXPECT (timestamp > '2020-01-01') ON VIOLATION DROP ROW  
What is the expected behavior when a batch of data containing data that violates these constraints is processed?

 - [ ] A. Records that violate the expectation are dropped from the target dataset and loaded into a quarantine table.
 - [ ] B. Records that violate the expectation are added to the target dataset and flagged as invalid in a field added to the target dataset.
 - [ ] C. Records that violate the expectation are dropped from the target dataset and recorded as invalid in the event log.
 - [ ] D. Records that violate the expectation are added to the target dataset and recorded as invalid in the event log. 
 - [ ]  E. Records that violate the expectation cause the job to fail.

- [ ] POINTS
 - [ ] WRONG
 - [ ] OK
Question 33

