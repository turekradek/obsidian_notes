- [ ] AMI = Amazon Machine Image
- [ ] AMI are a customization of an EC@ isntance
	- [ ] you add your own software, configuration, operating system, monitoring
	- [ ] faster boot/configuration time because all your software is pre-packaged
- [ ] AMI are built for a specific region (and can be copied across regions)
- [ ] You can launch EC2 instances from:
	- [ ] A Public AMI: AWS provided
	- [ ] your own AMI: you make and maintain them yourself
	- [ ] an AWS Marketpace AMI: an AMI someone else made ( and potentially sells)

- [ ] AMI Process () from an EC2 instance)
	- [ ] start an EC2 instance and customize it
	- [ ] stop the instance (for data integrity)
	- [ ] build an AMI - this will also create EBS snapshots
	- [ ] launch instances from other AMIs
	- [ ] 
- [ ] Instance
	- [ ] Image and templates
		- [ ] Create an Image
			- [ ] create


- [ ]   Used to automate the creation of Virtual Machines or container images
- [ ]  Automate the creation, maintain, validate and test EC2 AMIs
- [ ] can be run on a schedule ( weekly, whenever packages are updated)
- [ ] free service ( only pay for the underlying resources)


											Build Components applied                                    Test suite is run               
											(customize software on instance)                            ( is the AMI working, secure ?)           
													|                                                          |   
													|                                                          |   
EC2 Image Builder ---- create ----  > Builder EC2 instance   -------------> create New AMI----- Test EC2 instance ------AMI is distributed
																													  (can be multiple regions)
								