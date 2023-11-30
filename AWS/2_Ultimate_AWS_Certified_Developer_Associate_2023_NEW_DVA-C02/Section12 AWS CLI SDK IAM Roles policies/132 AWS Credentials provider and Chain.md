**Credentials Provided Chain in AWS**

- When using the AWS CLI, credentials are searched for in the following order:
    
    2. Command-line options
    4. Environment variables
    6. CLI credentials file
    8. CLI configuration file
    10. Container credentials
    12. EC2 instance profile credentials
    
- The most prioritized credentials are those specified in the command-line options, followed by the environment variables. The least prioritized credentials are those from the EC2 instance profile or ECS container credentials.
    
- In the AWS SDK, the credentials search order is similar:
    
    2. Java system properties
    4. Environment variables (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY)
    6. Default credential profile file
    8. Amazon ECS container credentials
    10. Instance profile file credentials
    
- Environment variables still have a higher precedence over EC2 instance profile credentials in the AWS SDK.
    
- It is crucial to prioritize IAM roles and instance profiles over environment variables to ensure least privilege access and prevent unauthorized access.
    
- Credentials should never be stored directly in code. Instead, they should be inherited from the credentials provided chain or specified using environment variables or named profiles.