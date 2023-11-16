
**What is an Application Load Balancer (ALB)?**

An Application Load Balancer (ALB) is a load balancer that distributes incoming traffic across multiple HTTP applications. It is a layer 7 load balancer, which means that it can operate at the application layer of the OSI model. This allows it to make routing decisions based on the content of the HTTP request, such as the URL, the headers, and the body.

**How to Launch an ALB**

1. Create a security group that allows HTTP traffic on port 80.
2. Create an ALB listener on port 80.
3. Create a target group for your EC2 instances.
4. Register your EC2 instances with the target group.
5. Create the ALB.

**What is a Target Group?**

A target group is a collection of EC2 instances that are used to serve traffic from an ALB. The ALB will send traffic to all of the healthy instances in the target group.

**How to Register EC2 Instances with a Target Group**

1. Go to the target group that you want to register your EC2 instances with.
2. Click on the "Register targets" button.
3. Select the EC2 instances that you want to register.
4. Click on the "Register" button.

**How to Test Your ALB**

1. Copy the DNS name of your ALB.
2. Paste the DNS name into a new web browser tab.
3. You should see a hello world message from one of your EC2 instances.

**What Happens When an EC2 Instance is Stopped?**

If an EC2 instance is stopped, it will be removed from the target group. The ALB will no longer send traffic to the stopped instance.

**What Happens When an EC2 Instance is Healthy Again?**

If an EC2 instance is healthy again, it will be added back to the target group. The ALB will start sending traffic to the healthy instance again.