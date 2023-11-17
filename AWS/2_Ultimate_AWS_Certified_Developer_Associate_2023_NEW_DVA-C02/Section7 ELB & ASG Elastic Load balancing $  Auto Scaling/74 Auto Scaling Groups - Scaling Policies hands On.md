
##   
Automatic Scaling for Auto Scaling Groups (ASG)

There are three types of automatic scaling policies for ASG:

**1. Dynamic Scaling Policies:**

- **Target tracking scaling:** Automatically scales the ASG up or down to maintain a specified target metric value. This is the easiest and simplest to set up.
- **Simple scaling:** Scales the ASG up or down based on predefined thresholds.
- **Step scaling:** Scales the ASG up or down in a specified number of steps.

**2. Scheduled Actions:**

allows you to schedule scaling actions in the future based on events that you can predict and that you know in advance.

**3. Predictive Scaling Policies:**

Uses machine learning to forecast future demand and scales the ASG accordingly. This is the most advanced type of scaling policy and requires a history of data to be effective.

## Demonstrating a Target Tracking Scaling Policy

**Steps:**

1. Create a target tracking scaling policy with a target CPU utilization of 40%.
2. Set the maximum capacity of the ASG to 2 or 3.
3. Stress the EC2 instance to make the CPU utilization go to 100%.
4. Monitor the ASG and wait for the scaling action to occur.
5. Verify that the ASG has added a new instance.
6. Reboot the EC2 instance to make the CPU utilization go back to 0.
7. Monitor the ASG and wait for the scaling action to occur.
8. Verify that the ASG has terminated the additional instance.

## Target Tracking Scaling Policy Details:

- Creates two CloudWatch alarms, one for scaling out and one for scaling in.
- The scaling out alarm triggers when the CPU utilization is greater than 40% for 3 data points within 3 minutes.
- The scaling in alarm triggers when the CPU utilization is less than 28% for 15 data points.

## Cleanup:

- Delete the target tracking scaling policy.
- 