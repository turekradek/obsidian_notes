**RDS and Aurora Security**

RDS and Aurora offer a variety of security features to protect your data.

**At-rest encryption**

- Encrypts data at rest on your RDS and Aurora database volumes
- Uses KMS to encrypt the master and any replicas
- Defined at launch time
- Read replicas cannot be encrypted if the master database is not encrypted
- To encrypt an already existing unencrypted database, take a database snapshot from the unencrypted database and restore the snapshot as an encrypted database

**In-flight encryption**

- Encrypts data in transit between your clients and your database
- Each database on RDS and Aurora is ready to have in-flight encryption by default
- Your clients must use the TLS root certificates from AWS

**Database authentication**

- You can use the classic combination of username and password
- You can also use IAM roles to connect to your database
- This allows you to manage all the security within AWS and IAM

**Network access control**

- You can control network access to your database using security groups
- You can allow or block specific ports, specific IP addresses, and specific security groups

**SSH access**

- RDS and Aurora do not have SSH access by default, except if you use the RDS custom service from AWS

**Audit logs**

- You can enable audit logs to track queries being made on RDS and Aurora over time
- Audit logs are lost after a bit of time, so you need to send them to a dedicated service called CloudWatch Logs if you want to keep them for a long period of time