**Signing HTTP Requests to AWS**

- When you make an API request to AWS, you must sign the request using SigV4 (Signature Version 4) to authenticate yourself and prove that you are authorized to make the request.
    
- SigV4 is a complex process, but you do not need to know the details of how it works. The AWS CLI and SDK will automatically sign your requests for you.
    
- There are two ways to transmit your signature to AWS:
    
    2. In the authorization header of the HTTP request
    4. In a query string parameter called X-Amz-Signature
    
- The AWS CLI uses the first method by default.
    
- The second method is less common, but it can be useful in some cases. For example, if you are using a web browser to access an object in Amazon S3, the browser will automatically sign the request using the second method.
    
- The lecture concludes with an example of how to sign an HTTP request using the second method.