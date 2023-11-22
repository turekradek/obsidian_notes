
**Steps**

2. Create a new DNS record.
4. Set the TTL to the desired value.
6. Save the record.
8. Verify that the record is working.

**Table**

|Feature|Description|
|---|---|
|TTL|Time To Live|
|A record|Points to a specific IP|
|DNS query|A request to the DNS system for the IP address of a domain name|
|Cache|A temporary storage for data|
|CloudShell|A web-based command-line interface for Amazon Web Services|
|nslookup|A command-line tool for querying DNS servers|
|dig|A command-line tool for querying DNS servers|

drive_spreadsheetExport to Sheets

**Additional Notes**

- The TTL is mandatory for every record except the Alias record.
- A high TTL can reduce traffic on Route 53, but it can also mean that clients will have outdated records.
- A low TTL can increase traffic on Route 53, but it can also mean that clients will have more up-to-date records.
- You can decrease the TTL for a record to make sure that all clients have the new record, and then increase the TTL once the new record is in place.

