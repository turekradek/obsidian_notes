**AWS Limits**

- AWS has two types of limits: API Rate Limits and Service Quotas.
    
- **API Rate Limits** limit how many times you can call an AWS API in a given period of time. For example, the DescribeInstances API for Amazon EC2 has a limit of 100 calls per second.
    
- **Service Quotas** limit the number of resources you can run of a particular type. For example, you can run up to 1,152 virtual CPUs (vCPUs) in your On-Demand Standard Instances account.
    
- If you exceed an API Rate Limit, you will receive an **ThrottlingException**. This is not a fatal error, and you can recover from it by using **Exponential Backoff**.
    
- Exponential Backoff is a technique where you wait a certain amount of time before retrying an API call. You start with a small amount of time, and you double the amount of time each time you retry. This helps to ensure that you do not overwhelm the AWS service with your requests.
    
- You should only use Exponential Backoff for **server errors** (errors with a code starting with 5), not for **client errors** (errors with a code starting with 4).
    
- The AWS SDK includes a built-in retry mechanism that implements Exponential Backoff. If you are using the SDK, you do not need to implement your own Exponential Backoff logic.