
**  
Steps to take a snapshot of an EBS volume:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to create a snapshot of.
4. Click on **Actions** > **Create Snapshot**.
5. Give the snapshot a name and description.
6. Click on **Create Snapshot**.

**Steps to restore a snapshot to a new EBS volume:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Snapshots**.
3. Select the snapshot to restore.
4. Click on **Actions** > **Create Volume from Snapshot**.
5. Select the Availability Zone and instance type for the new volume.
6. Click on **Create Volume**.

**Steps to copy a snapshot to another region:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Snapshots**.
3. Select the snapshot to copy.
4. Click on **Actions** > **Copy Snapshot**.
5. Select the destination region.
6. Click on **Copy Snapshot**.

**Steps to create a Retention Rule for EBS Snapshots in the Recycle Bin:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Snapshots**.
3. Click on the **Recycle Bin** tab.
4. Click on **Create Retention Rule**.
5. Give the rule a name and description.
6. Select **EBS Snapshots**.
7. Select **Apply to all resources**.
8. Select the retention period.
9. Click on **Create Retention Rule**.

**Steps to recover a snapshot from the Recycle Bin:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Snapshots**.
3. Click on the **Recycle Bin** tab.
4. Select the snapshot to recover.
5. Click on **Recover Resources**.

## Markdown table of steps

|Step|Action|
|---|---|
|Take a snapshot of an EBS volume|Go to the AWS Console > EC2 > Volumes > Select the volume to create a snapshot of > Actions > Create Snapshot|
|Restore a snapshot to a new EBS volume|Go to the AWS Console > EC2 > Snapshots > Select the snapshot to restore > Actions > Create Volume from Snapshot > Select the Availability Zone and instance type for the new volume > Create Volume|
|Copy a snapshot to another region|Go to the AWS Console > EC2 > Snapshots > Select the snapshot to copy > Actions > Copy Snapshot > Select the destination region > Copy Snapshot|
|Create a Retention Rule for EBS Snapshots in the Recycle Bin|Go to the AWS Console > EC2 > Snapshots > Click on the Recycle Bin tab > Create Retention Rule > Give the rule a name and description > Select EBS Snapshots > Select Apply to all resources > Select the retention period > Create Retention Rule|
|Recover a snapshot from the Recycle Bin|Go to the AWS Console > EC2 > Snapshots > Click on the Recycle Bin tab > Select the snapshot to recover > Recover Resources|

# 151 EBS Hands On
  
EBS should be in the same location

**Steps to create an EBS volume and attach it to an EC2 instance:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Click on **Create Volume**.
4. Select the volume type, size, and availability zone.
5. Click **Create Volume**.
6. Once the volume is created, click on **Attach Volume**.
7. Select the EC2 instance to attach the volume to.
8. Click **Attach Volume**.

**Steps to detach an EBS volume from an EC2 instance:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to detach.
4. Click on **Actions** > **Detach Volume**.

**Steps to terminate an EBS volume:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to terminate.
4. Click on **Actions** > **Delete Volume**.

**Steps to check if the Delete on Termination attribute is enabled for an EBS volume:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to check.
4. In the **Details** pane, scroll down to the **Delete on Termination** attribute.
5. If the attribute is enabled, it will say **Yes**.

**Steps to disable the Delete on Termination attribute for an EBS volume:**

1. Go to the AWS Console and click on **EC2**.
2. In the left-hand pane, click on **Volumes**.
3. Select the volume to disable the attribute for.
4. Click on **Actions** > **Edit Attributes**.
5. Uncheck the **Delete on Termination** checkbox.
6. Click **Save**.

# 152 EBS Snapshots Overview
- [ ] make a backup (snapshot) of your EVS volume at a point in time
- [ ] not necessary to detach volume to do snapshot but recommended
- [ ] Can copy snapshots acress AZ or Region

## EBS Snapchots Features
- [ ] EBS Snapchot Archive
	- [ ] Move a snapshot to an "archive tier" that is 75% cheaper
	- [ ] taks within 24 to 72 hours for restoring the archive
- [ ] RecycleBin for EBS Snapshots
	- [ ] Setup rules to retain deleted snapshots so you can recover them after an accidental deletion
	- [ ] Specify retention )from I fay to ( year) 


- [ ] Volumes
	- [ ] Actions
		- [ ] Description - Demo snaphots
			- [ ] Elastic Block Store 
				- [ ] Snapshots 
				- [ ] Copy Snapchots 
	- [ ] Recreate volume from snaphots
	- [ ] 