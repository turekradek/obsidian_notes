
#EC2
## Amazon EC2

	- EC2 is one of the most popular of AWS offering
	- EC2 = Elastic Compute CLoud = Onfrastructure as a Service 
	- It mainly consistes in the capability of:
		- Renting virtual machines (EC2)
		- Storing data on virtual drives (EBS)
		- Distributing load across machines (ELB)
		- Scaling the services using an auto-scaling group (ASG) 
	- Knowing EC2 is fundamental to understand how the Cloud workd

### EC2 sizing & configuration options
- [ ] Operating System: Linux, Windows Mac
- [ ] How much compute power & cores (CPU)
- [ ] How much random-access memory (RAM)
- [ ] How much storage space:
	- [ ] Network-attached (EBS & EFS)
	- [ ] hardware (EC2 Instance Store) 
- [ ] Network card: speed of the card, Public IP address
- [ ] Firewall rules: security group
- [ ] Bootstrap script (configure at first launch) : EC2 User Data


### EC2 instance types : example
| Instance | vCPU |  Mem (GiB) | Storage| Network Performance | EBS Bandwidth (Mbps)|
| - | - | - | - | - | - | 
| t2.micro | 1 | 1 | EBS-Only | Low to Moderate | |
| t2.xlarge | 4 | 16 | EBS-Only | Moderate | |
| c5d.4xlarge | 16 | 32| EBS-Only | Up to 10 Gbps | 4750 |
| r5.16xlarge | 64 | 512 | 1 x 400 NVMe SSD| 20 Gbps | 13 600 |
| m5.8xlarge | 32 | 128 | EBS-Only | 10 Gbps| 6 800 |

### tc.micro is part of the AWS free tier ( up to 750 hours per month)

