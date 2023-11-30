**Cache Invalidations in CloudFront**

**Table**

|Feature|Description|
|---|---|
|Cache Invalidation|Forces an entire or partial cache refresh.|
|TTL (Time to Live)|Controls how long an object is cached.|
|Edge Location|Contains the cache for a CloudFront distribution.|
|Origin|The backend origin for a CloudFront distribution.|

drive_spreadsheetExport to Sheets

**Steps**

2. Update the backend origin.
4. Create a CloudFront invalidation.
6. Specify the file paths to invalidate.
8. CloudFront tells the edge locations to invalidate the files.
10. Edge locations remove the files from the cache.
12. Next time a user requests a file, CloudFront forwards the request to an edge location.
14. Edge location realizes the file is not in its cache.
16. Edge location requests the updated file from the origin.
18. User receives the updated file.

**Additional Notes**

- Use cache invalidations to force new content to be served as soon as possible.
- Use a star (*) to invalidate all files.
- Use a specific path to invalidate only certain files.
