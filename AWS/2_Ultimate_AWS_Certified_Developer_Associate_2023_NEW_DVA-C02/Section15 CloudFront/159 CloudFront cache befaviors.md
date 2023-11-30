**Cache Behaviors in CloudFront**

Cache behaviors allow you to have different cache settings for different parts of your website. This can be useful for a variety of reasons, such as:

- **Serving different content from different origins.** For example, you could use one cache behavior to serve static content from an S3 bucket and another cache behavior to serve dynamic content from your web application.
- **Routing requests to different origins based on different criteria.** For example, you could use one cache behavior to route requests to your origin web server for all JPEG images, and another cache behavior to route requests to your S3 bucket for all other files.
- **Gating access to your content.** For example, you could use one cache behavior to redirect users to a login page if they are not signed in, and another cache behavior to serve content from your S3 bucket if they are signed in.
- **Maximizing cache hit ratio.** For example, you could use one cache behavior with a very long TTL for static content, and another cache behavior with a shorter TTL for dynamic content.

**How cache behaviors work**

When a user requests a file from CloudFront, CloudFront first checks to see if there is a cache behavior that matches the URL of the file. If there is, then CloudFront uses the settings of that cache behavior to process the request. If there is no cache behavior that matches the URL of the file, then CloudFront uses the settings of the default cache behavior.

**Creating cache behaviors**

You can create cache behaviors in the CloudFront console. To create a cache behavior, you need to specify the following:

- **Path pattern:** The URL pattern that the cache behavior should match.
- **Origin:** The origin that the cache behavior should use.
- **Cache policy:** The cache policy that the cache behavior should use.