```ec2-user-data.sh
#!/bin/bash

# Use this for your user data (script from top to bottom)

# install httpd (Linux 2 version)

yum update -y

yum install -y httpd

systemctl start httpd

systemctl enable httpd

echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
```
[[AWS/1_AWSCertifiedCloudPractitionerCourseCLF-C02/code_v2022-12-16/ec2-fundamentals/ec2-user-data.sh|ec2-user-data]]
# this script will run once during start instance