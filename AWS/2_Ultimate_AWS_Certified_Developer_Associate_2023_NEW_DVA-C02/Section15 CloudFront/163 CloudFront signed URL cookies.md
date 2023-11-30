**Using CloudFront Signed URLs and Cookies for Private Content**

CloudFront signed URLs and cookies are a way to control access to private content on a CloudFront distribution. They can be used to give access to specific users or groups of users, and to control how long the access is valid for.

**When to Use Signed URLs vs. Cookies**

- **Use signed URLs:**
    
    - When you want to give access to individual files.
    - When you want to control access based on IP address or date.
    
- **Use signed cookies:**
    
    - When you want to give access to multiple files.
    - When you want to reuse the same cookie for multiple requests.
    

**How Signed URLs Work**

2. The user's browser sends a request to the CloudFront distribution.
4. CloudFront verifies the signature of the signed URL or cookie.
6. If the signature is valid, CloudFront returns the requested content.

**How to Set Up Signed URLs and Cookies**

2. Create a policy that specifies who can access the content, what content can be accessed, and how long the access is valid for.
4. Generate a signed URL or cookie using the policy.
6. Provide the signed URL or cookie to the user.

**Additional Notes**

- Signed URLs and cookies are more secure than using plain URLs, because they are tamper-proof.
- You can use CloudFront signed URLs with any origin, not just S3.
- You can leverage all of the caching features of CloudFront when using signed URLs.