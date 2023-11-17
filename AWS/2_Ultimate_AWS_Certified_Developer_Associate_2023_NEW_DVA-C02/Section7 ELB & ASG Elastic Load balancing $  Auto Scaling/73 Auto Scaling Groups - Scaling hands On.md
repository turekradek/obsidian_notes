|Type of Scaling Policy|Description|
|---|---|
|Target tracking scaling|Automatically scales the ASG up or down to maintain a specified target metric value.|
|Simple scaling|Scales the ASG up or down based on predefined thresholds.|
|Step scaling|Scales the ASG up or down in a specified number of steps.|
|Scheduled scaling|Scales the ASG up or down at a specified time.|
|Predictive scaling|Uses machine learning to forecast future demand and scales the ASG accordingly.|

drive_spreadsheetExport to Sheets

Here is a summary of the different metrics that can be used to scale an Auto Scaling Group:

- CPU utilization
- Request counts per target
- Network in or out
- Custom metrics

Here is a summary of the scaling cooldown:

- The scaling cooldown is a period of time after a scaling action occurs during which the ASG will not launch or terminate additional instances.
- The default scaling cooldown is five minutes or 300 seconds.
- The scaling cooldown can be decreased to allow for more dynamic scaling.

Here are some additional tips for using Auto Scaling Groups:

- Use a ready-to-use AMI to reduce the configuration time for your EC2 instances.
- Enable detailed monitoring for ASG to get access to lower-level metrics.
- Make sure that your metrics are being updated fast enough.
|Topic|Description|
|---|---|
|SSL/TLS Certificates|Used to encrypt traffic between clients and load balancers.|
|SNI (Server Name Indication)|Allows for multiple SSL certificates to be loaded onto one web server.|
|AWS Certificate Manager (ACM)|Used to manage SSL certificates in AWS.|
|Application Load Balancer (ALB)|Supports multiple listeners with multiple SSL certificates and uses SNI.|
|Network Load Balancer (NLB)|Supports multiple listeners with multiple SSL certificates and uses SNI.|

drive_spreadsheetExport to Sheets

Here are the steps for loading multiple SSL certificates onto a load balancer:

1. Create an ALB or NLB.
2. Create a listener for each hostname that you want to serve.
3. Upload the SSL certificate for each hostname to ACM.
4. Attach the SSL certificate to the corresponding listener.
5. Configure routing rules to send traffic to the correct target group based on the hostname.

Here are some additional notes:

- SSL certificates have an expiration date and must be renewed regularly.
- Classic load balancers can only support one SSL certificate.
- SNI is not supported by all clients.
- SNI is required for ALB and NLB to load multiple SSL certificates.