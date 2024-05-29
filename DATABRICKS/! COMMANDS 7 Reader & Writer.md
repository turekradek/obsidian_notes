# Reader & Writer

##### Objectives

1. Read from CSV files
2. Read from JSON files
3. Write DataFrame to files
4. Write DataFrame to tables
5. Write DataFrame to a Delta table

##### Methods

- [DataFrameReader](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql.html#input-and-output): **`csv`**, **`json`**, **`option`**, **`schema`**
- [DataFrameWriter](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql.html#input-and-output): **`mode`**, **`option`**, **`parquet`**, **`format`**, **`saveAsTable`**
- [StructType](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.types.StructType.html#pyspark.sql.types.StructType): **`toDDL`**

##### Spark Types

- [Types](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql.html#data-types): **`ArrayType`**, **`DoubleType`**, **`IntegerType`**, **`LongType`**, **`StringType`**, **`StructType`**, **`StructField`**

## FrameReader

Interface used to load a DataFrame from external storage systems

**`spark.read.parquet("path/to/files")`**

DataFrameReader is accessible through the SparkSession attribute **`read`**. This class includes methods to load DataFrames from different external storage systems.

### Read from CSV files

Read from CSV with the DataFrameReader's **`csv`** method and the following options:

Tab separator, use first line as header, infer schema

```python
users_df = (spark
           .read
           .option("sep", "\t")
           .option("header", True)
           .option("inferSchema", True)
           .csv(DA.paths.users_csv)
          )

users_df.printSchema()
```

Spark's Python API also allows you to specify the DataFrameReader options as parameters to the **`csv`** method
```python
users_df = (spark

           .read

           .csv(DA.paths.users_csv, sep="\t", header=True, inferSchema=True)

          )
```

Manually define the schema by creating a **`StructType`** with column names and data types
```python
from pyspark.sql.types import LongType, StringType, StructType, StructField

user_defined_schema = StructType([

    StructField("user_id", StringType(), True),

    StructField("user_first_touch_timestamp", LongType(), True),

    StructField("email", StringType(), True)

])
```

Read from CSV using this user-defined schema instead of inferring the schema
```python
users_df = (spark

           .read

           .option("sep", "\t")

           .option("header", True)

           .schema(user_defined_schema)

           .csv(DA.paths.users_csv)

          )
```

Read data faster by creating a **`StructType`** with the schema names and data types
```python
from pyspark.sql.types import ArrayType, DoubleType, IntegerType, LongType, StringType, StructType, StructField

  

user_defined_schema = StructType([

    StructField("device", StringType(), True),

    StructField("ecommerce", StructType([

        StructField("purchaseRevenue", DoubleType(), True),

        StructField("total_item_quantity", LongType(), True),

        StructField("unique_items", LongType(), True)

    ]), True),

    StructField("event_name", StringType(), True),

    StructField("event_previous_timestamp", LongType(), True),

    StructField("event_timestamp", LongType(), True),

    StructField("geo", StructType([

        StructField("city", StringType(), True),

        StructField("state", StringType(), True)

    ]), True),

    StructField("items", ArrayType(

        StructType([

            StructField("coupon", StringType(), True),

            StructField("item_id", StringType(), True),

            StructField("item_name", StringType(), True),

            StructField("item_revenue_in_usd", DoubleType(), True),

            StructField("price_in_usd", DoubleType(), True),

            StructField("quantity", LongType(), True)

        ])

    ), True),

    StructField("traffic_source", StringType(), True),

    StructField("user_first_touch_timestamp", LongType(), True),

    StructField("user_id", StringType(), True)

])

events_df = (spark

            .read

            .schema(user_defined_schema)

            .json(DA.paths.events_json)

           )
```

## DataFrameWriter

Interface used to write a DataFrame to external storage systems

**`(df     .write     .option("compression", "snappy")     .mode("overwrite")     .parquet(output_dir)   )`**

DataFrameWriter is accessible through the SparkSession attribute **`write`**. This class includes methods to write DataFrames to different external storage systems.

### Write

DataFrames to files

Write **`users_df`** to parquet with DataFrameWriter's **`parquet`** method and the following configurations:

Snappy compression, overwrite mode

users_output_dir = DA.paths.working_dir + "/users.parquet"

  

(users_df

 .write

 .option("compression", "snappy")

 .mode("overwrite")

 .parquet(users_output_dir)

)

### Write DataFrames to tables

Write **`events_df`** to a table using the DataFrameWriter method **`saveAsTable`**

![Note](https://files.training.databricks.com/images/icon_note_32.png) This creates a global table, unlike the local view created by the DataFrame method **`createOrReplaceTempView`**

events_df.write.mode("overwrite").saveAsTable("events")

### Write Results to a Delta Table

Write **`events_df`** with the DataFrameWriter's **`save`** method and the following configurations: Delta format & overwrite mode.

