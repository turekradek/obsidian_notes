**Steps to create a new bucket "s3-storage-classes-demos-2022" and upload a file to it:**

1. Go to the Amazon S3 console.
2. Click **Create Bucket**.
3. In the **Bucket Name** field, enter `s3-storage-classes-demos-2022`.
4. Select a region for your bucket.
5. Click **Create Bucket**.
6. Click the **Upload** button.
7. Select the file you want to upload.
8. Click **Upload**.

**Steps to change the storage class of an object:**

1. Go to the Amazon S3 console.
2. Open the bucket that contains the object.
3. Click the object's name.
4. Click the **Properties** tab.
5. Under **Storage Class**, select the new storage class you want to use.
6. Click **Save**.

**Steps to automate moving objects between storage classes using a lifecycle rule:**

1. Go to the Amazon S3 console.
2. Open the bucket that contains the objects you want to move.
3. Click the **Management** tab.
4. Under **Lifecycle Rules**, click **Create Lifecycle Rule**.
5. In the **Rule Name** field, enter a name for your rule.
6. Select **Apply to all objects in the bucket**.
7. Under **Transitions**, click **Add Transition**.
8. In the **Transition** dialog box, select the storage class you want to move the objects to.
9. In the **After** field, enter the number of days after the object is created or last modified that you want to move it.
10. Click **Add**.
11. Click **Review**.
12. Review the lifecycle rule and click **Create**.

Here is an example of a lifecycle rule that moves objects to Standard-IA after 30 days, Intelligent-Tiering after 60 days, and Glacier-Flexible-Retrieval after 180 days:

```
{
  "Rules": [
    {
      "ID": "DemoRule",
      "Status": "Enabled",
      "Filter": {},
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 60,
          "StorageClass": "INTELLIGENT_TIERING"
        },
        {
          "Days": 180,
          "StorageClass": "GLACIER_FLEXIBLE_RETRIEVAL"
        }
      ]
    }
  ]
}
```

Once you have created a lifecycle rule, Amazon S3 will automatically move objects to the specified storage classes based on the rules you have defined.