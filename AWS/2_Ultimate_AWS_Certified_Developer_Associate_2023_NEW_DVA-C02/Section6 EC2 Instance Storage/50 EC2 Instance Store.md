
 - EBS volumes are network drives with good but "limited" performance
 - If you need a high-performance hardware disk , use EC2 Instance Store

##   
EC2 Instance Store

**What is EC2 Instance Store?**

EC2 Instance Store is a high-performance ephemeral storage device that is attached to some EC2 instances. It is a good choice for applications that require high I/O throughput and low latency, such as databases, caches, and scratch disks.

**Features of EC2 Instance Store**

- High I/O throughput and low latency
- Ephemeral storage (data is lost when the instance is stopped or terminated)
- Attached directly to the EC2 instance

**Use cases for EC2 Instance Store**

- Databases
- Caches
- Scratch disks
- Temporary storage

**Caveats of EC2 Instance Store**

- Data is lost when the instance is stopped or terminated
- Can be more expensive than EBS volumes

**Performance comparison of EC2 Instance Store and EBS volumes**

|Storage type|Read IOPS|Write IOPS|
|---|---|---|
|EC2 Instance Store|3.3 million (maximum)|1.4 million (maximum)|
|EBS volume (BP2)|32 thousand|

drive_spreadsheetExport to Sheets

**When to use EC2 Instance Store**

Use EC2 Instance Store when you need high I/O throughput and low latency, and you are willing to accept the risk of data loss if the instance is stopped or terminated.

**How to back up EC2 Instance Store data**

To back up EC2 Instance Store data, you can use one of the following methods:

- Create an EBS snapshot of the instance root volume.
- Use a third-party backup solution.
- Replicate the data to another instance or storage device.

**Conclusion**

EC2 Instance Store is a high-performance ephemeral storage device that is attached to some EC2 instances. It is a good choice for applications that require high I/O throughput and low latency, such as databases, caches, and scratch disks. However, it is important to note that data on EC2 Instance Store is lost when the instance is stopped or terminated, so it is important to back up your data regularly.