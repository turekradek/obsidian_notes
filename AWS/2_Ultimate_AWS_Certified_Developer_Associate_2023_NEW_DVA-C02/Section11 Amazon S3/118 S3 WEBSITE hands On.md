**Steps to enable a bucket to be a website:**

**Prerequisites:**

- The bucket must be public.

**Steps:**

1. Go to the **Properties** tab of the bucket.
2. Scroll down to **Static website hosting**.
3. Click **Edit**.
4. Select **Use this bucket to host a website**.
5. Enter the index document name. to show on website
6. Click **Save changes**.

**Nested list:**

1. **Enable the bucket for static website hosting**
    1. Go to the **Properties** tab of the bucket.
    2. Scroll down to **Static website hosting**.
    3. Click **Edit**.
    4. Select **Use this bucket to host a website**.
2. **Specify the index document**
    1. Enter the index document name.
3. **Save changes**
    1. Click **Save changes**.

**Note:** If you want to use a custom domain name for your website, you will need to create a hosted zone in Amazon Route 53 and create a CNAME record that points to the website endpoint of your S3 bucket.