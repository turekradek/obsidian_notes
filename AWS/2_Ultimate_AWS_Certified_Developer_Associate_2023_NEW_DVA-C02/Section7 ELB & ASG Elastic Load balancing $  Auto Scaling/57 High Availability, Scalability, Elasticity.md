### Vertical scalibility 
tc.micro ---> tc.2xlarge

### Horizontal Scalability
increase numbers of instances 

  
Sure, here is a summary of the lecture on scalability and high availability:

**Scalability**

Scalability is the ability of a system to handle increasing workload by adapting. There are two types of scalability:

- **Vertical scalability:** Increasing the size of an instance. This is like upgrading a junior operator to a senior operator.
- **Horizontal scalability:** Increasing the number of instances. This is like hiring more operators.

**High Availability**

High availability is the ability of a system to continue operating even if one or more components fail. This is typically achieved by running the system in multiple data centers or availability zones.

**When to Use Each Type of Scalability**

- **Vertical scalability** is typically used for non-distributed systems, such as databases.
- **Horizontal scalability** is typically used for distributed systems, such as web applications.

**High availability** is typically used for systems that are critical to business operations.

**Examples of Scalability and High Availability in AWS**

- **Vertical scalability:** You can vertically scale an EC2 instance by upgrading the instance type.
- **Horizontal scalability:** You can horizontally scale an EC2 instance by creating a new instance and adding it to an Auto Scaling group.
- **High availability:** You can make an EC2 instance highly available by running it in multiple Availability Zones.