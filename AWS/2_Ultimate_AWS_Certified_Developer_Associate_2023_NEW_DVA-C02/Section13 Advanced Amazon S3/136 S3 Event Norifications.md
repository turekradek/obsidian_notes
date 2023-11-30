**S3 Event Notifications**

- S3 Event Notifications allow you to react to events happening in Amazon S3.
    
- Events such as object creation, deletion, restoration, and replication can be filtered to focus on specific objects or events.
    
- Event Notifications can be sent to SNS topics, SQS queues, Lambda functions, or Amazon Event Bridge.
    
- IAM permissions are required for Event Notifications to work. Resource access policies are attached to SNS topics, SQS queues, or Lambda functions to allow S3 to send data to these destinations.
    
- Amazon Event Bridge is a new integration that allows S3 Event Notifications to be sent to over 18 different AWS services. Event Bridge offers advanced filtering options, multiple destination support, and additional features such as event archiving, replay, and more reliable delivery.
    
- S3 Event Notifications are a versatile tool for automating tasks and reacting to events in Amazon S3.
SQS   Simple Queue Service
SNS   Simple Notification Service
