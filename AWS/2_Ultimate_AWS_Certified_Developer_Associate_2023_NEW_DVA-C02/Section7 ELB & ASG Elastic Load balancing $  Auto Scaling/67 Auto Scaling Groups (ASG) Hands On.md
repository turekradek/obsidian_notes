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
	- [ ] 