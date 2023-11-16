|Concept|Definition|Features|
|---|---|---|
|High availability|Having applications across multiple availability zones|ELB distributes traffic across backend EC2 instances spread out across multiple availability zones|
|Scalability|Ability to increase or decrease resources to meet demand|Vertical scaling: increasing the size of an instance; Horizontal scaling: increasing the number of instances|
|Elasticity|Ability to scale up and down automatically based on demand|Auto scaling groups scale EC2 instances based on demand|
|Agility|Ability to create and delete resources quickly|Cloud computing makes it possible to create and delete resources very quickly|

  

|Concept|Definition|Features|
|---|---|---|
|High availability|Having applications across multiple availability zones|ELB distributes traffic across backend EC2 instances spread out across multiple availability zones|
|Scalability|Ability to increase or decrease resources to meet demand|Vertical scaling: increasing the size of an instance; Horizontal scaling: increasing the number of instances|
|Elasticity|Ability to scale up and down automatically based on demand|Auto scaling groups scale EC2 instances based on demand|
|Agility|Ability to create and delete resources quickly|Cloud computing makes it possible to create and delete resources very quickly|

drive_spreadsheetExport to Sheets

**ELB**

- Distributes traffic across backend EC2 instances
- Supports health checks to ensure backend EC2 instances are healthy
- Four types of load balancers:
    - Classic load balancer (old and retired)
    - Application load balancer (HTTP type of workload at layer seven)
    - Network load balancer (very high performance and TCP level load balancing at layer four)
    - Gateway load balancer (routes the network itself, and makes it go by, for example, through some virtual appliances, at layer three)

**ASG**

- Allows us to implement elasticity for our application
- Spreads load across multiple availability zones and scales accordingly
- Scales EC2 instances based on demand
- Can replace unhealthy instances

**Tight integration between ASG and ELB**

- ELB can be attached to an ASG to distribute traffic across the ASG's EC2 instances
- ASG can scale up or down the number of EC2 instances based on demand, which ELB will then take into account when distributing traffic

**Benefits of using ELB and ASG together**

- High availability: ELB distributes traffic across multiple EC2 instances, so that if one instance fails, traffic can still be routed to other healthy instances.
- Scalability: ASG can scale up or down the number of EC2 instances based on demand, so that your application can handle changes in traffic load.
- Elasticity: ASG can automatically scale up or down the number of EC2 instances based on demand, so that you don't have to manually manage scaling.
- Agility: You can quickly create and delete ELB and ASG resources, so that you can quickly deploy and scale your applications.

Overall, ELB and ASG are a powerful combination that can help you to achieve high availability, scalability, elasticity, and agility in the Cloud.
