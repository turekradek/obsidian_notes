**Real-time logs in CloudFront**

- CloudFront can send all requests to a Kinesis Data Stream in real time.
- This can be used to monitor, analyze, and take actions based on content delivery performance.
- To enable real-time logs, you need to create a Kinesis Data Stream and then configure CloudFront to send logs to it.
- You can use a Lambda function to process the records in your Kinesis Data Stream.
- If you need to do near real-time processing, you can use Kinesis Data Firehose to process the records in batches and send them to another destination, such as Amazon S3 or Open Search.
- You can choose the sampling rate, which is the percentage of requests you want to receive in your Kinesis Data Stream.
- You can also specify which fields and which cache behaviors or path patterns you want to have access to in your Kinesis Data Stream.

**Additional notes:**

- Real-time logs can be helpful for troubleshooting content delivery issues.
- Real-time logs can also be used to track user activity and identify trends.
- Real-time logs can be used to trigger automated actions, such as sending notifications or scaling your CloudFront distribution.