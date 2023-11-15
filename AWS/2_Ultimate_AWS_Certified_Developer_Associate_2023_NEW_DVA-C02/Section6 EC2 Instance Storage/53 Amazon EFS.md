
## EFS - Elastic File System
- [ ] Managed NFS ) network file system) that can be mounted on 100s of EC2
- [ ] EFS works with Linux EC2 instances in multi-AZ
- [ ] Highly available, scalable, expensive (3x gp2), pay per use , no capacity planning

 EBS                        

 | Availability      |      Availability    |       
 |   Zone 1          |        Zone 1        |    
 |    |              |          |           |
 |   EBS             |         EBS          | 
 |    |              |          |           |
   snapshot                    restore           
	 |                           |
       \\                       /
          \\                  /
            >  EBS Snapshot >


EFS

  |  Availability      |    Availability |            
  |    Zone 1          |      Zone 1     |         
  |     |              |        |        |     
  |    EFS             |       EFS       |      
  |    Mount           |       Mount     |        
  |  target            |       tager     |        
       |                           |
	   |                           |
        \\                       /
           \\                  /
              <-->  EFS  <-->


### EFS Infrequent Access (EFS-IA)
- [ ] Storage class that is cost-optimized for files not accessed every day
- [ ] Up to 92 % lower cost compared to EFS Standard
- [ ] EFS will automatically move your files to EFS-IA based on the last time the were accessed

EFS Standard no access for 60 days  -> (Lifecycle Policy)  move -> EFS IA   


## Summary of Amazon EFS

**What is Amazon EFS?**

Amazon EFS is a fully managed, scalable NFS file system that provides simple, elastic, and secure file sharing for EC2 instances. It is a great option for workloads that require high performance, availability, and scalability, such as web serving, content management, and big data processing.

**Benefits of using Amazon EFS**

- **High performance:** EFS provides throughput of up to 10 gigabytes per second and thousands of concurrent NFS clients.
- **Availability:** EFS is highly available and can be configured to be Multi-AZ for even greater availability.
- **Scalability:** EFS can scale automatically to meet your needs, up to petabytes of data.
- **Easy to use:** EFS is easy to set up and manage. You can mount EFS file systems on EC2 instances in the same or different Availability Zones, or even in different regions.
- **Secure:** EFS uses industry-standard security features to protect your data, such as encryption at rest and transit, and access control lists.

**Use cases for Amazon EFS**

- Web serving
- Content management
- Big data processing
- Media processing
- Application development and testing
- Data sharing

**EFS performance and storage classes**

- **Performance modes:** General Purpose (default) and Max I/O
- **Throughput modes:** Bursting, Provisioned, and Elastic
- **Storage classes:** Standard and Infrequent Access (IA)

**EFS availability and durability**

- **Availability zones:** Multi-AZ and One-AZ
- **Durability:** Backups are enabled by default

## Tips for using Amazon EFS

- Choose the right performance mode and throughput mode for your workload.
- Use the Infrequent Access storage class for files that are not frequently accessed.
- Configure EFS to be Multi-AZ if you require high availability.
- Use lifecycle policies to automate the movement of files between storage classes.
- Monitor your EFS usage to ensure that you are using it efficiently.

## Example

You have a web application that is hosted on EC2 instances. The application needs to be highly available and scalable. You also need to be able to share files between the EC2 instances.

Amazon EFS is a good choice for this workload. You can create a Multi-AZ EFS file system and mount it on the EC2 instances. EFS will provide the high performance, availability, and scalability that you need. You can also use lifecycle policies to automate the movement of files between storage classes to save money.

## Conclusion

Amazon EFS is a powerful and versatile file system that can be used for a variety of workloads. It is a good choice for workloads that require high performance, availability, and scalability.