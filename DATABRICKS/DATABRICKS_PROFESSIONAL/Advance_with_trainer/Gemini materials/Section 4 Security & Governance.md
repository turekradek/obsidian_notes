## Databricks Data Engineer Professional Exam - Exam Outline: Section 4 - Security & Governance

This section focuses on security and governance practices in Databricks, specifically using Dynamic Views for data masking and access control.

**Dynamic Views for Data Masking:**

- Dynamic views are virtual representations of underlying tables with additional logic applied during query execution.
- They can be used to mask sensitive data before exposing it to users.

**Masking Techniques (using CASE statements):**

- **Redacting:** Replace sensitive data with a constant string (e.g., "REDACTED").
- **Hashing:** Convert sensitive data to a non-reversible hash value.
- **Truncating:** Show only a portion of the data (e.g., last 4 digits of a credit card).
- **Masking based on user roles:** Grant access to specific columns or masked versions based on user groups or roles.

**Example (Masking Email Addresses):**

SQL

```
CREATE OR REPLACE VIEW masked_users AS
SELECT user_id,
       CASE WHEN CURRENT_USER() = 'admin' THEN email ELSE SUBSTRING(email, 1, 3) || '***' || SUBSTRING(email, INSTR(email, '@')) END AS email
FROM users;
```

Use code [with caution.](/faq#coding)

**Dynamic Views for Access Control:**

- Use `WHERE` clauses in dynamic views to restrict access to specific rows based on user attributes.
- Grant access to the view instead of the underlying table.

**Example (Granting Auditors Access to Full Email):**

SQL

```
CREATE OR REPLACE VIEW user_data_for_auditors AS
SELECT *
FROM users
WHERE CURRENT_USER() = 'auditor';
```

Use code [with caution.](/faq#coding)

**Benefits of Dynamic Views:**

- **Centralized Control:** Define data masking or access control logic in a single view for consistency.
- **Enforced Access:** Users only see the masked data or allowed rows, regardless of their access to the underlying table.
- **Performance:** Dynamic views have minimal performance impact compared to other masking techniques.

**Additional Resources:**

- Databricks documentation on Dynamic Views: [https://docs.databricks.com/en/sql/language-manual/sql-ref-syntax-ddl-create-sql-function.html](https://docs.databricks.com/en/sql/language-manual/sql-ref-syntax-ddl-create-sql-function.html)
- Databricks knowledge base on Data Masking: [https://www.immuta.com/guides/blueprints/how-to-implement-databricks-data-masking-across-platforms/](https://www.immuta.com/guides/blueprints/how-to-implement-databricks-data-masking-across-platforms/)

**Practice:**

- Design dynamic views to implement data masking scenarios for different user groups.
- Create dynamic views to restrict access to specific rows based on user attributes.