
# Aggregation

##### Objectives

1. Group data by specified columns
2. Apply grouped data methods to aggregate data
3. Apply built-in functions to aggregate data

##### Methods

- [DataFrame](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/dataframe.html): **`groupBy`**
- [Grouped Data](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/grouping.html): **`agg`**, **`avg`**, **`count`**, **`max`**, **`sum`**
- [Built-In Functions](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/functions.html): **`approx_count_distinct`**, **`avg`**, **`sum`**

### groupBy

Use the DataFrame **`groupBy`** method to create a grouped data object.

This grouped data object is called **`RelationalGroupedDataset`** in Scala and **`GroupedData`** in Python.

```python
df.groupBy("event_name")
df.groupBy("geo.state", "geo.city")
```

### Grouped data methods

Various aggregation methods are available on the [GroupedData](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/grouping.html) object.

| Method | Description                                                                     |
| ------ | ------------------------------------------------------------------------------- |
| agg    | Compute aggregates by specifying a series of aggregate columns                  |
| avg    | Compute the mean value for each numeric columns for each group                  |
| count  | Count the number of rows for each group                                         |
| max    | Compute the max value for each numeric columns for each group                   |
| mean   | Compute the average value for each numeric columns for each group               |
| min    | Compute the min value for each numeric column for each group                    |
| pivot  | Pivots a column of the current DataFrame and performs the specified aggregation |
| sum    | Compute the sum for each numeric columns for each group                         |
|        |                                                                                 |

```python
event_counts_df = df.groupBy("event_name").count()
avg_state_purchases_df = df.groupBy("geo.state").avg("ecommerce.purchase_revenue_in_usd")
city_purchase_quantities_df = df.groupBy("geo.state", "geo.city").sum("ecommerce.total_item_quantity", "ecommerce.purchase_revenue_in_usd")

```

###   
Aggregate Functions

Here are some of the built-in functions available for aggregation.

|Method|Description|
|---|---|
|approx_count_distinct|Returns the approximate number of distinct items in a group|
|avg|Returns the average of the values in a group|
|collect_list|Returns a list of objects with duplicates|
|corr|Returns the Pearson Correlation Coefficient for two columns|
|max|Compute the max value for each numeric columns for each group|
|mean|Compute the average value for each numeric columns for each group|
|stddev_samp|Returns the sample standard deviation of the expression in a group|
|sumDistinct|Returns the sum of distinct values in the expression|
|var_pop|Returns the population variance of the values in a group|

Use the grouped data method [**`agg`**](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.GroupedData.agg.html#pyspark.sql.GroupedData.agg) to apply built-in aggregate functions

This allows you to apply other transformations on the resulting columns, such as [**`alias`**](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.Column.alias.html).


```python
from pyspark.sql.functions import sum

  

state_purchases_df = df.groupBy("geo.state").agg(sum("ecommerce.total_item_quantity").alias("total_purchases"))

display(state_purchases_df)
```

```python
from pyspark.sql.functions import avg, approx_count_distinct

state_aggregates_df = (df
                       .groupBy("geo.state")
                       .agg(avg("ecommerce.total_item_quantity").alias("avg_quantity"),
                            approx_count_distinct("user_id").alias("distinct_users"))
                      )

display(state_aggregates_df)
```

### Math Functions

Here are some of the built-in functions for math operations.

|Method|Description|
|---|---|
|ceil|Computes the ceiling of the given column.|
|cos|Computes the cosine of the given value.|
|log|Computes the natural logarithm of the given value.|
|round|Returns the value of the column e rounded to 0 decimal places with HALF_UP round mode.|
|sqrt|Computes the square root of the specified float value.|

```python
from pyspark.sql.functions import cos, sqrt

  

display(spark.range(10)  # Create a DataFrame with a single column called "id" with a range of integer values

        .withColumn("sqrt", sqrt("id"))

        .withColumn("cos", cos("id"))

       )
```