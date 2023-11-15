Elastic Load Balancing (ELB) Overview

**What is Load Balancing?**

A load balancer is a device or software that distributes incoming traffic across multiple servers. This helps to improve performance and reliability by ensuring that no single server is overloaded.

**Types of Load Balancers**

There are four types of managed load balancers on AWS:

- **Classic Load Balancer (CLB)**: The oldest generation of load balancer, which is still available but not recommended for new use cases.
- **Application Load Balancer (ALB)**: Supports HTTP, HTTPS, and WebSocket protocols.
- **Network Load Balancer (NLB)**: Supports TCP, TLS, security CP, and UDP protocols.
- **Gateway Load Balancer (GWLB)**: Operates at the network layer and supports IPv4 and IPv6 protocols.

**Why Use a Load Balancer?**

There are many reasons to use a load balancer, including:

- **Improved performance:** Load balancers can help to improve performance by distributing traffic evenly across multiple servers. This can help to reduce latency and improve response times.
- **Increased reliability:** Load balancers can help to increase reliability by detecting and automatically removing unhealthy servers from the pool of available servers. This can help to prevent outages and ensure that your applications are always available.
- **Scalability:** Load balancers can be easily scaled up or down to meet the changing demands of your application. This can help you to save money on infrastructure costs.

**Security Considerations for Load Balancers**

When using a load balancer, it is important to consider the security of your application. This includes making sure that your load balancer is configured to only allow traffic from authorized sources. You should also use security groups to restrict traffic between your load balancer and your EC2 instances.