# **Lab 05-Building a data warehouse in Microsoft Fabric**

> **Introduction**
> 
> While many concepts in Microsoft Fabric may be familiar to data and analytics professionals, it can be challenging to apply those concepts in a new environment. This tutorial has been designed to walk step-by-step through an end-to-end scenario from data acquisition to data consumption to build a basic understanding of the Microsoft Fabric user experience, the various experiences and their integration points, and the Microsoft Fabric professional and citizen developer experiences.

> **Objectives**
> 
> • Set up a Fabric workspace with trial enabled.
> 
> • Establish a new Warehouse named WideWorldImporters in Microsoft Fabric.
> 
> • Load data into the Warehouse_FabricXX workspace using a Data Factory pipeline.
> 
> • Generate dimension_city and fact_sale tables within the data warehouse.
> 
> • Populate dimension_city and fact_sale tables with data from Azure Blob Storage.
> 
> • Create clones of dimension_city and fact_sale tables in the Warehouse.
> 
> • Clone dimension_city and fact_sale tables into the dbo1 schema.
> 
> • Develop a stored procedure to transform data and create aggregate_sale_by_date_city table.
> 
> • Generate a query using the visual query builder to merge and aggregate data.
> 
> • Use a notebook to query and analyze data from the dimension_customer table.
> 
> • Include WideWorldImporters and ShortcutExercise warehouses for cross-querying.
> 
> • Execute a T-SQL query across WideWorldImporters and ShortcutExercise warehouses.
> 
> • Enable Azure Maps visual integration in the Admin portal.
> 
> • Generate column chart, map, and table visuals for Sales Analysis report.
> 
> • Create a report using data from the WideWorldImporters dataset in the OneLake data hub.
> 
> • Remove the workspace and its associated items.

[more...](https://labclient.labondemand.com/Instructions/de8607fa-b36b-4a76-863a-c2fc910ef8fb?rc=10#)

## **Task 1: Create a workspace**

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter** button.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image1.png)
    
2. In the **Microsoft Fabric** window, enter your credentials, and click on the **Submit** button.
    
    ![A close up of a white and green object Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image2.png)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button**.**
    
    ![A login screen with a red box and blue text Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image3.png)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![A screenshot of a computer error Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image4.png)
    
5. In the **Microsoft Fabric** home page, select the **Power BI** template.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image5.png)
    
6. In the **Power BI Home** page menu bar on the left, select **Workspaces** (the icon looks similar to 🗇).
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image6.png)
    
7. In the Workspaces pane Select **+** **New workspace**.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image7.png)
    
8. In the **Create a workspace tab**, enter the following details and click on the **Apply** button.
    
    |**Name**|**`Warehouse_FabricXX`**(XX can be a unique number) (here, we entered **_Warehouse_Fabric29)_**|
    |---|---|
    |**Description**|`This workspace contains all the artifacts for the data warehouse`|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**Small dataset storage format**|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image8.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image9.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image10.png)
    
9. Wait for the deployment to complete. It takes 2-3 minutes to complete. When your new workspace opens, it should be empty.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image11.png)
    
10. In the **Power BI Fabric Lakehouse Tutorial-XX** page, click on the **Data Warehouse** icon located at the bottom left and select **Data Warehouse** under Datascience.
    
    ![196o3gju.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/196o3gju.jpg)
    

## **Task 2: Create a Warehouse in Microsoft Fabric**

1. In the **Synapse Data Warehouse** page, select **Warehouse** to create a lakehouse.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image13.png)
    
2. On the **New warehouse** dialog, enter **`WideWorldImporters`** as the name and click on the **Create** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image14.png)
    
3. When provisioning is complete, the **WideWorldImporters** warehouse landing page appears.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image15.png)
    

## **Task 3: Ingest data into a Warehouse in Microsoft Fabric**

1. From the **WideWorldImporters** warehouse landing page, select **Warehouse_FabricXX** in the left-sided navigation menu to return to the workspace item list.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image16.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image17.png)
    
2. In the **Warehouse_FabricXX** page, click on the **+New** dropdown. Then, click on **More options** to view the full list of available items.
    
    ![utbpc8lh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/utbpc8lh.jpg)
    
3. In the **Synapse Data Engineering** **Warehouse_FabricXX** page, In the **Data Factory** section, select **Data pipeline**.
    
    ![t2zmpgrw.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/t2zmpgrw.jpg)
    
4. On the **New** **pipeline** dialog, enter **`Load Customer Data`** as the name and click on **Create** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image20.png)
    
5. In the **`Load Customer Data`** pane, Select **Add pipeline activity** from the **Start building your data pipeline** landing page.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image21.png)
    
6. Select **Copy data** from the **Move &** **transform** section.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image22.png)
    
7. Select the newly created **Copy data** **1** activity from the design canvas and follow the next steps to configure it.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image23.png)
    
    > **Note:** Drag the horizonal line in the design canvas to have a complete view of various features.
    
8. On the **General** page, for **Name**, enter **`CD Load dimension_customer`**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image24.png)
    
9. On the **Source** page, select **External** for the **Data store type**. Next to the **Connection** box, select **New** to create a new connection.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image25.png)
    
10. On the **New connection** window, under **All** tab, navigate and select **Azure Blob Storage**, then click on the **Continue** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image26.png)
    
11. On the **Connection settings** pane that appears on the right side, configure the following settings and click on the **Create** button for accessibility.
    
    - In the **Account name or URL**, enter **`https://azuresynapsestorage.blob.core.windows.net/sampledata/`**.
        
    - In the **Connection credentials** section, select **Create new connection** in the dropdown for the **Connection**.
        
    - For **Connection name**, enter **`Wide World Importers Public Sample`**.
        
    - Set the **Authentication kind** to **Anonymous**.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image27.png)
    
12. Change the remaining settings on the **Source** page of the copy activity as follows, to reach the .parquet files in https://azuresynapsestorage.blob.core.windows.net/sampledata/WideWorldImportersDW/parquet/full/dimension_city/*.parquet:
    
13. In the **File path** text boxes, provide:
    
    - **Container:** **`sampledata`**
        
    - **File path - Directory:** **`WideWorldImportersDW/tables`**
        
    - **File path - File name:** **`dimension_customer.parquet`**
        
    - In the **File format** drop down, choose **Parquet**.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image28.png)
    
14. Click on **Preview data** on the right side of **File path** setting to ensure that there are no errors and then click on **close**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image29.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image30.png)
    
15. On the **Destination** page, enter the following settings.
    
    |||
    |---|---|
    |Data store type|Workspace|
    |Workspace data store type|Data Warehouse|
    |Data Warehouse|drop down, select **WideWorldImporters** from the list|
    |Table option|Auto create table|
    |Table|- In the first box enter `dbo` - In the second box enter `dimension_customer`|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image31.png)
    
16. From the ribbon, select **Run**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image32.png)
    
17. Select **Save and run** from the dialog box. The pipeline to load the dimension_customer table with start.
    
    > ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image33.png)
    > 
    > ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image34.png)
    > 
    > ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image35.png)
    
18. Monitor the copy activity's progress on the **Output** page and wait for it to complete.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image36.png)
    

## **Task 4: Create tables in a data warehouse**

1. In **Load Customer Data** page menu bar on the left Select **Warehouse_FabricXX** **Workspace** in the navigation menu.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image37.png)
    
2. In the **Syanapse Data Engineering** **Warehouse_FabricXX** pane, from the item list select **WideWorldImporters** with the type of **Warehouse**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image38.png)
    
3. In the **WideWorldImporters** page, from the **Home** ribbon select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image39.png)
    
4. In the query editor, **paste** the following code and select **Run** to execute the query
    
    SQLCopy
    
    `/* 1. Drop the dimension_city table if it already exists. 2. Create the dimension_city table. 3. Drop the fact_sale table if it already exists. 4. Create the fact_sale table. */  --dimension_city DROP TABLE IF EXISTS [dbo].[dimension_city]; CREATE TABLE [dbo].[dimension_city]     (         [CityKey] [int] NULL,         [WWICityID] [int] NULL,         [City] [varchar](8000) NULL,         [StateProvince] [varchar](8000) NULL,         [Country] [varchar](8000) NULL,         [Continent] [varchar](8000) NULL,         [SalesTerritory] [varchar](8000) NULL,         [Region] [varchar](8000) NULL,         [Subregion] [varchar](8000) NULL,         [Location] [varchar](8000) NULL,         [LatestRecordedPopulation] [bigint] NULL,         [ValidFrom] [datetime2](6) NULL,         [ValidTo] [datetime2](6) NULL,         [LineageKey] [int] NULL     );  --fact_sale  DROP TABLE IF EXISTS [dbo].[fact_sale];  CREATE TABLE [dbo].[fact_sale]  ``` (     [SaleKey] [bigint] NULL,     [CityKey] [int] NULL,     [CustomerKey] [int] NULL,     [BillToCustomerKey] [int] NULL,     [StockItemKey] [int] NULL,     [InvoiceDateKey] [datetime2](6) NULL,     [DeliveryDateKey] [datetime2](6) NULL,     [SalespersonKey] [int] NULL,     [WWIInvoiceID] [int] NULL,     [Description] [varchar](8000) NULL,     [Package] [varchar](8000) NULL,     [Quantity] [int] NULL,     [UnitPrice] [decimal](18, 2) NULL,     [TaxRate] [decimal](18, 3) NULL,     [TotalExcludingTax] [decimal](29, 2) NULL,     [TaxAmount] [decimal](38, 6) NULL,     [Profit] [decimal](18, 2) NULL,     [TotalIncludingTax] [decimal](38, 6) NULL,     [TotalDryItems] [int] NULL,     [TotalChillerItems] [int] NULL,     [LineageKey] [int] NULL,     [Month] [int] NULL,     [Year] [int] NULL,     [Quarter] [int] NULL ); ```  `
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image40.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image41.png)
    
5. To save this query, right-click on the **SQL query** 1 tab just above the editor and select **Rename**.
    
    ![2sv1a8wt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2sv1a8wt.jpg)
    
6. In the **Rename** dialog box, under **Name** field, enter **`Create Tables`** to change the name of **SQL query 1**. Then, click on the **Rename** button.
    
    ![gf8maoie.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gf8maoie.jpg)
    
7. Click on the **Refresh icon** below the **Home** tab, as shown in the below image.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image44.png)
    
8. In the **Explorer** pane, verify that you can see the newly created **Create Tables** query, **fact_sale** table, and **dimension_city** table.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image45.png)
    

## **Task 5: Load data using T-SQL**

Now that you know how to build a data warehouse, load a table, and generate a report, it's time to extend the solution by exploring other methods for loading data.

1. In the **WideWorldImporters** page , in the Home pane select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image46.png)
    
2. In the query editor, **paste** the following code. Select **Run** to execute the query and the query takes between one and four minutes to execute.
    
    SQLCopy
    
    `--Copy data from the public Azure storage account to the dbo.dimension_city table. COPY INTO [dbo].[dimension_city] FROM 'https://azuresynapsestorage.blob.core.windows.net/sampledata/WideWorldImportersDW/tables/dimension_city.parquet' WITH (FILE_TYPE = 'PARQUET');  --Copy data from the public Azure storage account to the dbo.fact_sale table. COPY INTO [dbo].[fact_sale] FROM 'https://azuresynapsestorage.blob.core.windows.net/sampledata/WideWorldImportersDW/tables/fact_sale.parquet' WITH (FILE_TYPE = 'PARQUET');`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image47.png)
    
3. After the query is completed, review the messages to see the rows affected which indicated the number of rows that were loaded into the **dimension_city** and **fact_sale** tables respectively.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image48.png)
    
4. Load the data preview to validate the data loaded successfully by selecting on the **fact_sale** table in the **Explorer**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image49.png)
    
5. Rename the query. Right-click on **SQL query 1** in the **Explorer** and select **Rename**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image50.png)
    
6. In the **Rename** dialog box, under the **Name** field, enter **`Load Tables`**. Then, click on **Rename** button.
    
    ![xr941km3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xr941km3.jpg)
    
7. Press **Enter** on the keyboard or select anywhere outside the tab to save the change.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image52.png)
    

## **Task 6: Clone table using T-SQL in Microsoft Fabric**

This task guides you through creating a [table clone](https://learn.microsoft.com/en-in/fabric/data-warehouse/clone-table) in Warehouse in Microsoft Fabric, using the [CREATE TABLE AS CLONE OF](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-as-clone-of-transact-sql?view=fabric&preserve-view=true) T-SQL syntax.

1. Create a table clone within the same schema in a warehouse.
    
2. In the **WideWorldImporter** page, from the **Home** ribbon, select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image53.png)
    
3. In the query editor, paste the following code to create clones of the **dbo.dimension_city** and **dbo.fact_sale** tables.
    
    SQLCopy
    
    `--Create a clone of the dbo.dimension_city table. CREATE TABLE [dbo].[dimension_city1] AS CLONE OF [dbo].[dimension_city];  --Create a clone of the dbo.fact_sale table. CREATE TABLE [dbo].[fact_sale1] AS CLONE OF [dbo].[fact_sale];`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image54.png)
    
4. Select **Run** to execute the query. The query takes a few seconds to execute. After the query is completed, the table clones **dimension_city1** and **fact_sale1** have been created.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image55.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image56.png)
    
5. Load the data preview to validate the data loaded successfully by selecting on the **dimension_city1** table in the **Explorer**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image57.png)
    
6. Rename the query for reference later. Right-click on **SQL query 3** in the **Explorer** and select **Rename**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image58.png)
    
7. In the **Rename** dialog box, under the **Name** field, enter **`Clone Table`**, then click on the **Rename** button.
    
    ![vgfgcxfx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vgfgcxfx.jpg)
    

## **Task 7: Create a table clone across schemas within the same warehouse**

1. In **WideWorldImporters** page, click on **New SQL query** in the command bar.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image60.png)
    
2. Create a new schema within the **WideWorldImporter** warehouse named **dbo1**. **Copy paste**, and **run** the following T-SQL code:
    
    SQLCopy
    
    `CREATE SCHEMA dbo1;`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image61.png)
    
3. In the query editor, paste the following code to create clones of the **dbo.dimension_city** and **dbo.fact_sale** tables in the **dbo1** schema.
    
    SQLCopy
    
    `--Create a clone of the dbo.dimension_city table in the dbo1 schema.     CREATE TABLE [dbo1].[dimension_city1] AS CLONE OF [dbo].[dimension_city];  --Create a clone of the dbo.fact_sale table in the dbo1 schema.     CREATE TABLE [dbo1].[fact_sale1] AS CLONE OF [dbo].[fact_sale];`
    
4. Select **Run** to execute the query. The query takes a few seconds to execute.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image62.png)
    
5. After the query is completed, clones **dimension_city1** and **fact_sale1** are created in the **dbo1** schema.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image63.png)
    
6. Load the data preview to validate the data loaded successfully by selecting on the **dimension_city1** table under **dbo1** schema in the **Explorer**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image64.png)
    
7. **Rename** the query for reference later. Right-click on **SQL query 1** in the **Explorer** and select **Rename**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image65.png)
    
8. In the **Rename** dialog box, under the **Name** field, enter `Clone Table in another schema`. Then, click on **Rename** button.
    
    ![mg8k43oz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mg8k43oz.jpg)
    

## **Task 8: Transform data using a stored procedure**

Learn how to create and save a new stored procedure to transform data.

1. From the **Home** tab of the ribbon, select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image67.png)
    
2. In the query editor, **paste** the following code to create the stored procedure **dbo.populate_aggregate_sale_by_city**. This stored procedure will create and load the **dbo.aggregate_sale_by_date_city** table in a later step.
    
    SQLCopy
    
    `--Drop the stored procedure if it already exists. DROP PROCEDURE IF EXISTS [dbo].[populate_aggregate_sale_by_city] GO  --Create the populate_aggregate_sale_by_city stored procedure. CREATE PROCEDURE [dbo].[populate_aggregate_sale_by_city] AS BEGIN     --If the aggregate table already exists, drop it. Then create the table.     DROP TABLE IF EXISTS [dbo].[aggregate_sale_by_date_city];     CREATE TABLE [dbo].[aggregate_sale_by_date_city]         (             [Date] [DATETIME2](6),             [City] [VARCHAR](8000),             [StateProvince] [VARCHAR](8000),             [SalesTerritory] [VARCHAR](8000),             [SumOfTotalExcludingTax] [DECIMAL](38,2),             [SumOfTaxAmount] [DECIMAL](38,6),             [SumOfTotalIncludingTax] [DECIMAL](38,6),             [SumOfProfit] [DECIMAL](38,2)         );  ``` --Reload the aggregated dataset to the table. INSERT INTO [dbo].[aggregate_sale_by_date_city] SELECT     FS.[InvoiceDateKey] AS [Date],      DC.[City],      DC.[StateProvince],      DC.[SalesTerritory],      SUM(FS.[TotalExcludingTax]) AS [SumOfTotalExcludingTax],      SUM(FS.[TaxAmount]) AS [SumOfTaxAmount],      SUM(FS.[TotalIncludingTax]) AS [SumOfTotalIncludingTax],      SUM(FS.[Profit]) AS [SumOfProfit] FROM [dbo].[fact_sale] AS FS INNER JOIN [dbo].[dimension_city] AS DC     ON FS.[CityKey] = DC.[CityKey] GROUP BY     FS.[InvoiceDateKey],     DC.[City],      DC.[StateProvince],      DC.[SalesTerritory] ORDER BY      FS.[InvoiceDateKey],      DC.[StateProvince],      DC.[City]; ```  END`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image68.png)
    
3. In the **Rename** dialog box, under the **Name** field, enter **`Create Aggregate Procedure`**, then click on the **Rename** button.
    
    ![fvkail3j.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/fvkail3j.jpg)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image70.png)
    
4. Press **Enter** on the keyboard or select anywhere outside the tab to save the change.
    
5. From the **Home** tab of the ribbon, select the **refresh** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image72.png)
    
6. In the **Explorer** tab, verify that you can see the newly created stored procedure by expanding the **StoredProcedures** node under the **dbo** schema.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image73.png)
    
7. From the **Home** tab of the ribbon, select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image74.png)
    
8. In the query editor, paste the following code. This T-SQL executes **dbo.populate_aggregate_sale_by_city** to create the **dbo.aggregate_sale_by_date_city** table.
    
    SqlCopy
    
    `--Execute the stored procedure to create the aggregate table. EXEC [dbo].[populate_aggregate_sale_by_city];`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image75.png)
    
9. To save this query for reference later, right-click on the query tab just above the editor and select **Rename.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image76.png)
    
10. Type **Run Create Aggregate Procedure** to change the name of the query. Press **Enter** on the keyboard or select anywhere outside the tab to save the change.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image77.png)
    
11. Select **Run** to execute the query.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image78.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image79.png)
    
12. Select the **refresh** button on the ribbon. The query takes between two and three minutes to execute.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image80.png)
    
13. In the Object **Explorer** tab, load the data preview to validate the data loaded successfully by selecting on the **aggregate_sale_by_city** table in the **Explorer**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image81.png)
    

## **Task 9: Create a query with the visual query builder**

Create and save a query with the visual query builder in the Microsoft Fabric portal.

1. In the **WideWolrdImporters** page, from the **Home** tab of the ribbon, select **New visual query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image82.png)
    
2. Drag the **fact_sale** table from the **Explorer** to the query design pane.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image83.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image84.png)
    
3. In the query design pane, from the **transformations ribbon** limit the dataset size by select the dropdown next to **Reduce rows** and select the **Keep top rows** .
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image85.png)
    
4. In the **Keep top rows** dialog box, enter **`10000`** and Select **OK**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image86.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image87.png)
    
5. Drag the **dimension_city** table from the **Explorer** pane to the **query design** pane.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image88.png)
    
6. From the transformations ribbon, select the dropdown next to **Combine** and select **Merge queries as new**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image89.png)
    
7. On the **Merge** settings page enter the following details.
    
    - In the **Left table for merge** dropdown, choose **dimension_city**
        
    - In the **Right table for merge** dropdown, choose **fact_sale**
        
    - Select the **CityKey** field in the **dimension_city** table by selecting on the column name in the header row to indicate the join column.
        
    - Select the **CityKey** field in the **fact_sale** table by selecting on the column name in the header row to indicate the join column.
        
    - In the **Join kind** diagram selection, choose **Inner** and click on the **Ok** button.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image90.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image91.png)
    
8. With the **Merge** step selected, select the **Expand** button next to **fact_sale** on the header of the data grid then select the columns **TaxAmount, Profit, TotalIncludingTax** and select **Ok.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image92.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image93.png)
    
9. From the **transformations ribbon** select the dropdown next to **Transform** and select the **Group by**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image94.png)
    
10. On the **Group by** settings page enter the following details.
    
    - Change to **Advanced**.
        
    - **Group by** (if necessary, select **Add grouping** to add more group by columns):
        
        1. **Country**
            
        2. **StateProvince**
            
        3. **City**
            
    - In the **New column name** enter **`SumOfTaxAmount`** choose **Operation** of **Sum** and Column of **TaxAmount** and select **Add aggregation** to add more aggregate column and operation.
        
    - In the **New column name** enter **`SumOfProfit`** choose **Operation** of **Sum** and Column of **Profit** and select **Add aggregation** to add more aggregate column and operation.
        
    - In the **New column name** enter **`SumOfTotalIncludingTax`** choose **Operation** of **Sum** and Column of **TotalIncludingTax.**
        
    - Click on the **Ok** button
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image95.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image96.png)
    
11. Right-click on **Visual query 1** under **Queries** in the **Explorer** and select **Rename**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image97.png)
    
12. Type **`Sales Summary`** to change the name of the query. Press **Enter** on the keyboard or select anywhere outside the tab to save the change.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image98.png)
    

## **Task 10: Analyze data with a notebook**

In this task, learn about how you can save your data once and then use it with many other services. Shortcuts can also be created to data stored in Azure Data Lake Storage and S3 to enable you to directly access delta tables from external systems.

First, we create a new lakehouse. To create a new lakehouse in your Microsoft Fabric workspace:

1. In the **WideWorldImportes** page menu bar on the left, select the **Warehouse_FabricXX** Workspace.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image99.png)
    
2. In the **Synapse Data Engineering Warehouse_FabricXX** home page, under **Warehouse_FabricXX** pane select **+New** and select the **Lakehouse**.
    
    ![sriz5ttz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sriz5ttz.jpg)
    
3. In the **Name** field, enter **`ShortcutExercise`** and click on the **Create**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image101.png)
    
4. The new lakehouse loads and the **Explorer** view opens up, with the **Get data** in your lakehouse menu. Under **Load data in your lakehouse**, select the **New shortcut** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image102.png)
    
5. In the **New shortcut** window, select the button for **Microsoft OneLake**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image103.png)
    
6. In the **Select a data source type** window, scroll through the list until you find the **Warehouse** named **WideWorldImporters** you created previously. Select it, then select **Next**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image104.png)
    
7. In the **OneLake** object browser, expand **Tables**, then expand the **dbo** schema, and select the radio button beside **dimension_customer**. Select the **Next** button.
    
    ![skt1xi2d.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/skt1xi2d.jpg)
    
8. In the **New shortcut** window, click on the **Create** button and click on the **Close** button
    
    ![stb6s3rr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/stb6s3rr.jpg)
    
    ![3a8bdkon.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3a8bdkon.jpg)
    
9. Select the **Refresh** icon in the horizontal menu bar and see a folder called **Unidentified** under **Tables**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image106.png)
    
10. Select the **dimension_customer** in the **Table** list to preview the data. Notice that the lakehouse is showing the data from the **dimension_customer** table from the Warehouse!
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image107.png)
    
11. Next, create a new notebook to query the **dimension_customer** table. In the **Home** ribbon, select the drop down for **Open notebook** and choose **New notebook**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image108.png)
    
12. Select, then drag the **dimension_customer** from the **Tables** list into the open notebook cell. You can see a **PySpark** query has been written for you to query all the data from **ShortcutExercise.dimension_customer**. This notebook experience is similar to Visual Studio Code Jupyter notebook experience. You can also open the notebook in VS Code.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image109.png)
    
13. In the **Home** ribbon, select the **Run all** button. Once the query is completed, you will see you can easily use PySpark to query the Warehouse tables!
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image110.png)
    

## **Task 11: Add multiple warehouses to the Explorer**

In this task, learn about how you can easily create and execute T-SQL queries with the SQL query editor across multiple warehouse, including joining together data from a SQL Endpoint and a Warehouse in Microsoft Fabric.

1. In the **Notebook1** pane menu bar on the left, select the **Warehouse_FabricXX** Workspace.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image111.png)
    
2. In the **Warehouse_FabricXX** view, select the **WideWorldImporters** warehouse.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image112.png)
    
3. In the **WideWorldImpoeters** page, under **Explorer** tab, select the **+ Warehouses** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image113.png)
    
4. Select the **SQL endpoint** of the lakehouse you created using shortcuts previously, named **ShortcutExercise** and click on the **Confirm** button.Both warehouse experiences are added to the query.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image114.png)
    
5. Your selected warehouses now show the same **Explorer** pane.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image115.png)
    

## **Task 12: Execute a cross-warehouse query**

In this example, you can see how easily you can run T-SQL queries across the WideWorldImporters warehouse and ShortcutExercise SQL Endpoint. You can write cross-database queries using three-part naming to reference the database.schema.table, as in SQL Server.

1. From the **Home** tab of the ribbon, select **New SQL query**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image116.png)
    
2. In the query editor, copy and paste the following T-SQL code. Select the **Run** button to execute the query. After the query is completed, you will see the results.
    
    SQLCopy
    
    `SELECT Sales.StockItemKey,  Sales.Description,  SUM(CAST(Sales.Quantity AS int)) AS SoldQuantity,  c.Customer FROM [dbo].[fact_sale] AS Sales, [ShortcutExercise].[dbo].[dimension_customer] AS c WHERE Sales.CustomerKey = c.CustomerKey GROUP BY Sales.StockItemKey, Sales.Description, c.Customer;`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image117.png)
    
3. Rename the query for reference later. Right-click on **SQL query 1** in the **Explorer** and select **Rename**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image118.png)
    
4. Type **`Cross-warehouse query`** to change the name of the query.Press **Enter** on the keyboard or select anywhere outside the tab to save the change.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image119.png)
    

## **Task 13: Enable azure maps visuals sign in**

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/home`** then press the **Enter** button. In Microsoft Fabric page, click on **Power BI**.
    
    ![3nagevyp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/3nagevyp.jpg)
    
2. On right side of Power BI home page, click on the **Settings** icon.
    
    ![6jui75xa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/6jui75xa.jpg)
    
    In case, you did not see the **Settings** icon, then click on the horizontal ellipsis on the top right side of the page, then navigate and click on **Settings** as shown in the below image.
    
    ![tjdw0wyd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/tjdw0wyd.jpg)
    
3. In **Settings** tab, under **Governance and insights** select **Admin portal** .
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image122.png)
    
4. In **Admin portal** pane, select **Tenant settings**, scroll down to **Integration settings** section, click on **Use Azure Maps visual**, then enable it using the **toggle** button. After **Use Azure Maps visual** were Enabled, click on the **Apply** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image123.png)
    
5. You will see a notification stating **Applying changes.**
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image124.png)
    

## **Task 14: Create Power BI reports**

In this task we learn how to create and save several types of Power BI reports.

1. In the **WideWorldImportes** page, Select the **Model** view from the options in the bottom left corner, just outside the canvas.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image125.png)
    
2. From the **fact_sale** table, drag the **CityKey** field and drop it onto the **CityKey** field in the **dimension_city** table to create a relationship.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image126.png)
    
3. On the **Create Relationship** settings:
    
    - **Table 1** is populated with **fact_sale** and the column of **CityKey**.
        
    - **Table 2** is populated with **dimension_city** and the column of **CityKey**.
        
    - **Cardinality**: select **Many to one (*:1)**.
        
    - **Cross filter direction**: select **Single**.
        
    - Leave the box next to **Make this relationship active** checked.
        
    - Check the box next to **Assume referential integrity**.
        
    - Select **Confirm**.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image127.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image128.png)
    
4. From the **Home** tab of the ribbon, select **New report**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image129.png)
    
5. In the **Synapse Data Engineering Warehouse_FabricXX** page, under **Visualizations**, click to the **Column chart** icon to add a **Column chart** to your report.
    
    - On the **Data** pane, expand **fact_sales** and check the box next to **Profit**. This creates a column chart and adds the field to the Y-axis.
        
    - On the **Data** pane, expand **dimension_city** and check the box next to **SalesTerritory**. This adds the field to the X-axis.
        
    - Reposition and resize the column chart to take up the top left quarter of the canvas by dragging the anchor points on the corners of the visual.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media06/image130.png)