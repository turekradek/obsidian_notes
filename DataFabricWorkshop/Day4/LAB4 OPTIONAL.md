# **Optional Lab - A Data Factory solution for moving and transforming data with dataflows and data pipelines (Optional)**

**Introduction**

This lab helps you accelerate the evaluation process for Data Factory in Microsoft Fabric by providing a step-by-step guidance for a full data integration scenario within one hour. By the end of this tutorial, you understand the value and key capabilities of Data Factory and know how to complete a common end-to-end data integration scenario.

**Objective**

The lab is divided into three modules:

- Exercise 1: Create a pipeline with Data Factory to ingest raw data from a Blob storage to a Bronze table in a data Lakehouse.
    
- Exercise 2: Transform data with a dataflow in Data Factory to process the raw data from your Bronze table and move it to a Gold table in the data Lakehouse.
    
- Exercise 3: Automate and send notifications with Data Factory to send an email to notify you once all the jobs are complete, and finally, setup the entire flow to run on a scheduled basis.
    

# **Exercise 1: Create a pipeline with Data Factory**

> **Important**: Microsoft Fabric is currently in PREVIEW. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here. Refer to **`https://learn.microsoft.com/en-us/azure/data-factory/`** for the service in Azure.

## **Task 1: Create a workspace**

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter** button.
    
    ![jssotlnr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jssotlnr.jpg)
    
    > **Note**: If you are directed to Microsoft Fabric Home page, then skip steps from #2 to #4.
    
2. In the **Microsoft Fabric** window, enter your credentials, and click on the **Submit** button.
    
    ![oxvk8yku.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/oxvk8yku.jpg)
    
3. Then, in the **Microsoft** window, enter the password and click on the **Sign in** button**.**
    
    ![1kyp2nb0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1kyp2nb0.jpg)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![0vs5wz9t.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0vs5wz9t.jpg)
    
5. In the **Microsoft Fabric** home page, select the **Power BI** template.
    
    ![vuc7w3jv.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vuc7w3jv.jpg)
    
6. In the **Power BI Home** page left-sided navigation bar, select **Workspaces** (the icon looks similar to 🗇).
    
    ![p6o4gh9e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/p6o4gh9e.jpg)
    
7. In the Workspaces pane, select **+** **New workspace**.
    
    ![o19d0tgy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/o19d0tgy.jpg)
    
8. In the **Create a workspace** tab, enter the following details and click on the **Apply** button.
    
    |||
    |---|---|
    |**Name**|**`Data-FactoryXX`**(XX can be a unique number) (here, we entered **Dataflow_Fabric29)**|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**`Small dataset storage format`**|
    
    ![do6mmdau.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/do6mmdau.jpg)
    
    ![ftckft5n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ftckft5n.jpg)
    
    ![5dzqs4qh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/5dzqs4qh.jpg)
    
9. Wait for the deployment to complete. It'll take approximately 2-3 minutes.
    

## **Task 2: Create a data pipeline**

1. Select the default Power BI icon at the bottom left of the screen, and switch to the **Data Factory** experience.
    
    ![lj5kqy3i.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lj5kqy3i.jpg)
    
2. In the **Data Factory** Home page, click on **Data pipeline (Preview)** as shown in the below image.
    
    ![nbn3w711.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nbn3w711.jpg)
    
3. In the **New pipeline** dialog box, enter **`First_Pipeline1`** in the **Name** field, then click on the **Create** button.
    
    ![xzzqce80.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xzzqce80.jpg)
    

## **Task 3: Use a Copy activity in the pipeline to load sample data to a data Lakehouse**

1. In the **First_Pipeline1** home page Select **Copy data** to open the copy assistant tool.
    
    ![exlnke1e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/exlnke1e.jpg)
    
2. The **Copy data** dialog is displayed with the first step, **Choose data source**, highlighted. Scroll down if necessary to the **Data sources** section, and select the **Azure Blob Storage** data source type. Then select **Next**.
    
    ![6p8pksts.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6p8pksts.jpg)
    
3. In the next step, select **Create new connection** and then provide the URL for the blob storage hosting the sample data provided for this tutorial, at **`https://nyctaxisample.blob.core.windows.net/sample`**. The authentication kind is **Anonymous**. Select **Next** after providing the URL.
    
    ![9gnbze03.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9gnbze03.jpg)
    
4. The **Connect to data source** step appears, and initially, you see an error **Unable to list files**, because permissions have only been granted to the **sample** folder in the blob storage. Provide the folder name **`sample`**, and select **Retry**.
    
    ![sebg65y5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sebg65y5.jpg)
    
    > **Note:** The blob storage folder is case sensitive and should be in all lower case.*
    
5. The blob storage browser appears next. Select the **NYC-Taxi-Green-2015-01.parquet** file, and wait for the data preview to appear. Then select **Next**.
    
    ![7308xstg.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7308xstg.jpg)
    
6. For the **Choose data destination** step of the copy assistant, select **Lakehouse** and then **Next**.
    
    ![h7xzmqzc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h7xzmqzc.jpg)
    
7. Select **Create new Lakehouse** on the data destination configuration page that appears, and enter a name for the new Lakehouse **`Tutorial_Lakehouse`**. Then select **Next** again.
    
    ![8675zw39.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8675zw39.jpg)
    
8. Now configure the details of your Lakehouse destination on the **Select and map to folder path or table.** page. Select **Tables** for the **Root folder**, provide a table name **Bronze**, and select the **Next**.
    
    ![wgjdpv8b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wgjdpv8b.jpg)
    
9. Finally, on the **Review + save** page of the copy data assistant, review the configuration. For this lab, uncheck the **Start data transfer immediately** checkbox, since we run the activity manually in the next step. Then select **OK**.
    
    ![8xgml7en.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8xgml7en.jpg)
    

## **Task 4: Run and view the results of your Copy activity**.

1. On the **Home** tab of the pipeline editor window, then select the **Run** button.
    
    ![hefls25w.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hefls25w.jpg)
    
2. In the **Save and run?** dialog box, click on **Save and run** button to execute these activities.
    
    ![9kftqud3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9kftqud3.jpg)
    
    ![uup1agi2.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uup1agi2.jpg)
    
    ![wwbn0u0q.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wwbn0u0q.jpg)
    
3. You can monitor the run and check the results on the **Output** tab below the pipeline canvas. Select the **activity name** as **Copy_ihy** to view the run details.
    
    ![vs5xdhwm.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vs5xdhwm.jpg)
    
4. The run details show 1,508,501 rows read and written.
    
    ![fjla1gjq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/fjla1gjq.jpg)
    
5. Expand the **Duration breakdown** section to see the duration of each stage of the Copy activity. After reviewing the copy details, select **Close**.
    
    ![17yblvd2.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/17yblvd2.jpg)
    

## **Exercise 2: Transform data with a dataflow in Data Factory**

## **Task 1: Get data from a Lakehouse table**

1. On the **First_Pipeline 1** page, from the sidebar select **Create.**
    
    ![vocp1sq3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vocp1sq3.jpg)
    
2. On the **Data Factory Data-FactoryXX** home page, to create a new dataflow gen2 click on **Dataflow Gen2 (Preview)** under the **Data Factory.**
    
    ![dn1270gp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/dn1270gp.jpg)
    
3. From the new dataflow menu, under the **Power Query** pane click on **Get data**, then select **More...**.
    
    ![qmnk7vjk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/qmnk7vjk.jpg)
    
4. In the **Choose data source** tab, search box search type **`Lakehouse`** and then click on the **Lakehouse** connector.
    
    ![17i4mqpf.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/17i4mqpf.jpg)
    
5. The **Connect to data source** dialog appears, select **Edit connection.**
    
    ![m8wakwk0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/m8wakwk0.jpg)
    
6. In the **Connect to data source** dialog box, select **sign in** using your Power BI organizational account to set the identity that the dataflow uses to access the lakehouse.
    
    ![ztw36ue8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ztw36ue8.jpg)
    
    ![7pxrsgir.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7pxrsgir.jpg)
    
7. In **Connect to data source** dialog box, select **Next.**
    
    ![5fl45fvs.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/5fl45fvs.jpg)
    
8. The **Choose data** dialog is displayed. Use the navigation pane to find the Lakehouse you created for the destination in the prior module, and select the **Tutorial_Lakehouse** data table then click on **Create** button.
    
    ![9k1se9ap.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9k1se9ap.jpg)
    
9. Once your canvas is populated with the data, you can set **column profile** information, as this is useful for data profiling. You can apply the right transformation and target the right data values based on it.
    
10. To do this, select **Options** from the ribbon pane, then select the first three options under **Column profile**, and then select **OK**.
    
    ![03lpegeq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/03lpegeq.jpg)
    
    ![no9vm1d8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/no9vm1d8.jpg)
    

## **Task 2: Transform the data imported from the Lakehouse**

1. Select the data type icon in the column header of the second column, **IpepPickupDatetime**, to display a dropdown menu and select the **Change type** from the menu to convert the column from the **Date/Time** to **Date** type.
    
    ![4p7xua5e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4p7xua5e.jpg)
    
2. On the **Home** tab of the ribbon, select the **Choose columns** option from the **Manage columns** group.
    
    ![vxrenrxg.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vxrenrxg.jpg)
    
3. On the **Choose columns** dialog, **deselect** some columns listed here, then select **OK**.
    
    - lpepDropoffDatetime
    - puLocationId
    - doLocationId
    - pickupLatitude
    - dropoffLongitude
    - rateCodeID
    
    ![7msgj73u.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7msgj73u.jpg)
    
4. Select the **storeAndFwdFlag** column's filter and sort dropdown menu. (If you see a warning **List may be incomplete**, select **Load more** to see all the data.)
    
    ![rszohe4m.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rszohe4m.jpg)
    
5. Select **'Y'** to show only rows where a discount was applied, and then select **OK**.
    
    ![rfixjmbp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rfixjmbp.jpg)
    
6. Select the **Ipep_Pickup_Datetime** column sort and filter dropdown menu, then select **Date filters**, and choose the **Between...** filter provided for Date and Date/Time types.
    
    ![bvczapk5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bvczapk5.jpg)
    
7. In the **Filter rows** dialog, select dates between **January 1, 2015**, and **January 31, 2015**, then select **OK**.
    
    ![cmig1hew.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/cmig1hew.jpg)
    

### **Task 3: Connect to a CSV file containing discount data**

Now, with the data from the trips in place, we want to load the data that contains the respective discounts for each day and VendorID, and prepare the data before combining it with the trips data.

1. From the **Home** tab in the dataflow editor menu, select the **Get data** option, and then choose **Text/CSV**.
    
    ![la673ie3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/la673ie3.jpg)
    
2. In the **Connect to data source** pane, under **Connection settings**, select **Upload file (Preview)** radio button, then click on **Browse** button and browse your VM **C:\LabFiles**, then select the **NYC-Taxi-Green-Discounts** file and click on the **Open** button.
    
    ![naroavjz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/naroavjz.jpg)
    
    ![kihybdf5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kihybdf5.jpg)
    
3. In the **Connect to data source** pane, click on the **Next** button.
    
    ![a3bk0hwp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/a3bk0hwp.jpg)
    
4. On the **Preview file data** dialog, select **Create**.
    
    ![w4ppgwxy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/w4ppgwxy.jpg)
    

## **Task 4: Transform the discount data**

1. Reviewing the data, we see the headers appear to be in the first row. Promote them to headers by selecting the table's context menu at the top left of the preview grid area to select **Use first row as headers**.
    
    ![y74172x6.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/y74172x6.jpg)
    
    > **Note:** After promoting the headers, you can see a new step added to the **Applied steps** pane at the top of the dataflow editor to the data types of your columns.*
    
2. Right-click the **VendorID** column, and from the context menu displayed, select the option **Unpivot other columns**. This allows you to transform columns into attribute-value pairs, where columns become rows.
    
    ![lavqnrsp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lavqnrsp.jpg)
    
3. With the table unpivoted, rename the **Attribute** and **Value** columns by double-clicking them and changing **Attribute** to **Date** and **Value** to **Discount**.
    
    ![0wa0lftz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0wa0lftz.jpg)
    
    ![h9jxl3nj.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h9jxl3nj.jpg)
    
    ![8ctmzett.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8ctmzett.jpg)
    
    ![g8of289d.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/g8of289d.jpg)
    
4. Change the data type of the Date column by selecting the data type menu to the left of the column name and choosing **Date**.
    
    ![h7ywmaj6.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h7ywmaj6.jpg)
    
5. Select the **Discount** column and then select the **Transform** tab on the menu. Select **Number column**, and then select **Standard** numeric transformations from the submenu, and choose **Divide**.
    
    ![7verumhy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7verumhy.jpg)
    
6. On the **Divide** dialog, enter the value **`100`**, then click on **OK** button.
    
    ![0v5i4atp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0v5i4atp.jpg)
    

### **Task 5: Combine trips and discounts data**

The next step is to combine both tables into a single table that has the discount that should be applied to the trip, and the adjusted total.

1. First, toggle the **Diagram view** button so you can see both of your queries.
    
    ![bvlb7bpx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bvlb7bpx.jpg)
    
2. Select the **Nyc_Taxi_Green_2..** query, and on the **Home** tab, Select the **Combine** menu and choose **Merge queries**, then **Merge queries as new**.
    
    ![e4x09jp8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/e4x09jp8.jpg)
    
3. On the **Merge** dialog, select **Generated-NYC-Taxi-Green-Discounts** from the **Right table for merge** drop down, and then select the "**light bulb**" icon on the top right of the dialog to see the suggested mapping of columns between the three tables.
    
    ![1z0m8bz8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1z0m8bz8.jpg)
    
4. Choose each of the two suggested column mappings, one at a time, mapping the VendorID and date columns from both tables. When both mappings are added, the matched column headers are highlighted in each table.
    
    ![u7nvtqp6.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/u7nvtqp6.jpg)
    
5. A message is shown asking you to allow combining data from multiple data sources to view the results. Select **OK**
    
    ![g61v28oq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/g61v28oq.jpg)
    
6. Notice how a new query was created in Diagram view showing the relationship of the new Merge query with the two queries you previously created. Looking at the table pane of the editor, scroll to the right of the Merge query column list to see a new column with table values is present. This is the "Generated NYC Taxi-Green-Discounts" column, and its type is **[Table]**. In the column header there's an icon with two arrows going in opposite directions, allowing you to select columns from the table. Deselect all of the columns except **Discount**, and then select **OK**.
    
    ![6tz511wu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6tz511wu.jpg)
    
    ![c37ylwyh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/c37ylwyh.jpg)
    
7. With the discount value now at the row level, we can create a new column to calculate the total amount after discount. To do so, select the **Add column** tab at the top of the editor, and choose **Custom column** from the **General** group.
    
    ![vwmc63hz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vwmc63hz.jpg)
    
8. On the **Custom column** dialog, you can use the [Power Query formula language (also known as M)](https://learn.microsoft.com/en-us/powerquery-m) to define how your new column should be calculated. Enter **TotalAfterDiscount** for the **New column name**, select **Currency** for the **Data type**, and provide the following M expression for the **Custom column formula**:
    
    **`if [totalAmount] > 0 then [totalAmount] * ( 1 -[Discount] ) else [totalAmount]`**
    
    Then select **OK**.
    
    ![04ntcz0l.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/04ntcz0l.jpg)
    
    ![4rlezej5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4rlezej5.jpg)
    
9. Select the newly create **TotalAfterDiscount** column and then select the **Transform** tab at the top of the editor window. On the **Number column** group, select the **Rounding** drop down and then choose **Round...**.
    
    ![hy2ijd76.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hy2ijd76.jpg)
    
10. On the **Round** dialog, enter **`2`** for the number of decimal places and then select **OK**.
    
    ![v5wzpr1h.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/v5wzpr1h.jpg)
    
11. Change the data type of the **IpepPickupDatetime** from **Date** to **Date/Time**.
    
    ![u828x0nc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/u828x0nc.jpg)
    
    ![cphc2jx3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/cphc2jx3.jpg)
    
12. Finally, expand the **Query settings** pane from the right side of the editor if it isn't already expanded, and rename the query from **Merge** to **Output**.
    
    ![51tludj2.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/51tludj2.jpg)
    
    ![sm5uz4xd.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sm5uz4xd.jpg)
    

### **Task 6: Load the output query to a table in the Lakehouse**

With the output query now fully prepared and with data ready to output, we can define the output destination for the query.

1. Select the **Output** merge query created previously. Then select the **Home** tab in the editor, and **Add data destination** from the **Query** grouping, to select a **Lakehouse** destination.
    
    ![i8cfdqnw.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/i8cfdqnw.jpg)
    
2. On the **Connect to data destination** dialog, your connection should already be selected. Select **Next** to continue.
    
    ![56tk5p7a.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/56tk5p7a.jpg)
    
3. On the **Choose destination target** dialog, browse to the Lakehouse where you wish to load the data and name the new table **`nyc_taxi_with_discounts`**, then select **Next** again.
    
    ![r8hiwiwz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/r8hiwiwz.jpg)
    
4. On the **Choose destination settings** dialog, leave the default **Replace** update method, double check that your columns are mapped correctly, and select **Save settings**.
    
    ![ymy51lj7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ymy51lj7.jpg)
    
5. Back in the main editor window, confirm that you see your output destination on the **Query settings** pane for the **Output** table, and then select **Publish**.
    
    ![9ciqo2du.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9ciqo2du.jpg)
    
    ![93yzjbxr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/93yzjbxr.jpg)
    
6. On the workspace page, you can rename your dataflow by selecting the ellipsis to the right of the dataflow name that appears after you select the row, and choosing **Properties**.
    
    ![wp0yjed0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wp0yjed0.jpg)
    
7. In the **Dataflow 1** dialog box, enter **`nyc_taxi_data_with_discounts`** in the name box, then select **Save**.
    
    ![xc6v8sgb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xc6v8sgb.jpg)
    
8. Select the refresh icon for the dataflow after selecting its row, and when complete, you should see your new Lakehouse table created as configured in the **Data destination** settings.
    
    ![q2su9i1o.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/q2su9i1o.jpg)
    
9. In the **Data_FactoryXX** pane, select **Tutorial_Lakehouse** to view the new table loaded there.
    
    ![imfgwbzb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/imfgwbzb.jpg)
    
    ![rj8v1ia0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rj8v1ia0.jpg)
    

# **Exercise 3: Automate and send notifications with Data Factory**

> **Important** Microsoft Fabric is currently in PREVIEW. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here. Refer to [**Azure Data Factory documentation**](https://learn.microsoft.com/en-us/azure/data-factory/) for the service in Azure.

## **Task 1: Add an Office 365 Outlook activity to your pipeline**

1. From **Tutorial_Lakehouse** page, navigate and click on **Data_FactoryXX** Workspace on the left-sided navigation menu.
    
    ![jbe0d1ck.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jbe0d1ck.jpg)
    
2. In the **Data_FactoryXX** view, select the **First_Pipeline1**.
    
    ![va42e4ky.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/va42e4ky.jpg)
    
3. Select the **Activities** tab in the pipeline editor and find the **Office Outlook** activity.
    
    ![4ks8iyxs.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4ks8iyxs.jpg)
    
4. Select and drag the **On success** path (a green checkbox on the top right side of the activity in the pipeline canvas) from your **Copy activity** to your new **Office 365 Outlook** activity.
    
    ![isc6qx1l.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/isc6qx1l.jpg)
    
5. Select the Office 365 Outlook activity from the pipeline canvas, then select the **Settings** tab of the property area below the canvas to configure the email. Click on **Sing in** button.
    
    ![swt17sye.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/swt17sye.jpg)
    
6. Select your Power BI organizational account and then select **Allow access** to confirm.
    
    ![eflvjiz9.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/eflvjiz9.jpg)