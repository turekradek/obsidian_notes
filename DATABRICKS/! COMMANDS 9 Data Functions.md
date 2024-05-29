# Datetime Functions

##### Objectives

1. Cast to timestamp
2. Format datetimes
3. Extract from timestamp
4. Convert to date
5. Manipulate datetimes

##### Methods

- [Column](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/column.html): **`cast`**
- [Built-In Functions](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/functions.html#datetime-functions): **`date_format`**, **`to_date`**, **`date_add`**, **`year`**, **`month`**, **`dayofweek`**, **`minute`**, **`second`**

```python
from pyspark.sql.functions import col

  

df = spark.table("events").select("user_id", col("event_timestamp").alias("timestamp"))
```

### Built-In Functions: Date Time Functions

Here are a few built-in functions to manipulate dates and times in Spark.

|Method|Description|
|---|---|
|**`add_months`**|Returns the date that is numMonths after startDate|
|**`current_timestamp`**|Returns the current timestamp at the start of query evaluation as a timestamp column|
|**`date_format`**|Converts a date/timestamp/string to a value of string in the format specified by the date format given by the second argument.|
|**`dayofweek`**|Extracts the day of the month as an integer from a given date/timestamp/string|
|**`from_unixtime`**|Converts the number of seconds from unix epoch (1970-01-01 00:00:00 UTC) to a string representing the timestamp of that moment in the current system time zone in the yyyy-MM-dd HH:mm:ss format|
|**`minute`**|Extracts the minutes as an integer from a given date/timestamp/string.|
|**`unix_timestamp`**|Converts time string with given pattern to Unix timestamp (in seconds)|

### Cast to Timestamp

#### **`cast()`**

Casts column to a different data type, specified using string representation or DataType.


```python
timestamp_df = df.withColumn("timestamp", (col("timestamp") / 1e6).cast("timestamp"))

from pyspark.sql.types import TimestampType

timestamp_df = df.withColumn("timestamp", (col("timestamp") / 1e6).cast(TimestampType()))
```

### Datetimes

There are several common scenarios for datetime usage in Spark:

- CSV/JSON datasources use the pattern string for parsing and formatting datetime content.
- Datetime functions related to convert StringType to/from DateType or TimestampType e.g. **`unix_timestamp`**, **`date_format`**, **`from_unixtime`**, **`to_date`**, **`to_timestamp`**, etc.

#### Datetime Patterns for Formatting and Parsing

Spark uses [pattern letters for date and timestamp parsing and formatting](https://spark.apache.org/docs/latest/sql-ref-datetime-pattern.html). A subset of these patterns are shown below.

|Symbol|Meaning|Presentation|Examples|
|---|---|---|---|
|G|era|text|AD; Anno Domini|
|y|year|year|2020; 20|
|D|day-of-year|number(3)|189|
|M/L|month-of-year|month|7; 07; Jul; July|
|d|day-of-month|number(3)|28|
|Q/q|quarter-of-year|number/text|3; 03; Q3; 3rd quarter|
|E|day-of-week|text|Tue; Tuesday|



#### Format date

#### **`date_format()`**

Converts a date/timestamp/string to a string formatted with the given date time pattern.

```python
from pyspark.sql.functions import date_format

  

formatted_df = (timestamp_df

                .withColumn("date string", date_format("timestamp", "MMMM dd, yyyy"))

                .withColumn("time string", date_format("timestamp", "HH:mm:ss.SSSSSS"))

               )

display(formatted_df)
```

#### Extract datetime attribute from timestamp

#### **`year`**

Extracts the year as an integer from a given date/timestamp/string.

##### Similar methods: **`month`**, **`dayofweek`**, **`minute`**, **`second`**, etc.
```python
#### Extract datetime attribute from timestamp

#### **`year`**

Extracts the year as an integer from a given date/timestamp/string.

##### Similar methods: **`month`**, **`dayofweek`**, **`minute`**, **`second`**, etc.
```

#### Convert to Date

#### **`to_date`**

Converts the column into DateType by casting rules to DateType.

```python
from pyspark.sql.functions import to_date

date_df = timestamp_df.withColumn("date", to_date(col("timestamp")))
```

### Manipulate Datetimes

#### **`date_add`**

Returns the date that is the given number of days after start

```python
from pyspark.sql.functions import date_add

plus_2_df = timestamp_df.withColumn("plus_two_days", date_add(col("timestamp"), 2))
```