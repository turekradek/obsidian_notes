

**What are SSL and TLS certificates?**

SSL (Secure Sockets Layer) and TLS (Transport Layer Security) certificates are used to encrypt traffic between a client and a server. This means that the data that is exchanged between the two parties is scrambled and cannot be read by anyone who intercepts it.

**How do SSL and TLS certificates work?**

When a client connects to a server that has an SSL or TLS certificate, the two parties go through a handshake process. During this handshake, the server sends its certificate to the client. The client then verifies the certificate to make sure that it is valid. If the certificate is valid, the client and server will establish an encrypted connection.

**Benefits of using SSL and TLS certificates**

- **Increased security:** SSL and TLS certificates help to protect your data from being intercepted and read by unauthorized parties.
- **Improved trust:** SSL and TLS certificates help to improve user trust in your website by showing that you are taking steps to protect their data.
- **SEO benefits:** Google and other search engines give preference to websites that use SSL and TLS certificates.

**How to manage SSL and TLS certificates in AWS**

You can manage SSL and TLS certificates in AWS using AWS Certificate Manager (ACM). ACM is a free service that makes it easy to request, manage, and renew SSL and TLS certificates for your AWS resources.

**What is SNI?**

SNI (Server Name Indication) is a protocol that allows a client to specify the hostname that they want to connect to in the initial SSL handshake. This allows a web server to load multiple SSL certificates onto one IP address.

**What load balancers support SNI?**

The following load balancers support SNI:

- Application Load Balancer (ALB)
- Network Load Balancer (NLB)

The Classic Load Balancer does not support SNI.

**How to use SNI with ALB and NLB**

To use SNI with ALB and NLB, you need to create an HTTPS listener and specify a default certificate. You can then add an optional list of certificates to support multiple domains. Clients can use SNI to specify the hostname that they want to connect to, and the load balancer will use the appropriate certificate.

**What is supported for SSL certificates?**

The following load balancers support multiple SSL certificates:

- Application Load Balancer (ALB) v2
- Network Load Balancer (NLB)

The Classic Load Balancer only supports one SSL certificate.

I hope this summary is helpful!