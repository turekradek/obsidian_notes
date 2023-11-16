1. Auto Scaling group
	1. create auto scaling group
		1. launch template
		2. create a launch template
			1. Launch template name - required
			2. EVERYTHIN LIKE WITH INSTANCE CREATING
			3. User data [[ec2-user-dataTXT]]
		3. Next
		4. Chose instance launch options
			1. Availability Zones and subnets
				1. select multiple zones
			2. Next
		5. Configure advanced options
			1. Attach to an existing load balancer
			2. Existing load balancer target groups
				1. chose existing
			3. health checks 
				- [x] EC2
				- [x] ELB
		6. Configure group size and scaling policies 
			1. Group size
			2. Next
	2. CREATE
- [ ] Create on Auto Scaling groups
	- [ ] Activity
	- [ ] Instance management
		- [ ] you will see instances 

- [ ] EC2 instances
	- [ ] 2 instances are running after creating auto scaling group
	- [ ] 
- [ ] Auto scaling group
	- [ ] you can check if instances are created

**What are Auto Scaling Groups?**

Auto Scaling Groups (ASGs) are a feature of Amazon EC2 that allows you to automatically scale your fleet of EC2 instances up or down based on predefined criteria. This can help you to ensure that you have the right number of EC2 instances available to handle the load for your application, and can also help you to save money by only running the EC2 instances that you need.

**How do Auto Scaling Groups work?**

ASGs work by using a combination of launch templates, scaling policies, and health checks. Launch templates define the configuration of the EC2 instances that will be launched in the ASG. Scaling policies determine when and how to scale the ASG up or down. Health checks are used to monitor the health of the EC2 instances in the ASG and to terminate any unhealthy instances.

**How to create an Auto Scaling Group**

To create an Auto Scaling Group, you will need to create a launch template. This will contain information about the AMI, instance type, and other settings that will be used to launch new EC2 instances in the ASG.

You will also need to specify the minimum size, maximum size, and desired capacity of the ASG. The minimum size is the number of EC2 instances that will always be running in the ASG. The maximum size is the number of EC2 instances that can be running in the ASG at any given time. The desired capacity is the number of EC2 instances that the ASG will try to maintain.

**How to use Auto Scaling Groups with a load balancer**

ASGs can be used with load balancers to distribute traffic across multiple EC2 instances. The load balancer will also check the health of the EC2 instances in the ASG and terminate any unhealthy instances.

**How to scale an Auto Scaling Group**

ASGs can be scaled up or down manually or automatically. To scale an ASG manually, you can change the desired capacity of the ASG. To scale an ASG automatically, you can create scaling policies that will trigger based on predefined criteria.

**How to terminate an Auto Scaling Group**

To terminate an Auto Scaling Group, you can delete it. This will terminate all of the EC2 instances in the ASG and will deregister them from any load balancers that they are attached to.