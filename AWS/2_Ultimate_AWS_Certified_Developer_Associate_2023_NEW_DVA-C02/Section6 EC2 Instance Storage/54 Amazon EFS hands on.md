**Creating an EFS File System**

- Choose a name for your file system (optional).
- Select the availability and durability of your file system:
    - Regional: Data is replicated across multiple AZs.
    - One Zone: Data is stored redundantly only within a single AZ.
- Enable automated backups (recommended).
- Configure lifecycle management to transition infrequently accessed files to a lower-cost storage tier.

**Performance Settings**

- Choose a throughput mode:
    - Bursting: Throughput scales with storage usage.
    - Elastic: Provides all the I/O you need and scales automatically (recommended).
    - Provisioned: You specify the throughput you need upfront.
- Select an additional performance setting:
    - General Purpose: For latency-sensitive applications.
    - Max I/O: For highly parallelized workloads that can tolerate higher latency.

**Network Access Settings**

- Choose a VPC.
- Assign a security group to your file system.

**Review and Create File System**

- Review your file system settings and click **Create**.

**Mounting an EFS File System on an EC2 Instance**

- Launch an EC2 instance and select the appropriate subnet.
- Edit the file system settings for your EC2 instance.
- Add an EFS file system.
- Specify the mount point for the file system.
- Click **Create** to launch the EC2 instance.

**Verifying EFS File System Access from EC2 Instances**

- Connect to both EC2 instances using EC2 Instance Connect.
- Verify that the EFS file system is mounted at /mnt/efs/fs1 on both instances.
- Create a file named hello.txt on one EC2 instance.
- Verify that the hello.txt file exists on the other EC2 instance.

**Cleaning Up**

- Terminate the two EC2 instances.
- Delete the EFS file system.
- Delete the extra security groups that were created during the demo.

tuneshare

more_vert