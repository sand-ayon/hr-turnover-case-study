-- ============================================================
-- 01_verify_upload.sql
-- Purpose: Confirm the dataset uploaded completely and check
--          for duplicate employee records before analysis.
-- Dataset: IBM HR Analytics Employee Attrition (1,470 rows)
-- Table:   sa-hr-attrition.hr_data.attrition
-- Result:  1,470 total rows and 1,470 unique employees (no
--          duplicates); 237 employees left (16.1% attrition).
-- ============================================================

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT EmployeeNumber) AS unique_employees,
  COUNTIF(Attrition) AS employees_left
FROM `sa-hr-attrition.hr_data.attrition`;
