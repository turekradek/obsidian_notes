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

  
Sure, here is a summary of the lecture on the Application Load Balancer (ALB):

**What is the Application Load Balancer (ALB)?**

The Application Load Balancer (ALB) is a layer 7 load balancer that distributes incoming traffic across multiple HTTP applications running on EC2 instances, containers, or IP addresses. It supports a variety of features, including:

- **Routing based on URL path, host name, query string, or headers:** This allows you to route traffic to different target groups based on the specific URL or request that the user is making.
- **Support for HTTP/2 and WebSockets:** This ensures that your applications can handle high-traffic workloads and real-time communication.
- **Port mapping for containers:** This allows you to route traffic to a specific port on an ECS container, even if the port is dynamically assigned.

**When to Use the ALB**

The ALB is a good choice for applications that:

- Are composed of multiple microservices or containers.
- Require high performance and scalability.
- Need to support features like HTTP/2 and WebSockets.

**How Does the ALB Work?**

The ALB works by distributing incoming traffic across multiple target groups. Each target group is a collection of EC2 instances, containers, or IP addresses. The ALB uses a variety of algorithms to route traffic to the target groups, including round-robin, weighted, and least connections.

**Health Checks**

The ALB can perform health checks on the target groups to ensure that they are healthy and available. If a target group is unhealthy, the ALB will stop sending traffic to it.

**Security**

The ALB can be configured to use different security groups to control access to the target groups. This can help to protect your applications from unauthorized access.

**Fixed Host Name**

The ALB is assigned a fixed host name that can be used to route traffic to the load balancer. This can be helpful for applications that require a consistent URL.

**Client IP Address**

The true IP address of the client is not visible to the application servers. Instead, the ALB inserts the client IP address into a header called X-Forwarded-For. This allows the application servers to track the origin of the requests.
