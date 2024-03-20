# **Lab 01: Creating a Lakehouse, ingesting sample data and building a report**

> **Introduction**
> 
> This lab walks you through an end-to-end scenario from data acquisition to data consumption. It helps you build a basic understanding of Fabric, including the different experiences and how they integrate, as well as the professional and citizen developer experiences that come with working on this platform. This lab isn't intended to be a reference architecture, an exhaustive list of features and functionality, or a recommendation of specific best practices.
> 
> Traditionally, organizations have been building modern data warehouses for their transactional and structured data analytics needs. And data lakehouses for big data (semi/unstructured) data analytics needs. These two systems ran in parallel, creating silos, data duplicity, and increased total cost of ownership.
> 
> Fabric with its unification of data store and standardization on Delta Lake format allows you to eliminate silos, remove data duplicity, and drastically reduce total cost of ownership.
> 
> With the flexibility offered by Fabric, you can implement either lakehouse or data warehouse architectures or combine them together to get the best of both with simple implementation. In this tutorial, you're going to take an example of a retail organization and build its lakehouse from start to finish. It uses the **medallion architecture** where the bronze layer has the raw data, the silver layer has the validated and deduplicated data, and the gold layer has highly refined data. You can take the same approach to implement a lakehouse for any organization from any industry.
> 
> This lab explains how a developer at the fictional Wide World Importers company from the retail domain completes the following steps:

[more...](https://labclient.labondemand.com/Instructions/de8607fa-b36b-4a76-863a-c2fc910ef8fb?rc=10#)

> **Objectives**
> 
> 1. Sign in to Power BI account and initiate a free Microsoft Fabric trial.
> 2. Start the Microsoft Fabric (Preview) trial within Power BI.
> 3. Configure OneDrive sign-up for the Microsoft 365 admin center.
> 4. Build and implement an end-to-end lakehouse for the organization, including creating a Fabric workspace and a lakehouse.
> 5. Ingest sample data into the lakehouse and prepare it for further processing.
> 6. Transform and prepare the data using Python/PySpark and SQL notebooks.
> 7. Create business aggregate tables using different approaches.
> 8. Establish relationships between tables for seamless reporting.
> 9. Build a Power BI report with visualizations based on the prepared data.
> 10. Save and store the created report for future reference and analysis.

[more...](https://labclient.labondemand.com/Instructions/de8607fa-b36b-4a76-863a-c2fc910ef8fb?rc=10#)

# **Exercise 1: Setup Lakehouse end-to-end scenario**

# **Task 1: Sign in to Power BI account and sign up for the free Microsoft Fabric trial**

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image1.png)
    
2. In the **Microsoft Fabric** window, enter your **Microsoft 365** credentials from the **Resources** tab, and click on the **Submit** button.
    
    ![exh8tqoi.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/exh8tqoi.jpg)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image2.png)
    
3. Enter the **Administrative password** from the **Resources** tab and click on the **Sign in** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image3.png)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image4.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image5.png)
    

# **Task 2: Start the Microsoft Fabric (Preview) trial**

Follow these steps to start your Fabric (Preview) trial.

1. On **Power BI Home** page, click on the **Account manager for MOD Administrator** icon on the top right corner of the page. In the Account manager blade, navigate and select **Start trial** as shown in the below image.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image6.png)
    
2. If prompted, agree to the terms and then select **Start trial**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image7.png)
    
3. Once your trial capacity is ready, you receive a confirmation message. Select **Got it** to begin working in Fabric.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image8.png)
    
    ![s6aeq4vb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/s6aeq4vb.jpg)
    
4. You will get a **Successfully upgraded to a free Microsoft Fabic (preview) trial** notification. Click on Stay on current page and continue to next task.
    
    ![4qx77ng3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/4qx77ng3.jpg)
    

# **Task 3: Ingest First Dimension**

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://admin.microsoft.com/AdminPortal/Home#/homepage`** then press the **Enter** button.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image10.png)
    
    > **Note:** If you are directly landed on Microsoft 365 admin center page, then skip steps from #2 to #4.
    
2. In the **Microsoft Azure** window, enter your **Sign-in** credentials, and click on the **Next** button.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image11.png)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button**.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image3.png)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image4.png)
    
5. Click on the **App launcher** from the top left corner of the Microsoft 365 admin center page.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image12.png)
    
6. In the Microsoft 365 page from the Apps pane select **OneDrive**
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image13.png)
    
7. In **One Drive** page, under **Securely store and share files** select **Your One Drive is ready**
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image14.png)
    
    ![ya0uu78u.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/ya0uu78u.jpg)
    

# **Exercise 2: Build and implement an end-to-end lakehouse for your organization**

## **Task 1: Create a Fabric workspace**

In this task, you create a Fabric workspace. The workspace contains all the items needed for this lakehouse tutorial, which includes lakehouse, dataflows, Data Factory pipelines, the notebooks, Power BI datasets, and reports.

1. Back in the **Power BI** page, select **Workspaces** from the left side navigation menu.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image16.png)
    
2. In the Workspaces pane Select **+** **New workspace**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image17.png)
    
3. In the **Create a workspace tab**, enter the following details and click on the **Apply** button.
    
    |**Name**|**`Fabric Lakehouse Tutorial-XX`** (XX can be a unique number) (here, we entered **Fabric Lakehouse Tutorial-29**)|
    |---|---|
    |**Description**|**`This workspace contains all the items for the lakehouse tutorial`**|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**Small dataset storage format**|
    |**Template apps**|**Check the Develop template apps**|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image18.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image19.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image20.png)
    
4. Wait for the deployment to complete. It takes 2-3 minutes to complete
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image21.png)
    

## **Task 2: Create a lakehouse**

1. In the **Power BI Fabric Lakehouse Tutorial-XX** page, click on the **Power BI** icon located at the bottom left and select **Data Engineering** under Synapse.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image22.png)
    
2. In the **Synapse** **Data Engineering** **Home** page, select **Lakehouse(Preview)** to create a lakehouse.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image23.png)
    
3. In the **New lakehouse** dialog box, enter **`wwilakehouse`** in the **Name** field, click on the **Create** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image24.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image25.png)
    
4. You will see a notification stating **Successfully created SQL endpoint**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image26.png)
    

## **Task 3: Ingest sample data**

1. In the **wwilakehouse** page, under **Get data in your lakehouse** section, click on **New Dataflow Gen2** as shown in the below image.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image27.png)
    
2. On the Dataflow canvas, navigate and click on **Import from a Text/CSV file**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image28.png)
    
3. On the **Connect to data source** pane, select the **Upload file(Preview)** radio button. Click on **Browse button** and browse your VM to **C:\LabFiles** and then select **dimension_customer.csv** file. Select **Open.**
    
    > ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image29.png)
    > 
    > ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image30.png)
    
4. In the Connect to data source pane select **Next.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image31.png)
    
5. From the **Preview file data** page, preview the data and select **Create** to proceed and return back to the dataflow canvas.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image32.png)
    
6. In the **Query settings** pane on the right side of the Dataflow canvas, ensure that **dimension_customer** is selected under the **Name** field. Similarly, ensure that **Lakehouse** is selected under the **Data destination** field.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image33.png)
    
    > **Note:**
    > 
    > - _If needed, from the **Connect to data destination** screen, sign into your account. Select **Next**._
    >     
    > - Navigate to the **wwilakehouse** in your workspace.
    >     
    > - If the **dimension_customer** table doesn't exist, select the **New table** setting and enter the table name **dimension_customer**. If the table already exists, select the **Existing table** setting and choose **dimension_customer** from the list of tables in the object explorer. Select **Next**.
    >     
    > 
    > Fabric adds a space and number at the end of the table name by default. Table names must be lower case and must not contain spaces. Please rename it appropriately and remove any spaces from the table name.*
    
7. From the dataflow canvas, you can easily transform the data based on your business requirements. For simplicity, we aren't making any changes in this task. To proceed, select **Publish** at the bottom right of the screen.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image34.png)
    
8. A spinning circle next to the dataflow's name indicates publishing is in progress in the item view. ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image35.png)
    
9. In the **Fabric Lakehouse Tutorial-XX** tab, when publishing is completed, move your mouse to **Dataflow 1** row and click on the horizontal ellipses (…), then navigate and click on **Properties** as shown in the below image.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image36.png)
    
10. In the Dataflow 1 tab ,rename the dataflow to **`Load Lakehouse Table`** and select **Save**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image37.png)
    
11. Select the **Refresh now** option next to data flow name to refresh the dataflow. It runs the dataflow and moves data from the source file to lakehouse table. While it's in progress, you see a spinning circle under **Refreshed** column in the item view.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image38.png)
    
    ![tu29hayd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/tu29hayd.jpg)
    
12. Refreshing data will take around **5-6** min.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image40.png)
    
13. Once the dataflow is refreshed, select **wwilakehouse** in the left navigation panel to view the **dimension_customer** delta table. Select the table to preview its data.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image41.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image42.png)
    
14. You can also use the SQL endpoint of the lakehouse to query the data with SQL statements. Select **SQL endpoint** from the **Lakehouse** drop-down menu at the top right of the screen.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image43.png)
    
15. In the wwilakehouse page, under Explorer select the **dimension_customer** table to preview its data and select **New SQL query** to write your SQL statements.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image44.png)
    
16. The following sample query aggregates the row count based on the **BuyingGroup column** of the **dimension_customer** table. SQL query files are saved automatically for future reference, and you can rename or delete these files based on your need. Paste the code as shown in the below image, then click on the play icon to **Run** the script.
    
    SQLCopy
    
    `SELECT BuyingGroup, Count(*) AS Total FROM dimension_customer GROUP BY BuyingGroup`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image45.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image46.png)
    

## **Task 4: Build a report**

1. Now, click on **Fabric Lakehouse Tutorial-XX** on the left-sided navigation pane.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image47.png)
    
2. In the **Fabric Lakehouse Tutorial-XX** view, select **wwilakehouse** of Type **Semantic model(default)**. This dataset is automatically created and has the same name as the lakehouse.
    
    ![6o6hpdnc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6o6hpdnc.jpg)
    
3. From the semantic model pane, you can view all the tables. You have options to create reports either from scratch, paginated report, or let Power BI automatically create a report based on your data. For this task, navigate to **Discover business** insights section, then click on **Explore this data and select Auto-create a report as shown in the below image**.
    
    ![hv6xdedg.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hv6xdedg.jpg)
    
4. Expand **dimension_customer**, check the box next to **BuyingGroup** and check the box next to **wwwCustomerID** .
    
    ![j75dbg84.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/j75dbg84.jpg)
    
5. Since the table is a dimension and there are no measures in it, Power BI creates a measure for the row count and aggregates it across different columns, and creates different charts as shown in the following image.
    
6. Save this report for the future use by selecting **Save** at the top ribbon.
    
    ![krigitvf.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/krigitvf.jpg)
    
7. In the **Save your report** dialog box, enter the name for your report as **`dimension_customer-report`** and select **Save.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image53.png)
    
8. You will see a notification stating **Report saved**.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image54.png)
    
9. Stay on the same page.
    

# **Exercise 3: Ingest data into the lakehouse**

In this exercise, you ingest additional dimensional and fact tables from the Wide World Importers (WWI) into the lakehouse.

## **Task 1: Ingest data**

In this task, you use the **Copy data activity** of the Data Factory pipeline to ingest sample data from an Azure storage account to the **Files** section of the lakehouse you created earlier.

1. Now, click on **Fabric Lakehouse Tutorial-XX** on the left-sided navigation pane.
    
    ![k3259edy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/k3259edy.jpg)
    
2. In the **Fabric Lakehouse Tutorial-XX** workspace page, click on the drop-down arrow in the **+New** button, then select **Data pipeline** .
    
    ![602o60kz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/602o60kz.jpg)
    
3. In the New pipeline dialog box, specify the name as **`IngestDataFromSourceToLakehouse`** and select **Create.** A new data factory pipeline is created and opened
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image58.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image59.png)
    
4. On newly created data factory pipeline i.e **IngestDataFromSourceToLakehouse**, select **Add pipeline activity** to add an activity to the pipeline and select **Copy data**. This action adds copy data activity to the pipeline canvas.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image60.png)
    
5. Select the newly added **copy data activity** from the canvas. Activity properties appear in a pane below the canvas. Select **Expand**(upward arrow) in the Properties bar as in the below Screenshot.
    
    ![j2dgi1o0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/j2dgi1o0.jpg)
    
6. Under the **General** tab in the properties pane, specify the name for the copy data activity as **`Data Copy to Lakehouse`** .
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image61.png)
    
7. Under **Source** tab of the selected copy data activity, select **External** as **Data store type** and then select **+ New** to create a new connection to data source.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image62.png)
    
8. For this task, all the sample data is available in a public container of Azure blob storage. You connect to this container to copy data from it. On the **New connection** wizard, select **Azure Blob Storage** and then select **Continue**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image63.png)
    
9. On the next screen of the **New connection** wizard, enter the following details and select **Create** to create the connection to the data source.
    
    |**Property**|**Value**|
    |---|---|
    |Account name or URI|`https://azuresynapsestorage.blob.core.windows.net/sampledata`|
    |Connection|Create new connection|
    |Connection name|`wwisampledata`|
    |Authentication kind|Anonymous|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image64.png)
    
10. Once the new connection is created, return to the **Source** tab of the copy data activity, and the newly created connection is selected by default. Specify the following properties before moving to the destination settings.
    
    |**Property**|**Value**|
    |---|---|
    |Data store type|External|
    |Connection|wwisampledata|
    |File path type|File path|
    |File path|Container name (first text box): `sampledata`|
    |File path|Directory name (second text box): `WideWorldImportersDW/parquet`|
    |Recursively|Checked|
    |File Format|Binary|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image65.png)
    
11. Under the **Destination** tab of the selected copy data activity, specify the following properties:
    
    |**Property**|**Value**|
    |---|---|
    |Data store type|Workspace|
    |Workspace data store type|Lakehouse|
    |Lakehouse|wwilakehouse|
    |Root Folder|Files|
    |File path|Directory name (first text box): `wwi-raw-data`|
    |File Format|Binary|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image66.png)
    
12. You have finished configuring the copy data activity. Select the **Save** button on the top ribbon (under **Home**) to save your changes.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image67.png)
    
13. You will see a notification stating **Saving completed.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image68.png)
    
14. In the **IngestDataFromSourceToLakehouse** page select **Run** to execute your pipeline and its activity.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image69.png)
    
15. This action triggers data copy from the underlying data source to the specified lakehouse and might take up to a minute to complete. You can monitor the execution of the pipeline and its activity under the **Output** tab, which appears when you click anywhere on the canvas.
    
    ![uvuc5dti.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uvuc5dti.jpg)
    
    ![uaiu6osv.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uaiu6osv.jpg)
    
16. Under the Output tab, hover your mouse to **Data Copy to Lakehouse** row, select Data Copy to Lakehouse to look at the details of the data transfer. After seeing the **Status** as **Succeeded**, click on the **Close** button.
    
    ![7e4a2m1c.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7e4a2m1c.jpg)
    
    ![d8gsjlzp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/d8gsjlzp.jpg)
    
17. Open the **Duration breakdown** and observe details of used parallel copies.
    
    ![k4h27qeo.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/k4h27qeo.jpg)
    
18. Click on Close.
    
19. Now, click on **Fabric Lakehouse Tutorial-XX** on the left-side navigation pane and select your new lakehouse (**wwilakehouse**) to launch the **Lakehouse explorer** as shown in the below image.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image74.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image75.png)
    
20. Validate that in the **Lakehouse explorer** view, a new folder **wwi-raw-data** has been created. Now expand the **wwi-raw-date** select **full** folder then select **fact_sale_1y_full** and data for all the files have been copied there.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image76.png)
    

# **Exercise 4: Prepare and transform data in the lakehouse**

## **Task 1: Upload data to bronze layer**

From the previous exercise steps, we have raw data ingested from the source to the **Files** section of the lakehouse. Now you can transform that data and prepare it for creating delta tables.

1. Now, click on **Fabric Lakehouse Tutorial-XX** on the left-sided navigation pane
    
    ![as2wf80q.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/as2wf80q.jpg)
    
2. In the **Fabric Lakehouse Tutorial-XX** workspace page, click on the drop-down arrow in the **+New** button, then select **Import notebook**.
    
    ![sd6h2g3v.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sd6h2g3v.jpg)
    
3. Select **Upload** from the **Import status** pane that opens on the right side of the screen.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image79.png)
    
4. Navigate to **C:\LabFiles\Lakehouse Tutorial Source Code**, select **01-Create Delta Tables, 02-Data Transformation-Business Aggregation** notebook and click on **Open**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image80.png)
    
5. You will see a notification stating **Imported successfully.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image81.png)
    
6. After the import is successful, to see the newly imported notebooks select **Fabric Lakehouse Tutorial-XX** under the **Recommended** section.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image82.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image83.png)
    
7. In **Fabric Lakehouse Tutorial-XX** pane, Select **wwilakehouse** lakehouse to open it.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image84.png)
    

### **Task 2: Transform data and load to silver Delta table**

1. In the **wwilakehouse** page, select **Open notebook > Existing notebook** from the top navigation menu.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image85.png)
    
2. From the list of **Open existing notebook**, select the **01 - Create Delta Tables** notebook and select **Open**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image86.png)
    
3. In the opened notebook in **Lakehouse explorer**, you see the notebook is already linked to your opened lakehouse.
    
    ![syzjkvwd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/syzjkvwd.jpg)
    
    > **Note:** Fabric provides the **V-order** capability to write optimized delta lake files. V-order often improves compression by three to four times and up to 10 times performance acceleration over the Delta Lake files that aren't optimized. Spark in Fabric dynamically optimizes partitions while generating files with a default 128 MB size. The target file size may be changed per workload requirements using configurations. With the **optimize write** capability, the Apache Spark engine that reduces the number of files written and aims to increase individual file size of the written data.
    
4. Before you write data as delta lake tables in the **Tables** section of the lakehouse, you use two Fabric features (**V-order** and **Optimize Write**) for optimized data writing and for improved reading performance. To enable these features in your session, set these configurations in the first cell of your notebook.
    
5. To start the notebook and execute the cell, select the **Run** icon that appears to the left of the cell upon hover.
    
    ![wbhq23ff.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/wbhq23ff.jpg)
    
    When running a cell, you didn't have to specify the underlying Spark pool or cluster details because Fabric provides them through Live Pool. Every Fabric workspace comes with a default Spark pool, called Live Pool. This means when you create notebooks, you don't have to worry about specifying any Spark configurations or cluster details. When you execute the first notebook command, the live pool is up and running in a few seconds. And the Spark session is established and it starts executing the code. Subsequent code execution is almost instantaneous in this notebook while the Spark session is active.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image89.png)
    
6. Next, you read raw data from the **Files** section of the lakehouse, and add more columns for different date parts as part of the transformation. you use partitionBy Spark API to partition the data before writing it as delta table based on the newly created data part columns (Year and Quarter).
    
7. To execute the second cell, select **Run** icon that appears to the left of the cell upon hover.
    
    PythonCopy
    
    `from pyspark.sql.functions import col, year, month, quarter table_name = 'fact_sale' df = spark.read.format("parquet").load('Files/wwi-raw-data/full/fact_sale_1y_full') df = df.withColumn('Year', year(col("InvoiceDateKey"))) df = df.withColumn('Quarter', quarter(col("InvoiceDateKey"))) df = df.withColumn('Month', month(col("InvoiceDateKey"))) df.write.mode("overwrite").format("delta").partitionBy("Year","Quarter").save("Tables/" + table_name)`
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image90.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image91.png)
    
8. After the fact tables load, you can move on to loading data for the rest of the dimensions. The following cell creates a function to read raw data from the **Files** section of the lakehouse for each of the table names passed as a parameter. Next, it creates a list of dimension tables. Finally, it loops through the list of tables and creates a delta table for each table name that's read from the input parameter.
    
9. Select the cell and select **Run** icon that appears to the left of the cell upon hover.
    
    PythonCopy
    
    `from pyspark.sql.types import * def loadFullDataFromSource(table_name): df = spark.read.format("parquet").load('Files/wwi-raw-data/full/' + table_name) df.write.mode("overwrite").format("delta").save("Tables/" + table_name) full_tables = [     'dimension_city',     'dimension_date',     'dimension_employee',     'dimension_stock_item'     ] for table in full_tables: loadFullDataFromSource(table)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image92.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image93.png)
    
10. To validate the created tables, right click on **Tables** folder and choose **Refresh**. The tables appear.
    
    ![f6erwxnk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/f6erwxnk.jpg)
    
    ![o1pbny9m.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/o1pbny9m.jpg)
    
11. Go the items view of the workspace again select **Fabric Lakehouse Tutorial-XX** and select the **wwilakehouse** lakehouse to open it.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image97.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image84.png)
    
12. Now, open the second notebook. In the lakehouse view, select **Open notebook > Existing notebook** from the ribbon.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image98.png)
    
13. From the list of Open existing notebook, select the **02 - Data Transformation - Business** **Aggregation** notebook and click on the **Open**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image99.png)
    
14. In the open notebook in **Lakehouse explorer**, you see the notebook is already linked to your opened lakehouse.
    
15. To start the notebook and select the 1stcell and select the **Run** icon that appears to the left of the cell upon hover.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image100.png)
    
16. An organization might have data engineers working with Scala/Python and other data engineers working with SQL (Spark SQL or T-SQL), all working on the same copy of the data. Fabric makes it possible for these different groups, with varied experience and preference, to work and collaborate. The two different approaches transform and generate business aggregates. You can pick the one suitable for you or mix and match these approaches based on your preference without compromising on the performance:
    
    - **Approach #1** - Use PySpark to join and aggregates data for generating business aggregates. This approach is preferable to someone with a programming (Python or PySpark) background.
        
    - **Approach #2** - Use Spark SQL to join and aggregates data for generating business aggregates. This approach is preferable to someone with SQL background, transitioning to Spark.
        
17. **Approach #1 (sale_by_date_city)** - Use PySpark to join and aggregate data for generating business aggregates. With the following code, you create three different Spark dataframes, each referencing an existing delta table. Then you join these tables using the dataframes, do group by to generate aggregation, rename a few of the columns, and finally write it as a delta table in the **Tables** section of the lakehouse to persist with the data.
    
    In this cell, you create three different Spark dataframes, each referencing an existing delta table.
    
    Execute the cell by clicking on the **Run** icon.
    
    PythonCopy
    
    `df_fact_sale = spark.read.table("wwilakehouse.fact_sale") df_dimension_date = spark.read.table("wwilakehouse.dimension_date") df_dimension_city = spark.read.table("wwilakehouse.dimension_city")`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image101.png)
    
18. In this cell, you join these tables using the dataframes created earlier, do group by to generate aggregation, rename a few of the columns, and finally write it as a delta table in the **Tables** section of the lakehouse.
    
    Execute the cell by clicking on the **Run** icon.
    
    PythonCopy
    
    `sale_by_date_city = df_fact_sale.alias("sale") \ .join(df_dimension_date.alias("date"), df_fact_sale.InvoiceDateKey == df_dimension_date.Date, "inner") \ .join(df_dimension_city.alias("city"), df_fact_sale.CityKey == df_dimension_city.CityKey, "inner") \ .select("date.Date", "date.CalendarMonthLabel", "date.Day", "date.ShortMonth", "date.CalendarYear", "city.City", "city.StateProvince", "city.SalesTerritory", "sale.TotalExcludingTax", "sale.TaxAmount", "sale.TotalIncludingTax", "sale.Profit")\ .groupBy("date.Date", "date.CalendarMonthLabel", "date.Day", "date.ShortMonth", "date.CalendarYear", "city.City", "city.StateProvince", "city.SalesTerritory")\ .sum("sale.TotalExcludingTax", "sale.TaxAmount", "sale.TotalIncludingTax", "sale.Profit")\ .withColumnRenamed("sum(TotalExcludingTax)", "SumOfTotalExcludingTax")\ .withColumnRenamed("sum(TaxAmount)", "SumOfTaxAmount")\ .withColumnRenamed("sum(TotalIncludingTax)", "SumOfTotalIncludingTax")\ .withColumnRenamed("sum(Profit)", "SumOfProfit")\ .orderBy("date.Date", "city.StateProvince", "city.City") sale_by_date_city.write.mode("overwrite").format("delta").option("overwriteSchema", "true").save("Tables/aggregate_sale_by_date_city")`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image102.png)
    
19. **Approach #2 (sale_by_date_employee)** - Use Spark SQL to join and aggregate data for generating business aggregates. With the following code, you create a temporary Spark view by joining three tables, do group by to generate aggregation, and rename a few of the columns. Finally, you read from the temporary Spark view and finally write it as a delta table in the **Tables** section of the lakehouse to persist with the data.
    
    In this cell, you create a temporary Spark view by joining three tables, do group by to generate aggregation, and rename a few of the columns.
    
    Execute the cell.
    
    PythonCopy
    
    `%%sql CREATE OR REPLACE TEMPORARY VIEW sale_by_date_employee AS SELECT DD.Date, DD.CalendarMonthLabel , DD.Day, DD.ShortMonth Month, CalendarYear Year ,DE.PreferredName, DE.Employee ,SUM(FS.TotalExcludingTax) SumOfTotalExcludingTax ,SUM(FS.TaxAmount) SumOfTaxAmount ,SUM(FS.TotalIncludingTax) SumOfTotalIncludingTax ,SUM(Profit) SumOfProfit FROM wwilakehouse.fact_sale FS INNER JOIN wwilakehouse.dimension_date DD ON FS.InvoiceDateKey = DD.Date INNER JOIN wwilakehouse.dimension_Employee DE ON FS.SalespersonKey = DE.EmployeeKey GROUP BY DD.Date, DD.CalendarMonthLabel, DD.Day, DD.ShortMonth, DD.CalendarYear, DE.PreferredName, DE.Employee ORDER BY DD.Date ASC, DE.PreferredName ASC, DE.Employee ASC`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image103.png)
    
20. In this cell, you read from the temporary Spark view created in the previous cell and finally write it as a delta table in the **Tables** section of the lakehouse.
    
    Execute the cell by clicking on the **Run** icon.
    
    > **PythonCopy**
    > 
    > sale_by_date_employee = spark.sql("SELECT * FROM sale_by_date_employee")
    > 
    > sale_by_date_employee.write.mode("overwrite").format("delta").option("overwriteSchema", "true").save("Tables/aggregate_sale_by_date_employee")
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image104.png)
    
21. To validate the created tables, right click on **Tables** folder and choose **Refresh**. The tables appear.
    
    ![k8l4zm1j.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/k8l4zm1j.jpg)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image106.png)
    
    Both the approaches produce a similar outcome. You can choose based on your background and preference, to minimize the need for you to learn a new technology or compromise on the performance.
    
    Also you may notice that you're writing data as delta lake files. The automatic table discovery and registration feature of Fabric picks up and registers them in the metastore. You don't need to explicitly call CREATE TABLE statements to create tables to use with SQL.
    

# **Exercise 5: Building reports in Microsoft Fabric**

In this section of the tutorial, you create a Power BI data model and create a report from scratch.

Power BI is natively integrated in the whole Fabric experience. This native integration brings a unique mode, called DirectLake, of accessing the data from the lakehouse to provide the most performant query and reporting experience. DirectLake mode is a groundbreaking new engine capability to analyze very large datasets in Power BI. The technology is based on the idea of loading parquet-formatted files directly from a data lake without having to query a data warehouse or lakehouse endpoint, and without having to import or duplicate data into a Power BI dataset. DirectLake is a fast path to load the data from the data lake straight into the Power BI engine, ready for analysis.

In traditional DirectQuery mode, the Power BI engine directly queries the data from the source to execute each query, and the query performance depends on data retrieval speed. DirectQuery eliminates the need to copy data, ensuring that any changes in the source are immediately reflected in the query results during the import. On the other hand, in Import mode, performance is better because the data is readily available in the memory without querying data from the source for each query execution. However, the Power BI engine must first copy the data into memory during data refresh. Only changes to the underlying data source are picked up during the next data refresh(in scheduled as well as on-demand refresh).

DirectLake mode now eliminates this import requirement by loading the data files directly into memory. Because there's no explicit import process, it's possible to pick up any changes at the source as they occur, thus combining the advantages of DirectQuery and import mode while avoiding their disadvantages. DirectLake mode is therefore the ideal choice for analyzing very large datasets and datasets with frequent updates at the source.

### **Task 1: Explore data in the silver layer using the SQL endpoint**

1. From your left navigation pane, select **Fabric_LakehouseXX** and then select **wwilakehouse** of **Type SQL endpoint**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image107.png)
    
    ![sdbt4shg.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sdbt4shg.jpg)
    
2. From the SQL endpoint pane, you should be able to see all the tables you created. If you don't see them yet, select the **Refresh** icon at the top. Next, select the **Model** tab at the bottom to open the default Power BI dataset.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image109.png)
    
3. For this data model, you need to define the relationship between different tables so that you can create reports and visualizations based on data coming across different tables.
    
4. From the **fact_sale** table, drag the **CityKey** field and drop it on the **CityKey** field in the **dimension_city** table to create a relationship. The **Create Relationship** dialog box appears.
    
    > **Note :** Rearrange the tables by clicking on the table, dragging and dropping to have the dimension_city and the fact_sale tables next to each other. The same holds good for any two tables that you are trying to create relationship. This is just to make the drag and drop of the columns between the tables is easier.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image110.png)
    
5. In the **Create Relationship** dialog box:
    
    - **Table 1** is populated with **fact_sale** and the column of **CityKey**.
        
    - **Table 2** is populated with **dimension_city** and the column of **CityKey**.
        
    - Cardinality: **Many to one (*:1)**
        
    - Cross filter direction: **Single**
        
    - Leave the box next to **Make this relationship active** selected.
        
    - Select the box next to **Assume referential integrity.**
        
    - Select **Confirm.**
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media01/image111.png)
    
6. Next, add these relationships with the same **Create Relationship** settings as shown above but with the following tables and columns:
    
    - **StockItemKey(fact_sale) - StockItemKey(dimension_stock_item)**
        
        ![7syymw7n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/7syymw7n.jpg)
        
        ![0wlax0yq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/0wlax0yq.jpg)
        
    - **Salespersonkey(fact_sale) - EmployeeKey(dimension_employee)**
        
        ![gs5j4shk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/gs5j4shk.jpg)
        
        ![0f3fq8dx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/0f3fq8dx.jpg)
        
7. Ensure to create the relationships between the below two sets using the same steps as above.
    
    - **CustomerKey(fact_sale) - CustomerKey(dimension_customer)**
    - **InvoiceDateKey(fact_sale) - Date(dimension_date)**
8. After you add these relationships, your data model should be as shown in the below image and is ready for reporting.
    
    ![00t4o94y.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/00t4o94y.jpg)
    

### **Task 2: Build Report**

1. From the top ribbon, select **New report** to start creating reports/dashboards in Power BI.
    
    ![j6bq9mno.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/j6bq9mno.jpg)
    
2. On the Power BI report canvas, you can create reports to meet your business requirements by dragging required columns from the **Data** pane to the canvas and using one or more of available visualizations.
    
    ![rsfv177d.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/rsfv177d.jpg)
    
    **Add a title:**
    
    - In the Ribbon, select **Text box**. Type in **`WW Importers Profit Reporting`**. Highlight the **text** and increase size to **20**.
        
        ![2x5eovwb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/2x5eovwb.jpg)
        
    - • Resize the text box and place it in the **upper left** of the report page and click outside the textbox.
        
        ![v8k2chdl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/v8k2chdl.jpg)
        
    
    **Add a Card:**
    
    - On the **Data** pane, expand **fact_sales** and check the box next to **Profit**. This selection creates a column chart and adds the field to the Y-axis.
        
        ![l165jove.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/l165jove.jpg)
        
    - With the bar chart selected, select the **Card** visual in the visualization pane.
        
        ![4wkj82uz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/4wkj82uz.jpg)
        
    - This selection converts the visual to a card. Place the card under the title.
        
        ![5n223ork.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/5n223ork.jpg)
        
    - Click anywhere on the blank canvas (or press the Esc key) so the Card that we just placed is no longer selected.
        
    
    **Add a Bar chart:**
    
    - On the **Data** pane, expand **fact_sales** and check the box next to **Profit**. This selection creates a column chart and adds the field to the Y-axis.
        
        ![u0x37n99.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/u0x37n99.jpg)
        
    - On the **Data** pane, expand **dimension_city** and check the box for **SalesTerritory**. This selection adds the field to the Y-axis.
        
        ![utz08nui.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/utz08nui.jpg)
        
    - With the bar chart selected, select the **Clustered bar chart** visual in the visualization pane. This selection converts the column chart into a bar chart.
        
        ![1479i6ry.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/1479i6ry.jpg)
        
    - Resize the Bar chart to fill in the area under the title and Card.
        
        ![it9156py.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/it9156py.jpg)
        
    - Click anywhere on the blank canvas (or press the Esc key) so the bar chart is no longer selected.
        
    
    **Build a stacked area chart visual:**
    
    - On the **Visualizations** pane, select the **Stacked area chart** visual.
        
        ![k1ipwshr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/k1ipwshr.jpg)
        
    - Reposition and resize the stacked area chart to the right of the card and bar chart visuals created in the previous steps.
        
        ![gsubl8cl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/gsubl8cl.jpg)
        
    - On the **Data** pane, expand **fact_sales** and check the box next to **Profit**. Expand **dimension_date** and check the box next to **FiscalMonthNumber**. This selection creates a filled line chart showing profit by fiscal month.
        
        ![a58zhpzh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/a58zhpzh.jpg)
        
    - On the **Data** pane, expand **dimension_stock_item** and drag **BuyingPackage** into the Legend field well. This selection adds a line for each of the Buying Packages.
        
        ![8ezthmj6.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/8ezthmj6.jpg)
        
        ![fhfdiski.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/fhfdiski.jpg)
        
    - Click anywhere on the blank canvas (or press the Esc key) so the stacked area chart is no longer selected.
        
    
    **Build a column chart:**
    
    - On the **Visualizations** pane, select the **Stacked column chart** visual.
        
        ![mdv1in9e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/mdv1in9e.jpg)
        
    - On the **Data** pane, expand **fact_sales** and check the box next to **Profit**. This selection adds the field to the Y-axis.
        
    - On the **Data** pane, expand **dimension_employee** and check the box next to **Employee**. This selection adds the field to the X-axis.
        
        ![lset0hrl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/lset0hrl.jpg)
        
    - Click anywhere on the blank canvas (or press the Esc key) so the chart is no longer selected.
        
3. From the ribbon, select **File** > **Save**.
    
    ![81trnsy1.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/81trnsy1.jpg)
    
4. Enter the name of your report as **`Profit Reporting`**. Select **Save**.
    
    ![uk19pmvd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/uk19pmvd.jpg)
    
5. You will get a notification stating that the report has been saved.
    
    ![fqvul7s0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/fqvul7s0.jpg)
    

## **Exercise 6: Clean up resources**

You can delete individual reports, pipelines, warehouses, and other items or remove the entire workspace. Use the following steps to delete the workspace you created for this tutorial.

1. Select your workspace, the **Fabric Lakehouse Tutorial-XX** from the left-hand navigation menu. It opens the workspace item view.
    
    ![lht8g3in.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/lht8g3in.jpg)
    
2. Select the **…** option under the workspace name and select **Workspace settings**.
    
    ![1b8bjgqd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/1b8bjgqd.jpg)
    
3. Select **Other** and **Remove this workspace**.
    
    ![v3z6rlk7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/v3z6rlk7.jpg)
    
4. Click on **Delete** in the warning that pops up.
    
    ![7ed5llam.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/7ed5llam.jpg)
    
5. Wait for a notification that the Workspace has been deleted, before proceeding to the next lab.
    
    ![24k0gsvb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/24k0gsvb.jpg)
    

> **Summary** This practical lab focuses on setting up and configuring essential components within Microsoft Fabric and Power BI for data management and reporting. It includes tasks like activating trials, configuring OneDrive, creating workspaces, and setting up lakehouses. The lab also covers tasks related to ingesting sample data, optimizing delta tables, and building reports in Power BI for effective data analysis. The objectives aim to provide hands-on experience in utilizing Microsoft Fabric and Power BI for data management and reporting purposes.