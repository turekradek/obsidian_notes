# Section 2: Data Processing (Batch processing, Incremental processing, and Optimization)

## Databricks Data Engineer Professional Exam - Exam Outline: Section 2 - Data Processing

This section delves into data processing techniques using Spark in Databricks, covering batch, incremental, and optimization strategies. Here are some in-depth materials to help you prepare:

**Data Partitioning:**

- **Partition Hints:**
    - **Coalesce:** Reduces the number of partitions in a DataFrame by merging smaller partitions.
    - **Repartition:** Explicitly defines the number of desired partitions in the DataFrame.
    - **Repartition by Range:** Creates partitions based on a specific column range. Useful for distributed processing.
    - **Rebalance:** Redistributes data across partitions to achieve balanced size and workload across executors.
- **Partitioning Strategies:**
    - **Identify proper partitioning columns:** Choose columns used frequently in WHERE clauses or joins.
    - Examples: date, region, product category. Partitioning on these columns allows efficient data filtering.
    - **Over-partitioning:** Avoid excessive partitions, as they can introduce management overhead.
    - Consider workload patterns and data skew when defining partitioning schemes.

**Writing Dataframes to Disk:**

- Use Spark's `coalesce` function before writing to control the number of output files.
- Utilize `parquet.write.partitionBy` or `orc.write.partitionBy` functions to specify partitioning column(s) while writing.
- Explore libraries like `delta-lake` for advanced partitioning options in Delta tables.

**Updating Spark Tables:**

- **Type 1 Updates (Modifying Existing Records):**
    - Use `updateWhere` or `update` methods on DataFrames.
    - `updateWhere` allows conditional updates based on specific criteria.
    - `update` updates all rows, potentially requiring full table scans for large datasets.
    - Consider using Delta Lake for efficient updates (discussed later).

**Structured Streaming and Delta Lake:**

- **Structured Streaming Design Patterns:**
    - **Micro-batching:** Processes data in small batches for lower latency.
    - **Windowing:** Aggregates data within a specified time window.
    - **Watermark:** Tracks data progress and allows handling late arriving data.
    - **State Management:** Stores intermediate results across micro-batches for complex processing.
- **State Management with Stream-Static Joins:**
    - Join streaming data with static datasets stored in Delta tables for enrichment.
    - Delta Lake's efficient updates improve join performance.
    - Explore techniques like checkpointing to manage state information.

**Deduplication in Structured Streaming:**

- Utilize `withWatermark` and `dropDuplicates` functions.
- `withWatermark` defines a timestamp column to track data progress.
- `dropDuplicates` removes duplicate records based on specified columns within a defined watermark window.

**Change Data Feed (CDF) with Delta Lake:**

- Enable CDF on Delta tables to capture insert, update, and delete operations.
- Redesign data processing to consume the CDF output instead of the original feed.
- Leverage CDF for efficient data updates and easier deletion propagation.

**Data Archiving and Deletion with Partitioning:**

- Proper partitioning allows for efficient archiving or deletion of specific data segments.
- Archive old partitions by moving them to a separate directory.
- Delete unwanted partitions directly from the file system.

**Small Files and Performance:**

- **Small files (smalls):** Numerous tiny files can cause performance issues due to scanning overhead.
- **Reduce smalls:**
    - Use techniques like coalescing data before writing to reduce file count.
    - Adjust partitioning granularity to avoid over-partitioning.
    - Consider file size optimization for writes, balancing read/write performance.

**Additional Resources:**

- Spark DataFrames documentation: [https://spark.apache.org/docs/latest/](https://spark.apache.org/docs/latest/)
- Structured Streaming programming guide: [https://spark.apache.org/docs/3.3.1/structured-streaming-programming-guide.html](https://spark.apache.org/docs/3.3.1/structured-streaming-programming-guide.html)
- Delta Lake documentation: [https://docs.databricks.com/en/delta/tutorial.html](https://docs.databricks.com/en/delta/tutorial.html)
- Databricks Blog on Partitioning Strategies: [https://docs.databricks.com/en/sql/language-manual/sql-ref-partition.html](https://docs.databricks.com/en/sql/language-manual/sql-ref-partition.html)

**Practice:**

- Set up a Databricks environment and experiment with data partitioning techniques.
- Implement stream-static joins and deduplication using Structured Streaming.
- Explore Change Data Feed functionality with Delta Lake.