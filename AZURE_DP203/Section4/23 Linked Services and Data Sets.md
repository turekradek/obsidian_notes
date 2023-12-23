
**Creating Link Services**

- Establish connection to each storage account:
    
    - Blob storage: `BlobStorageLS_CovidReporting`
    - Data Lake Storage Gen2: `Ls_Adls_CovidReportingDL`
    
- Provide account key and subscription details.
- Execute connection tests to verify connectivity.

**Creating Datasets**

- Define a source dataset for the Azure Blob Storage file:
    
    - `PopulationDS_RawData_GZip_TSV`
    - Associate with link service `BlobStorageLS_CovidReporting`
    - Specify file path `population/population_by_age.gzipped`
    - Disable schema import
    - Specify compression type `GZIP`
    - Set column delimiter to `Tab`
    
- Establish a target dataset for the Data Lake Storage Gen2 file:
    
    - `PopulationDS_RawData_TSV`
    - Bind to link service `Ls_Adls_CovidReportingDL`
    - Set file path to `raw/population_by_age.tsv`
    - Exclude schema import
    - Eliminate compression
    - Maintain column delimiter as `Tab`
    

**Data Validation**

- Examine source dataset data preview to confirm schema correctness.
- Perform comprehensive validation of all Data Factory objects to detect any discrepancies.

**Data Factory Changes Management**

- Utilize the `Publish all` option to save alterations made within the author tab.

**Onward to Pipeline and Copy Activity Creation**

- Proceed to the subsequent lesson to construct a pipeline and incorporate a copy activity.
- Employ data ingestion testing via pipeline debugging.