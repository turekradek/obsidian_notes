| Short Description        | Example                                                                                | Notes |
| ------------------------ | -------------------------------------------------------------------------------------- | ----- |
| Create a table           | CREATE TABLE customers (id SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255)); |       |
| Insert data into a table | INSERT INTO customers (name, email) VALUES ('John Doe', 'johndoe@example.com');        |       |
| Select data from a table | SELECT * FROM customers;                                                               |       |
| Update data in a table   | UPDATE customers SET email = 'janedoe@example.com' WHERE id = 1;                       |       |
| Delete data from a table | DELETE FROM customers WHERE id = 2;                                                    |       |


  

|Short Description|Example|Notes|
|---|---|---|
|Create a table|CREATE TABLE customers (id SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255))||
|Insert data into a table|INSERT INTO customers (name, email) VALUES ('John Doe', 'johndoe@example.com')||
|Select data from a table|SELECT * FROM customers||
|Update data in a table|UPDATE customers SET email = 'janedoe@example.com' WHERE id = 1||
|Delete data from a table|DELETE FROM customers WHERE id = 2||
|Create a new table|CREATE TABLE orders (id SERIAL PRIMARY KEY, customer_id INTEGER, product_id INTEGER, quantity INTEGER)||
|Insert data into a new table|INSERT INTO orders (customer_id, product_id, quantity) VALUES (1, 1, 2), (2, 2, 1)||
|Select data from a new table|SELECT * FROM orders||
|Update data in a new table|UPDATE orders SET quantity = 3 WHERE id = 1||
|Delete data from a new table|DELETE FROM orders WHERE id = 2||
|Create a view|CREATE VIEW customer_orders AS SELECT customers.id AS customer_id, customers.name AS customer_name, orders.id AS order_id, orders.product_id, orders.quantity FROM customers INNER JOIN orders ON customers.id = orders.customer_id||
|Select data from a view|SELECT * FROM customer_orders||
|Drop a view|DROP VIEW customer_orders||
|Create a function|CREATE FUNCTION add_numbers(a INTEGER, b INTEGER) RETURNS INTEGER AS $$ BEGIN RETURN a + b; END $$ LANGUAGE plpgsql||
|Call a function|SELECT add_numbers(1, 2)||
|Drop a function|DROP FUNCTION add_numbers(INTEGER, INTEGER)||
|Create a trigger|CREATE TRIGGER update_customer_last_login_time BEFORE UPDATE ON customers FOR EACH ROW EXECUTE PROCEDURE update_last_login_time()||
|Drop a trigger|DROP TRIGGER update_customer_last_login_time||
|Create a schema|CREATE SCHEMA my_schema||
|Create a table in a schema|CREATE TABLE my_schema.my_table (id SERIAL PRIMARY KEY, name VARCHAR(255))||
|Drop a schema|DROP SCHEMA my_schema||
|Create a user|CREATE USER my_user WITH PASSWORD 'my_password'||
|Grant privileges to a user|GRANT ALL PRIVILEGES ON DATABASE my_database TO my_user||
|Revoke privileges from a user|REVOKE ALL PRIVILEGES ON DATABASE my_database FROM my_user||
|Drop a user|DROP USER my_user|

|Short Description|Example|Notes|
|---|---|---|
|Create a role|CREATE ROLE my_role||
|Drop a role|DROP ROLE my_role||
|Add a comment to a table|COMMENT ON TABLE customers IS 'This table stores customer information.'||
|Remove a comment from a table|UNCOMMENT ON TABLE customers||
|Grant all privileges to a user on a table|GRANT ALL PRIVILEGES ON TABLE customers TO my_user||
|Revoke all privileges from a user on a table|REVOKE ALL PRIVILEGES ON TABLE customers FROM my_user||
|Grant all privileges to a user on a function|GRANT ALL PRIVILEGES ON FUNCTION add_numbers(INTEGER, INTEGER) TO my_user||
|Revoke all privileges from a user on a function|REVOKE ALL PRIVILEGES ON FUNCTION add_numbers(INTEGER, INTEGER) FROM my_user||
|Grant all privileges to a user on a view|GRANT ALL PRIVILEGES ON VIEW customer_orders TO my_user||
|Revoke all privileges from a user on a view|REVOKE ALL PRIVILEGES ON VIEW customer_orders FROM my_user|


How to create a group in PostgreSQL? In PostgreSQL, a group is essentially a role1. You can create a group using the CREATE ROLE command2. For example, to create a group named “mygroup”, you would use:

SQL

CREATE ROLE mygroup;
AI-generated code. Review and use carefully. More info on FAQ.
How to create a user in PostgreSQL? You can create a user in PostgreSQL using the CREATE USER command3. For example, to create a user named “myuser” with a password “mypassword”, you would use:

SQL

CREATE USER myuser WITH PASSWORD 'mypassword';
AI-generated code. Review and use carefully. More info on FAQ.
How to give permissions to a user in PostgreSQL? You can grant permissions to a user in PostgreSQL using the GRANT command4. For example, to grant all privileges on a database named “mydatabase” to a user named “myuser”, you would use:

SQL

GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;
AI-generated code. Review and use carefully. More info on FAQ.
How to add a user to a group in PostgreSQL? You can add a user to a group (role) in PostgreSQL using the GRANT command5. For example, to add a user named “myuser” to a group named “mygroup”, you would use:

SQL

GRANT mygroup TO myuser;


GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgresstgreadgrafana;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgresstgread;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgresstgwrite;

-- Insert values into the id column
UPDATE mytable SET id = 1 WHERE some_condition; -- Replace some_condition with your condition

SELECT usename FROM pg_user;

ALTER USER username WITH PASSWORD 'new_password';
