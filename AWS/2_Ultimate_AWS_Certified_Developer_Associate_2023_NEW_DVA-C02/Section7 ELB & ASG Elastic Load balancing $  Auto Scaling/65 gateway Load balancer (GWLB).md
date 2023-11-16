**What is a Gateway Load Balancer (GLB)?**

A Gateway Load Balancer (GLB) is a type of load balancer that operates at the network layer (Layer 3) and is designed to distribute traffic across a group of third-party network virtual appliances. This allows you to inspect and modify network traffic before it reaches your applications.

**When to Use a GLB**

You would use a GLB if you want to:

- Inspect all network traffic before it reaches your applications.
- Modify network traffic at the network level.
- Use third-party network virtual appliances to provide additional security or functionality.

**How Does a GLB Work?**

A GLB works by routing all traffic in your VPC through a single entry and exit point. This entry and exit point is the GLB itself. The GLB then distributes the traffic across a group of target groups, which are collections of third-party network virtual appliances.

**Target Groups for GLBs**

Target groups for GLBs can be either EC2 instances or private IP addresses. EC2 instances are registered with the GLB by instance ID, while private IP addresses are registered manually.

**Key Points about GLBs**

- GLBs operate at Layer 3, which is the network layer.
- GLBs use the GENEVE protocol on port 6081.
- GLBs can target EC2 instances or private IP addresses.
**What is a Gateway Load Balancer (GLB)?**

A Gateway Load Balancer (GLB) is a type of load balancer that operates at the network layer (Layer 3) and is designed to distribute traffic across a group of third-party network virtual appliances. This allows you to inspect and modify network traffic before it reaches your applications.

**When to Use a GLB**

You would use a GLB if you want to:

- Inspect all network traffic before it reaches your applications.
- Modify network traffic at the network level.
- Use third-party network virtual appliances to provide additional security or functionality.

**How Does a GLB Work?**

A GLB works by routing all traffic in your VPC through a single entry and exit point. This entry and exit point is the GLB itself. The GLB then distributes the traffic across a group of target groups, which are collections of third-party network virtual appliances.

**Target Groups for GLBs**

Target groups for GLBs can be either EC2 instances or private IP addresses. EC2 instances are registered with the GLB by instance ID, while private IP addresses are registered manually.

**Key Points about GLBs**

- GLBs operate at Layer 3, which is the network layer.
- GLBs use the GENEVE protocol on port 6081.
- GLBs can target EC2 instances or private IP addresses.