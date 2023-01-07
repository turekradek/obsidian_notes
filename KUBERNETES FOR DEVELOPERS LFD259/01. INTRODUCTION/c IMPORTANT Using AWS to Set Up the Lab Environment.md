
https://aws.amazon.com/

- [ ] My Account
	- [ ] AWS Management Console
	- [ ] ec2 Dashboards

Success

Successfully initiated launch of instances ([i-09ceb386c6b0dabd8](https://eu-central-1.console.aws.amazon.com/ec2/home?region=eu-central-1#Instances:instanceId=i-09ceb386c6b0dabd8), [i-0aebb1814206b6172](https://eu-central-1.console.aws.amazon.com/ec2/home?region=eu-central-1#Instances:instanceId=i-0aebb1814206b6172))

putty 
amazon1
user: ubuntu 

get ssh key from aws cloud
convert if nessesery to file.pem
copy to correct directory 
run command below with path to correct directory with file.pem file

```connection_aws
ssh -i "amazon_1.pem" ubuntu@ec2-35-159-2-177.eu-central-1.compute.amazonaws.com
```

```
ssh -i "~/.ssh/amazon/amazon_1.pem" ubuntu@ec2-35-159-2-177.eu-central-1.compute.amazonaws.com
```
```
ssh -i "~/.ssh/amazon/amazon_1.pem" ubuntu@ec2-52-59-205-204.eu-central-1.compute.amazonaws.com
```

when I create instances I can choose 
- [ ] cerate key pair 
- [ ] chose an existing key pair
