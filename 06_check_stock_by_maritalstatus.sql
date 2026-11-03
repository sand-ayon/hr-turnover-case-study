sql
-- ============================================================
-- 06_check_stock_by_maritalstatus.sql
-- Purpose: Check whether the high attrition rate at Stock
--          Option Level 0 (query 04) overlaps with Marital
--          Status, since Single employees also showed high
--          attrition.
-- Table:   sa-hr-attrition.hr_data.attrition_clean
--
-- Result:
--   - All 470 Single employees are at Stock Option Level 0;
--     no Single employee has any stock options.
--   - Single employees make up 470 of the 631 employees (74%)
--     at Level 0.
--   - Stock options and marital status are therefore
--     confounded in this dataset, likely a quirk of how the
--     data was generated. Query 07 retests stock options with
--     Single employees excluded.
-- ============================================================

SELECT
  MaritalStatus,
  StockOptionLevel,
  COUNT(*) AS employees
FROM `sa-hr-attrition.hr_data.attrition_clean`
GROUP BY MaritalStatus, StockOptionLevel
ORDER BY MaritalStatus, StockOptionLevel;
