# Explore Azure Databricks

Azure Databricks is a Microsoft Azure-based version of the popular open-source Databricks platform.

Similarly to Azure Synapse Analytics, an Azure Databricks _workspace_ provides a central point for managing Databricks clusters, data, and resources on Azure.

This exercise should take approximately **30** minutes to complete.

## Provision an Azure Databricks workspace

> **Tip**: If you already have an Azure Databricks workspace, you can skip this procedure and use your existing workspace.

This exercise includes a script to provision a new Azure Databricks workspace. The script attempts to create a _Premium_ tier Azure Databricks workspace resource in a region in which your Azure subscription has sufficient quota for the compute cores required in this exercise; and assumes your user account has sufficient permissions in the subscription to create an Azure Databricks workspace resource. If the script fails due to insufficient quota or permissions, you can try to [create an Azure Databricks workspace interactively in the Azure portal](https://learn.microsoft.com/azure/databricks/getting-started/#--create-an-azure-databricks-workspace).

1. In a web browser, sign into the [Azure portal](https://portal.azure.com/) at `https://portal.azure.com`.
2. Use the **[>_]** button to the right of the search bar at the top of the page to create a new Cloud Shell in the Azure portal, selecting a **_PowerShell_** environment and creating storage if prompted. The cloud shell provides a command line interface in a pane at the bottom of the Azure portal, as shown here:
    
    [![Azure portal with a cloud shell pane](https://microsoftlearning.github.io/mslearn-databricks/Instructions/Exercises/images/cloud-shell.png)](https://microsoftlearning.github.io/mslearn-databricks/Instructions/Exercises/images/cloud-shell.png)
    
    > **Note**: If you have previously created a cloud shell that uses a _Bash_ environment, use the the drop-down menu at the top left of the cloud shell pane to change it to **_PowerShell_**.
    
3. Note that you can resize the cloud shell by dragging the separator bar at the top of the pane, or by using the **—**, **◻**, and **X** icons at the top right of the pane to minimize, maximize, and close the pane. For more information about using the Azure Cloud Shell, see the [Azure Cloud Shell documentation](https://docs.microsoft.com/azure/cloud-shell/overview).
    
4. In the PowerShell pane, enter the following commands to clone this repo:
    
    CodeCopy
    
    ```
     rm -r mslearn-databricks -f
     git clone https://github.com/MicrosoftLearning/mslearn-databricks
    ```
    
5. After the repo has been cloned, enter the following command to run the **setup.ps1** script, which provisions an Azure Databricks workspace in an available region:
    
    CodeCopy
    
    ```
     ./mslearn-databricks/setup.ps1
    ```
    
6. If prompted, choose which subscription you want to use (this will only happen if you have access to multiple Azure subscriptions).
7. Wait for the script to complete - this typically takes around 5 minutes, but in some cases may take longer. While you are waiting, review the [What is Azure Databricks?](https://learn.microsoft.com/azure/databricks/introduction/) article in the Azure Databricks documentation.

## Create a cluster

Azure Databricks is a distributed processing platform that uses Apache Spark _clusters_ to process data in parallel on multiple nodes. Each cluster consists of a driver node to coordinate the work, and worker nodes to perform processing tasks. In this exercise, you’ll create a _single-node_ cluster to minimize the compute resources used in the lab environment (in which resources may be constrained). In a production environment, you’d typically create a cluster with multiple worker nodes.

> **Tip**: If you already have a cluster with a 13.3 LTS or higher runtime version in your Azure Databricks workspace, you can use it to complete this exercise and skip this procedure.

1. In the Azure portal, browse to the **msl-_xxxxxxx_** resource group that was created by the script (or the resource group containing your existing Azure Databricks workspace)
2. Select your Azure Databricks Service resource (named **databricks-_xxxxxxx_** if you used the setup script to create it).
3. In the **Overview** page for your workspace, use the **Launch Workspace** button to open your Azure Databricks workspace in a new browser tab; signing in if prompted.
    
    > **Tip**: As you use the Databricks Workspace portal, various tips and notifications may be displayed. Dismiss these and follow the instructions provided to complete the tasks in this exercise.
    
4. In the sidebar on the left, select the **(+) New** task, and then select **Cluster**.
5. In the **New Cluster** page, create a new cluster with the following settings:
    - **Cluster name**: _User Name’s_ cluster (the default cluster name)
    - **Policy**: Unrestricted
    - **Cluster mode**: Single Node
    - **Access mode**: Single user (_with your user account selected_)
    - **Databricks runtime version**: 13.3 LTS (Spark 3.4.1, Scala 2.12) or later
    - **Use Photon Acceleration**: Selected
    - **Node type**: Standard_DS3_v2
    - **Terminate after** _20_ **minutes of inactivity**
6. Wait for the cluster to be created. It may take a minute or two.

> **Note**: If your cluster fails to start, your subscription may have insufficient quota in the region where your Azure Databricks workspace is provisioned. See [CPU core limit prevents cluster creation](https://docs.microsoft.com/azure/databricks/kb/clusters/azure-core-limit) for details. If this happens, you can try deleting your workspace and creating a new one in a different region. You can specify a region as a parameter for the setup script like this: `./mslearn-databricks/setup.ps1 eastus`

## Use Spark to analyze data

As in many Spark environments, Databricks supports the use of notebooks to combine notes and interactive code cells that you can use to explore data.

1. Download the [**products.csv**](https://raw.githubusercontent.com/MicrosoftLearning/mslearn-databricks/main/data/products.csv) file from `https://raw.githubusercontent.com/MicrosoftLearning/mslearn-databricks/main/data/products.csv` to your local computer, saving it as **products.csv**.
2. 1. In the sidebar, in the **(+) New** link menu, select **File upload**.
3. Upload the **products.csv** file you downloaded to your computer.
4. In the **Create or modify table from file upload** page, ensure that your cluster is selected at the top right of the page. Then choose the **hive_metastore** catalog and its default schema to create a new table named **products**.
5. In the **catalog Explorer** page when the **products** page has been created, in the **Create** button menu, select **Notebook** to create a notebook.
6. In the notebook, ensure that the notebook is connected to your cluster and then review the code that has been automatically been added to the first cell; which should look similar to this:
    
    CodeCopy
    
    ```python
     %sql
     SELECT * FROM `hive_metastore`.`default`.`products`;
    ```
    
7. Use the **▸ Run Cell** menu option at the left of the cell to run it, starting and attaching the cluster if prompted.
8. Wait for the Spark job run by the code to complete. The code retrieves data from the table that was created based on the file you uploaded.
9. Above the table of results, select **+** and then select **Visualization** to view the visualization editor, and then apply the following options:
    
    - **Visualization type**: Bar
    - **X Column**: Category
    - **Y Column**: _Add a new column and select_ **ProductID**. _Apply the_ **Count** _aggregation_.
    
    Save the visualization and observe that it is displayed in the notebook, like this:
    
    [![A bar chart showing product counts by category](https://microsoftlearning.github.io/mslearn-databricks/Instructions/Exercises/images/databricks-chart.png)](https://microsoftlearning.github.io/mslearn-databricks/Instructions/Exercises/images/databricks-chart.png)
    

## Analyze data with a dataframe

While most data analysis are comfortable using SQL code as used in the previous example, some data analysts and data scientists can use native Spark objects such as a _dataframe_ in programming languages such as _PySpark_ (A Spark-optimized version of Python) to work efficiently with data.

1. In the notebook, under the chart output from the previously run code cell, use the **+** icon to add a new cell.
2. Enter and run the following code in the new cell:
    
    CodeCopy
    
    ```python
     df = spark.sql("SELECT * FROM products")
     df = df.filter("Category == 'Road Bikes'")
     display(df)
    ```
    
3. Run the new cell, which returns products in the _Road Bikes_ category.

## Clean up

In Azure Databricks portal, on the **Compute** page, select your cluster and select **■ Terminate** to shut it down.

If you’ve finished exploring Azure Databricks, you can delete the resources you’ve created to avoid unnecessary Azure costs and free up capacity in your subscription.