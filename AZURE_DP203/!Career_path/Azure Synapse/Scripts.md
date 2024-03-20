Time dimension tables store a record for each time interval based on the _grain_ by which you want to aggregate data over time. For example, a time dimension table at the _date_ grain contains a record for each date between the earliest and latest dates referenced by the data in related fact tables.

The following code example shows how you can generate a sequence of time dimension values based on a _date_ grain.
```SQL

-- Create a temporary table for the dates we need
CREATE TABLE #TmpStageDate (DateVal DATE NOT NULL)

-- Populate the temp table with a range of dates
DECLARE @StartDate DATE
DECLARE @EndDate DATE
SET @StartDate = '2019-01-01'
SET @EndDate = '2023-12-31'
DECLARE @LoopDate = @StartDate
WHILE @LoopDate <= @EndDate
BEGIN
    INSERT INTO #TmpStageDate VALUES
    (
        @LoopDate
    )
    SET @LoopDate = DATEADD(dd, 1, @LoopDate)
END

-- Insert the dates and calculated attributes into the dimension table
INSERT INTO dbo.DimDate
SELECT CAST(CONVERT(VARCHAR(8), DateVal, 112) as INT), -- date key
    DateVal, --date alt key
    Day(DateVal) -- day number of month
    --,  other derived temporal fields as required
FROM #TmpStageDate
GO

--Drop temporary table
DROP TABLE #TmpStageDate
```

## Combining INSERT and UPDATE statements

Logic to implement Type 1 and Type 2 updates can be complex, and there are various techniques you can use. For example, you could use a combination of `UPDATE` and `INSERT` statements.
```SQL
-- New Customers
INSERT INTO dbo.DimCustomer
SELECT stg.*
FROM dbo.StageCustomers AS stg
WHERE NOT EXISTS
    (SELECT * FROM dbo.DimCustomer AS dim
    WHERE dim.CustomerAltKey = stg.CustNo)

-- Type 1 updates (name)
UPDATE dbo.DimCustomer
SET CustomerName = stg.CustomerName
FROM dbo.StageCustomers AS stg
WHERE dbo.DimCustomer.CustomerAltKey = stg.CustomerNo;

-- Type 2 updates (StreetAddress)
INSERT INTO dbo.DimCustomer
SELECT stg.*
FROM dbo.StageCustomers AS stg
JOIN dbo.DimCustomer AS dim
ON stg.CustNo = dim.CustomerAltKey
AND stg.StreetAddress <> dim.StreetAddress;
```

## Using a MERGE statement

As an alternative to using multiple `INSERT` and `UPDATE` statements, you can use a single `MERGE` statement to perform an "_upsert_" operation to insert new records and update existing ones.
```SQL
MERGE dbo.DimProduct AS tgt
    USING (SELECT * FROM dbo.StageProducts) AS src
    ON src.ProductID = tgt.ProductBusinessKey
WHEN MATCHED THEN
    -- Type 1 updates
    UPDATE SET
        tgt.ProductName = src.ProductName,
        tgt.ProductCategory = src.ProductCategory,
        tgt.Color = src.Color,
        tgt.Size = src.Size,
        tgt.ListPrice = src.ListPrice,
        tgt.Discontinued = src.Discontinued
WHEN NOT MATCHED THEN
    -- New products
    INSERT VALUES
        (src.ProductID,
        src.ProductName,
        src.ProductCategory,
        src.Color,
        src.Size,
        src.ListPrice,
        src.Discontinued);
```

# Load fact tables
```SQL
INSERT INTO dbo.FactSales
SELECT  (SELECT MAX(DateKey)
         FROM dbo.DimDate
         WHERE FullDateAlternateKey = stg.OrderDate) AS OrderDateKey,
        (SELECT MAX(CustomerKey)
         FROM dbo.DimCustomer
         WHERE CustomerAlternateKey = stg.CustNo) AS CustomerKey,
        (SELECT MAX(ProductKey)
         FROM dbo.DimProduct
         WHERE ProductAlternateKey = stg.ProductID) AS ProductKey,
        (SELECT MAX(StoreKey)
         FROM dbo.DimStore
         WHERE StoreAlternateKey = stg.StoreID) AS StoreKey,
        OrderNumber,
        OrderLineItem,
        OrderQuantity,
        UnitPrice,
        Discount,
        Tax,
        SalesAmount
FROM dbo.StageSales AS stg
```

## Rebuild indexes
```SQL
ALTER INDEX ALL ON dbo.DimProduct REBUILD
```

## Update statistics
```SQL
CREATE STATISTICS productcategory_stats
ON dbo.DimProduct(ProductCategory);
```

# The syntax to use for implementing column level security looks as follows:
```SQL
GRANT <permission> [ ,...n ] ON
    [ OBJECT :: ][ schema_name ]. object_name [ ( column [ ,...n ] ) ] // specifying the column access
    TO <database_principal> [ ,...n ]
    [ WITH GRANT OPTION ]
    [ AS <database_principal> ]
<permission> ::=
    SELECT
  | UPDATE
<database_principal> ::=
      Database_user // specifying the database user
    | Database_role // specifying the database role 
    | Database_user_mapped_to_Windows_User
    | Database_user_mapped_to_Windows_Group
```

## An example of column level security
```SQL
CREATE TABLE Membership
  (MemberID int IDENTITY,
   FirstName varchar(100) NULL,
   SSN char(9) NOT NULL,
   LastName varchar(100) NOT NULL,
   Phone varchar(12) NULL,
   Email varchar(100) NULL);
```

```SQL
GRANT SELECT ON Membership(MemberID, FirstName, LastName, Phone, Email) TO TestUser;
```

## Partition the output file
```Python
from pyspark.sql.functions import year, col

# Load source data
df = spark.read.csv('/orders/*.csv', header=True, inferSchema=True)

# Add Year column
dated_df = df.withColumn("Year", year(col("OrderDate")))

# Partition by year
dated_df.write.partitionBy("Year").mode("overwrite").parquet("/data")
```