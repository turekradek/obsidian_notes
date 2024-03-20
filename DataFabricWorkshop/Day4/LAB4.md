# **Lab 04-Create a Dataflow (Gen2) in Microsoft Fabric**

**Introduction**

In Microsoft Fabric, Dataflows (Gen2) connect to various data sources and perform transformations in Power Query Online. They can then be used in Data Pipelines to ingest data into a lakehouse or other analytical store, or to define a dataset for a Power BI report.

This lab is designed to introduce the different elements of Dataflows (Gen2), and not create a complex solution that may exist in an enterprise.

**Objectives**

- Establish a data lakehouse in the Data Engineering experience and ingest relevant data for subsequent analysis.
    
- Define a dataflow for extracting, transforming, and loading data into the lakehouse.
    
- Configure data destinations within Power Query to store the transformed data in the lakehouse.
    
- Incorporate the dataflow into a pipeline to enable scheduled data processing and ingestion.
    
- Remove the workspace and associated elements to conclude the exercise.
    

**Prerequisites**

- Before starting the Lab 04, complete the **Lab 02: Analyze data with Apache Spark** and **Lab 03-Use delta tables in Apache Spark**

## **Exercise 1: Create a Dataflow (Gen2) in Microsoft Fabric**

In Microsoft Fabric, Dataflows (Gen2) connect to various data sources and perform transformations in Power Query Online. They can then be used in Data Pipelines to ingest data into a lakehouse or other analytical store, or to define a dataset for a Power BI report.

This exercise is designed to introduce the different elements of Dataflows (Gen2), and not create a complex solution that may exist in an enterprise

### **Task 1: Create a Dataflow (Gen2) to ingest data**

Now that you have a lakehouse, you need to ingest some data into it. One way to do this is to define a dataflow that encapsulates an _extract, transform, and load_ (ETL) process.

1. Now, click on **Fabric_lakehouse** on the left-sided navigation pane.
    
    ![rei16gkr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rei16gkr.jpg)
    
2. In the **Fabric_lakehouse** home page, click on the drop-down arrow in the **Get data** and select **New Dataflow Gen2.** The Power Query editor for your new dataflow opens.
    
    ![95m0wbhp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/95m0wbhp.jpg)
    
3. In the **Power Query** pane under the **Home tab**, click on **Import from a Text/CSV file**.
    
    ![bt2iw0w8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bt2iw0w8.jpg)
    
4. In the **Connect to data source** pane, under **Connection settings**, select **Upload file (Preview)** radio button, then click on **Browse** button and browse your VM **C:\LabFiles**, then select the **orders file** and click on the **Open** button.
    
    ![7xcrwtba.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7xcrwtba.jpg)
    
5. In the **Connect to data source** pane, under **Connection credentials,** enter the following details and click on the **Next** button.
    
    - **Connection**: Create new connection
        
    - **data gateway**: (none)
        
    - **Authentication kind**: Organizational account
        
    
    ![z1hs22sl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/z1hs22sl.jpg)
    
6. In **Preview file data** pane, click on **Create** to create the data source.
    
    ![h0198wwe.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h0198wwe.jpg)
    
7. The **Power Query** editor shows the data source and an initial set of query steps to format the data.
    
    ![y1wd77iq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/y1wd77iq.jpg)
    
8. On the toolbar ribbon, select the **Add column** tab. Then, select **Custom column.**
    
    ![81q1qqmv.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/81q1qqmv.jpg)
    
9. Set the New column name to **`MonthNo`**, set the Data type to **Whole Number** and then add the following formula: **`Date.Month(\[OrderDate\])`** under **Custom column formula**. Select **OK**.
    
    ![xud304uq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xud304uq.jpg)
    
10. Notice how the step to add the custom column is added to the query. The resulting column is displayed in the data pane.
    
    ![kmp1g3b5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kmp1g3b5.jpg)
    
    > **Tip:** In the Query Settings pane on the right side, notice the **Applied Steps** include each transformation step. At the bottom, you can also toggle the **Diagram flow** button to turn on the Visual Diagram of the steps.
    > 
    > Steps can be moved up or down, edited by selecting the gear icon, and you can select each step to see the transformations apply in the preview pane.
    

### **Task 2: Add data destination for Dataflow**

1. On the **Power Query** toolbar ribbon, select the **Home** tab. Then in the D**ata destination** drop-down menu, select **Lakehouse**(if not selected already).
    
    ![ljpzccrk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ljpzccrk.jpg)
    
    > **Note:** If this option is grayed out, you may already have a data destination set. Check the data destination at the bottom of the Query settings pane on the right side of the Power Query editor. If a destination is already set, you can change it using the gear.
    
2. Click on the **Settings** icon next to the selected **Lakehouse** option.
    
    ![d3dsglql.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/d3dsglql.jpg)
    
3. In the **Connect to data destination** dialog box, select **Edit connection.**
    
    ![4tis5dfd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4tis5dfd.jpg)
    
4. In the **Connect to data destination** dialog box, select **sign in** using your Power BI organizational account to set the identity that the dataflow uses to access the lakehouse.
    
    ![frqx6qqx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/frqx6qqx.jpg)
    
    ![68x2pt3b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/68x2pt3b.jpg)
    
5. In Connect to data destination dialog box, select **Next**
    
    ![bxwr28he.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bxwr28he.jpg)
    
6. In Connect to data destination dialog box, select **New table**. Click on the **Lakehouse folder** ,select your workspace -- **dp_FabricXX** and then select your lakehouse i.e **Fabric_lakehouse.** Then specify the Table name as **`orders`** and select **Next** button.
    
    ![y529zkez.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/y529zkez.jpg)
    
    ![l9uuvvvy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/l9uuvvvy.jpg)
    
7. In the **Choose destination settings** dialog box, under the **Update method** select **Append** and then click on the **Save settings** button.
    
    ![yim6o90m.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yim6o90m.jpg)
    
8. The **Lakehouse** destination is indicated as an **icon** in the **query** in the Power Query editor.
    
    ![fm9b5wjz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/fm9b5wjz.jpg)
    
    ![uswbz027.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uswbz027.jpg)
    
9. Select **Publish** to publish the dataflow. Then wait for the **Dataflow 1** dataflow to be created in your workspace.
    
    ![wsru60we.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wsru60we.jpg)
    
10. Once published, you can right-click on the dataflow in your workspace, select **Properties**, and rename your dataflow.
    
    ![bxc9fmwt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bxc9fmwt.jpg)
    
11. In the **Dataflow1** dialog box, enter the **Name** as **`Gen2_Dataflow`** and click on **Save** button.
    
    ![guo8tpuh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/guo8tpuh.jpg)
    
    ![6hlorub2.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6hlorub2.jpg)
    

### **Task 3: Add a dataflow to a pipeline**

You can include a dataflow as an activity in a pipeline. Pipelines are used to orchestrate data ingestion and processing activities, enabling you to combine dataflows with other kinds of operation in a single, scheduled process. Pipelines can be created in a few different experiences, including Data Factory experience.

1. In the Synapse Data Engineering Home page , Under **dp_FabricXX** pane, select **+New** -> **Data pipeline(Preview)**.
    
    ![f99w6k5e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/f99w6k5e.jpg)
    
2. In the **New pipeline** dialog box, enter **`Load data`** in the **Name** field, click on the **Create** button to open the new pipeline.
    
    ![9wlb56u5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9wlb56u5.jpg)
    
3. The pipeline editor opens.
    
    ![ngzf9k4i.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ngzf9k4i.jpg)
    
    > **Tip**: If the Copy Data wizard opens automatically, close it!
    
4. Select **Add pipeline activity**, and add a **Dataflow** activity to the pipeline.
    
    ![u8m2w9hu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/u8m2w9hu.jpg)
    
5. With the new **Dataflow1** activity selected, on the **Settings** tab, in the **Dataflow** drop-down list, select **Gen2_Dataflow** (the data flow you created previously)
    
    ![hin7po7q.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hin7po7q.jpg)
    
6. On the **Home** tab, save the pipeline using the **🖫 (_Save_)** icon.
    
    ![u60spsxi.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/u60spsxi.jpg)
    
7. Use the **▷ Run** button to run the pipeline, and wait for it to complete. It may take a few minutes.
    
    ![exwcw0va.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/exwcw0va.jpg)
    
    ![p0l463b9.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/p0l463b9.jpg)
    
    ![lla5461o.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lla5461o.jpg)
    
8. In the menu bar on the left edge, select your workspace i.e **dp_FabricXX**.
    
    ![ndtg47wt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ndtg47wt.jpg)
    
9. In the **Fabric_lakehouse** pane, select the **Gen2_FabricLakehouse** of type Lakehouse.
    
    ![rx6hcqi0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rx6hcqi0.jpg)
    
10. In **Explorer** pane, select the **…** menu for **Tables**, select **refresh**. Then expand **Tables** and select the **orders** table, which has been created by your dataflow.
    
    ![kutqv8m4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kutqv8m4.jpg)
    
    ![01qi48b3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/01qi48b3.jpg)
    
    > **Tip**: [Use the Power BI Desktop _Dataflows connector_ to connect directly to the data transformations done with your dataflow.]{.mark}
    

[You can also make additional transformations, publish as a new dataset, and distribute with intended audience for specialized datasets.]{.mark}

### **Task 4: Clean up resources**

In this exercise, you've learned how to use Spark to work with data in Microsoft Fabric.

If you've finished exploring your lakehouse, you can delete the workspace you created for this exercise.

1. In the bar on the left, select the icon for your workspace to view all of the items it contains.
    
    ![7agnyoka.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7agnyoka.jpg)
    
2. In the **…** menu on the toolbar, select **Workspace settings**.
    
    ![9ny02vcl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9ny02vcl.jpg)
    
3. In the **Other** section, select **Remove this workspace**.
    
    ![pwc2m89h.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/pwc2m89h.jpg)
    
4. In the **Delete workspace?** dialog box, click on the **Delete** button.
    
    ![nr2flcdb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nr2flcdb.jpg)
    
    ![jyveqdaa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jyveqdaa.jpg)