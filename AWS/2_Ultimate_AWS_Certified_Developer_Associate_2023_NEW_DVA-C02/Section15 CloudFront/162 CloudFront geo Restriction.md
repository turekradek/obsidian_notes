**CloudFront's Geo Restriction**

CloudFront's geo restriction feature allows you to control who can access your distribution based on the country where they are trying to access the distribution from. You can use an allow list to define a list of approved countries, or you can use a block list to define a list of banned countries. The country is determined by using a third-party geo-IP database to match the IP address of the user to the country it belongs to.

**Use Cases for Geo Restriction**

- **Copyright laws:** Geo restriction can be used to control access to content in accordance with copyright laws. For example, you could use geo restriction to prevent users in certain countries from accessing copyrighted content.
- **Content availability:** Geo restriction can be used to control the availability of content based on the location of the user. For example, you could use geo restriction to make certain content available only to users in a specific region.

**How to Set Up Geo Restriction in CloudFront**

2. Go to the CloudFront console and select your distribution.
4. Click on the **Geographic restrictions** tab.
6. Click on **Edit**.
8. Select the **Restrictoin type**. You can choose from **Allow list** or **Block list**.
10. Add the countries you want to allow or block.
12. Click on **Save**.

**Additional Notes**

- You can use a wildcard (*) to match multiple countries. For example, you could use the wildcard to allow or block all countries in Europe.
- You can use multiple allow lists or block lists. For example, you could use one allow list to allow users from the United States and Canada, and another allow list to allow users from Japan and South Korea.
- Geo restriction is not foolproof. Users can use VPNs to bypass geo restriction.