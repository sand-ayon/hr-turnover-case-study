sql
-- ============================================================
-- 02_check_constant_columns.sql
-- Purpose: Identify columns that hold the same value for every
--          employee, since they add nothing to the analysis.
-- Table:   sa-hr-attrition.hr_data.attrition
-- Result:  EmployeeCount, Over18, and StandardHours each have
--          only 1 distinct value, so they were excluded from
--          the clean table (see 03_create_clean_table.sql).
-- ============================================================

SELECT
  COUNT(DISTINCT EmployeeCount) AS distinct_employeecount,
  COUNT(DISTINCT Over18) AS distinct_over18,
  COUNT(DISTINCT StandardHours) AS distinct_standardhours
FROM `sa-hr-attrition.hr_data.attrition`;
