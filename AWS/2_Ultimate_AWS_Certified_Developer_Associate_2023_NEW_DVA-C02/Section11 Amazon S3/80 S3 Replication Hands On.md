## Detailed notes on Amazon S3 Replication

### Steps to set up S3 Replication

1. Create a source bucket and a destination bucket.
2. Enable versioning on both buckets.
3. Go to the **Management** tab of the source bucket.
4. Under **Replication rules**, click **Create replication rule**.
5. Enter a name for the replication rule.
6. Select **Enabled**.
7. In the **Source bucket** field, select the source bucket.
8. In the **Rule scope** field, select **Apply to all objects in the bucket**.
9. In the **Destination** field, select the destination bucket.
10. Click **Create rule**.
	1. Creating replication rule
		1. Choose a rule scope
			1. Apply to all objects in the bucket
		2. Destination
			1. Choose a bucket in this account
			2. specify a bucket in another account
			3. Bucket name
		3. IAM role
			1. Create new role
		__CREATE__
	Replicate existing objects
		No, ....
		Yes, replicate existing objects
		__SUBMIT__
		
	
### Notes

- Replication only works if versioning is enabled on both the source and destination buckets.
- When you first enable replication, it will only replicate new objects. To replicate existing objects, you can use S3 Batch Operations.
- The destination region can be the same as the source region, or it can be a different region.
- You need to create an IAM role for replication. You can use the default role that is created for you, or you can create your own custom role.

### Example

# Create a source bucket.

aws s3mb s3://s3-stephane-bucket-origin-v2

# Enable versioning on the source bucket.

aws s3bu s3://s3-stephane-bucket-origin-v2

# Create a destination bucket.

aws s3mb s3://s3-stephane-bucket-replica-v2

# Enable versioning on the destination bucket.

aws s3bu s3://s3-stephane-bucket-replica-v2

# Create a replication rule.

aws s3ptr s3://s3-stephane-bucket-origin-v2 s3://s3-stephane-bucket-replica-v2 demo-replication-rule --rule-scope all --destination-region us-east-1

### Conclusion

Amazon S3 Replication is a powerful feature that allows you to copy objects from one S3 bucket to another. This can be useful for disaster recovery, performance optimization, and compliance.