# **Lab 09- Performing Real-Time Analytics using Microsoft Fabric**

**Introduction**

Microsoft Fabric Real-Time Analytics is a fully managed, high-performance, big data analytics platform that makes it easy to analyze high volumes of data in near real time. The Microsoft Fabric Real-Time Analytics toolbox gives you an end-to-end solution for data ingestion, query, visualization, and management.

By analyzing structured, semi-structured, and unstructured data across time series, and by using Machine Learning, Microsoft Fabric Real-Time Analytics makes it simple to extract key insights, spot patterns and trends, and create forecasting models. Microsoft Fabric Real-Time Analytics is scalable, secure, robust, and enterprise-ready, and is useful for log analytics, time series analytics, IoT, and general-purpose exploratory analytics.

**Objective**

- Create **KQL database** in your Fabric enabled Power BI workspace
    
- Run powerful KQL queries to explore the data via **KQL Queryset**
    
- Manage KQL Database using control commands and policies
    
- Visualize data in Fabric **Real Time Dashboards**
    

# **Exercise 1: Database Creation, Data Ingestion and Exploration**

This exercise will focus on enabling the participants to Create a KQL database, and ingest data into the KQL database table - One click ingestion of historic data , update policy to perform ETL and write some KQL queries.

## **Task 1: Create a workspace**

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter** button.
    
    > **Note:** If you are directed to Microsoft Fabric Home page, then skip steps from #2 to #4.
    
    ![0c4dhwk7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0c4dhwk7.jpg)
    
2. In the **Microsoft Fabric** window, enter your credentials, and click on the **Submit** button.
    
    ![c0bkdsjn.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/c0bkdsjn.jpg)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button.
    
    ![sfwlg5xl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sfwlg5xl.jpg)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![8b54d9sh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8b54d9sh.jpg)
    
5. In the **Microsoft Fabric** home page, select the **Power BI** template.
    
    ![ijsjy4az.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ijsjy4az.jpg)
    
6. In the **Power BI Home** page menu bar on the left, select **Workspaces** (the icon looks similar to 🗇).
    
    ![gfyxqdvz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gfyxqdvz.jpg)
    
7. In the Workspaces pane, select **+** **New workspace**.
    
    ![orwm8v3z.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/orwm8v3z.jpg)
    
8. In the **Create a workspace tab**, enter the following details and click on the **Apply** button.
    
    |**Name**|**`Fabric Real-Time AnalyticsXX`**(XX can be a unique number|
    |---|---|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**Small dataset storage format**|
    
    ![si1gza9d.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/si1gza9d.jpg)
    
    ![tcsklayq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/tcsklayq.jpg)
    
    ![pqbulj13.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/pqbulj13.jpg)
    
9. Wait for the deployment to complete. It takes 2-3 minutes to complete. When your new workspace opens, it should be empty.
    
    ![cfo7jl1c.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/cfo7jl1c.jpg)
    

## **Task 2: Create a KQL Database**

Kusto query language (KQL) is used to query static or streaming data in a table that is defined in a KQL database. To analyze the sales data, you must create a table in a KQL database and ingest the data from the file.

1. At the bottom left of the Power BI portal, select the **Power BI** icon and switch to the **Real-Time Analytics** experience.
    
    ![2w8fofov.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2w8fofov.jpg)
    
2. On the **Synapse Real-Time Analytics Home** page, select **KQL database** **(Preview)** under the **New** pane.
    
    ![2mjiahpn.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2mjiahpn.jpg)
    
3. In the **New KQL Database** dialog box, enter the **KQL Database name** as **`FabricRTA`** (or new database with a name of your choice) and click on **Create** button.
    
    > **Note**: Remove any extra space before and after **FabricRTA.**
    
    ![0c13o8x9.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0c13o8x9.jpg)
    
    ![1j7t3w2g.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1j7t3w2g.jpg)
    

## **Task 3: Create a KQL queryset**

The KQL Queryset exists within the context of a workspace. A new KQL queryset is always associated with the workspace you're using when you create it.

1. Select **_Fabric Real-Time AnalyticsXX_** workspace in the left navigation pane.
    
    ![mwwqqfsa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mwwqqfsa.jpg)
    
2. On the **Synapse Real-Time Analytics Home** page, from the menu bar, select the **New** drop-down, and from there select **KQL Queryset**
    
    ![m3glo24p.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/m3glo24p.jpg)
    
3. In the **New KQL Queryset** dialog box, enter the **KQL Query name** as **`querysetXX`** (or new database with a name of your choice) and click on **Create** button.
    
    > **Note:** KQL Query name should be alphanumeric characters, underscores, periods, and hyphens. Special characters aren't supported.
    
    ![gaz6bx6n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gaz6bx6n.jpg)
    
4. In **OneLake data hub** pane ,select **FabricRTA** KQL Database and click on **Select** button.
    
    ![wpwgs09e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wpwgs09e.jpg)
    
    ![xdb9oqv8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xdb9oqv8.jpg)
    
5. Now you can write a simple KQL query:
    
    **`print "Hello World"`**
    
    ![oho5k5o7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/oho5k5o7.jpg)
    
6. Highlight the line with the code and hit the **Run** button. The query will be executed and its result can be seen in the result grid at the bottom of the page.
    
    ![ywshe26s.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ywshe26s.jpg)
    

# **Exercise 2: Ingest data from Azure Storage Account**

Data ingestion to KQL Database is the process used to load data records from one or more sources into a table. Once ingested, the data becomes available for query.

KQL Database supports several ingestion methods, including Eventstream, Fabric Pipeline, and Fabric Dataflow. Also available with Azure Data Factory and Event Hubs.

## **Task 1: Create the raw table - logsRaw**

Ingest data using one-click ingestion from Azure Blob Storage to your KQL Database.

1. In KQL queryset pane, replace all the code in the **cell** with the following code and click on **▷ Run** button to create a table
    
    ```
    .create table logsRaw(
    Timestamp:datetime, 
    Source:string, 
    Node:string, 
    Level:string, 
    Component:string, 
    ClientRequestId:string, 
    Message:string, 
    Properties:dynamic
    )
    ```
    
    ![mfqwjcdk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mfqwjcdk.jpg)
    
    ![fnyp2l1n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/fnyp2l1n.jpg)
    
2. Click on refresh to see the new table on the left.
    
    ![9mngmbw0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9mngmbw0.jpg)
    
    ![tcy36ymp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/tcy36ymp.jpg)
    

## **Task 2: Use the "One-click" User Interface to ingest data from Azure blob storage**

You need to analyze the system logs for Contoso, which are stored in Azure blob storage.

1. Select **FabricRTA** database in the left navigation pane.
    
    ![antozfbp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/antozfbp.jpg)
    
2. In **FabricRTA** database, under the **Home** tab, navigate and click on **Get data** in the command bar, then select **Azure Storage**.
    
    ![6qbm07zm.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6qbm07zm.jpg)
    
3. Then use the wizard to import the data into a new table by selecting the following options:
    
4. In the **Get data** tab, select the existing table as **logsRaw**. Under the Configure the data source tab enter the **URI :** `https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D`
    
    ![3djc1lw3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3djc1lw3.jpg)
    
5. In the **Get data** tab, click on the **+** and click on **Next** button.
    
    ![m3r0ibmb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/m3r0ibmb.jpg)
    
6. In Get data tab under the Inspect the data click on the horizontal **ellipses (…)** beside Edit columns, select the **Advanced** and check the **Keep table schema.** Click on the **Finish** button.
    
    ![0xzosey7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0xzosey7.jpg)
    
7. Wait for the Data ingestion to be completed, and click **Close**.
    
    ![unysu2hx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/unysu2hx.jpg)
    
    ![m2dq707r.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/m2dq707r.jpg)
    
8. Select **querysetXX** KQL queryset in the left navigation pane.
    
    ![c4hfjo6c.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/c4hfjo6c.jpg)
    
9. Replace all the code in the **cell** with the following code and click on **▷ Run** button
    
    ```
    logsRaw
    | count
    ```
    
    ![qopyegpe.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/qopyegpe.jpg)
    

The logsRaw table should have 3,834,012 records.

# **Exercise 3: Starting with the basics of KQL**

A _Kusto query_ is a read-only request to process data and return results. The request is stated in plain text that's easy to read, author, and automate. A Kusto query has one or more query statements and returns data in a tabular or graph format.

## **Task 1: Journey from SQL to KQL!**

1. For all the SQL pros out there, KQL Database allows a subset of TSQL queries. Try running the following SQL query in web UI. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    SELECT COUNT() FROM logsRaw
    ```
    
    ![mhwd6vhz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mhwd6vhz.jpg)
    
2. The primary language to interact with Kusto is KQL (Kusto Query Language). To make the transition and learning experience easier, you can use the explain operator to translate SQL queries to KQL.
    
3. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    explain SELECT MAX(Timestamp) AS MaxTimestamp FROM logsRaw WHERE Level='Error'
    ```
    
    ![jqw1p510.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jqw1p510.jpg)
    
    Output of the above query will be a corresponding KQL query
    
    logsRaw | where (Level == "Error") | summarize MaxTimestamp=max(Timestamp) | project MaxTimestamp
    

## **Task 2: Basic KQL queries - explore the data**

In this task, you will see some KQL examples. For this task, we will use the table logsRaw, which has data we loaded in previous challenge from storage account.

1. Execute the queries and view the results. KQL queries can be used to filter data and return specific information. Now, you\'ll learn how to choose specific rows of data. The **where** operator filters results that satisfy a certain condition.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    ```
    logsRaw
      | where Level=="Error"
      | take 10
    ```
    
    ![j18qimqc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/j18qimqc.jpg)
    

The take operator samples any number of records from our table without any order. In the above example, we asked to provide 10 random records.

3. Find out how many records are in the table. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    logsRaw
    | summarize count() // or: count
    ```
    
    ![bsoff2ml.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bsoff2ml.jpg)
    
4. Find out the minimum and maximum Timestamp. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    logsRaw
    | summarize min(Timestamp), max(Timestamp)
    ```
    
    ![yu0hstxs.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yu0hstxs.jpg)
    
5. Our dataset has trace records written by Contoso\'s DOWNLOADER program, which downloads files from blob storage as part of its business operations. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    logsRaw
    | where Component == "DOWNLOADER"
    | take 10
    ```
    
    ![h95t541w.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h95t541w.jpg)
    
6. Select the **Properties** column is dynamic. The dynamic data type is special in that it can take on any value of other data types, as well as arrays and property bags (dictionaries).
    
    ![sjdy9ni4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sjdy9ni4.jpg)
    
7. The dynamic type is extremely beneficial when it comes to storing JSON data, since KQL makes it simple to access fields in JSON and treat them like an independent column: just use either the dot notation (dict.key) or the bracket notation (dict["key"]).
    
8. The extend operator adds a new calculated column to the result set, during query time. This allows for the creation of new standalone columns to the result set, from the JSON data in dynamic columns. Replace all the code in the **cell** with the following code and click on **▷ Run** button.
    
    **Copy**
    
    ```
    logsRaw
    | where Component == "DOWNLOADER"
    | take 100
    | extend originalSize=Properties.OriginalSize, compressedSize=Properties.compressedSize
    ```
    
    ![gbroxjm5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gbroxjm5.jpg)
    

## **Task 3: Explore the table and columns**

After subscripting a dynamic object, it is necessary to cast (convert) the value to a simple type in order to utilize them (for example, if you want to summarize the sizes of all the OriginalSize, you should convert the dynamic type to a numeric type, like long).

1. This below query to get the table that is shown in the image below (we want to convert the OriginalSize and CompressedSize columns to long)
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | extend originalSize=Properties.OriginalSize, compressedSize=Properties.compressedSize
    | getschema 
    ```
    
    ![6u1juoxz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6u1juoxz.jpg)
    

## **Task 4: Keep the columns of your interest**

You are investigating an incident and wish to review only several columns of the dataset.

1. A query to get only specific desired columns: Timestamp, ClientRequestId, Level, Message. Take arbitrary 10 records.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | project Timestamp, ClientRequestId, Level, Message
    | take 10
    ```
    
    ![1lksm32d.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1lksm32d.jpg)
    

## **Task 5: Filter the output**

You are investigating an incident that occurred within a specific time frame.

1. Write a query to get only specific desired columns: Timestamp, ClientRequestId, Level, Message. Take all the records between 2014-03-08 01:00 and 2014-03-08 10:00.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | where Timestamp between (datetime(2014-03-08 01:00).. datetime(2014-03-08 10:00))
    | project Timestamp, ClientRequestId, Level, Message
    | take 10
    ```
    
    ![ceqart8b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ceqart8b.jpg)
    

## **Task 6: Sorting the results**

Your system generated an alert indicating a significant decrease in incoming data. You want to check the traces of the "INGESTOR_EXECUTER" [sic] component of the program.

1. Write a query that returns 20 sample records in which the Component column equals the word "INGESTOR_EXECUTER" [sic].
    
2. Once done, rewrite the query to take the top 1 records by the value of rowCount (for the "INGESTOR_EXECUTER" [sic] records).
    
3. Replace all the code in the cell with the following code and click on ▷ Run cell button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | where Component == 'INGESTOR_EXECUTER'
    | extend rowCount=toint(Properties.rowCount)
    | where isnotempty(rowCount)
    | sort by rowCount
    | top 10 by rowCount desc
    ```
    
    ![4say5uzu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4say5uzu.jpg)
    

## **Task 7: Data profiling**

1. As part of the incident investigation, you want to extract format and rowCount from INGESTOR_EXECUTER [sic] component. Rename the calculated fields to fileFormat and rowCount respectively. Also, Make Sure Timestamp, fileFormat and rowCount are the first 3 columns.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | where Component == 'INGESTOR_EXECUTER'
    | extend rowCount=toint(Properties.rowCount), fileFormat=tostring(Properties.format) 
    | project Timestamp, fileFormat, rowCount, ClientRequestId, Component, Level, Message
    | take 10
    ```
    
    ![kjjb2ums.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kjjb2ums.jpg)
    

## **Task 8: Total number of records**

The system comprises of several \"components\", but you don\'t know their names or how many records were generated by each.

1. Write a query to find out how many records were generated by each component. Use the Component column.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | summarize count() by Component
    ```
    
    ![n2qxgm6h.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/n2qxgm6h.jpg)
    

## **Task 9: Aggregations and string operations**

You assume that the incident being investigated has a connection to the ingestion process run by Contoso\'s program.

1. Write a query to find out how many records contain the string \'**ingestion\'** in the Message column. Aggregate the results by **Level.**
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | where Message has "ingestion"
    | summarize count() by Level
    ```
    
    ![4ka8snjz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4ka8snjz.jpg)
    

## **Task 10: Render a chart**

1. Write a query to find out how many total records are present per Level (aggregated by Level) and render a piechart.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | summarize count() by Level
    | render piechart
    ```
    
    ![arkrd6mr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/arkrd6mr.jpg)
    

## **Task 11: Create bins and visualize time series**

1. Write a query to show a timechart of the number of records in 30 minute bins (buckets). Each point on the timechart represent the number of logs in that bucket.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | summarize count() by bin(Timestamp, 30m)
    | render timechart
    ```
    
    ![xmglxkqa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xmglxkqa.jpg)
    

# **Exercise 4: Explore and Transform Data**

In this exercise we will explore 3 capabilities of Data Explorer

- **User-defined functions** are reusable KQL subqueries that can be defined as part of the query itself (ad-hoc functions), or persisted as part of the database metadata (stored functions - reusable KQL query, with the given name). Stored functions are invoked through a name, are provided with zero or more input arguments (which can be scalar or tabular), and produce a single value (which can be scalar or tabular) based on the function body.
    
- **Update Policy** is like an internal ETL. It can help you manipulate or enrich the data as it gets ingested into the source table (e.g. extracting JSON into separate columns, creating a new calculated column, joining the newly ingested records with a static dimension table that is already in your database, etc). For these cases, using an update policy is a very common and powerful practice.
    

> Each time records get ingested into the source table, the update policy's query (which we'll define in the update policy) will run on them (**only on newly ingested records** - other existing records in the source table aren't visible to the update policy when it runs), and the results of the query will be appended to the target table. This function's output schema and target table schema should exactly match.

## **Task 1: User defined Function (Stored Functions)**

1. Create a stored functions, named ManiputatelogsRaw, that will contain the code below. Make sure the function works.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw
    | where Component in (
    'INGESTOR_EXECUTER', 
    'INGESTOR_GATEWAY', 
    'INTEGRATIONDATABASE',
    'INTEGRATIONSERVICEFLOWS', 
    'INTEGRATIONSERVICETRACE')
    ```
    
    ![jwxppt05.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jwxppt05.jpg)
    

## **Task 2: Create an update policy**

In this task, we will use an update policy to filter the raw data in the logsRaw table (the source table) for ingestion logs, that will be ingested into the new table ingestionLogs that we'll create.

1. Build the target table,replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .create table ingestionLogs (
    Timestamp: datetime, 
    Source: string,
    Node: string, 
    Level: string, 
    Component: string, 
    ClientRequestId: string, 
    Message: string, 
    Properties: dynamic)
    ```
    
    ![s68oil7b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/s68oil7b.jpg)
    
2. Create a function for the update policy, replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .create function ingestionComponents(){
    logsRaw
    | where Component has_any ('INGESTOR_EXECUTER', 'INGESTOR_GATEWAY', 'INTEGRATIONDATABASE','INTEGRATIONSERVICEFLOWS', 'INTEGRATIONSERVICETRACE', 'DOWNLOADER')
    }
    ```
    
    ![nj2eksc7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nj2eksc7.jpg)
    
3. Create the update policy(Fill in the blanks), replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .alter table ingestionLogs 
    policy update  @'[{ "IsEnabled": true,"Source": "logsRaw", "Query": "ingestionComponents()", "IsTransactional": true, "PropagateIngestionProperties": false} ]'
    ```
    
    ![wtcr1rt0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wtcr1rt0.jpg)
    
4. Update policy can transform and move the data from source table from the time it is created. It cannot look back at already existing data in source table. We will ingest new data into logsraw table and see new data flowing into ingestionLogs table
    
5. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
6. copy **operationIds** and paste them in a notepad , and then **Save** the notepad to use the information in the upcoming step.
    
    **Copy**
    
    ```
    // Note: execute the below commands one after another => Using operationId(output of each command), 
    //check the status and execute a new command only after the previous one is completed
    
    .ingest async into table logsRaw (
    h'https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/03/08/00/data.csv.gz?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D') 
    with (format='csv',   
            creationTime='2014-03-08T00:00:00Z');
    
    .ingest async into table logsRaw (
    h'https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/03/08/01/data.csv.gz?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D') 
    with (format='csv', 
            creationTime='2014-03-08T01:00:00Z');
    
    .ingest async into table logsRaw (
    h'https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/03/08/02/data.csv.gz?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D') 
    with (format='csv', 
            creationTime='2014-03-08T02:00:00Z');
    
    .ingest async into table logsRaw (
    h'https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/03/08/03/data.csv.gz?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D') 
    with (format='csv', 
            creationTime='2014-03-08T03:00:00Z');
    
    .ingest async into table logsRaw (
    h'https://logsbenchmark00.blob.core.windows.net/logsbenchmark-onegb/2014/03/08/04/data.csv.gz?sp=rl&st=2022-08-18T00:00:00Z&se=2030-01-01T00:00:00Z&spr=https&sv=2021-06-08&sr=c&sig=5pjOow5An3%2BTs5mZ%2FyosJBPtDvV7%2FXfDO8pLEeeylVc%3D') 
    with (format='csv', 
            creationTime='2014-03-08T04:00:00Z');
    ```
    
    ![mqssge65.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mqssge65.jpg)
    
    > **Note:** The above command does not complete immediately. Because we used the async parameter, the output of the above query will be operationIds. The progress of the query can be checked by used the below command
    
7. Check progress of the commands, replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    Copy
    
    ```
      .show operations operationIds
    ```
    
    > **Note:** Replace the operationIds which you have saved in Step 6
    
    ![uabjz178.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uabjz178.jpg)
    
8. Make sure the data is transformed correctly in the destination table. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    ingestionLogs
    | count
    ```
    
    ![ommi94a8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ommi94a8.jpg)
    
    Check if the count of ingestionLogs table is 111,740.
    
    > **Note:** If the count is not matching for ingestionLogs table, it means that one of the above .ingest commands have throttled or failed.
    
9. Please run the following command to clean **ingestionLogs** table. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .clear table ingestionLogs data
    ```
    
    ![1j7r27gf.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1j7r27gf.jpg)
    
10. Now then run the above **.ingest** commands one by one and this will result in 93,648 count in ingestionLogs table.
    
11. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .alter table ingestionLogs policy update 
    @'[{ "IsEnabled": true, "Source": "logsRaw", "Query": "ingestionComponents()"}]'
    
    .set-or-append logsRaw <| logsRaw | take 100000
    
    ingestionLogs | take 10
    ```
    
    ![ajqev97a.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ajqev97a.jpg)
    

# **Exercise 5: Advanced KQL, Policies, and Visualization**

# **Caching and Retention Policies**

Among the different policies you can set to the KQL Database, two policies are of particular importance:

- Retention policy (retention period)
    
- Cache policy (cache period)
    

First, a policy is used to enforce and control the properties of the KQL Database.

- The **retention** policy: the time span, in days, for which it's guaranteed that the data is kept available for querying. The time span is measured from the time that the records are ingested. When the period expires, the records will not be available for querying any more.
    
    In other words, the retention policy defines the period during which data is retained and available to query, measured since ingestion time. Note that a large retention period may impact the cost.
    
- The **cache** policy: the time span, in days, for which to keep recently ingested data (which is usually the frequently queried data) available in the hot cache rather than in long term storage (this is also known as cold tier. Specifically, it is Azure blob storage). Data stored in the hot cache is actually stored in local SSD or the RAM of the machine, very close to the compute nodes.
    
    Therefore, more readily available for querying. The availability of data in the hot cache improves query performance but can potentially increase the cluster cost (as more data is being stored, more VMs are required to store it). In other words, the caching policy defines the period during which data is kept in the hot cache.
    
    All the data is always persisted in the cold tier, for the duration defined in the retention policy. Any data whose age falls within the hot cache policy will also be stored in the hot cache. If you query data from cold cache, it’s recommended to target a small specific range in time (“point in time”) for the queries to be efficient.
    

## **Task 1: Change the retention policy via commands**

Database policies can be overridden per table using a KQL control command. A database cache and retention policies can be edited from the Fabric UI. Tables policies can be managed via a KQL command.

1. Select **_querysetXX_** KQL queryset in the left navigation pane.
    
    ![z0ls5yg3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/z0ls5yg3.jpg)
    
2. Always use KQL commands to alter the policies of the entire Database/tables. Table level policy takes precedence over database level which takes precedence over cluster level.
    
3. Run the below query to find the total hours is the retention policy of **ingestionLogs** table
    
4. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    **Copy**
    
    > .alter table ingestionLogs policy retention
    > 
    > ``` {
    > 
    > "SoftDeletePeriod": "10:12:00:00",
    > 
    > "Recoverability": "Enabled"
    > 
    > }
    > 
    > ```
    
    ![df9f4rba.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/df9f4rba.jpg)
    

# **Exercise 6: Metadata objects handling using Control Commands**

## **Task 1: .show/diagnostic logs/Insights**

Control commands are requests to the service to retrieve information that is not necessarily data in the database tables, or to modify the service state, etc. In addition, they can be used to manage Azure Data Explorer. The first character of the KQL text determines if the request is a control command or a query. Control commands must start with the dot (.) character, and no query may start with that character.

- The .show queries command returns a list of queries that have reached a final state, and that the user invoking the command has access to see.
    
- The .show commands command returns a table of the admin commands that have reached a final state. The TotalCpu column is the value of the total CPU clock time (User mode + Kernel mode) consumed by this command.
    
- The .show journal command returns a table that contains information about metadata operations that are done on the Azure Data Explorer database. The metadata operations can result from a control command that a user executed, or internal control commands that the system executed, such as drop extents by retention
    
- The .show tables details command returns a set that contains the specified table or all tables in the database with a detailed summary of each table\'s properties.
    

1. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    **Copy**
    
    ```
    // 1. Using pipe: Count how many tables are in the database-in-scope:
    .show tables
    | count
    
    // 2. Using semicolon: Count how many tables are in the database-in-scope:
    .show tables;
    $command_results
    | count
    
    // 3. Using semicolon, and including a let statement:
    .show tables;
    let useless=(n:string){strcat(n,'-','useless')};
    $command_results | extend LastColumn=useless(TableName)
    ```
    
    ![94kn4y15.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/94kn4y15.jpg)
    

## **Task 2: Use .show queries**

As part of an incident investigation, you need to find out how many queries were executed in the past 3 hours.

1. To count the number of queries that were run, in the past 3 hours execute the below query
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    **Copy**
    
    ```
    .show queries 
    | where StartedOn >ago(7d)
    | summarize count() by User
    ```
    
    ![chj8h0wx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/chj8h0wx.jpg)
    

## **Task 3: Use .journal commands**

1. To show the details of the function that you created earlier, replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    **Copy**
    
    ```
    .show journal
    | where EventTimestamp > ago(1h) and Event =='ADD-FUNCTION'
    | project Event, EventTimestamp, ChangeCommand
    ```
    
    ![fcio7ymu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/fcio7ymu.jpg)
    

## **Task 4: Use .show commands**

1. To show the details of commands that you ran, in the past 4 hours, replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    .show commands
    | where StartedOn >ago(4h)
    | summarize count() by User
    ```
    
    ![ot5fh6ap.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ot5fh6ap.jpg)
    

## **Task 5: Table details and size**

1. Use control command to show details on **ingestionLogs** tables in the database.
    
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    **Copy**
    
    .show extents | summarize format_bytes(sum(OriginalSize),2,'MB'), format_bytes(sum(ExtentSize),2,'MB') by TableName
    
    .show tables details
    
    ![vxw4g4xo.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vxw4g4xo.jpg)
    

# **Exercise 7: Going more advanced with KQL**

## **Task 1: Declaring variables and using 'let' statements**

You can use the let statement to set a variable name equal to an expression or a function, or to create views (virtual, temporary, tables based on the result-set of another KQL query).

let statements are useful for:

- Breaking up a complex expression into multiple parts, each represented by a variable.
    
- Defining constants outside of the query body for readability.
    
- Defining a variable once and using it multiple times within a query.
    

1. Use 2 let statements to create **LogType** and **TimeBucket **variables with the following values:
    
    - LogType = 'Warning'
        
    - TimeBucket = 1m
        
2. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    let LogType = 'Warning';
    let TimeBucket = 1m;
    logsRaw
    | summarize count() by Level = LogType, bin(Timestamp,TimeBucket)
    | render timechart
    ```
    
    ![8w7nvc3p.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8w7nvc3p.jpg)
    

## **Task 2: Use the search operator**

You received an alert early in the morning regarding multiple Timeouts in your system. You want to quickly search the traces without using specific columns or table names.

1. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    search  "Exception=System.Timeout" | count
    ```
    
    ![311lkcdk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/311lkcdk.jpg)
    

## **Task 3: Parse Key-Value pairs strings into separate columns**

As part of an incident investigation, you need to look at the **INGESTOR_GATEWAY** records (Component == 'INGESTOR_GATEWAY').You need to use the _Message_ column, which contains the message of the trace, representing the information in a key/value form.

1. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output.
    
    **Copy**
    
    ```
    logsRaw 
    | where Component == "INGESTOR_EXECUTER" 
    ```