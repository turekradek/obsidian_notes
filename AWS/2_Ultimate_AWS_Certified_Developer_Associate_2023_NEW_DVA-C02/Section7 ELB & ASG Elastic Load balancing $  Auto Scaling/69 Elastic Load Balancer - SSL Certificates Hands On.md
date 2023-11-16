**How to enable SSL certificates on ALB**

1. Add a listener with the following configuration:
    - Protocol: HTTPS
    - Port: 443
    - Default action: Forward to a specific target group
2. Set a SSL security policy based on your compatibility needs.
3. Choose the location of the SSL or TLS certificate:
    - ACM (recommended)
    - IAM (not recommended)
    - Import the certificate directly

**How to enable SSL certificates on NLB**

1. Add a listener with the following configuration:
    - Protocol: TLS
    - Port: 443
    - Default action: Forward to a target group
2. Set a security policy based on your compatibility needs.
3. Choose the location of the SSL or TLS certificate:
    - ACM (recommended)
    - IAM (not recommended)
    - Import the certificate directly
4. Set an application layer protocol negotiation (optional)