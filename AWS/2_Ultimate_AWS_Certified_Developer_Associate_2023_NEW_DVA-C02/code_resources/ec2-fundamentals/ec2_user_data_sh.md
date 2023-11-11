
```ec2-user-data.sh

#!/bin/bash  
# Use this for your user data (script from top to bottom)  
# install httpd (Linux 2 version)  
yum update -y  
yum install -y httpd  
systemctl start httpd  
systemctl enable httpd  
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html%

```

[[AWS/2_Ultimate_AWS_Certified_Developer_Associate_2023_NEW_DVA-C02/Section5 EC2 Elastic Compute Cloud/35 Create an EWC2 Instance with EC2 user data to have a website hands on|35 Create an EWC2 Instance with EC2 user data to have a website hands on]]
