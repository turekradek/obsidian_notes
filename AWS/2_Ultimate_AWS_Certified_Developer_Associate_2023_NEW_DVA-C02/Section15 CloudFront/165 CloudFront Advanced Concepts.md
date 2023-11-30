**Pricing and Price Classes**

- CloudFront edge locations are all around the world, and the cost of data out per edge location varies depending on the continent or geographic region.
- There are three price classes available: All, 200, and 100. Price class All gives you the best performance and includes all regions, but it is also the most expensive. Price class 200 excludes the most expensive regions, and price class 100 only includes the least expensive regions.

**Multiple Origins**

- You can use multiple origins in CloudFront to redirect and route to different kinds of origins based on the content type or the path being passed to CloudFront.
- For example, you could have one origin for images, one origin for the API, and one origin for everything else.

**Origin Groups**

- You can use origin groups to increase high availability and do failover in case one origin has failed.
- An origin group consists of one primary origin and one secondary origin.
- If the primary origin fails, CloudFront will try to failover to the secondary origin.

**Field-Level Encryption**

- Field-level encryption is an additional layer of security that can be used to protect sensitive information.
- It uses asymmetric encryption to encrypt sensitive fields in POST requests.
- Only the web server has access to the private key, so the encrypted fields can only be decrypted by the web server.