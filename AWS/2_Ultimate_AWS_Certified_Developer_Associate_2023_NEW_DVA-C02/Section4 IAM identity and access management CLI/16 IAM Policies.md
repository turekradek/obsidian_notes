```policies
{
	"Version":"2012-10-17",
	"Id": "S3-Account-Permissions",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"AWS": ["arn:aws:iam::123134567:root"]
			},
			"Action": [
				"cloudwatch:ListMetrics",
				"cloudwatch:GetMetricStatistics",
				"cloudwatch:Describe*",
			]
			"Resource": [ "arn:aws:s3:::mybucket/*"]
		}
	]
}
```