#SELECT SELECT
SELECT column_name FROM table_name

#ORDERBY ORDER BY
SELECT column_name1, column_name2, FROM table_name ORDER BY column_name1

#DESC/AS DESC / AS
SELECT first_name, last_name FROM actor ORDER BY first_name DESC

SELECT DISTINCT
SELECT DISTINCT column_name1 FROM table_name


Day 2

LIMIT
SELECT column_name1, column_name2 FROM table_name LIMIT n

COUNT
SELECT COUNT(`*) FROM table_name         

SELECT COUNT(DISTINCT first_name) FROM actor

WHERE
SELECT column_name1, column_name2 FROM table_name WHERE condition

AND / OR
SELECT column_name1, column_name2 FROM table_name WHERE condition1 AND condition2 AND condition3 
SELECT * FROM payment WHERE (amount = 10.99 OR amount = 9.99) AND customer_id = 426

BETWEEN … AND …
SELECT payment_id, amount FROM payment WHERE amount NOT BETWEEN 1.99 AND 6.99

LIKE
✓ Use wildcards: _ any single character 
✓ Use wildcards: % any sequence of characters
SELECT * FROM actor WHERE first_name LIKE 'A%' SYNTAX
SELECT * FROM actor WHERE first_name LIKE '__A%'

Day 3