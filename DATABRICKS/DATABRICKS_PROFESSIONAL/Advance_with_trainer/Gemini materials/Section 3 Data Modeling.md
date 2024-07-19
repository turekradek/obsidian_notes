## Databricks Data Engineer Professional Exam - Exam Outline: Section 3 - Data Modeling

This section focuses on data modeling concepts and practices relevant to Databricks. Here's a breakdown to help you prepare:

**Data Transformations (Bronze to Silver):**

- **Objective:** Clean, enrich, and transform data from raw format (bronze) to a curated and usable format (silver).
- Transformations include:
    - Schema standardization
    - Data cleaning (handling missing values, outliers)
    - Deriving new features
    - Joining with reference data

**Change Data Feed (CDF):**

- **Challenge:** Traditionally, propagating updates and deletes in Lakehouse architectures was complex.
- **CDF solution:** Captures insert, update, and delete operations on a table, allowing efficient propagation of changes.
- Enables updating silver tables with the latest data state.

**Delta Lake Clone:**

- **Shallow vs. Deep Clone:**
    - **Shallow clone:** Creates a reference to a specific version of a Delta table, pointing to the same underlying data.
    - **Deep clone:** Creates a full copy of the data at the point of cloning, independent of the source table.
- Use shallow clones for efficient versioning without data duplication.
- Deep clones are useful for creating isolated development or testing environments.

**Multiplex Bronze Table:**

- **Objective:** Avoids pitfalls in productionalizing streaming workloads by handling schema evolution.
- Contains multiple nested schemas to accommodate different versions of incoming data.
- Requires careful processing logic to identify the appropriate schema for each data stream.

**Best Practices for Streaming from Multiplex Bronze:**

- Implement schema validation to ensure data adheres to the expected format.
- Utilize error handling routines to gracefully handle unexpected schema variations.
- Consider using schema registry tools to manage schema evolution centrally.

**Bronze to Silver Processing:**

- **Incremental Processing:** Only process new or updated data from the bronze table, avoiding full reprocessing.
- **Quality Enforcement:**
    - Define data quality checks (e.g., data validation rules) to ensure data integrity in the silver table.
    - Utilize Delta Lake DDL constraints (discussed later) or custom validation logic.
- **Deduplication:** Remove duplicate records using techniques like watermarking and filtering based on unique identifiers.

**Data Quality in Delta Lake:**

- **Approaches:**
    - **Schema constraints:** Enforce data type and format consistency.
    - **Data validation rules:** Define custom logic to validate specific data values.
    - **Delta Lake data repair:** Fix specific data quality issues within the Delta table itself.
- Consider the trade-offs between these approaches based on complexity and flexibility.

**Foreign Keys without Constraints:**

- Delta Lake doesn't natively enforce foreign key constraints.
- Design tables to mitigate data integrity issues (e.g., using surrogate keys).
- Implement referential integrity checks in your processing logic.

**Constraints in Delta Lake:**

- Utilize DDL constraints within Delta tables to enforce data type, nullability, and uniqueness.
- Restrict invalid data insertion, improving data quality.

**Lookup Tables:**

- **Purpose:** Provide reference data for enriching other tables.
- **Trade-offs:**
    - **Normalized model:** Separates reference data, reducing redundancy but requiring joins.
    - **Denormalized model:** Duplicates reference data in multiple tables for faster access but increases storage requirements and maintenance complexity.

**Slowly Changing Dimensions (SCDs) with Delta Lake:**

- Implement SCD tables to handle changes in dimension data over time.
- **Architectures with Streaming and Batch:**
    - Use streaming pipelines for real-time updates.
    - Utilize batch processing for historical data backfill.
- **SCD Type 0, 1, and 2:**
    - **Type 0:** Stores all historical data in a single table with additional flags to indicate changes.
    - **Type 1:** Adds new rows for updates, keeping old data intact.
    - **Type 2:** Maintains a current and historical table, allowing historical analysis.
- Choose the appropriate SCD type based on your data access and historical analysis needs.

**Additional Resources:**

- Delta Lake DDL: [invalid URL removed]
- Slowly Changing Dimensions: [https://www. [invalid URL removed]](https://www. [invalid URL removed])

**Practice:**

- Design data models for specific scenarios, including bronze, silver, and possibly gold tables.