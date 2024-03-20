# **Lab 02: Analyzing data with Apache Spark**

> **Introduction**
> 
> Apache Spark is an open source engine for distributed data processing, and is widely used to explore, process, and analyze huge volumes of data in data lake storage. Spark is available as a processing option in many data platform products, including Azure HDInsight, Azure Databricks, Azure Synapse Analytics, and Microsoft Fabric. One of the benefits of Spark is support for a wide range of programming languages, including Java, Scala, Python, and SQL; making Spark a very flexible solution for data processing workloads including data cleansing and manipulation, statistical analysis and machine learning, and data analytics and visualization.
> 
> **Objective**
> 
> - Create a workspace in Microsoft Fabric with the Fabric trial enabled.
> - Establish a lakehouse environment and upload data files for analysis.
> - Generate a notebook for interactive data exploration and analysis.
> - Load data into a dataframe for further processing and visualization.
> - Apply transformations to the data using PySpark.
> - Save and partition the transformed data for optimized querying

[more...](https://labclient.labondemand.com/Instructions/de8607fa-b36b-4a76-863a-c2fc910ef8fb?rc=10#)

This lab will take approximately **45** minutes to complete.

# **Exercise 1: Create a workspace, lakehouse, notebook and load data into dataframe**

## **Task 1: Create a workspace**

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image1.png)
    
2. In the **Microsoft Fabric** window, enter your credentials, and click on the **Submit** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image2.png)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button**.**
    
    ![A login screen with a red box and blue text Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image3.png)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![A screenshot of a computer error Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image4.png)
    
5. In the **Microsoft Fabric** home page, select the **Power BI** template.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image5.png)
    
6. In the **Power BI Home** page menu bar on the left, select **Workspaces** (the icon looks similar to 🗇).
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image6.png)
    
7. In the Workspaces pane Select **+** **New workspace**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image7.png)
    
8. In the **Create a workspace tab**, enter the following details and click on the **Apply** button.
    
    |**Name**|**`dp_FabricXX`**(XX can be a unique number) (here, we entered **dp_Fabric29)**|
    |---|---|
    |**Description**|`This workspace contains Analyze data with Apache Spark`|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**Small dataset storage format**|
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image8.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image9.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image10.png)
    
9. Wait for the deployment to complete. It takes 2-3 minutes to complete. When your new workspace opens, it should be empty.
    
    ![A screen shot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image11.png)
    

## **Task 2: Create a lakehouse and upload files**

Now that you have a workspace, it’s time to switch to the _Data engineering_ experience in the portal and create a data lakehouse for the data files you’re going to analyze.

1. At the bottom left of the Power BI portal, select the **Power BI** icon and switch to the **Data Engineering** experience.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image12.png)
    
2. In the **Synapse Data Engineering** home page, Select **Lakehouse(Preview)** under **New** pane.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image13.png)
    
3. In the **New lakehouse** dialog box, enter **`Fabric_lakehouse`** in the **Name** field, click on the **Create** button and open the new lakehouse.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image14.png)
    
4. After a minute or so, a new empty lakehouse will be created. You need to ingest some data into the data lakehouse for analysis.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image15.png)
    
5. You will see a notification stating **Successfully created SQL endpoint**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image16.png)
    
6. In the **Explorer** pane,under the **fabric_lakehouse**, in the **…** menu for the **Files folder**, select **Upload** and select the **Upload folder**. ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image17.png)
    
7. On the **Upload folder** pane that appears on the right side, select the **folder icon** under the **Files/** and then browse to **C:\LabFiles** and then select the **orders** folder and click on the **Upload** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image18.png)
    
8. In case, the **Upload 3 files to this site?** dialog box appears, then click on **Upload** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image19.png)
    
9. In the Upload folder tab, click on the **Upload** button.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image20.png)
    
10. After the files have been uploaded **close** the **Upload folder** tab.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image21.png)
    
11. Expand **Files** and select the **orders** folder and verify that the CSV files have been uploaded.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image22.png)
    

## **Task 3: Create a notebook**

To work with data in Apache Spark, you can create a _notebook_. Notebooks provide an interactive environment in which you can write and run code (in multiple languages), and add notes to document it.

1. On the **Home** page while viewing the contents of the **orders** folder in your datalake, in the **Open notebook** menu, select **New notebook**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image23.png)
    
2. After a few seconds, a new notebook containing a single _cell_ will open. Notebooks are made up of one or more cells that can contain _code_ or _markdown_ (formatted text).
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image24.png)
    
3. Select the first cell (which is currently a _code_ cell), and then in the dynamic tool bar at its top-right, use the **M↓** button to **convert the cell to a markdown cell**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image25.png)
    
4. When the cell changes to a markdown cell, the text it contains is rendered.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image26.png)
    
5. Use the **🖉** (Edit) button to switch the cell to editing mode, replace all the text then modify the markdown as follows:
    
    CodeCopy
    
    `# Sales order data exploration  Use the code in this notebook to explore sales order data.`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image27.png)
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image28.png)
    
6. Click anywhere in the notebook outside of the cell to stop editing it and see the rendered markdown.
    
    ![A screenshot of a computer Description automatically generated](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image29.png)
    

## **Task 4: Load data into a dataframe**

Now you’re ready to run code that loads the data into a _dataframe_. Dataframes in Spark are similar to Pandas dataframes in Python, and provide a common structure for working with data in rows and columns.

> **Note**: Spark supports multiple coding languages, including Scala, Java, and others. In this exercise, we’ll use _PySpark_, which is a Spark-optimized variant of Python. PySpark is one of the most commonly used languages on Spark and is the default language in Fabric notebooks.

1. With the notebook visible, expand the **Files** list and select the **orders** folder so that the CSV files are listed next to the notebook editor.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image30.png)
    
2. In the **…** menu for **2019.csv**, select **Load data** and select **Spark**. A new code cell containing the following code should be added to the notebook:
    
    CodeCopy
    
    `df = spark.read.format("csv").option("header","true").load("Files/orders/2019.csv") # df now is a Spark DataFrame containing CSV data from "Files/orders/2019.csv". display(df)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image31.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image32.png)
    
    > **Tip**: You can hide the Lakehouse explorer panes on the left by using their **«** icons. Doing so will help you focus on the notebook.
    
3. Use the **▷ Run cell** button on the left of the cell to run it.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image33.png)
    
4. When the cell command has completed, review the output below the cell, which should look similar to this:
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image34.png)
    
5. The output shows the rows and columns of data from the 2019.csv file. However, note that the column headers don’t look right. The default code used to load the data into a dataframe assumes that the CSV file includes the column names in the first row, but in this case the CSV file just includes the data with no header information.
    
6. Modify the code to set the **header** option to **false**. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    CodeCopy
    
    `df = spark.read.format("csv").option("header","false").load("Files/orders/2019.csv") # df now is a Spark DataFrame containing CSV data from "Files/orders/2019.csv". display(df)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image36.png)
    
7. Now the dataframe correctly includes first row as data values, but the column names are auto-generated and not very helpful. To make sense of the data, you need to explicitly define the correct schema and data type for the data values in the file.
    
8. Replace all the code in the **cell** with the following code and click on **▷ Run cell** button and review the output
    
    CodeCopy
    
    `from pyspark.sql.types import *  orderSchema = StructType([     StructField("SalesOrderNumber", StringType()),     StructField("SalesOrderLineNumber", IntegerType()),     StructField("OrderDate", DateType()),     StructField("CustomerName", StringType()),     StructField("Email", StringType()),     StructField("Item", StringType()),     StructField("Quantity", IntegerType()),     StructField("UnitPrice", FloatType()),     StructField("Tax", FloatType())     ])  df = spark.read.format("csv").schema(orderSchema).load("Files/orders/2019.csv") display(df)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image37.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image38.png)
    
9. Now the dataframe includes the correct column names (in addition to the **Index**, which is a built-in column in all dataframes based on the ordinal position of each row). The data types of the columns are specified using a standard set of types defined in the Spark SQL library, which were imported at the beginning of the cell.
    
10. Confirm that your changes have been applied to the data by viewing the dataframe.
    
11. Use the **+ Code** icon below the cell output to add a new code cell to the notebook, and enter the following code in it. Click on **▷ Run cell** button and review the output
    
    CodeCopy
    
    `display(df)`
    
    ![o3tfhtg9.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/o3tfhtg9.jpg)
    
12. The dataframe includes only the data from the **2019.csv** file. Modify the code so that the file path uses a * wildcard to read the sales order data from all of the files in the **orders** folder
    
13. Use the **+ Code** icon below the cell output to add a new code cell to the notebook, and enter the following code in it.
    
    CodeCopy
    
    `from pyspark.sql.types import *  orderSchema = StructType([     StructField("SalesOrderNumber", StringType()),     StructField("SalesOrderLineNumber", IntegerType()),     StructField("OrderDate", DateType()),     StructField("CustomerName", StringType()),     StructField("Email", StringType()),     StructField("Item", StringType()),     StructField("Quantity", IntegerType()),     StructField("UnitPrice", FloatType()),     StructField("Tax", FloatType())     ])  df = spark.read.format("csv").schema(orderSchema).load("Files/orders/*.csv") display(df)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image40.png)
    
14. Run the modified code cell and review the output, which should now include sales for 2019, 2020, and 2021.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image41.png)
    

**Note**: Only a subset of the rows is displayed, so you may not be able to see examples from all years.

# **Exercise 2: Explore data in a dataframe**

The dataframe object includes a wide range of functions that you can use to filter, group, and otherwise manipulate the data it contains.

## **Task 1: Filter a dataframe**

1. Use the **+ Code** icon below the cell output to add a new code cell to the notebook, and enter the following code in it.
    
    ```
    customers = df['CustomerName', 'Email']
    print(customers.count())
    print(customers.distinct().count())
    display(customers.distinct())
    ```
    
2. **Run** the new code cell, and review the results. Observe the following details:
    
    - When you perform an operation on a dataframe, the result is a new dataframe (in this case, a new **customers** dataframe is created by selecting a specific subset of columns from the **df** dataframe)
        
    - Dataframes provide functions such as **count** and **distinct** that can be used to summarize and filter the data they contain.
        
    - The dataframe['Field1', 'Field2', …] syntax is a shorthand way of defining a subset of columns. You can also use **select** method, so the first line of the code above could be written as customers = df.select("CustomerName", "Email")
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image43.png)
    
3. Modify the code, replace all the code in the **cell** with the following code and click on **▷ Run cell** button as follows:
    
    CodeCopy
    
    `customers = df.select("CustomerName", "Email").where(df['Item']=='Road-250 Red, 52') print(customers.count()) print(customers.distinct().count()) display(customers.distinct())`
    
4. **Run** the modified code to view the customers who have purchased the **_Road-250 Red, 52_ product**. Note that you can “**chain**” multiple functions together so that the output of one function becomes the input for the next - in this case, the dataframe created by the **select** method is the source dataframe for the **where** method that is used to apply filtering criteria.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image44.png)
    

## **Task 2: Aggregate and group data in a dataframe**

1. Click on **+ Code** and copy and paste the below code and then click on **Run cell** button.
    
    CodeCopy
    
    `productSales = df.select("Item", "Quantity").groupBy("Item").sum() display(productSales)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image45.png)
    
2. Note that the results show the sum of order quantities grouped by product. The **groupBy** method groups the rows by _Item_, and the subsequent **sum** aggregate function is applied to all of the remaining numeric columns (in this case, _Quantity_)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image46.png)
    
3. Click on **+ Code** and copy and paste the below code and then click on **Run cell** button.
    
    CodeCopy
    
    `from pyspark.sql.functions import *  yearlySales = df.select(year("OrderDate").alias("Year")).groupBy("Year").count().orderBy("Year") display(yearlySales)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image47.png)
    
4. Note that the results show the number of sales orders per year. Note that the **select** method includes a SQL **year** function to extract the year component of the _OrderDate_ field (which is why the code includes an **import** statement to import functions from the Spark SQL library). It then uses an **alias** method is used to assign a column name to the extracted year value. The data is then grouped by the derived _Year_ column and the count of rows in each group is calculated before finally the **orderBy** method is used to sort the resulting dataframe.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image48.png)
    

# **Exercise 3: Use Spark to transform data files**

A common task for data engineers is to ingest data in a particular format or structure, and transform it for further downstream processing or analysis.

## **Task 1: Use dataframe methods and functions to transform data**

1. Click on + Code and copy and paste the below code
    
    CodeCopy
    
    `from pyspark.sql.functions import *  ## Create Year and Month columns transformed_df = df.withColumn("Year", year(col("OrderDate"))).withColumn("Month", month(col("OrderDate")))  # Create the new FirstName and LastName fields transformed_df = transformed_df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))  # Filter and reorder columns transformed_df = transformed_df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "Email", "Item", "Quantity", "UnitPrice", "Tax"]  # Display the first five orders display(transformed_df.limit(5))`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image49.png)
    
2. **Run** the code to create a new dataframe from the original order data with the following transformations:
    
    - Add **Year** and **Month** columns based on the **OrderDate** column.
        
    - Add **FirstName** and **LastName** columns based on the **CustomerName** column.
        
    - Filter and reorder the columns, removing the **CustomerName** column.
        
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image50.png)
    
3. Review the output and verify that the transformations have been made to the data.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image51.png)
    
    You can use the full power of the Spark SQL library to transform the data by filtering rows, deriving, removing, renaming columns, and applying any other required data modifications.
    
    > **Tip**: See the Spark dataframe documentation to learn more about the methods of the Dataframe object.
    

## **Task 2: Save the transformed data**

1. **Add a new cell** with the following code to save the transformed dataframe in Parquet format (Overwriting the data if it already exists). **Run** the cell and wait for the message that the data has been saved.
    
    CodeCopy
    
    `transformed_df.write.mode("overwrite").parquet('Files/transformed_data/orders') print ("Transformed data saved!")`
    
    > **Note**: Commonly, _Parquet_ format is preferred for data files that you will use for further analysis or ingestion into an analytical store. Parquet is a very efficient format that is supported by most large scale data analytics systems. In fact, sometimes your data transformation requirement may simply be to convert data from another format (such as CSV) to Parquet!
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image52.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image53.png)
    
2. Then, in the **Lakehouse explorer** pane on the left, in the **…** menu for the **Files** node, select **Refresh**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image54.png)
    
3. Click on the **transformed_data** folder to verify that it contains a new folder named **orders**, which in turn contains one or more **Parquet files**.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image55.png)
    
4. Click on **+ Code** following code to load a new dataframe from the parquet files in the **transformed_data -> orders** folder:
    
    CodeCopy
    
    `orders_df = spark.read.format("parquet").load("Files/transformed_data/orders") display(orders_df)`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image56.png)
    
5. **Run** the cell and verify that the results show the order data that has been loaded from the parquet files.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image57.png)
    

## **Task 3: Save data in partitioned files**

1. Add a new cell, Click on **+ Code** with the following code; which saves the dataframe, partitioning the data by **Year** and **Month**. **Run** the cell and wait for the message that the data has been saved
    
    CodeCopy
    
    `orders_df.write.partitionBy("Year","Month").mode("overwrite").parquet("Files/partitioned_data") print ("Transformed data saved!")`
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image58.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image59.png)
    
2. Then, in the **Lakehouse explorer** pane on the left, in the **…** menu for the **Files** node, select **Refresh.**
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image60.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image61.png)
    
3. Expand the **partitioned_orders** folder to verify that it contains a hierarchy of folders named **Year=_xxxx_**, each containing folders named **Month=_xxxx_**. Each month folder contains a parquet file with the orders for that month.
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image62.png)
    
    ![BrokenImage](https://labondemand.blob.core.windows.net/content/lab149562/instructions237215/Media02/image63.png)