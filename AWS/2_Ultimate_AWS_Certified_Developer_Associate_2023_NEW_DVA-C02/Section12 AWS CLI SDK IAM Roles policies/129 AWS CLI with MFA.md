**Using MFA with the AWS CLI**

- To use MFA with the AWS CLI, you must create a temporary session token using the STS GetSessionToken API.
    
- The STS GetSessionToken API requires the serial number of your MFA device, the token code from your MFA device, and the duration of the temporary session.
    
- The STS GetSessionToken API returns a new Access Key ID, Secret Access Key, and Session Token that you can use to make API calls to AWS.
    
- The temporary session token expires after the duration that you specified in the STS GetSessionToken API request.
    

**How to Create a Temporary Session Token with the AWS CLI**

2. Open a terminal window and type the following command:

```
aws sts get-session-token --serial-number <serial-number> --token-code <token-code>
```

3. Replace `<serial-number>` with the serial number of your MFA device.
    
5. Replace `<token-code>` with the token code from your MFA device.
    
7. The command will output your temporary credentials, including your Access Key ID, Secret Access Key, Session Token, and Expiration date.
    

**How to Use Temporary Credentials with the AWS CLI**

2. Save your temporary credentials to a file.
    
4. Configure the AWS CLI to use your temporary credentials by adding a profile to your `~/.aws/credentials` file.
    
6. Set the `AWS_PROFILE` environment variable to the name of the profile you created in step 2.
    
8. You can now use the AWS CLI to make API calls to AWS using your temporary credentials.
    

**Additional Notes**

- Using MFA with the AWS CLI is a more secure way to access AWS resources.
    
- Temporary session tokens expire after a specified duration, which helps to protect your AWS account from unauthorized access.
