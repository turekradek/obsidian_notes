
**Introduction to VPC and subnets**

- **VPC (Virtual Private Cloud)** is a private network within the AWS cloud that allows you to deploy your resources in a secure and isolated environment.
    
- **Subnets** divide a VPC into smaller, more manageable networks. They are defined at the availability zone (AZ) level.
    

**Types of subnets**

- **Public subnets:** Allow resources to communicate with the internet and can be accessed from the internet.
    
- **Private subnets:** Cannot be accessed directly from the internet and are used to isolate resources that need to be more secure.
    

**Route tables**

- **Route tables** define how network traffic flows between subnets and the internet.
    
- **Public subnets** have a route to the internet gateway, allowing resources to access the internet.
    
- **Private subnets** can use a NAT gateway or NAT instance to access the internet while remaining private.
    

**Internet gateways and NAT gateways**

- **Internet gateways** enable resources in public subnets to communicate with the internet.
    
- **NAT gateways (Network Address Translation gateways)** allow resources in private subnets to access the internet without exposing their IP addresses.
    
- **NAT instances** provide the same functionality as NAT gateways but are self-managed.
    

**Default VPC**

- **Default VPC:** A VPC that is automatically created for each AWS account. It contains only public subnets.

**Key takeaways**

- VPCs and subnets are fundamental components of networking in AWS.
    
- Public subnets are used for resources that need to communicate with the internet.
    
- Private subnets are used for resources that need to be more secure.
    
- Route tables control how network traffic flows between subnets and the internet.
    
- Internet gateways and NAT gateways enable resources to access the internet while maintaining security.