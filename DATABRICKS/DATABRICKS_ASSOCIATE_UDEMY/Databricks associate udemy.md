Inserting only rows when not match and u.category = 'Computer Science'
```sql
MERGE INTO books b

USING books_updates u

ON b.book_id = u.book_id AND b.title = u.title

WHEN NOT MATCHED AND u.category = 'Computer Science' THEN

  INSERT *
```

Update rows when matched and c.emil IS NULL and U.EMAIL is not null
when NOT MATCHED just INSERT 
```sql
CREATE OR REPLACE TEMP VIEW customers_updates AS

SELECT * FROM json.`${dataset.bookstore}/customers-json-new`;

  

MERGE INTO customers c

USING customers_updates u

ON c.customer_id = u.customer_id

WHEN MATCHED AND c.email IS NULL AND u.email IS NOT NULL THEN

  UPDATE SET email = u.email, updated = u.updated

WHEN NOT MATCHED THEN INSERT *
```