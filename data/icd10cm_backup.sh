pg_dump -s icd10cm_dev  > icd10cm_schema.sql
pg_dump --attribute-inserts  --no-owner --data-only --no-privileges  -v icd10cm_dev  -t icd10clinicals    > icd10clinicals_data.sql 
pg_dump --attribute-inserts  --no-owner --data-only --no-privileges  -v icd10cm_dev  -t icd10cm_eindexes  > icd10cm_eindexes_data.sql 
pg_dump --attribute-inserts  --no-owner --data-only --no-privileges  -v icd10cm_dev  -t icd10cm_neoplasms > icd10cm_neoplasms_data.sql 
pg_dump --attribute-inserts  --no-owner --data-only --no-privileges  -v icd10cm_dev  -t icd10cm_orders    > icd10cm_orders_data.sql 

