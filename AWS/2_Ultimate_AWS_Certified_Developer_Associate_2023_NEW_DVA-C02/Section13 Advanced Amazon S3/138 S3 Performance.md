  
  
Sure, here is a summary of the lecture on S3 Baseline Performance:

**S3 Baseline Performance**

- Amazon S3 automatically scales to a very high number of requests, with a low latency of 100 to 200 milliseconds to get the first byte out of S3.
    
- You can get 3,500 PUT/COPY/POST/DELETE requests per second per prefix, and 5,500 GET/HEAD requests per second per prefix in the buckets.
    
- There is no limit to the number of prefixes in your bucket.
    
- You can spread reads across all prefixes to achieve up to 22,000 requests per second for Head and Gets.
    

**S3 Performance Optimization**

- **Multi-part upload:** Recommended for files over 100 megabytes, and required for files over 5 gigabytes. Parallelizes uploads to maximize bandwidth.
    
- **S3 Transfer Acceleration:** Increases transfer speed for uploads and downloads by transferring a file to an AWS edge location, which then forwards the data to the S3 bucket in the target region.
    
- **S3 Byte Range Fetches:** Parallelizes Gets by getting specific byte ranges for your files. Also allows you to retry a smaller byte range in case of failures. Can be used to speed up downloads and to only retrieve a partial amount of the file.