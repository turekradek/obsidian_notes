
**Network Security**

By default, EC2 instances are accessible through their own security groups. However, it is often preferable to only access EC2 instances through an ALB. To do this, you can modify the inbound rules of the EC2 instance's security group to only allow traffic from the security group of the ALB.

**Application Load Balancer Rules**

ALBs allow you to create rules that filter traffic based on various conditions, such as the host header, path, HTTP request method, source IP, query string, and HTTP header. You can use these rules to forward traffic to different target groups, redirect to specific URLs, or return fixed responses.

**Testing Rules**

Once you have created an ALB rule, you can test it by copying the DNS name of your ALB and adding the path pattern that you specified in the rule. For example, if you created a rule that forwards traffic to a specific target group for requests to the path "/error", you would test the rule by adding "/error" to the end of the DNS name.

**Priority of Rules**

ALBs allow you to define priorities for rules. The rule with the highest priority will be applied first, and the rule with the lowest priority will be applied last. If a condition is matched by multiple rules, the rule with the highest priority will win.

**Adding More Rules**

You can add as many rules as you want to an ALB. Each rule can have a different condition and action. You can use rules to create complex routing configurations for your applications.