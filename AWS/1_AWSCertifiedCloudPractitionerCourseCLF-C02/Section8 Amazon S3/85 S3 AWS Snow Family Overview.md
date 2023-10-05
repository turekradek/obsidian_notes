
**Summary of the AWS Snow Family**

The AWS Snow Family is a group of devices that can be used to migrate data to and from AWS, or to perform edge computing.

**Data Migration**

The three Snow Family devices for data migration are:

- **Snowcone:** A portable device with 8TB or 14TB of storage. Ideal for small to medium-sized data migrations, or for space-constrained environments.
- **Snowball Edge:** A larger device with 80TB of storage. Ideal for medium to large-sized data migrations.
- **Snowmobile:** A truck-sized device with 100PB of storage. Ideal for exabyte-scale data migrations.

**Edge Computing**

The two Snow Family devices for edge computing are:

- **Snowcone:** The same device as used for data migration. Can be used to run EC2 instances and Lambda functions at the edge.
- **Snowball Edge:** The same device as used for data migration. Can be used to run EC2 instances, Lambda functions, and other AWS services at the edge.

**How to Use the Snow Family**

To use the Snow Family, you first request a device from the AWS console. AWS will then ship the device to you. Once you have the device, you can use the Snowball client software to copy your data to the device. Once the data is copied, you can ship the device back to AWS. AWS will then load your data onto an S3 bucket.

**Conclusion**

The AWS Snow Family is a powerful tool for migrating data to and from AWS, or for performing edge computing. The Snow Family offers a variety of devices to choose from, depending on your specific needs.