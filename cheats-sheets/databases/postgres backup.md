
Here are the commands necessary to backup a PostgreSQL database using the `pg_dump` command:

2. **Stop the PostgreSQL server:**

```
sudo service postgresql stop
```

3. **Create a backup directory:**

```
mkdir /var/lib/postgresql/data/backup
```

4. **Dump the database to a backup file:**

```
pg_dump -U postgres mydatabase > /var/lib/postgresql/data/backup/mydatabase.backup
```

5. **Start the PostgreSQL server:**

```
sudo service postgresql start
```

Here's a breakdown of the commands:

- `sudo service postgresql stop`: This command stops the PostgreSQL server. This is necessary to ensure that the database is not modified while you are backing it up.
    
- `mkdir /var/lib/postgresql/data/backup`: This command creates a directory called `backup` in the `/var/lib/postgresql/data` directory. This directory will be used to store the backup file.
    
- `pg_dump -U postgres mydatabase > /var/lib/postgresql/data/backup/mydatabase.backup`: This command dumps the database `mydatabase` to a file called `mydatabase.backup` in the `/var/lib/postgresql/data/backup` directory. The `-U postgres` option specifies that the database should be dumped as the PostgreSQL user `postgres`.
    
- `sudo service postgresql start`: This command starts the PostgreSQL server.
    

Here's an example of how to backup and restore a PostgreSQL database:

To back up the database `mydatabase`, run the following commands:

```
sudo service postgresql stop
mkdir /var/lib/postgresql/data/backup
pg_dump -U postgres mydatabase > /var/lib/postgresql/data/backup/mydatabase.backup
sudo service postgresql start
```

# To restore the database `mydatabase`, run the following commands:

```
sudo service postgresql stop
dropdb mydatabase
pg_restore -U postgres /var/lib/postgresql/data/backup/mydatabase.backup
sudo service postgresql start
```

This will restore the database `mydatabase` from the backup file `mydatabase.backup`.

WITH merged_tables AS (
  SELECT 
    dag_id, 
    state, 
    right(run_id, 36) AS session, 
    execution_date, 
    start_date, 
    end_date,
    EXTRACT(EPOCH FROM (start_date - execution_date)) AS exec_start_diff_sec,
    (CAST(EXTRACT(EPOCH FROM (end_date - start_date)) AS FLOAT) / 60) AS end_start_diff_min
  FROM dag_run
  WHERE DAG_ID IN ('data_pipeline','ingest','image_extractor','video_creator','image_video_pipeline','auto_labelling','signal_extractor','signal_synchronizer','dq_smard','marker_import_tablet_label')
    --AND execution_date > NOW() - INTERVAL '${count} ${interval}'
    AND $__timeFilter(execution_date) 
)
SELECT 
  dag_id, 
  AVG(CAST(end_start_diff_min AS INTEGER)),
  CONCAT(
    floor(CAST(AVG(CAST(end_start_diff_min AS INTEGER)) AS INTEGER) / 60), ' h ',
    floor(CAST(AVG(CAST(end_start_diff_min AS INTEGER)) AS INTEGER) % 60), ' m '
  ) AS formatted_avg_end_start_diff_min
FROM merged_tables
GROUP BY dag_id