```sql
CREATE OR REPLACE FUNCTION sale_announcement(item_name STRING, item_price INT)

RETURNS STRING

RETURN concat("The ", item_name, " is on sale for $", round(item_price * 0.8, 0));

  

SELECT *, sale_announcement(name, price) AS message FROM item_lookup
```

```sql
DESCRIBE FUNCTION EXTENDED sale_announcement
```

```sql
CREATE OR REPLACE FUNCTION item_preference(name STRING, price INT)

RETURNS STRING

RETURN CASE

  WHEN name = "Standard Queen Mattress" THEN "This is my default mattress"

  WHEN name = "Premium Queen Mattress" THEN "This is my favorite mattress"

  WHEN price > 100 THEN concat("I'd wait until the ", name, " is on sale for $", round(price * 0.8, 0))

  ELSE concat("I don't need a ", name)

END;

  

SELECT *, item_preference(name, price) FROM item_lookup
```

```python
sales_df = spark.table("sales")

display(sales_df)


def first_letter_function(email):

    return email[0]

first_letter_function("annagray@kaufman.com")

# registration for function udf( FUNCTION NAME )
first_letter_udf = udf(first_letter_function)

display(first_letter_function("annagray@kaufman.com"))


from pyspark.sql.functions import col

display( sales_df.select( first_letter_udf( col("email") ) ) )
```

# register udf to use in sql 
```sql
sales-df.createOrderReplaceTempView("sales")
first_letter_udf = spark.udf.register("sql_udf", first_letter-funtion)

-- you can still apply the UDF from Python
display(sales_df.select(first_letter(udf(col("email")))
-- you can now also apply the UDF from SQL
select sql_udf(email) as first_letter from sales 
```

# Use Decorator Syntax (Python Only)
```python
# Our input/output is a string

@udf("string")

def first_letter_udf(email: str) -> str:

    return email[0]


from pyspark.sql.functions import col

sales_df = spark.table("sales")

display(sales_df.select(first_letter_udf(col("email"))))
```

```python
import pandas as pd

from pyspark.sql.functions import pandas_udf

  

# We have a string input/output

@pandas_udf("string")

def vectorized_udf(email: pd.Series) -> pd.Series:

    return email.str[0]

  
# Alternatively

 def vectorized_udf(email: pd.Series) -> pd.Series:

    return email.str[0]

 vectorized_udf = pandas_udf(vectorized_udf, "string")

```

```python
display(sales_df.select(vectorized_udf(col("email"))))
spark.udf.register("sql_vectorized_udf", vectorized_udf)

%sql

-- Use the Pandas UDF from SQL

SELECT sql_vectorized_udf(email) AS firstLetter FROM sales

```

