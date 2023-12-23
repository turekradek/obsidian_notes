**Scenario 3: Deleting the Source File After Copying**

To efficiently manage data movement and avoid unnecessary storage consumption, the pipeline can be configured to delete the source file after the data is successfully copied to the destination location. This ensures that only the latest version of the data remains in the source and the destination is updated with the new data.

**Implementation:**

2. **Add a Delete Activity:**
    
    - Drag and drop the `Delete Activity` from the `General` tab onto the pipeline canvas.
    - Name the activity `Delete Source File`.
    - Specify the source dataset as `DS Population Raw Gz`.
    - Leave the `Recursive Delete` option unchecked.
    - Leave the `Logging Settings` section unchecked.
    
4. **Connect the Delete Activity:**
    
    - Link the `Copy Data` activity to the `Delete Source File` activity.
    - This ensures that the `Delete Source File` activity will only execute after the `Copy Data` activity has successfully copied the file to the destination.
    
6. **Test and Publish:**
    
    - Validate the pipeline's behavior by running it in debug mode and observing the logs.
    - Verify that the source file is successfully copied to the destination and then deleted.
    - Publish the updated pipeline to ensure the changes are reflected in the Data Factory instance.
    

By implementing this approach, the pipeline can effectively manage data movement and ensure that the source file is deleted once the data is transferred to the destination, optimizing storage utilization and maintaining data freshness.