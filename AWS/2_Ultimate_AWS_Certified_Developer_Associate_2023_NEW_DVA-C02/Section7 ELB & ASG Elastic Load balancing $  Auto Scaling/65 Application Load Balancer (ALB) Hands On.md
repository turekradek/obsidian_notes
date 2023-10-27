### Application Load balancer

- [ ] launch instance (2) 
- [ ] security group
	- [ ] user data [[ec2-user-dataTXT]]
- [ ] copy IP of both instances
- [ ] Load Balancing
	- [ ] create Load balancer 
		- [ ] ALB
			- [ ] Load balancer Name
			- [ ] internet-facing
			- [ ] ipv4
			- [ ] Network mapping 
				- [ ] check zones 
			- [ ] Security group
				- [ ] group only for HTTP traffic from anywhere
			- [ ] Listeners and routing
				- [ ] Protocol: HTTP  Port: 80   Default action: select a target group ( group of instances )
					- [ ] create target group
						- [ ] Basic configuration
							- [ ] instances together
							- [ ] target group name
							- [ ] Protocol, Port
							- [ ] Protocol version (HTTP1)  NEXT
					- [ ] Register targets 
						- [ ] Both instances 
						- [ ] Include as pending below 
					- [ ] CREATE TARGET GROUP - when created 
				- [ ] Default 
			- [ ] CREATE LOAD BALANCER 

DNS NAME IT IS ME URL AFTER CRATING LOAD BALANCER ( MENU LOAD BALANCER )