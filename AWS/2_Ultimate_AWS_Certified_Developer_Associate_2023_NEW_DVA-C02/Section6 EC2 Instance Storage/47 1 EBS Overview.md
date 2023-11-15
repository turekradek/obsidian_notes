
strona 73 [[AWS_Certified_Developer_Slides_v27.pdf]]

##   
EBS Volumes

**What are EBS Volumes?**

EBS Volumes (Elastic Block Store) are network drives that you can attach to your EC2 instances while they run. They allow you to persist data, even after the instance is terminated.

**Features of EBS Volumes**

- Can only be mounted to one instance at a time
- Bound to a specific availability zone
- Can be detached from an EC2 instance and attached to another one very quickly
- Locked to a specific availability zones
- You have to provision capacity in advance

**Use Cases for EBS Volumes**

- Persisting data even after the instance is terminated
- Failovers
- High availability workloads
- Storing data that needs to be accessed by multiple instances

**Creating and Managing EBS Volumes**

To create an EBS Volume, you can use the AWS Console, AWS CLI, or AWS SDK. You can also create EBS Volumes when you launch an EC2 instance.

To manage EBS Volumes, you can use the AWS Console, AWS CLI, or AWS SDK. You can attach and detach EBS Volumes, create snapshots, and delete them.

**Deletes on Termination**

When you terminate an EC2 instance, the root EBS Volume is deleted by default. You can disable Delete on Termination for the root volume, or for any other attached EBS Volume.

## Diagram

[Diagram of EBS Volumes attached to EC2 instances in an availability zone]

**Conclusion**

EBS Volumes are a powerful storage option for EC2 instances. They provide persistent storage, high availability, and scalability.

| Feature | Description |
|---|---|---|
| Type | Network drive |
| Mounting | Can only be mounted to one instance at a time |
| Availability zone | Bound to a specific availability zone |
| Detachment | Can be detached from an EC2 instance and attached to another one very quickly |
| Locking | Locked to a specific availability zone |
| Provisioning | Capacity must be provisioned in advance |
| Cost | Billed for provisioned capacity |
| Use cases | Persisting data, failovers, high availability workloads, storing data that needs to be accessed by multiple instances |
| Creation and management | Can be created and managed using the AWS Console, AWS CLI, or AWS SDK |
| Deletes on Termination | Root EBS Volume is deleted by default when an EC2 instance is terminated. Can be disabled for the root volume or any other attached EBS Volume. |
