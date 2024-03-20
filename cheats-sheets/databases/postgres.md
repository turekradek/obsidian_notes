# PostgreSQL Cheat-Sheet
PostgreSQL or also known as Postgres, is a free and open-source relational database management system. PostgreSQL features transactions with Atomicity, Consistency, Isolation, Durability (ACID) properties automatically updatable views, materialized views, triggers, foreign keys, and stored procedures. It is designed to handle a range of workloads, from single machines to data warehouses or web services with many concurrent users.

## Install PostgreSQL 12 on Ubuntu 20.04 LTS
```bash
sudo apt update
sudo apt install -y postgresql postgresql-contrib postgresql-client
sudo systemctl status postgresql.service
```

## Initial database connection

A local connection (from the database server) can be done by the following command:

```bash
sudo -u postgres psql

psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1))
Type "help" for help.

postgres=#
```

## Set password for postgres database user

The password for the `postgres` database user can be set the the quickcommand `\password`
or by `alter user postgres password 'Supersecret'`. A connection using the `postgres` user
is still not possible from the "outside" hence to the default settings in the `pg_hba.conf`.

### Update pg_hba.conf to allow postgres user connections with password

In order to allow connections of the `postgres` database user not using OS user
authentication, you have to update the `pg_hba.conf` which can be found under
`/etc/postgresql/12/main/pg_hba.conf`.

```
sudo vi /etc/postgresql/12/main/pg_hba.conf

...
local   all             postgres                                peer
...
```

Change the last section of the above line to `md5`.

```
local   all             postgres                                md5
```

A restart is required in order to apply the new configuration:

```bash
sudo systemctl restart postgresql
```

Now a connection from outside the database host is possible e.g.

```bash
psql -U postgres -d postgres -h databasehostname
```

## Creation of additional database users

A database user can be created by the following command:

```sql
create user myuser with encrypted password 'Supersecret';
CREATE ROLE

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 myuser    |                                                            | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

## Creation of additional databases

One can create new Postgres databases within an instance. Therefore you can use the `psql`
command to login (see above).

```sql
CREATE DATABASE dbname OWNER myuser;
CREATE DATABASE

postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-----------+----------+----------+-------------+-------------+-----------------------
 dbname    | myuser   | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
```

You can leave the `OWNER` section of the command, when doing so, the current user will become
owner of the newly created database.

To change the owner of an existing database later, you can use the following command:

```sql
postgres=# alter database dbname owner to myuser;
ALTER DATABASE
```

```POSTGRES_HELP
\? COMMAND
```

**Create a role group in PostgreSQL:**
> CREATE ROLE groupname;

**Add a user to this group:** First, create a user:
> CREATE USER username WITH PASSWORD 'password';

Then add the user to the group:
>GRANT groupname TO username;

**Add permissions for this group:** 
a. **Permission to create new tables:** `sql GRANT CREATE ON SCHEMA public TO groupname;`  
b. **Permission to add records to created tables:** `sql GRANT INSERT ON ALL TABLES IN SCHEMA public TO groupname;`

**In PostgreSQL, you can revoke the `DELETE` privilege from a group to prevent it from deleting tables. Here’s an example:**
> REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM groupname;


To change the user in PostgreSQL, you can use the `SET ROLE` command. Here’s an example:
> SET ROLE username;

> SELECT CURRENT_USER;
> 

## SQL SCRIPT

# TO CHANGE TRANSACTION READ WRITE
```
BEGIN;
SET TRANSACTION READ WRITE;
CREATE GROUP groupcreateprod;
COMMIT;

```

```
-- Create a new role
CREATE ROLE groupname;

-- Create a new user and add it to the role
CREATE USER username WITH PASSWORD 'password';
GRANT groupname TO username;

-- Grant permissions to the role
GRANT CREATE ON SCHEMA public TO groupname;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO groupname;

-- Revoke delete permission from the role
REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM groupname;

```
Please replace `groupname`, `username`, and `password` with your actual group name, user name, and password.

You can run this script using the `psql` command-line tool like so:
psql -U USERNAME -d NAMEDATABASE -a -f myscript.sql

> ALTER USER postgres WITH PASSWORD 'radek';

> psql -U postgres -d postgres -h localhost

password: radek

> psql -U postgres -d postgres -h localhost -f script.sql

\d table           - shows columns

```LIST_USERS
SELECT usename FROM pg_user;
  usename
-----------
 postgres
 usertest1
(2 rows)
```

```list_groups
postgres=# select groname from pg_group;
          groname
---------------------------
 pg_database_owner
 pg_read_all_data
 pg_write_all_data
 pg_monitor
 pg_read_all_settings
 pg_read_all_stats
 pg_stat_scan_tables
 pg_read_server_files
 pg_write_server_files
 pg_execute_server_program
 pg_signal_backend
(11 rows)
```

## postgres groups permissions
#postgres

To grant read-only permissions to a specific group in PostgreSQL, you can use the `GRANT` statement to assign the `SELECT` privilege to the group for a particular table or schema. Here's how to do it:

1. Connect to your PostgreSQL database using the `psql` command-line tool:
    
    bashCopy code
    
    `psql -U your_username -d your_database`
    
    Replace `your_username` with your PostgreSQL username and `your_database` with the name of your database.
    
2. Grant read-only permission to a group for a specific table:
    
    > GRANT SELECT ON table_name TO group_name;
    
    > GRANT SELECT ON mytable TO mygroup;`
    
3. If you want to grant read-only permissions for all tables within a schema, you can use the following command:

    > GRANT SELECT ON ALL TABLES IN SCHEMA schema_name TO group_name;

    > GRANT SELECT ON ALL TABLES IN SCHEMA public TO mygroup;
    
4. After executing the `GRANT` statement, the group will have read-only permissions on the specified table(s) or schema.
    
> SET ROLE username;

switch back to previous user
> RESET ROLE

Show available schemas in postgres
```available_schemas
select nspname from pg_catalog.pg_namespace;
      nspname
--------------------
 pg_toast
 pg_catalog
 public
 information_schema
(4 rows)
```

## description of schema in PostgreSQL

> SELECT 
    catalog_name,
    schema_name,
    schema_owner,
    default_character_set_catalog,
    default_character_set_schema,
    default_character_set_name,
    sql_path
FROM 
    information_schema.schemata;

## To get the privileges of all groups in PostgreSQL

> SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolcanlogin FROM pg_roles;

## To get the privileges of a specific group

> SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolcanlogin 
  FROM pg_roles 
  WHERE rolname = 'your_group_name';

> SELECT g.rolname AS groupname, u.rolname AS username
      FROM pg_auth_members m
      JOIN pg_roles g ON (m.roleid = g.oid)
       JOIN pg_roles u ON (m.member = u.oid);



| Nr | Action | SQL CODE | notes |
| ---- | ---- | ---- | ---- |
| 1. | **Create a group** named ‘GROUPRADEK’: | CREATE ROLE GROUPRADEK NOLOGIN; |  |
| 2. | **Give permissions to read and write data from tables**: | GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO GROUPRADEK; |  |
| 3. | **Give permissions to create databases and tables**: | GRANT CREATE ON DATABASE your_database TO GROUPRADEK; GRANT CREATE ON SCHEMA public TO GROUPRADEK; |  |
| 4. | **Give permissions to delete tables**: | GRANT DELETE ON ALL TABLES IN SCHEMA public TO GROUPRADEK; |  |
| 5. | **Give permissions to delete databases**: | ALTER ROLE GROUPRADEK CREATEDB; |  |
| 6. | **Give permissions to create new users**: | ALTER ROLE GROUPRADEK CREATEROLE; |  |
| 7. | **Add user ‘radek1’ to this group**: | GRANT GROUPRADEK TO radek1; |  |
| 8. | **Revoke the privilege of deleting databases**: | ALTER ROLE GROUPRADEK NOCREATEDB; |  |
| 9. | **Revoke the privilege of creating new users**: | ALTER ROLE GROUPRADEK NOCREATEROLE; |  |
| 10. |  |  |  |

In PostgreSQL, a role can have the following attributes which you can use for a newly created group:

1. **LOGIN / NOLOGIN**: This determines whether a role is allowed to log in. A role with the LOGIN attribute can enter a database. Roles without this attribute are useful for managing database privileges.
    
2. **SUPERUSER / NOSUPERUSER**: The SUPERUSER attribute determines whether the role bypasses all permission checks, except the right to log in.
    
3. **CREATEDB / NOCREATEDB**: Roles with the CREATEDB attribute can create new databases.
    
4. **CREATEROLE / NOCREATEROLE**: Roles with the CREATEROLE attribute can create new roles.
    
5. **INHERIT / NOINHERIT**: A role with the INHERIT attribute automatically has the privileges of roles it is a member of. If NOINHERIT is specified, then a role does not automatically inherit privileges of roles it is a member of.
    
6. **REPLICATION / NOREPLICATION**: The REPLICATION attribute determines whether a role can initiate streaming replication or put the system in and out of backup mode.
    
7. **BYPASSRLS / NOBYPASSRLS**: The BYPASSRLS attribute determines whether a role bypasses row-level security policies.
    

You can set these attributes while creating a group (role) or alter them later using the `CREATE ROLE` and `ALTER ROLE` commands respectively.


```
SELECT 
    t.table_name, 
    pg_catalog.pg_get_userbyid(c.relowner) AS table_owner
FROM 
    information_schema.tables t
JOIN 
    pg_catalog.pg_class c ON (t.table_name = c.relname)
WHERE 
    t.table_schema = 'public';  -- change this to your schema name

```


[You can set up the privileges for your groups in PostgreSQL using the `GRANT` command](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html). Here’s how you can do it:

1. **groupcreate**:
    
    SQL
    
    ```sql
    GRANT SELECT, INSERT, UPDATE, CREATE ON ALL TABLES IN SCHEMA public TO groupcreate;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, CREATE ON TABLES TO groupcreate;
    ```
    
    AI-generated code. Review and use carefully. .
    
2. **groupwrite**:
    
    SQL
    
    ```sql
    GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO groupwrite;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE ON TABLES TO groupwrite;
    ```
    
    AI-generated code. Review and use carefully. .
    
3. **groupread**:
    
    SQL
    
    ```sql
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO groupread;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO groupread;
    ```
    
    AI-generated code. Review and use carefully. .
    

In these commands:

- [`GRANT` is used to give privileges to a group](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html).
- [`ALTER DEFAULT PRIVILEGES` is used to set the default privileges for new tables created in the future](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html).
- `public` is the schema where your tables are located. [Replace it with your schema name if it’s different](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html).
- [`ON ALL TABLES IN SCHEMA` applies the privileges to all existing tables in the schema](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html).
- [`ON TABLES` in the `ALTER DEFAULT PRIVILEGES` command applies the privileges to all new tables created in the future](https://www.postgresql.org/docs/current/ddl-priv.html)[1](https://www.postgresql.org/docs/current/ddl-priv.html).

Please note that you need to have the necessary permissions to execute these commands. If you encounter any issues, please contact your database administrator.

[You can check the privileges for your groups in PostgreSQL by querying the `information_schema.role_table_grants` view](https://stackoverflow.com/questions/40759177/postgresql-show-all-the-privileges-for-a-concrete-user)[1](https://stackoverflow.com/questions/40759177/postgresql-show-all-the-privileges-for-a-concrete-user). Here’s an SQL command that will list all privileges for a specific group:

SQL

```sql
SELECT * 
FROM information_schema.role_table_grants 
WHERE grantee = 'YOUR_GROUP';
```

# update indexes 
```update_indexes
-- Create a temporary sequence

CREATE TEMP SEQUENCE temp_seq START WITH 1;

-- Update the 'index' column with new values from the sequence

UPDATE unavailable_sessions_xxx

SET index = NEXTVAL('temp_seq')

ORDER BY index;

-- Reset the sequence

SELECT SETVAL('temp_seq', 1);
```
