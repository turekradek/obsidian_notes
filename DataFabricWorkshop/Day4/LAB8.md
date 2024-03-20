# **Lab 08 - Developing, evaluating, and scoring a forecasting model for superstore sales**

**Introduction**

In this lab, you'll see Microsoft Fabric's end-to-end data science workflow for a forecasting model. This scenario uses the historic sales data to predict the sales for different categories of products at a superstore.

Forecasting is a crucial asset in sales, harnessing historical data and predictive methods to provide insights into future trends. By analyzing past sales, identifying patterns, and learning from consumer behavior, businesses can optimize inventory, production, and marketing strategies. This proactive approach enhances adaptability, responsiveness, and overall performance of businesses in a dynamic marketplace.

**Objective**

1. Load the data
    
2. Understand and process the data using exploratory data analysis
    
3. Train a machine learning model using an open source software package called SARIMAX and track experiments using MLflow and Fabric Autologging feature
    
4. Save the final machine learning model and make predictions
    
5. Demonstrate the model performance via visualizations in Power BI
    

## **Task 1: Load the Data**

**Dataset**

The dataset contains the churn status of 9995 instances of sales of different products, along with 21 attributes that include: Row ID, Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Customer Name, Segment, Country, City, State, Postal Code, Region, Product ID, Category, Sub-Category, Product Name, Sales, Quantity, Discount, Profit.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/home`** then press the **Enter** button
    
2. In the **Microsoft Azure** window, enter your **Sign-in** credentials, and click on the **Next** button.
    
    ![3noisybb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3noisybb.jpg)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button**.**
    
    ![1cyf8u5b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1cyf8u5b.jpg)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![rxp1rwsj.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rxp1rwsj.jpg)
    
5. In the **Power BI** **Home** page, on the left-side pane navigate and click on **Workspaces**.
    
    ![j1p2j666.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/j1p2j666.jpg)
    
6. In the Workspaces pane Select **Data-ScienceXX** workspace.
    
    ![zui7lygu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zui7lygu.jpg)
    
7. In the **Data-ScienceXX** workspace page, click on the drop-down arrow in the **+New** button, then select **Import notebook.**
    
    ![hf1kps91.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hf1kps91.jpg)
    
8. On the **Import status pane that appears on the right side, click on Upload button** and then browse to **C:\Labfiles\data-science** and then select **AIsample - Superstore Forecast** notebook and click on the **Open** button.
    
    ![6vqfukay.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6vqfukay.jpg)
    
    ![kffcjwrl.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kffcjwrl.jpg)
    
9. Once the notebooks are imported, select **Go to workspace** in the import dialog box
    
    ![6a7i8q92.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6a7i8q92.jpg)
    
    ![5ayltm4j.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/5ayltm4j.jpg)
    
10. On the Data-ScienceXX workspace homepage, select the **FabricData_Sciencelakehouse** lakehouse.
    
    ![tx6pf5py.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/tx6pf5py.jpg)
    
11. In the Fabric **Data_Sciencelakehouse** page, select **Open notebook** > **Existing notebook** from the top navigation menu.
    
    ![zpwqbgzt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zpwqbgzt.jpg)
    
12. From the list of **Open existing notebook**, select the **AIsample - Superstore Forecast** notebook and select **Open**.
    
    ![o5cyvvu5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/o5cyvvu5.jpg)
    
13. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![9f7tnfex.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9f7tnfex.jpg)
    
14. To load the data, select the code cell and click on the **play** button to execute cell.
    
    ![nau8sl92.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nau8sl92.jpg)
    
15. Download a publicly available version of the dataset and then store it in a Fabric lakehouse. Select the code cell and click on the **play** button to execute cell.
    
    ![s7165dhy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/s7165dhy.jpg)
    
16. Start recording the time it takes to run this notebook. Select the code cell and click on the **play** button to execute cell.
    
    ![46rzxceq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/46rzxceq.jpg)
    
17. Autologging in Microsoft Fabric extends the MLflow autologging capabilities by automatically capturing the values of input parameters and output metrics of a machine learning model as it is being trained. This information is then logged to the workspace, where it can be accessed and visualized using the MLflow APIs or the corresponding experiment in the workspace.
    
18. Select the code cell and click on the **play** button to execute cell.
    
    ![e33pu9uu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/e33pu9uu.jpg)
    
19. Read raw data from the **Files** section of the lakehouse. Add additional columns for different date parts and the same information will be used to create partitioned delta table. Since the raw date is stored as an Excel file, you need to use Pandas to read the raw data.
    
20. Select the code cell and click on the **play** button to execute cell.
    
    ![t3wi5nn8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/t3wi5nn8.jpg)
    

## **Task 2: Exploratory Data Analysis**

1. To import the required libraries. Select the code cell and click on the **play** button to execute cell.
    
    ![h4rl8uha.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/h4rl8uha.jpg)
    
2. To review the dataset, it is recommended to manually go through a subset of the data to gain a better understanding. In this regard, you could use the display function to print the DataFrame. You can also show the "Chart" views to easily visualize subsets of the dataset.
    
3. Select the code cell and click on the **play** button to execute cell.
    
    ![2b5y255q.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2b5y255q.jpg)
    
4. The primary focus will be on forecasting the sales for the Furniture category. This choice is made to speed up the computation and facilitate the demonstration of the model\'s performance. However, it is important to realize that this techniques used in this notebook are adaptable and can be extended to predict the sales of various other product categories.
    
5. Select the code cell and click on the **play** button to execute cell.
    
    ![7r5ut82r.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7r5ut82r.jpg)
    
6. To Pre-processing the data, select the code cell and click on the **play** button to execute cell.
    
    ![b6dmiy02.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/b6dmiy02.jpg)
    
7. The dataset is structured on a daily basis, and since the goal is to develop a model to forecast the sales on a monthly basis, you need to resample on the column Order Date.
    
8. First, group the Furniture category by Order Date and then calculate the sum of the Sales column for each group in order to determine the total sales for each unique Order Date. Then, resample the Sales column using the MS frequency to aggregate the data by month and then you calculate the mean sales value for each month.
    
9. Select the code cell and click on the **play** button to execute cell.
    
    ![9k5kjtdi.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9k5kjtdi.jpg)
    
10. Demonstrate the impact of Order Date on the Sales for the Furniture category. Select the code cell and click on the **play** button to execute cell.
    
    ![7jxexz6p.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7jxexz6p.jpg)
    
11. Prior to any statistical analysis, you need to import statsmodels. Statsmodels is a Python module that provides classes and functions for the estimation of many different statistical models, as well as for conducting statistical tests and statistical data exploration.
    
12. Select the code cell and click on the **play** button to execute cell.
    
    ![dw669fp8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/dw669fp8.jpg)
    
13. A time series tracks four data elements at set intervals in order to determine the variation of those four elements in the time series pattern. These elements include:
    
    - **Level:** Refers to the fundamental component that represents the average value for a specific time period.
        
    - **Trend:** Describes whether the time series is decreasing, constant, or increasing over time.
        
    - **Seasonality:** Describes the periodic signal in the time series and looks for cyclic occurrences that affect the time series\' increasing or decreasing patterns.
        
    - **Noise/Residual:** Refers to the random fluctuations and variability in the time series data that cannot be explained by the model.
        
14. Select the code cell and click on the **play** button to execute cell.
    
    ![mvsemszi.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mvsemszi.jpg)
    
    ![s1yw244f.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/s1yw244f.jpg)
    

## **Task 3: Model Training and Tracking**

With your data in place, you can define the forecasting model. Apply the Seasonal AutoRegressive Integrated Moving Average with eXogenous regressors (SARIMAX) in this notebook. SARIMAX is a time series forecasting model that extends SARIMA to include exogenous variables. It combines autoregressive (AR) and moving average (MA) components, seasonal differencing, and external predictors to make accurate and flexible forecasts for time series data, making it a powerful tool for various forecasting tasks.

1. Use MLfLow and Fabric Autologging to track the experiments. Here you'll load the delta table from the lakehouse. You may use other delta tables considering the lakehouse as the source. Select the code cell and click on the **play** button to execute cell.
    
    ![62760afo.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/62760afo.jpg)
    
2. SARIMAX takes into account the parameters involved in regular ARIMA mode (p,d,q) and also adds the seasonality parameters (P,D,Q,s). These arguments to SARIMAX model are called order (p,d,q) and seasonal order (P,D,Q,s) respectively and hence 7 parameters to tune. Prior to model training, you need to set up these parameters which are defined in the following.
    
3. Select the code cell and click on the **play** button to execute cell.
    
    ![pnflrk5q.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/pnflrk5q.jpg)
    
    ![1qs2t7sy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1qs2t7sy.jpg)
    
4. To model training, select the code cell and click on the **play** button to execute cell.
    
    ![329s8f2x.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/329s8f2x.jpg)
    
5. Visualize a time series forecast for furniture sales data, showing both the observed data and the one-step-ahead forecast with a confidence interval shaded region. Select the code cell and click on the **play** button to execute cell.
    
    ![lvi9b52x.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lvi9b52x.jpg)
    
    ![yfhfaxew.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yfhfaxew.jpg)
    
    ![ymoo88au.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ymoo88au.jpg)
    
6. Note that predictions is utilized to assess the model\'s performance by contrasting it with the actual values, whereas **predictions_future** is indicative of future forecasting.
    
7. Select the code cell and click on the **play** button to execute cell.
    
    ![icr76h5v.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/icr76h5v.jpg)
    
    ![vyrfd0bn.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vyrfd0bn.jpg)
    

## **Task 4: Score the model and save predictions**

1. The actual values are integrated with the forecasted values, which will be employed to create the Power BI report. Note that these results will be stored into a table within the lakehouse.
    
2. Select the code cell and click on the **play** button to execute cell.
    
    ![r9zmmpdu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/r9zmmpdu.jpg)
    
    ![nm20zsn8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nm20zsn8.jpg)
    

## **Step 5: Business Intelligence via Visualizations in Power BI**

The Power BI report shows the mean absolute percentage error (MAPE) of 16.58. MAPE is a metric that defines the accuracy of a forecasting method and represents how accurate the forecasted quantities are in comparison with the actual quantities. MAPE is a straightforward metric, with a 10% MAPE representing that the average deviation between the forecasted values and actual values was 10%, regardless of whether the deviation was positive or negative. Note that what one considers to be a desirable MAPE value varies across different industries.

The light blue line in the graph represents the actual sales values, while the dark blue line represents the forecasted sales values. An analysis of the comparison between the actual and forecasted sales reveals that the model effectively predicts sales for the Furniture category during the first six months of 2023.

Based on this observation, it is justifiable to have confidence in the model\'s forecasting capabilities for the overall sales in the last six months of 2023 and extending into 2024. This confidence can inform strategic decisions regarding inventory management, raw material procurement, and other business-related considerations.

1. Now, click on **FabricData_Sciencelakehouse** on the left-sided navigation pane
    
    ![74h8gbkp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/74h8gbkp.jpg)
    
2. Select **New semantic model** on the top ribbon.
    
    ![jybp80he.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/jybp80he.jpg)
    
3. In the **New dataset** box, enter the dataset a name, such as **`bank churn predictions`** .Then select the **customer_churn_test_predictions** dataset and select **Confirm**.
    
    ![l6pyp6hu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/l6pyp6hu.jpg)
    
    ![6ag8acaa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6ag8acaa.jpg)
    
4. Add a new measure for the MAPE.
    
    - Select **New measure** in the top ribbon. This action adds a new item named **Measure** to the **Demand_Forecast_New_1** dataset, and opens a formula bar above the table.
        
        ![87a764x3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/87a764x3.jpg)
        
    - To determine the average the MAPE , replace Measure = in the formula bar with:
        
        ```
        MAPE_Value = AVERAGE(Demand_Forecast_New_1[MAPE])
        ```
        
    - To apply the formula, select the **check mark** in the formula bar. The new measure appears in the data table. The calculator icon shows it was created as a measure.
        
        ![vnk9z62p.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vnk9z62p.jpg)
        
5. Add a new measure that average the total number of forecasted sales . You'll need it for the rest of the new measures.
    
    - Select **New measure** in the top ribbon to add a new item named **Measure** to the **Demand_Forecast_New_1** dataset. This action also opens a formula bar above the table.
        
        ```
        Forecasted_Value = AVERAGE (Demand_Forecast_New_1[Forecasted_Sales])
        ```
        
    - Select the **check mark** in the formula bar to apply the formula.
        
        ![f9xngdyb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/f9xngdyb.jpg)
        
6. Add a new measure that counts the total number of actual sales . You'll need it for the rest of the new measures.
    
    - Select **New measure** in the top ribbon to add a new item named **Measure** to the **Demand_Forecast_New_1** dataset. This action also opens a formula bar above the table.
        
        ```
        Actual_Value = AVERAGE (Demand_Forecast_New_1[Actual_Sales])
        ```
        
    - Select the **check mark** in the formula bar to apply the formula.
        
        ![l62a8zr4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/l62a8zr4.jpg)
        
7. On the tools at the top of the dataset page, select **New report** to open the Power BI report authoring page.
    
    ![yyg9h44m.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yyg9h44m.jpg)
    
8. In the Ribbon, select **Text box**. Type in **ML-Forecast** . **Highlight** the **text** Change the font size and background color in the Format panel. Adjust the font size and color by selecting the text and using the format bar.
    
    ![4grpmhce.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4grpmhce.jpg)
    
9. In the Visualizations panel, select the **Card** icon. From the **Data** pane, select **MAPE_Value**. Change the font size and background color in the Format panel. Drag this visualization to the top right of the report.
    
    ![pepn9lgr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/pepn9lgr.jpg)
    
    ![14o45bo8.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/14o45bo8.jpg)
    
10. In the Visualizations panel, select the **Slicer** icon. From the **Data** pane, select **Category**.
    
11. Change the slicer settings, click on **Format your visual**, under the **Visual** drop down the **Slicer settings** and select the **style** as **Dropdown** font size. Change the background color in the Format panel. Drag this visualization to the top right of the report.
    
    ![p7cjez24.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/p7cjez24.jpg)
    
    ![eonbgit6.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/eonbgit6.jpg)
    
    ![b57va2at.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/b57va2at.jpg)
    
12. In the Visualizations panel, select the **Line chart** icon. Select **Date** for the x-axis, **Actual_Value** for column y-axis, and **Forecasted_value** for the line y-axis.
    
    ![iehz15cc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/iehz15cc.jpg)