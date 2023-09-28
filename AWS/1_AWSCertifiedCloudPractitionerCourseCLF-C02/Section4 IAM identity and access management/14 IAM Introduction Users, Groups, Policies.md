IAM = identity and Access management   Global service
- [ ] Root account created by default
- [ ] Users are people within your organization , and can be grouped

Group: Developers
- [ ] Alice 
- [ ] Bob

Group: Operations
- [ ] Pawel
- [ ] Marcin

Group: technik
- [ ] Alice
- [ ] Marcin

IAM Permissions
Users or Groups can be assigned JSON documents caled policies
```policies
{
	"Version":"2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"cloudwatch:ListMetrics",
				"cloudwatch:GetMetricStatistics",
				"cloudwatch:Describe*",
			]
			"Resource": "*"
		}
	]
}
```