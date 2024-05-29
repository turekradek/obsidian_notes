#   
Complex Types

Explore built-in functions for working with collections and strings.

##### Objectives

1. Apply collection functions to process arrays
2. Union DataFrames together

##### Methods

- [DataFrame](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/dataframe.html):**`union`**, **`unionByName`**
- [Built-In Functions](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/functions.html):
    - Aggregate: **`collect_set`**
    - Collection: **`array_contains`**, **`element_at`**, **`explode`**
    - String: **`split`**

```python
# You will need this DataFrame for a later exercise

details_df = (df

              .withColumn("items", explode("items"))

              .select("email", "items.item_name")

              .withColumn("details", split(col("item_name"), " "))

             )
```

### String Functions

Here are some of the built-in functions available for manipulating strings.

|Method|Description|
|---|---|
|translate|Translate any character in the src by a character in replaceString|
|regexp_replace|Replace all substrings of the specified string value that match regexp with rep|
|regexp_extract|Extract a specific group matched by a Java regex, from the specified string column|
|ltrim|Removes the leading space characters from the specified string column|
|lower|Converts a string column to lowercase|
|split|Splits str around matches of the given pattern|
```python
from pyspark.sql.functions import split
display(df.select(split(df.email, '@', 0).alias('email_handle')))
```

### Collection Functions

Here are some of the built-in functions available for working with arrays.

| Method         | Description                                                                               |
| -------------- | ----------------------------------------------------------------------------------------- |
| array_contains | Returns null if the array is null, true if the array contains value, and false otherwise. |
| element_at     | Returns element of array at given index. Array elements are numbered starting with **1**. |
| explode        | Creates a new row for each element in the given array or map column.                      |
| collect_set    | Returns a set of objects with duplicate elements eliminated.                              |
|                |                                                                                           |
```python
mattress_df = (details_df

               .filter(array_contains(col("details"), "Mattress"))

               .withColumn("size", element_at(col("details"), 2)))

display(mattress_df)
```

### Aggregate Functions

Here are some of the built-in aggregate functions available for creating arrays, typically from GroupedData.

|Method|Description|
|---|---|
|collect_list|Returns an array consisting of all values within the group.|
|collect_set|Returns an array consisting of all unique values within the group.|
```python
size_df = mattress_df.groupBy("email").agg(collect_set("size").alias("size options"))
```

## Union and unionByName

![Warning](https://files.training.databricks.com/images/icon_warn_32.png) The DataFrame [**`union`**](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.union.html) method resolves columns by position, as in standard SQL. You should use it only if the two DataFrames have exactly the same schema, including the column order. In contrast, the DataFrame [**`unionByName`**](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.unionByName.html) method resolves columns by name. This is equivalent to UNION ALL in SQL. Neither one will remove duplicates.

Below is a check to see if the two dataframes have a matching schema where **`union`** would be appropriate

```python
union_count = mattress_df.select("email").union(size_df.select("email")).count()

  

mattress_count = mattress_df.count()

size_count = size_df.count()

  

mattress_count + size_count == union_count
```