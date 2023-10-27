  

**Amazon Relational Database Service (RDS)**

- Managed database service for relational databases
- Supports PostgreSQL, MySQL, MariaDB, Oracle, Microsoft SQL Server, and Aurora
- Features:
    - Automatic provisioning
    - OS patching
    - Continuous backups and restore
    - Monitoring dashboards
    - Read replicas
    - Multi AZ
    - Maintenance windows
    - Vertical and horizontal scaling
    - EBS storage
- Cannot SSH into RDS database instances
- Solution architecture: load balancer, backend EC2 instances, RDS database
- Benefits:
    - Easy to use
    - Reliable
    - Scalable
    - Cost-effective

**Amazon Aurora**

- Cloud-optimized database technology from AWS
- Supports PostgreSQL and MySQL
- Features:
    - 5x performance improvement over MySQL on RDS
    - 3x performance improvement over PostgreSQL on RDS
    - Automatic storage growth
- Benefits:
    - Efficient
    - Cost-effective

**RDS vs. Aurora**

|Feature|RDS|Aurora|
|---|---|---|
|Managed database service|Yes|Yes|
|Relational database support|Yes|Yes|
|Cloud-native|No|Yes|
|Performance|Good|Excellent|
|Storage|EBS|Automatic growth|
|Cost|Less expensive|More expensive|
|Free tier|Yes|No|

drive_spreadsheetExport to Sheets

**Conclusion**

RDS and Aurora are both managed database services for relational databases on AWS. RDS is a good choice for general-purpose use, while Aurora is a better choice for applications that require high performance and scalability.
