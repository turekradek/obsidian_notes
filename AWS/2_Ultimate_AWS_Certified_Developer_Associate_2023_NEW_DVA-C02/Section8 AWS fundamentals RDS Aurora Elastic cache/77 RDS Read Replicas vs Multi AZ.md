  
Sure, here is a summary of the lecture on RDS Read Replicas and Multi-AZ:

**RDS Read Replicas**

- RDS Read Replicas are used to scale read operations for an RDS database.
- There can be up to 15 Read Replicas per RDS database instance.
- Read Replicas are eventually consistent, which means that reads may not reflect the latest writes.
- Read Replicas can be promoted to their own database.
- The main application must update its connection string to use the list of all Read Replicas.
- Read Replicas are only for SELECT statements.
- There is no networking cost for Read Replicas within the same region.
- There is a networking cost for Read Replicas across regions.

**RDS Multi-AZ**

- RDS Multi-AZ is used for disaster recovery.
- Multi-AZ deployments involve a Master database and a Standby database.
- The Standby database is kept in sync with the Master database using synchronous replication.
- There is a single DNS name for the Multi-AZ deployment.
- In the event of a failure of the Master database, the Standby database will automatically failover and become the new Master.
- Multi-AZ deployments are not used for scaling.
- Read Replicas can be set up as Multi-AZ deployments.

**How to Convert a Single-AZ RDS Database to Multi-AZ**

- Converting a Single-AZ RDS database to Multi-AZ is a zero downtime operation.
- To convert a Single-AZ database to Multi-AZ, you can simply modify the database settings and enable Multi-AZ.
- Behind the scenes, RDS will take a snapshot of the Single-AZ database and restore it into a new Standby database.
- The Standby database will then be synchronized with the Master database.
