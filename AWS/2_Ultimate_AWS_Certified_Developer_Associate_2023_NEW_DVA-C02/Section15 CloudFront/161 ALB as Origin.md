**Accessing a Custom HTTP Backend in CloudFront**

There are two main patterns for accessing a custom HTTP backend in CloudFront:

2. **Using a public EC2 instance:**
    
    - The EC2 instance must be public so that the CloudFront edge locations can access it.
    - You must create a security group that allows the public IPs of the CloudFront edge locations to access the EC2 instance.
    
4. **Using an application load balancer (ALB):**
    
    - The ALB must be public so that the users can access it.
    - The backend EC2 instances can be private because there is private VPC connectivity between the ALB and the EC2 instances.
    - You must create a security group for the ALB that allows the public IPs of the CloudFront edge locations to access the ALB.
    - You must create a security group for the EC2 instances that allows the security group of the ALB to access the EC2 instances.
    

In both patterns, the users will be accessing the CloudFront edge locations. The CloudFront edge locations will then make requests to your custom HTTP backend, which could be a public EC2 instance or an ALB.