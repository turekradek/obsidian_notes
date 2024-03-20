# **Lab 07 - Implementing a Data Science scenario in Microsoft Fabric**

**Introduction**

The lifecycle of a Data science project typically includes (often, iteratively) the following steps:

- Business understanding
    
- Data acquisition
    
- Data exploration, cleansing, preparation, and visualization
    
- Model training and experiment tracking
    
- Model scoring and generating insights.
    

The goals and success criteria of each stage depend on collaboration, data sharing and documentation. The Fabric data science experience consists of multiple native-built features that enable collaboration, data acquisition, sharing, and consumption in a seamless way.

In these tutorials, you take the role of a data scientist who has been given the task to explore, clean, and transform a dataset containing the churn status of 10000 customers at a bank. You then build a machine learning model to predict which bank customers are likely to leave.

**Objective**

1. Use the Fabric notebooks for data science scenarios.
    
2. Ingest data into a Fabric lakehouse using Apache Spark.
    
3. Load existing data from the lakehouse delta tables.
    
4. Clean and transform data using Apache Spark and Python based tools.
    
5. Create experiments and runs to train different machine learning models.
    
6. Register and track trained models using MLflow and the Fabric UI.
    
7. Run scoring at scale and save predictions and inference results to the lakehouse.
    
8. Visualize predictions in Power BI using DirectLake.
    

## **Task 1: Create a workspace**

Before working with data in Fabric, create a workspace with the Fabric trial enabled.

1. Open your browser, navigate to the address bar, and type or paste the following URL: **`https://app.fabric.microsoft.com/`** then press the **Enter** button.
    
    > **Note**: If you are directed to Microsoft Fabric Home page, then skip steps from #2 to #4.
    
    ![byak9dul.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/byak9dul.jpg)
    
2. In the **Microsoft Fabric** window, enter your credentials, and click on the **Submit** button.
    
    ![2nso5g7y.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2nso5g7y.jpg)
    
3. Then, In the **Microsoft** window enter the password and click on the **Sign in** button**.**
    
    ![hyonk9hj.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hyonk9hj.jpg)
    
4. In **Stay signed in?** window, click on the **Yes** button.
    
    ![p6s58ehs.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/p6s58ehs.jpg)
    
5. In the **Microsoft Fabric** home page, select the **Power BI** template.
    
    ![rntdmepm.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rntdmepm.jpg)
    
6. In the **Power BI Home** page menu bar on the left, select **Workspaces** (the icon looks similar to 🗇).
    
    ![3i4zeiiv.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3i4zeiiv.jpg)
    
7. In the Workspaces pane, select **+** **New workspace**.
    
    ![mu1txcxm.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mu1txcxm.jpg)
    
8. In the **Create a workspace tab**, enter the following details and click on the **Apply** button.
    
    |**Name**|**`Data-ScienceXX`** (XX can be a unique number)|
    |---|---|
    |**Advanced**|Under **License mode**, select **Trial**|
    |**Default storage format**|**`Small dataset storage format`**|
    
    ![f26vjznc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/f26vjznc.jpg)
    
    ![afxnmkrn.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/afxnmkrn.jpg)
    
    ![9aoz499g.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9aoz499g.jpg)
    
    ![p6bkzqa0.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/p6bkzqa0.jpg)
    
9. Wait for the deployment to complete. It takes 2-3 minutes to complete. When your new workspace opens, it should be empty.
    
10. At the bottom left of the Power BI portal, select the **Power BI** icon and switch to the **Data Engineering** experience.
    
11. In the **Power BI Data-ScienceXX** home page, Select **Lakehouse(Preview)** under **New** pane.
    
    ![bo98iwij.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bo98iwij.jpg)
    

## **Task 2: Create a lakehouse and upload files**

Now that you have a workspace, it's time to switch to the _Data engineering_ experience in the portal and create a data lakehouse for the data files you're going to analyze.

1. At the bottom left of the Power BI portal, select the **Power BI** icon and switch to the **Data Engineering** experience.
    
2. In the **Synapse Data Engineering** home page, Select **Lakehouse(Preview)** under **New** pane.
    
    ![bfk5iwzp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bfk5iwzp.jpg)
    
3. In the **New lakehouse** dialog box, enter **`FabricData_Sciencelakehouse`** in the **Name** field, click on the **Create** button and open the new lakehouse.
    
    ![prr9l8jr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/prr9l8jr.jpg)
    
    ![4ia1wn86.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4ia1wn86.jpg)
    
4. After a minute or so, a new empty lakehouse will be created. You need to ingest some data into the data lakehouse for analysis.
    
    ![57s8pnzj.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/57s8pnzj.jpg)
    
5. You will see a notification stating **Successfully created SQL endpoint**.
    
    ![09x979nb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/09x979nb.jpg)
    
6. At the bottom left of the Power BI portal, select the **Data Engineering** icon and switch to the **Data Science** experience.
    
    ![adwcoth7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/adwcoth7.jpg)
    

## **Task 3: Import tutorial notebooks**

1. On the Data science experience homepage, select **Import notebook** and upload the notebook files.
    
    ![ygg86ihw.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ygg86ihw.jpg)
    
2. On the **Import status** pane that appears on the right side, click on **Upload** button and then browse to **C:\Labfiles\data-science\data-science-tutorial** and then select all **_files_** and click on the **Open** button.
    
    ![d0c9rva3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/d0c9rva3.jpg)
    
    ![kj8pzo2v.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/kj8pzo2v.jpg)
    
    ![lyjid017.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lyjid017.jpg)
    
3. Once the notebooks are imported, select **Go to workspace** in the import dialog box
    
    ![047uj0uk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/047uj0uk.jpg)
    
4. The imported notebooks are now available in your workspace for use.
    
    ![1lmvl1gb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1lmvl1gb.jpg)
    
5. On the Data-ScienceXX workspace homepage, select the **1-ingest-data** notebook.
    
    ![e6i617p7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/e6i617p7.jpg)
    
6. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![zvvtxp4s.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zvvtxp4s.jpg)
    

## **Task 4: Attach a lakehouse to the notebooks**

To demonstrate Fabric lakehouse features, many of the tutorials require attaching a default lakehouse to the notebooks. The following steps show how to add an existing lakehouse to a notebook in a Fabric-enabled workspace.

1. Select **Add lakehouse** in the left pane and select **Existing lakehouse** to open the **Data hub** dialog box.
    
    ![an23irur.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/an23irur.jpg)
    
2. In the **Add lakehouse** box, select the **Existing lakehouse** radio button and click on the **Add** button.
    
    ![36wzvfhh.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/36wzvfhh.jpg)
    
3. In **OneLake data hub** tab, Select the **FabricData_Sciencelakehouse** and select **Add**.
    
    ![gw9vi109.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gw9vi109.jpg)
    
4. Once a lakehouse is added, it's visible in the lakehouse pane in the notebook UI where tables and files stored in the lakehouse can be viewed.
    
    ![vvllvach.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vvllvach.jpg)
    

## **Task 5: Ingest data into a Microsoft Fabric lakehouse using Apache Spark**

**Bank churn data**

The dataset contains churn status of 10,000 customers. It also includes attributes that could impact churn such as:

- Credit score
    
- Geographical location (Germany, France, Spain)
    
- Gender (male, female)
    
- Age
    
- Tenure (years of being bank's customer)
    
- Account balance
    
- Estimated salary
    
- Number of products that a customer has purchased through the bank
    
- Credit card status (whether a customer has a credit card or not)
    
- Active member status (whether an active bank's customer or not)
    

The dataset also includes columns such as row number, customer ID, and customer surname that should have no impact on customer's decision to leave the bank.

The event that defines the customer's churn is the closing of the customer's bank account. The column exited in the dataset refers to customer's abandonment. There isn't much context available about these attributes so you have to proceed without having background information about the dataset. The aim is to understand how these attributes contribute to the exited status.

1. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![2xbwcufp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/2xbwcufp.jpg)
    
2. Download dataset and upload to lakehouse, select the code cell and click on the **play** button to execute cell.
    
    ![8oqmri93.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8oqmri93.jpg)
    
3. This code downloads a publicly available version of the dataset and then stores it in a Fabric lakehouse. Select the code cell and click on the **play** button to execute cell.
    
    ![zr6mqg08.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zr6mqg08.jpg)
    

## **Task 6: Explore and visualize data using Microsoft Fabric notebooks**

1. Now, click on **Data_ScienceXX** on the left-sided navigation pane.
    
    ![zle4vfu7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zle4vfu7.jpg)
    
2. On the Data-ScienceXX workspace homepage, select the **FabricData_Sciencelakehouse** lakehouse.
    
    ![be2w57x3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/be2w57x3.jpg)
    
3. In the Fabric **Data_Sciencelakehouse** page, select **Open notebook** > **Existing notebook** from the top navigation menu.
    
    ![b1fr20ot.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/b1fr20ot.jpg)
    
4. From the list of **Open existing notebook**, select the **2-explore-cleanse-data** notebook and select **Open**.
    
    ![l325zqmo.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/l325zqmo.jpg)
    
    ![18z5rs1c.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/18z5rs1c.jpg)
    
5. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![s8je1jhe.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/s8je1jhe.jpg)
    
6. Read raw data from the **Files** section of the lakehouse. You uploaded this data in the previous notebook. Make sure you have attached the same lakehouse you used in Task 5 to this notebook before you run this code.
    
7. Select the code cell and click on the **play** button to execute cell.
    
    ![9116g4lm.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9116g4lm.jpg)
    
8. Convert the spark DataFrame to pandas DataFrame for easier processing and visualization. Select the code cell and click on the **play** button to execute cell.
    
    ![qp68m3k4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/qp68m3k4.jpg)
    
9. Explore the raw data with display, do some basic statistics and show chart views. You first need to import required libraries for data visualization such as seaborn, which is a Python data visualization library to provide a high-level interface for building visuals on DataFrames and arrays. Select the code cell and click on the **play** button to execute cell.
    
    ![23utz41l.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/23utz41l.jpg)
    
    ![4g8ow08p.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4g8ow08p.jpg)
    
10. Use Data Wrangler to perform initial data cleansing, under the notebook ribbon select **Data** tab , dropdown the **Launch Data Wrangler** and select the **df** data wrangler.
    
    ![351ta1hb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/351ta1hb.jpg)
    
11. Once the Data Wrangler is launched, a descriptive overview of the displayed data panel is generated.
    
12. In df(Data Wrangler) pane, under **Operations** select the **Find and replace>Drop duplicate rows.**
    
    ![766drjkk.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/766drjkk.jpg)
    
13. Under the Target columns, select the **RowNumber and CustomerId** check boxs, and then click on the **Apply** button.
    
    ![117qjhgq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/117qjhgq.jpg)
    
14. In df(Data Wrangler) pane, under **Operations** select the **Find and replace>Drop missing values.**
    
    ![eih0us19.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/eih0us19.jpg)
    
15. Under the Target columns, select the **RowNumber, CustomerId, Surname** check boxs**,** and then click on the **Apply** button.
    
    ![gta5m4q5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gta5m4q5.jpg)
    
16. In df(Data Wrangler) pane, under **Operations** select the **Find and replace>Drop missing values.**
    
    ![tzrk8xuq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/tzrk8xuq.jpg)
    
17. Under the Target columns, select the **Select all** check box, and then click on the **Apply** button.
    
    ![8me36c3b.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8me36c3b.jpg)
    
18. In df(Data Wrangler) pane, select the **+Add code to notebook.**
    
    ![83r8twkr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/83r8twkr.jpg)
    
19. This code is similar to the code produced by Data Wrangler, but adds in the argument **inplace=True** to each of the generated steps. By setting **inplace=True**, pandas will overwrite the original DataFrame instead of producing a new DataFrame as an output.
    
    ![k7n4qhtf.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/k7n4qhtf.jpg)
    
20. Select new added code cell and click on the **play** button to execute cells.
    
    ![rey60i3y.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/rey60i3y.jpg)
    
21. To determine categorical, numerical, and target attributes. Select the code cell and click on the **play** button to execute cell.
    
    ![sdc1obj4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/sdc1obj4.jpg)
    
22. To show the five-number summary (the minimum score, first quartile, median, third quartile, the maximum score) for the numerical attributes, using box plots. Select the code cell and click on the **play** button to execute cell.
    
    ![nuecldn1.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/nuecldn1.jpg)
    
    ![6vd9rk02.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6vd9rk02.jpg)
    
23. To show the distribution of exited versus non-exited customers across the categorical attributes. Select the code cell and click on the **play** button to execute cell.
    
    ![ghytjkeb.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ghytjkeb.jpg)
    
24. Show the frequency distribution of numerical attributes using histogram. Select the code cell and click on the **play** button to execute cell.
    
    ![4ofugd17.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4ofugd17.jpg)
    
25. Perform the feature engineering generates new attributes based on current attributes. Select the code cell and click on the **play** button to execute cell.
    
    ![bhgtukn3.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/bhgtukn3.jpg)
    
26. Perform the feature engineering generates new attributes based on current attributes. Select the code cell and click on the **play** button to execute cell.
    
    ![aj8tzp1z.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/aj8tzp1z.jpg)
    
27. Use the **Data Wrangler** to perform one-hot encoding, under the notebook ribbon select **Data** tab , dropdown the **Launch Data Wrangler** and select the **df** data wrangler.
    
    ![m0zdcfgq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/m0zdcfgq.jpg)
    
28. In df(Data Wrangler) pane, under **Operations** select the **Formulas>One-hot encode.**
    
    ![17p235yq.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/17p235yq.jpg)
    
29. Under the Target columns, select the **Geography** and **Gender** check boxs**,** and then click on the **Apply** button.
    
    ![lltyopbu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lltyopbu.jpg)
    
30. In df(Data Wrangler) pane, select the **+Add code to notebook.**
    
    ![njq65uvg.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/njq65uvg.jpg)
    
31. Code generated by Data Wrangler, Select the **df_copy()** data and replace with **df_clean.copy** ().
    
32. Select the code cell and click on the **play** button to execute cell.
    
    ![9322627s.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9322627s.jpg)
    
    ![98yt7p5r.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/98yt7p5r.jpg)
    
33. Create a delta table for the cleaned data, select the code cell and click on the **play** button to execute cell.
    
    ![yg5pwovz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yg5pwovz.jpg)
    

## **Task 7: Train and register a machine learning model**

1. Now, click on **FabricData_Sciencelakehouse** on the left-sided navigation pane
    
    ![7ggm5k26.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7ggm5k26.jpg)
    
2. In the Fabric **Data_Sciencelakehouse** page, select **Open notebook** > **Existing notebook** from the top navigation menu.
    
    ![7e27zr4n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/7e27zr4n.jpg)
    
3. From the list of **Open existing notebook**, select the **3-train-evaluate** notebook and select **Open**.
    
    ![vs4hkoei.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vs4hkoei.jpg)
    
4. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![velwzz57.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/velwzz57.jpg)
    
5. For this task, you'll install imbalanced-learn (imported as imblearn) using %pip install. Imbalanced-learn is a library for Synthetic Minority Oversampling Technique (SMOTE) which is used when dealing with imbalanced datasets. The PySpark kernel will be restarted after %pip install, so you\'ll need to install the library before you run any other cells.
    
6. Select the code cell and click on the play button to execute cell.
    
    ![75mm01oc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/75mm01oc.jpg)
    
7. Prior to training any machine learning model, you need to load the delta table from the lakehouse in order to read the cleaned data you created in the previous notebook. Select the code cell and click on the play button to execute cell.
    
    ![9w95rtoa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9w95rtoa.jpg)
    
8. Demonstrates how to generate an experiment, specify the machine learning model and training parameters as well as scoring metrics, train the machine learning models, log them, and save the trained models for later use.
    
9. Select the code cell and click on the play button to execute cell.
    
    ![10mwicv1.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/10mwicv1.jpg)
    
10. All the experiments with their respective names are logged and you'll be able to track their parameters and performance metrics.
    
11. Select the code cell and click on the play button to execute cell.
    
    ![yiwrc4zf.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yiwrc4zf.jpg)
    
12. With your data in place, you can now define the machine learning models. You'll apply Random Forrest and LightGBM models in this notebook. Use scikit-learn and lightgbm to implement the models within a few lines of code.
    
13. Select the code cell and click on the play button to execute cell.
    
    ![5zdcnu1i.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/5zdcnu1i.jpg)
    
14. Use the train_test_split function from scikit-learn to split the data into training, validation, and test sets. Select the code cell and click on the play button to execute cell.
    
    ![gcj20sxr.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/gcj20sxr.jpg)
    
15. Save the test data to the delta table for use in the next notebook. Select the code cell and click on the play button to execute cell.
    
    ![i8jh0car.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/i8jh0car.jpg)
    
16. The data exploration in part 2 showed that out of the 10,000 data points corresponding to 10,000 customers, only 2,037 customers (around 20%) have left the bank. This indicates that the dataset is highly imbalanced. The problem with imbalanced classification is that there are too few examples of the minority class for a model to effectively learn the decision boundary. SMOTE is the most widely used approach to synthesize new samples for the minority class.
    
17. Select the code cell and click on the play button to execute cell.
    
    ![v0llqfes.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/v0llqfes.jpg)
    
18. Train the model using Random Forest with maximum depth of 4 and 4 features. Select the code cell and click on the play button to execute cell.
    
    ![huybcg5g.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/huybcg5g.jpg)
    
19. Train the model using Random Forest with maximum depth of 8 and 6 features. Select the code cell and click on the play button to execute cell.
    
    ![61g8tjaa.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/61g8tjaa.jpg)
    
20. Train the model using LightGBM. Select the code cell and click on the play button to execute cell.
    
    ![1fkpynpu.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/1fkpynpu.jpg)
    
21. The experiment runs are automatically saved in the experiment artifact that can be found from the workspace. They\'re named based on the name used for setting the experiment. All of the trained machine learning models, their runs, performance metrics, and model parameters are logged.
    
22. Now, click on **Data_ScienceXX** workspace on the left-sided navigation pane.
    
    ![8edaky2r.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8edaky2r.jpg)
    
23. Find and select the experiment name, in this case **_bank-churn-experiment_**. If you don't see the experiment in your workspace, refresh your browser.
    
    ![n87bhb35.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/n87bhb35.jpg)
    
    ![htjz0js4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/htjz0js4.jpg)
    
24. Now, click on **Data_ScienceXX** workspace on the left-sided navigation pane.
    
    ![3d2weukc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3d2weukc.jpg)
    
25. On the Data-ScienceXX workspace homepage, select the **3-train-evaluate** notebook.
    
    ![9i0wd378.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/9i0wd378.jpg)
    
26. Open the saved experiment from the workspace, load the machine learning models, and then assess the performance of the loaded models on the validation dataset. Select the code cell and click on the play button to execute cell.
    
    ![4675p160.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/4675p160.jpg)
    
27. Directly assess the performance of the trained machine learning models on the validation dataset. Select the code cell and click on the play button to execute cell.
    
    ![j1axwr48.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/j1axwr48.jpg)
    
28. Next, develop a script to plot the confusion matrix in order to evaluate the accuracy of the classification using the validation dataset. The confusion matrix can be plotted using SynapseML tools as well, Select the code cell and click on the play button to execute cell.
    
    ![hz08pg7n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/hz08pg7n.jpg)
    
    ![vn6wv29e.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/vn6wv29e.jpg)
    
29. Confusion Matrix for Random Forest Classifier with maximum depth of 4 and 4 features. Select the code cell and click on the play button to execute cell.
    
    ![8a0x09wt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/8a0x09wt.jpg)
    
30. Confusion Matrix for Random Forest Classifier with maximum depth of 8 and 6 features. Select the code cell and click on the play button to execute cell.
    
    ![crs2gqo5.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/crs2gqo5.jpg)
    
31. Confusion Matrix for LightGBM. Select the code cell and click on the play button to execute cell.
    
    ![zx3t0zq7.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/zx3t0zq7.jpg)
    

## **Task 8: Perform batch scoring and save predictions to a lakehouse**

In this task, you'll learn to import the registered LightGBMClassifier model that was trained in part 3 using the Microsoft Fabric MLflow model registry, and perform batch predictions on a test dataset loaded from a lakehouse.

Microsoft Fabric allows you to operationalize machine learning models with a scalable function called PREDICT, which supports batch scoring in any compute engine. You can generate batch predictions directly from a Microsoft Fabric notebook or from a given model's item page. Learn about [PREDICT](https://aka.ms/fabric-predict).

To generate batch predictions on the test dataset, you'll use version 1 of the trained LightGBM model that demonstrated the best performance among all trained machine learning models. You\'ll load the test dataset into a spark DataFrame and create an MLFlowTransformer object to generate batch predictions. You can then invoke the PREDICT function using one of following three ways:

- Transformer API from SynapseML
    
- Spark SQL API
    
- PySpark user-defined function (UDF)
    

1. Now, click on **FabricData_Sciencelakehouse** on the left-sided navigation pane
    
    ![55e0knir.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/55e0knir.jpg)
    
2. In the Fabric **Data_Sciencelakehouse** page, select **Open notebook** > **Existing notebook** from the top navigation menu.
    
    ![cqxarxoc.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/cqxarxoc.jpg)
    
3. From the list of **Open existing notebook**, select the **4-predict** notebook and select **Open**.
    
    ![wlllebnz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/wlllebnz.jpg)
    
4. If the imported notebook includes output, select the **Edit** menu, then select **Clear all outputs**.
    
    ![3ywixs3k.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/3ywixs3k.jpg)
    
    ![g4lpq815.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/g4lpq815.jpg)
    
5. Load the test data that you saved in **Task 7**. Select the code cell and click on the play button to execute cell.
    
    ![uogyz08t.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/uogyz08t.jpg)
    
6. The MLFlowTransformer object is a wrapper around the MLFlow model that you registered in Part 3. It allows you to generate batch predictions on a given DataFrame. To instantiate the MLFlowTransformer object, you'll need to provide the following parameters:
    
    - The columns from the test DataFrame that you need as input to the model (in this case, you would need all of them).
        
    - A name for the new output column (in this case, predictions).
        
    - The correct model name and model version to generate the predictions (in this case, lgbm_sm and version 1).
        
7. Select the code cell and click on the play button to execute cell.
    
    ![lwy2vpfy.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/lwy2vpfy.jpg)
    
8. Now that you have the MLFlowTransformer object, you can use it to generate batch predictions. Select the code cell and click on the play button to execute cell.
    
    ![yugork82.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/yugork82.jpg)
    
9. The code invokes the PREDICT function with the Spark SQL API. Select the code cell and click on the play button to execute cell.
    
    ![czb37h37.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/czb37h37.jpg)
    
10. The code invokes the PREDICT function with a PySpark UDF. Select the code cell and click on the play button to execute cell.
    
    ![6lc2i4jw.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6lc2i4jw.jpg)
    
11. Once you have generated batch predictions, write the model prediction results back to the lakehouse. Select the code cell and click on the play button to execute cell.
    
    ![il8f37h4.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/il8f37h4.jpg)
    

## **Task 9: Visualize predictions with a Power BI report**

1. Now, click on **FabricData_Sciencelakehouse** on the left-sided navigation pane
    
    ![5kg81pf1.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/5kg81pf1.jpg)
    
2. Select **New semantic model** on the top ribbon.
    
    ![6bzemn7n.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/6bzemn7n.jpg)
    
3. In the **New dataset** box, enter the dataset a name, such as **`bank churn predictions`** .Then select the **customer_churn_test_predictions** dataset and select **Confirm**.
    
    ![me5fnqxx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/me5fnqxx.jpg)
    
4. Add a new measure for the churn rate.
    
    - Select **New measure** in the top ribbon. This action adds a new item named **Measure** to the **customer_churn_test_predictions** dataset, and opens a formula bar above the table.
        
        ![ooy6h0hp.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/ooy6h0hp.jpg)
        
    - To determine the average predicted churn rate, replace Measure = in the formula bar with:
        
        ```
        Churn Rate = AVERAGE(customer_churn_test_predictions[predictions])
        ```
        
        ![0iz828li.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/0iz828li.jpg)
        
    - To apply the formula, select the **check mark** in the formula bar. The new measure appears in the data table. The calculator icon shows it was created as a measure.
        
        ![znaezvqt.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/znaezvqt.jpg)
        
    - Change the format from **General** to **Percentage** in the **Properties** panel.
        
    - Scroll down in the **Properties** panel to change the **Decimal places** to 1.
        
        ![dorpvsmz.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/dorpvsmz.jpg)
        
5. Add a new measure that counts the total number of bank customers. You'll need it for the rest of the new measures.
    
    - Select **New measure** in the top ribbon to add a new item named **Measure** to the customer_churn_test_predictions dataset. This action also opens a formula bar above the table.
        
        ![xs6758xx.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/xs6758xx.jpg)
        
    - Each prediction represents one customer. To determine the total number of customers, replace Measure = in the formula bar with:
        
        ```
        Customers = COUNT(customer_churn_test_predictions[predictions])
        ```
        
        ![n3hum8ys.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/n3hum8ys.jpg)
        
    - Select the **check mark** in the formula bar to apply the formula.
        
        ![caanueuo.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/caanueuo.jpg)
        
6. Add the churn rate for Germany.
    
    - Select **New measure** in the top ribbon to add a new item named **Measure** to the customer_churn_test_predictions dataset. This action also opens a formula bar above the table.
        
        ![mowrpw19.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/mowrpw19.jpg)
        
    - To determine the churn rate for Germany, replace Measure = in the formula bar with:
        
        ```
        Germany Churn = CALCULATE(customer_churn_test_predictions[Churn Rate], customer_churn_test_predictions[Geography_Germany] = 1)
        ```
        
        ![pv41wmro.jpg](https://labondemand.blob.core.windows.net/content/lab149562/instructions240859/pv41wmro.jpg)