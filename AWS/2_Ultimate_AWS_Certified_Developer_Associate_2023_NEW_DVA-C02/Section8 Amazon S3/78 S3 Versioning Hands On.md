
##   Detailed notes on Amazon S3 versioning

**How to enable versioning**

1. Go to the Amazon S3 console.
2. Click the name of the bucket that you want to enable versioning on.
3. Click the **Properties** tab.
4. Under **Versioning**, click **Edit**.
5. Select the **Enable** checkbox.
6. Click **Save changes**.

**How to view versions**

1. Go to the Amazon S3 console.
2. Click the name of the bucket that contains the object versions that you want to view.
3. Click the **Versions** tab.
4. To view the contents of an object version, click the version ID.

**How to roll back to a previous version**

1. Go to the Amazon S3 console.
2. Click the name of the bucket that contains the object version that you want to restore.
3. Click the **Versions** tab.
4. Click the version ID of the object version that you want to restore.
5. Click **Restore**.

**How to delete a version**

1. Go to the Amazon S3 console.
2. Click the name of the bucket that contains the object version that you want to delete.
3. Click the **Versions** tab.
4. Click the version ID of the object version that you want to delete.
5. Click **Delete**.

**Important notes**

- Any file that is not versioned prior to enabling versioning will have the version `null`.
- Suspending versioning does not delete the previous versions of objects in the bucket.
- Deleting a version of an object is a permanent delete and cannot be undone.
- Deleting an object adds a delete marker, which means that the object is still in the bucket but is not accessible. To permanently delete an object, you must delete the delete marker.

**Example use cases**

- **Recover from accidental deletion:** If you accidentally delete an object, you can restore it from a previous version.
- **Roll back to a previous version:** If you make a mistake or change your mind, you can easily roll back to a previous version of an object.
- **Audit changes:** You can use versioning to audit changes to objects in a bucket. This can be useful for compliance or auditing purposes.

**Conclusion**

Amazon S3 versioning is a powerful feature that can help you protect your data and recover from mistakes. It is best practice to enable versioning on all S3 buckets that contain important data.