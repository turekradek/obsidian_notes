**EBS Snapshots**

**What is an EBS Snapshot?**

An EBS Snapshot is a backup at any point in time of your EBS volume. It is a copy of all of the data on your EBS volume, and it can be used to restore your volume to a previous point in time.

**Features of EBS Snapshots**

- Can be created without detaching the EBS volume from the EC2 instance
- Can be copied across different Availability Zones and Regions
- Can be archived to save up to 75% in costs
- Can be recycled to recover from accidental deletion
- Can be fast restored to reduce latency on the first use

**How to use EBS Snapshots**

To create an EBS Snapshot:

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to create a snapshot of.
4. Click on **Actions** > **Create Snapshot**.
5. Give the snapshot a name and description.
6. Click on **Create Snapshot**.

To restore an EBS Snapshot:

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Snapshots**.
3. Select the snapshot to restore.
4. Click on **Actions** > **Restore Volume**.
5. Select the Availability Zone and instance type for the new volume.
6. Click on **Restore Volume**.

**Use Cases for EBS Snapshots**

- Data protection: EBS Snapshots can be used to protect your data from loss or corruption.
- Disaster recovery: EBS Snapshots can be used to restore your data in the event of a disaster, such as a power outage or hardware failure.
- Migrations: EBS Snapshots can be used to migrate your data from one Availability Zone or Region to another.
- Testing: EBS Snapshots can be used to create test environments that are isolated from your production environment.

## Markdown table of EBS Snapshot features

| Feature | Description | 
|---|---|
| **EBS Snapshot Archive** | Move snapshots to an "archive tier" that is up to 75% cheaper. Takes 24-72 hours to restore. |
| **EBS Snapshot Recycle Bin** | Recover accidentally deleted snapshots. Retention can be set from 1 day to 1 year. | 
| **Fast Snapshot Restore** | Force a full initialization of snapshots to have no latency on the first use. Costs more than standard restore. |

