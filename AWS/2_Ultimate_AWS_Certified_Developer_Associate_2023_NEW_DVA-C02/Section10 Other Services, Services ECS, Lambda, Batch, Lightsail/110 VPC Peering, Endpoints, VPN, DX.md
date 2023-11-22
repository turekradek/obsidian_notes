**VPC Peering**

- Connects two VPCs privately using the AWS network.
    
- Allows VPCs to behave as if they are in the same network.
    
- Must be established for each VPC that needs to communicate with one another.
    
- VPC peering connections are not transitive.
    
- IP ranges for each VPC must not overlap.
    

**VPC Endpoints**

- Allow you to connect to AWS services using a private network instead of the public internet.
    
- Provides enhanced security and lower latency.
    
- VPC Endpoint Gateway is for Amazon S3 and Amazon DynamoDB.
    
- VPC Endpoint Interface is for other AWS services.
    

**Site-to-Site VPN**

- Connects an on-premises VPN appliance to AWS.
    
- Connection is automatically encrypted.
    
- Uses the public internet.
    
- Easy to set up.
    

**Direct Connect**

- Establishes a physical connection between an on-premises data center and AWS.
    
- Private connection.
    
- Secure and fast.
    
- Takes at least a month to establish.
    

**Additional notes:**

- VPC endpoints are useful for accessing AWS services from within a private subnet.
    
- Site-to-Site VPN is a good option for quickly establishing a connection between an on-premises data center and AWS.
    
- Direct Connect is a good option for establishing a private and secure connection between an on-premises data center and AWS.
