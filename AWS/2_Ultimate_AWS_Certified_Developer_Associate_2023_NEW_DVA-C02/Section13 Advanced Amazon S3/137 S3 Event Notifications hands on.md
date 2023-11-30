**S3 Event Notifications**

- S3 Event Notifications allow you to react to events happening in Amazon S3.
    
- Events can be sent to SQS queues, SNS topics, or Lambda functions.
    
- You can create an event notification without having to create a destination first, but you will need to create the destination and update its access policy to allow Amazon S3 to send messages to it.
    
- S3 Event Notifications can be used to automate tasks, such as creating thumbnails from uploaded images.
    
- You can send all events to Amazon EventBridge for further processing and sending to over 18 different AWS services.