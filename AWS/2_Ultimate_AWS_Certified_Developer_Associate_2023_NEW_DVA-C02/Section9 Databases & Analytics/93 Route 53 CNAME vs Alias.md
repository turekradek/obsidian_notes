
1

[

](https://github.com/bob-fornal/work-notes)

Sure, here are the key differences between CNAMEs and Aliases in AWS:

|Feature|CNAME|Aliases|
|---|---|---|
|Purpose|Points a hostname to any other hostname|Points a hostname to a specific AWS Resource|
|Use cases|Non-root domain names|Root and non-root domain names|
|Cost|Not free|Free|
|Health checks|Not native|Native|
|Targets|Any domain name|Elastic Load Balancers, CloudFront Distributions, API Gateway, Elastic Beanstalk environments, S3 Websites, VPC Interface Endpoints, Global Accelerator, Route 53 records in the same hosted zone|
|Apex support|No|Yes|
|TTL|Can be set|Automatically set by Route 53|

drive_spreadsheetExport to Sheets

In general, aliases are a better choice for pointing a hostname to an AWS Resource because they are free, have native health checks, and can be used for both root and non-root domain names. However, CNAMEs are still useful for pointing a hostname to any other hostname, including non-AWS resources.

Here is a table summarizing the steps for creating a CNAME and an Alias record:

|Record Type|Steps|
|---|---|
|CNAME|1. Create a new record. 2. Set the record type to CNAME. 3. Enter the value of the hostname you want to point to. 4. Save the record.|
|Alias|1. Create a new record. 2. Set the record type to A. 3. Select the Alias target. 4. Choose the AWS Resource you want to point to. 5. Save the record.|




