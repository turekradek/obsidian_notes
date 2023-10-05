
**How to create a static website using Amazon S3:**

1. Create an S3 bucket.
2. Enable public reads on the bucket.
3. Upload the files for your website to the bucket.
4. Make sure the files have the correct permissions.
5. Visit the website URL in your web browser.

**Detailed notes:**

- The website URL will be depending on the AWS region where you create the bucket.
- You can use the AWS Console, the AWS CLI, or the AWS SDK to create an S3 bucket.
- To enable public reads on the bucket, go to the **Permissions** tab and untick the **Block all public access** checkbox.
- To upload the files for your website to the bucket, you can use the AWS Console, the AWS CLI, or the AWS SDK.
- Make sure the files have the correct permissions so that they can be accessed publicly.
- To visit the website URL in your web browser, copy the URL from the **Properties** tab of the bucket.

**Example:**

```
# Create an S3 bucket.
aws s3mb example-bucket s3://example-bucket

# Enable public reads on the bucket.
aws s3bu example-bucket

# Upload the files for your website to the bucket.
aws s3 cp index.html example-bucket/index.html

# Make sure the files have the correct permissions.
aws s3api put-object-acl --bucket example-bucket --key index.html --acl public-read

# Visit the website URL in your web browser.
http://example-bucket.s3-website-us-east-1.amazonaws.com/index.html
```

**Note:** You can also use Amazon CloudFront to serve your static website from Amazon S3. CloudFront is a content delivery network (CDN) that can improve the performance and reliability of your website.