**Network ACLs (Network Access Control Lists)**

- Firewall that controls traffic from and to the subnets.
    
- Allow and deny rules.
    
- Attached at the subnet level.
    
- Rules only include IP addresses.
    
- First mechanism of defense for public subnets.
    

**Security Groups**

- Firewall that controls traffic to and from an ENI (Elastic Network Interface) or an EC2 instance.
    
- Allow rules only.
    
- Can reference IP addresses or other security groups.
    
- Attached to an EC2 instance or an ENI.
    
- Second mechanism of defense for public subnets.
    

**Key differences between Network ACLs and Security Groups:**

- Network ACLs are attached at the subnet level, while Security Groups are attached to instances or ENIs.
    
- Network ACLs can have allow and deny rules, while Security Groups only have allow rules.
    
- Network ACLs are stateful, meaning that any return traffic from allowed inbound traffic is automatically allowed, while Security Groups require explicit rules for both inbound and outbound traffic.
    

**VPC Flow Logs**

- Capture information about all IP traffic going into your interfaces.
    
- Include VPC flow logs, subnet flow logs, and ENI flow logs.
    
- Help you monitor and troubleshoot connectivity issues.
    
- Can be sent to Amazon S3, CloudWatch Logs, or Kinesis Data Firehose.
    

**Additional notes:**

- Default VPCs have default NACLs that allow all traffic in and out.
    
- VPC flow logs are useful for debugging network connectivity issues.
    
- VPC flow logs can be sent to various AWS services for further analysis.

View other drafts


![](https://www.gstatic.com/lamda/images/sparkle_resting_v2_darkmode_2bdb7df2724e450073ede.gif)

|Feature|Network ACLs|Security Groups|
|---|---|---|
|Attachment level|Subnet level|Instance or ENI level|
|Rule type|Allow and deny|Allow only|
|Statefulness|Stateful (return traffic is automatically allowed)|Non-stateful (explicit rules required for both inbound and outbound traffic)|
|Purpose|First mechanism of defense for public subnets|Second mechanism of defense for public subnets|
|Additional notes|Default VPCs have default NACLs that allow all traffic in and out.|Useful for debugging network connectivity issues.|
|Data destination|Amazon S3, CloudWatch Logs, or Kinesis Data Firehose|-|

