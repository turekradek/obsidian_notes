**Steps to make a bucket policy so that the coffee file is accessible from the public URL:**

1. Go to the **Permissions** tab.
2. Under **Block Public Access**, untick the **Block all public access** checkbox.
3. Scroll down to **Bucket policy** and click **Create bucket policy**.
4. In the Policy Generator, select **Allow** and **GetObject**.
5. In the **Amazon Resource Name**, enter the bucket ARN with a "/" and a "*".
6. Click **Generate policy**.
7. Copy the generated policy and paste it into the **Bucket policy** editor.
8. Click **Save changes**.

**Nested list of steps:**

1. **Make bucket policy public**
    1. Go to the **Permissions** tab.
    2. Under **Block Public Access**, untick the **Block all public access** checkbox.
2. **Create bucket policy**
    1. Scroll down to **Bucket policy** and click **Create bucket policy**.
    2. In the Policy Generator, select **Allow** and **GetObject**.
    3. In the **Amazon Resource Name**, enter the bucket ARN with a "/" and a "*".
    4. Click **Generate policy**.
    5. Copy the generated policy and paste it into the **Bucket policy** editor.
    6. Click **Save changes**.

[Aws policy generator]([AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)
**Note:** Be careful when making a bucket policy public, as this can expose your data to the internet.