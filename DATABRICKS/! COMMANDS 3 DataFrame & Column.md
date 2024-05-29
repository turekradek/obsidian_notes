# DataFrame & Column

##### Objectives

1. Construct columns
2. Subset columns
3. Add or replace columns
4. Subset rows
5. Sort rows

##### Methods

- [DataFrame](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/dataframe.html): **`select`**, **`selectExpr`**, **`drop`**, **`withColumn`**, **`withColumnRenamed`**, **`filter`**, **`distinct`**, **`limit`**, **`sort`**
- [Column](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/column.html): **`alias`**, **`isin`**, **`cast`**, **`isNotNull`**, **`desc`**, operators

```python
events_df = spark.table("events")

display(events_df)
```

```python
from pyspark.sql.functions import col

  

print(events_df.device)

print(events_df["device"])

print(col("device"))
```

```python
rev_df = (events_df

         .filter(col("ecommerce.purchase_revenue_in_usd").isNotNull())

         .withColumn("purchase_revenue", (col("ecommerce.purchase_revenue_in_usd") * 100).cast("int"))

         .withColumn("avg_purchase_revenue", col("ecommerce.purchase_revenue_in_usd") / col("ecommerce.total_item_quantity"))

         .sort(col("avg_purchase_revenue").desc())

        )

display(rev_df)
```

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
#### **`select()`**

Selects a list of columns or column based expressions
```python
from pyspark.sql.functions import col

  

locations_df = events_df.select(

    "user_id",

    col("geo.city").alias("city"),

    col("geo.state").alias("state")

)

display(locations_df)
```

#### **`selectExpr()`**

Selects a list of SQL expressions
```python
apple_df = events_df.selectExpr("user_id", "device in ('macOS', 'iOS') as apple_user")

display(apple_df)
```

#### **`   drop()`**

Returns a new DataFrame after dropping the given column, specified as a string or Column object

Use strings to specify multiple columns

```python
anonymous_df = events_df.drop("user_id", "geo", "device")

display(anonymous_df)

no_sales_df = events_df.drop(col("ecommerce"))

display(no_sales_df)
```

### Add or replace columns

Use DataFrame transformations to add or replace columns

[Cmd 26](https://community.cloud.databricks.com/?o=2908899293976106#notebook/805599106422956/command/805599106422982)

[Markdown](https://community.cloud.databricks.com/?o=2908899293976106#)[](https://community.cloud.databricks.com/?o=2908899293976106# "Show in Dashboard Menu")[](https://community.cloud.databricks.com/?o=2908899293976106# "Edit Menu")[](https://community.cloud.databricks.com/?o=2908899293976106# "Minimize")[](https://community.cloud.databricks.com/?o=2908899293976106# "Delete")

#### **`withColumn()`**

Returns a new DataFrame by adding a column or replacing an existing column that has the same name.

```python
mobile_df = events_df.withColumn("mobile", col("device").isin("iOS", "Android"))

display(mobile_df)

purchase_quantity_df = events_df.withColumn("purchase_quantity", col("ecommerce.total_item_quantity").cast("int"))

purchase_quantity_df.printSchema()
```
#### **`withColumnRenamed()`**

Returns a new DataFrame with a column renamed.
```python
location_df = events_df.withColumnRenamed("geo", "location")

display(location_df)
```

### Subset Rows

Use DataFrame transformations to subset rows

[Cmd 32](https://community.cloud.databricks.com/?o=2908899293976106#notebook/805599106422956/command/805599106422988)

[Markdown](https://community.cloud.databricks.com/?o=2908899293976106#)[](https://community.cloud.databricks.com/?o=2908899293976106# "Show in Dashboard Menu")[](https://community.cloud.databricks.com/?o=2908899293976106# "Edit Menu")[](https://community.cloud.databricks.com/?o=2908899293976106# "Minimize")[](https://community.cloud.databricks.com/?o=2908899293976106# "Delete")

#### **`filter()`**

Filters rows using the given SQL expression or column based condition.

##### Alias: **`where`**
```python
purchases_df = events_df.filter("ecommerce.total_item_quantity > 0")

display(purchases_df)
revenue_df = events_df.filter(col("ecommerce.purchase_revenue_in_usd").isNotNull())

display(revenue_df)
android_df = events_df.filter((col("traffic_source") != "direct") & (col("device") == "Android"))

display(android_df)
```

#### **`dropDuplicates()`**

Returns a new DataFrame with duplicate rows removed, optionally considering only a subset of columns.

##### Alias: **`distinct`**

```python
distinct_users_df = events_df.dropDuplicates(["user_id"])
```
#### **`limit()`**

Returns a new DataFrame by taking the first n rows.

```python
limit_df = events_df.limit(100)
```

#### **`sort()`**

Returns a new DataFrame sorted by the given columns or expressions.

##### Alias: **`orderBy`**

```python
increase_timestamps_df = events_df.sort("event_timestamp")
decrease_timestamp_df = events_df.sort(col("event_timestamp").desc())
increase_sessions_df = events_df.orderBy(["user_first_touch_timestamp", "event_timestamp"])
decrease_sessions_df = events_df.sort(col("user_first_touch_timestamp").desc(), col("event_timestamp"))

```