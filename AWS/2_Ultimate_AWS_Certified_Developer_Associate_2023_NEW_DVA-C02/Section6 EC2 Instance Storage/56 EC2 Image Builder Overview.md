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
								