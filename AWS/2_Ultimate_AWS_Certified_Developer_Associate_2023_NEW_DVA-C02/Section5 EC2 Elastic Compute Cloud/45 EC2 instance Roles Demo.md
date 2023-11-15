- instance in terminal
- [[[AWS_Certified_Developer_Slides_v27.pdf]]]

##   
EC2 Instances Purchasing Options

### Summary

- **On-demand:** Pay for what you use, no upfront payments or long-term commitments. Good for short-term and unpredictable workloads.
- **Reserved instances:** Commit to a specific instance type, region, tenancy, and OS for one or three years to get up to 72% discounts. Good for steady-state workloads.
- **Convertible reserved instances:** Similar to reserved instances, but you can change the instance type, instance family, OS, scope, and tenancy. Good for workloads that require flexibility.
- **Savings plans:** Commit to a specific amount of usage in dollars for one or three years to get up to 70% discounts. Good for long-term workloads.
- **Spot instances:** Get up to 90% discounts by bidding on unused EC2 capacity. Good for workloads that are resilient to failure.
- **Dedicated hosts:** Book an entire physical server and control instance placements. Good for workloads with compliance requirements or that need to use existing server-bound software licenses.
- **Dedicated instances:** Instances that run on hardware that's dedicated to you. Good for workloads that require isolation or access to the physical server.
- **Capacity reservations:** Reserve on-demand instances in a specific AZ for any duration. Good for short-term uninterrupted workloads that need to be in a specific AZ.

### Price Comparison

| Purchasing option | Discount |
|---|---|
| On-demand | 0% | 
| Spot instances | Up to 90% | 
| Reserved instances | Up to 72% | 
| Convertible reserved instances | Up to 66% | 
| Savings plans | Up to 70% |
| Dedicated hosts | On-demand price |
| Dedicated host reservation | Up to 70% |
| Capacity reservation | On-demand price |

### Choosing the Right Purchasing Option

The best purchasing option for you will depend on your specific needs and workloads. Here are some general guidelines:

- If you have short-term and unpredictable workloads, on-demand is a good option.
- If you have steady-state workloads, reserved instances or savings plans can save you money.
- If you need flexibility, convertible reserved instances are a good option.
- If you need to isolate your workloads or access the physical server, dedicated hosts or dedicated instances are good options.
- If you have short-term uninterrupted workloads that need to be in a specific AZ, capacity reservations are a good option.

If you are unsure which purchasing option is right for you, you can use the AWS Pricing Calculator to compare costs.