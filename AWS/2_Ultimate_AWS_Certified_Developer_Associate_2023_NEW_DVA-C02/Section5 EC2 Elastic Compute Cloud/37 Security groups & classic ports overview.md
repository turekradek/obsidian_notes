## Introduction to Security Groups

- [ ] Security groups yet again, are going to be fundamental into doing network security in the AWS cloud.
- [ ] They will control how the traffic is allowed into and out of your EC2 instances.
      inbound trafic                       | - -------------------|
www   ------------------> SECURITY GROUP   | EC2 Instance         |
    < -------------------                 |
       Outbund traffic                    |- -------------------|
- [ ] Security groups only contain allow rules
- [ ] Security groups rules can reference by IP or by security group


- 22 = SSH (Secure Shell) - log into a Linux instance
- 21 FTP (File Transfer Protocol) - upload files into a file share
- 22 = SFTP (Secure File Transfer Protocol) = upload files using SSH
- 80 = HTTP - access unsecured websites
- 443 = HTTPS - access secured websites
- 3389 = RDP (Remote Desktop Protocol) - log into a Windows instance 