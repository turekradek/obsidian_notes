
# Spark SQL

Demonstrate fundamental concepts in Spark SQL using the DataFrame API.

##### Objectives

1. Run a SQL query
2. Create a DataFrame from a table
3. Write the same query using DataFrame transformations
4. Trigger computation with DataFrame actions
5. Convert between DataFrames and SQL

##### Methods

- [SparkSession](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/spark_session.html): **`sql`**, **`table`**
- [DataFrame](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/dataframe.html):
    - Transformations: **`select`**, **`where`**, **`orderBy`**
    - Actions: **`show`**, **`count`**, **`take`**
    - Other methods: **`printSchema`**, **`schema`**, **`createOrReplaceTempView`**  


## DataFrame Transformation Methods

|Method|Description|
|---|---|
|**`select`**|Returns a new DataFrame by computing given expression for each element|
|**`drop`**|Returns a new DataFrame with a column dropped|
|**`withColumnRenamed`**|Returns a new DataFrame with a column renamed|
|**`withColumn`**|Returns a new DataFrame by adding a column or replacing the existing column that has the same name|
|**`filter`**, **`where`**|Filters rows using the given condition|
|**`sort`**, **`orderBy`**|Returns a new DataFrame sorted by the given expressions|
|**`dropDuplicates`**, **`distinct`**|Returns a new DataFrame with duplicate rows removed|
|**`limit`**|Returns a new DataFrame by taking the first n rows|
|**`groupBy`**|Groups the DataFrame using the specified columns, so we can run aggregation on them|

