**Amazon S3 Pre-Signed URLs**

- Pre-signed URLs are URLs that you can generate using the S3 console, the CLI, or the SDK.
- The URL has an expiration time of up to 168 hours.
- Pre-signed URLs can be used to give users outside of AWS temporary access to one specific file in an S3 bucket.
- Pre-signed URLs are a very common use case when it comes to temporary access to one specific file for download or even for upload.
- Examples of use cases for pre-signed URLs include:
    - Allowing logged-in users to download a premium video from your S3 bucket.
    - Allowing an ever-changing list of users to download files by generating URLs dynamically.
    - Allowing a user to temporarily upload a file to a precise location in your S3 bucket, while maintaining your S3 bucket private.