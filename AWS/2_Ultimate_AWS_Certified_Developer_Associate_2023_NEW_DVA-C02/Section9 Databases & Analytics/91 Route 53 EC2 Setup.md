

Sure, here is a summary of the lecture on setting up EC2 instances and an Application Load Balancer (ALB):

**Setting up EC2 Instances and an Application Load Balancer (ALB)**

2. Launch EC2 instances in three different regions: Frankfurt, Northern Virginia, and Singapore.
4. For each instance, choose Amazon Linux 2, T2 micro instance type, no key pair, and allow SSH and HTTP from anywhere.
6. In the advanced details, specify the bootstrap user data script to display the instance's availability zone.
8. Launch an Application Load Balancer (ALB) in Frankfurt.
10. Name the ALB "DemoRoute53ALB" and configure it to be internet-facing on IPv4.
12. Map the ALB to the three subnets you created earlier.
14. Choose the security group that allows AWS and HTTP traffic.
16. Forward traffic on port 80 to a new target group named "demo tg route 53".
18. Register the EC2 instance in Frankfurt to the target group.
20. Create the load balancer and view it in the console.
22. Test each EC2 instance by copying its public IP address and accessing it via HTTP.
24. Verify that the ALB DNS name is provisioned and that it points to the EC2 instance in Frankfurt.

**Next Steps**
