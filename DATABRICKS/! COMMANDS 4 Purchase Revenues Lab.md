

# Purchase Revenues Lab

Prepare dataset of events with purchase revenue.

##### Tasks

1. Extract purchase revenue for each event
2. Filter events where revenue is not null
3. Check what types of events have revenue
4. Drop unneeded column

##### Methods

- DataFrame: **`select`**, **`drop`**, **`withColumn`**, **`filter`**, **`dropDuplicates`**
- Column: **`isNotNull`**
```python
from pyspark.sql.functions import col

expected1 = [4351.5, 4044.0, 3985.0, 3946.5, 3885.0, 3590.0, 3490.0, 3451.5, 3406.5, 3385.0]

result1 = [row.revenue for row in revenue_df.sort(col("revenue").desc_nulls_last()).limit(10).collect()]

print(result1)

assert(expected1 == result1)

print("All test pass")
```

