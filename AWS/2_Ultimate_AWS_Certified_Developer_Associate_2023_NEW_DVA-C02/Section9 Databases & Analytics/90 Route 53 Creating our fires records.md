**Creating DNS Records in Amazon Route 53**

2. Go to your hosted zone in the Amazon Route 53 console.
4. Click on "Create record" in the top-right corner.
6. Enter the record name. This is the domain name you want to create, such as `test.stephanetheteacher.com`.
8. Select the record type. Common record types include A (for IPv4 addresses), AAAA (for IPv6 addresses), CNAME (for aliases), and NS (for name servers).
10. Enter the record value. This is the value that the DNS record should point to, such as an IP address or a domain name.
12. Set the TTL (time to live). This is the amount of time that DNS resolvers should cache the record.
14. Choose the routing policy. This determines how traffic is routed to the record. The default routing policy is simple routing, which routes all traffic to the record.
16. Click on "Create record".

**Verifying DNS Records**

2. Open a terminal window.
4. Type the following command:

```
nslookup <record_name>
```

Replace `<record_name>` with the domain name of the record you created. 3. The output of the command should show the IP address that the record points to.

**Next Steps**

In the next lecture, you will learn how to route traffic to an EC2 instance using Route 53.