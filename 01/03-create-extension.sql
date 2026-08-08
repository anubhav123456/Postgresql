CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT schema_name FROM information_schema.schemata ORDER BY schema_name;

```text
schema_name
----------------
information_schema
pg_catalog
pg_toast
public
```