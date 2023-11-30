**Cache Behaviors and Invalidations in CloudFront**

**Table**

|Feature|Description|
|---|---|
|Cache Behavior|Defines how content is cached for a specific URL pattern.|
|Cache Key|Specifies which HTTP headers, cookies, and query strings are used to identify cached objects.|
|Time to Live (TTL)|Controls how long an object is cached.|
|Origin Request Policy|Controls which HTTP headers, cookies, and query strings are added to requests to the origin.|
|Invalidation|Forces CloudFront to fetch new content from the origin.|

drive_spreadsheetExport to Sheets

**Steps**

2. Create a cache behavior for a specific URL pattern.
4. Define a cache policy to specify the cache key and TTL.
6. Optionally, create an origin request policy to add headers, cookies, or query strings to origin requests.
8. Create invalidations to force CloudFront to fetch new content from the origin.

**Additional Notes**

- The default cache behavior applies to all URLs that do not match a specific cache behavior.
- You can use cache behaviors to maximize cache hit ratio, gate access to content, and route requests to different origins.
- Use invalidations to force CloudFront to fetch new content from the origin after you have updated the content.