## Databricks Data Engineer Professional Exam - Exam Outline: Section 6 - Testing & Deployment

This section focuses on best practices for testing, deploying, and managing Databricks jobs, including leveraging Python libraries and tools.

**Notebook Dependencies:**

- **File Dependencies:** Manage dependencies by referencing local Python files within notebooks instead of relying on external libraries.
- **Wheels:** Utilize Python wheels for pre-packaged libraries. Adapt code to utilize relative imports instead of relying on absolute paths within the wheel.

**Job Management:**

- **Repairing Failed Jobs:** Identify and fix errors in failed jobs. Rerun specific failed stages or tasks to avoid full reprocessing.
- **Creating Jobs:** Design jobs based on common use cases, such as data processing pipelines or model training workflows.
- **Multi-Task Jobs with Dependencies:** Create jobs with multiple tasks that execute in a specific order, defining dependencies between tasks.

**Production Streaming Job Design:**

- Consider cost and latency SLAs (Service Level Agreements) while designing production streaming jobs.
- Implement techniques like autoscaling and micro-batching for optimal resource utilization and performance.

**Databricks CLI:**

- Configure the Databricks CLI to interact with your workspace and clusters.
- Execute basic commands to:
    - List clusters and notebooks
    - Create clusters
    - Submit jobs
    - Monitor job runs

**REST API for Jobs:**

- Utilize the Databricks REST API to programmatically interact with jobs.
- Commands to:
    - Clone existing jobs
    - Trigger job runs
    - Export job run output

**Additional Resources:**

- Databricks Job API: [invalid URL removed]
- Databricks CLI documentation: [invalid URL removed]

**Practice:**

- Set up a Databricks environment and write notebooks with local file dependencies.
- Simulate job failures and practice repairing and rerunning them.
- Design a multi-task job with dependencies in a Databricks workspace.
- Use the Databricks CLI to manage jobs and clusters.