**IMDS V1 vs. IMDS V2**

- IMDS V1 is the older version of the IMDS and is accessed directly at the URL 169.254.169.254.
    
- IMDS V2 is the newer version of the IMDS and is more secure. To access IMDS V2, you must first get a session token by using a PUT command and then call the IMDS URL with the token as a header.
    

**Retrieving Instance Metadata**

- IMDS V1 can be accessed by curling the URL 169.254.169.254.
    
- IMDS V2 requires a session token to be retrieved first. This can be done by curling the URL 169.254.169.254/latest/api/token.
    

**Retrieving IAM Credentials**

- To retrieve IAM credentials for the instance, curl the URL 169.254.169.254/instance-metadata/security-credentials/.

**Additional Notes**

- IMDS V2 is enabled by default on new EC2 instances.
    
- The IMDS provides a lot of information about the instance, such as its name, public IP, private IP, and IAM role name.
    
- The IMDS can also be used to retrieve credentials from the instance metadata.
- 
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-metadata-v2-how-it-works.html

First, generate a token using the following command.
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`

Then, use the token to generate top-level metadata items using the following command.
curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/

