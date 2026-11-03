sql
-- ============================================================
-- 07_stock_options_excl_single.sql
-- Purpose: Retest attrition by Stock Option Level with Single
--          employees excluded, since all Single employees are
--          at Level 0 (see 06_check_stock_by_maritalstatus.sql).
-- Table:   sa-hr-attrition.hr_data.attrition_clean
-- Filter:  Married and Divorced employees only (1,000 employees)
--
-- Result:
--   - Level 0: 21.1% (34 of 161) vs. 9.4% at Level 1 and 7.6%
--     at Level 2, so Level 0 attrition remains more than twice
--     as high even without Single employees.
--   - Level 3: 17.6% (15 of 85) breaks the downward trend, but
--     the group is small.
--   - Conclusion: Stock options may influence retention on
--     their own, but small group sizes limit confidence. Treated
--     as a supporting finding, not a headline.
-- ============================================================

SELECT
  StockOptionLevel,
  COUNT(*) AS employees,
  SUM(AttritionFlag) AS terminated,
  ROUND(AVG(AttritionFlag) * 100, 1) AS attrition_rate_pct
FROM `sa-hr-attrition.hr_data.attrition_clean`
WHERE MaritalStatus != 'Single'
GROUP BY StockOptionLevel
ORDER BY StockOptionLevel;
