sql
-- ============================================================
-- 04_attrition_by_factor.sql
-- Purpose: Compare attrition rates across employee groups for
--          12 factors in one results table, to find which
--          groups leave at rates above the 16.1% baseline.
-- Table:   sa-hr-attrition.hr_data.attrition_clean
-- Factors: Overtime, Department, Job Role, Business Travel,
--          Age Band, Tenure Band, Job Level, Marital Status,
--          Stock Option Level, Job Satisfaction, Environment
--          Satisfaction, Work-Life Balance
-- Method:  Stacks each factor into a common factor /
--          employee_group format (UNION ALL), then calculates
--          headcount, employees who left, and attrition rate
--          for each group.
-- Output:  Saved as hr_data.attrition_by_factor; exported as
--          attrition_by_factor_results.csv.
--
-- Key findings (baseline 16.1%):
--   - Overtime: 30.5% vs. 10.4% without; overtime workers are
--     28% of employees but 54% of terminations.
--   - Tenure 0-1 years: 34.9%, declining steadily with tenure.
--   - Job Level 1: 26.3%, accounting for 60% of terminations;
--     Sales Representatives highest by role (39.8%).
--   - Stock Option Level 0: 24.4% (see queries 06 and 07).
--   - Low Environment Satisfaction (25.4%) and Low Job
--     Satisfaction (22.8%) are well above baseline.
--   - These factors overlap and largely describe one
--     early-career, lower-paid group.  
-- ============================================================

WITH base AS (
  SELECT * FROM `sa-hr-attrition.hr_data.attrition_clean`
),
stacked AS (
  SELECT 'Overtime' AS factor, OverTime AS employee_group, AttritionFlag FROM base
  UNION ALL SELECT 'Department', Department, AttritionFlag FROM base
  UNION ALL SELECT 'Job Role', JobRole, AttritionFlag FROM base
  UNION ALL SELECT 'Business Travel', BusinessTravel, AttritionFlag FROM base
  UNION ALL SELECT 'Age Band', AgeBand, AttritionFlag FROM base
  UNION ALL SELECT 'Tenure Band', TenureBand, AttritionFlag FROM base
  UNION ALL SELECT 'Job Level', CAST(JobLevel AS STRING), AttritionFlag FROM base
  UNION ALL SELECT 'Marital Status', MaritalStatus, AttritionFlag FROM base
  UNION ALL SELECT 'Stock Option Level', CAST(StockOptionLevel AS STRING), AttritionFlag FROM base
  UNION ALL SELECT 'Job Satisfaction', JobSatisfactionLabel, AttritionFlag FROM base
  UNION ALL SELECT 'Environment Satisfaction', EnvironmentSatisfactionLabel, AttritionFlag FROM base
  UNION ALL SELECT 'Work-Life Balance', WorkLifeBalanceLabel, AttritionFlag FROM base
)
SELECT
  factor,
  employee_group,
  COUNT(*) AS employees,
  SUM(AttritionFlag) AS employees_left,
  ROUND(AVG(AttritionFlag) * 100, 1) AS attrition_rate_pct
FROM stacked
GROUP BY factor, employee_group
ORDER BY factor, attrition_rate_pct DESC;
