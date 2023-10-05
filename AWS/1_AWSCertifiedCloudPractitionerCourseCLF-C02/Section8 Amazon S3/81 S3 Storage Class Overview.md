**Table of Amazon S3 Storage Classes**

|Storage Class|Durability|Availability|Use Cases|
|---|---|---|---|
|S3 Standard|11 nines|99.99%|Frequently accessed data, big data analytics, mobile and gaming applications, content distribution|
|S3 Standard-Infrequent Access (S3 Standard-IA)|11 nines|99.9%|Disaster Recovery and backups|
|S3 One Zone-Infrequent Access (S3 One Zone-IA)|11 nines (within a single AZ)|99.5%|Secondary copy of backups, data that can be recreated|
|S3 Glacier Instant Retrieval|11 nines|Milliseconds|Data that's accessed once a quarter, and requires milliseconds retrieval|
|S3 Glacier Flexible Retrieval|11 nines|Expedited (1-5 minutes), Standard (3-5 hours), Bulk (5-12 hours)|Backup|
|S3 Glacier Deep Archive|11 nines|Standard (12 hours), Bulk (48 hours)|Long term storage|
|S3 Intelligent-Tiering|11 nines|99.9%|Automatically moves objects between tiers based on usage patterns|
