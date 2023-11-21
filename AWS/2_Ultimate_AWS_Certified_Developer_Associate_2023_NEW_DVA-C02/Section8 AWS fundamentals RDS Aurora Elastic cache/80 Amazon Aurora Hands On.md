**Creating an Aurora Database**

2. **Choose the type of Aurora:** Aurora MySQL or Aurora PostgreSQL
4. **Select the version of Aurora:** The version determines features like global database and parallel query
6. **Choose a template:** Production or Development
8. **Configure the instance:**
    
    - Instance class: Memory optimized or Burstable
    - Multi-AZ and durability: Create an Aurora replica for fast fallover and high availability
    
10. **Connectivity:**
    
    - Connect to an EC2 compute resource (optional)
    - Public access: Yes or No
    - Security group: Existing or New
    
12. **Authentication:**
    
    - Password or IAM based authentication
    
14. **Database name:** Default or Custom
16. **Backup and encryption:**
    
    - Backup retention: 1-35 days
    - Encryption: Yes or No
    - Backtrack: Yes or No, up to 72 hours
    - Audit log: Send to Amazon CloudWatch Logs (optional)
    

**Additional Features**

- Add more readers to the reader cluster for scaling capacity
- Create a cross-region read replica for disaster recovery
- Restore to any point in time
- Enable Replica autoscaling based on CPU utilization or connection count
- Add AWS regions to create a global Aurora database

**Deleting an Aurora Database**

2. Delete the reader instance
4. Delete the writer instance
6. Delete the cluster

**Additional Notes**

- Aurora is a high-performance, scalable, and reliable database service
- Aurora is compatible with MySQL and PostgreSQL
- Aurora offers a variety of features, including global database, parallel query, and serverless
- Aurora is a great choice for production workloads
- [ ] AURORA DATABASE
	- [ ] database2-instance1 **write instance**
	- [ ] database2-instance1-au-cetrnal **reader instance**
- [ ] 