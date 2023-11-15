**  
Summary of EBS volume types**

|Type|Description|Use cases|
|---|---|---|
|**gp2/gp3**|General purpose SSD volumes that balance price and performance|System boot volumes, virtual desktops, development and test environments|
|**io1/io2**|Provisioned IOPS SSD volumes for mission-critical, low-latency, and high-throughput workloads|Databases, other critical applications|
|**st1**|Throughput optimized HDD volumes for big data, data warehousing, and log processing|Workloads that require high throughput but not low latency|
|**sc1**|Cold HDD volumes for archived data that is infrequently accessed|Lowest cost storage option for data that is not frequently accessed|

drive_spreadsheetExport to Sheets

**Additional notes:**

- gp3 volumes can independently scale IOPS and throughput, while gp2 volumes link the two.
- io2 volumes are the newer generation of provisioned IOPS volumes and offer better durability and more IOPS per gigabyte than io1 volumes.
- io2 Block Express volumes offer even higher performance with sub-millisecond latency and up to 256,000 IOPS.
- EBS multi-attach is supported by provisioned IOPS volume types, but not by EBS volumes of previous generations or by st1 and sc1 volumes.

**Tips for choosing an EBS volume type:**

- Consider the performance requirements of your workload. If you need low latency and high throughput, then a provisioned IOPS volume such as io1 or io2 is the best choice. If you need a more cost-effective solution for less demanding workloads, then a general purpose SSD volume such as gp2 or gp3 may be a better option.
- Consider the size of your workload. EBS volumes can be up to 16 terabytes in size, but some volume types have smaller maximum sizes.
- Consider your budget. EBS volume types vary in price, so it is important to choose a type that fits your budget.

If you are unsure which EBS volume type is right for your workload, you can consult the AWS documentation or contact AWS support for assistance.


