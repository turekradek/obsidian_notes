**Generating Keys to Sign URLs with CloudFront**

There are two ways to generate keys to sign URLs with CloudFront:

2. **Using a trusted key group:** This is the recommended way to generate keys. It is more secure and can be automated using the CloudFront API.
4. **Using a CloudFront key pair:** This is the old way to generate keys. It is less secure and cannot be automated using the CloudFront API.

**How to Generate Keys Using a Trusted Key Group**

2. Create a trusted key group in CloudFront.
4. Generate a public and private key pair.
6. Upload the public key to CloudFront.

**How to Generate Keys Using a CloudFront Key Pair**

2. Log in to the AWS Management Console as the root user.
4. Go to **Security Credentials** > **CloudFront Key Pairs**.
6. Create a new key pair or upload your own key pair.

**Additional Notes**

- You can use IAM for API security around the management of trusted key groups and API keys.
- You can leverage the APIs to create and rotate trusted key groups and API keys.
- You can use CloudFront signed URLs with any origin, not just S3.
- You can leverage all of the caching features of CloudFront when using signed URLs.