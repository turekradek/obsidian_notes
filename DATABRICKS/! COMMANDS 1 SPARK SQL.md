> df_products = spark.table("dbfs:/mnt/dbacademy-datasets/data-engineer-learning-path/v02/ecommerc/products")

>display(df_products)
> df_products.write.csv('./products')

```python
display(spark
        .table("products")
        .select("name", "price")
        .where("price < 200")
        .orderBy("price")
       )
```

> products_df = spark.table("products")

Below are several additional methods we can use to create DataFrames. All of these can be found in the [documentation](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.SparkSession.html) for **`SparkSession`**.

#### **`SparkSession`** Methods

|Method|Description|
|---|---|
|sql|Returns a DataFrame representing the result of the given query|
|table|Returns the specified table as a DataFrame|
|read|Returns a DataFrameReader that can be used to read data in as a DataFrame|
|range|Create a DataFrame with a column containing elements in a range from start to end (exclusive) with step value and number of partitions|
|createDataFrame|Creates a DataFrame from a list of tuples, primarily used for testing|
```python
result_df = spark.sql("""

SELECT name, price

FROM products

WHERE price < 200

ORDER BY price

""") 

display(result_df)
```

```python
(products_df

  .select("name", "price")

  .where("price < 200")

  .orderBy("price"))
```

## Convert between DataFrames and SQL
**`createOrReplaceTempView`** creates a temporary view based on the DataFrame. The lifetime of the temporary view is tied to the SparkSession that was used to create the DataFrame.
```python
display(spark.sql("SELECT * FROM budget"))
```
