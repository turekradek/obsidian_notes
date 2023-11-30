**How Caching Works in CloudFront**

**Table**

|Feature|Description|
|---|---|
|Cache|Stores content at each CloudFront edge location.|
|Cache Key|Unique identifier for each object in the cache.|
|Cache Policy|Controls how the Cache Key is created.|
|Time to Live (TTL)|Controls how long an object is cached.|
|Origin Request Policy|Controls what information is sent to the origin.|
|Custom HTTP Headers|Can be added to origin requests.|

drive_spreadsheetExport to Sheets

**Steps**

2. A request is made through a CloudFront edge location.
4. The edge location checks if the object is cached.
6. If the object is cached and has not expired, a cached result is returned.
8. If the object is not cached or has expired, the request is forwarded to the origin.
10. The response from the origin is cached into the edge location.
12. Future requests for the same object return a cached result.

**Additional Notes**

- You can enhance the Cache Key by adding HTTP headers, cookies, or query strings.
- You can use predefined managed policies or create your own cache policies.
- HTTP headers, cookies, and query strings that are included in the Cache Key are automatically forwarded to the origin.
- You can define an origin request policy to include extra HTTP headers, cookies, or query strings in the origin request.
- Custom HTTP headers or CloudFront HTTP headers can be added to the origin request, even though they were not present in the viewer request.