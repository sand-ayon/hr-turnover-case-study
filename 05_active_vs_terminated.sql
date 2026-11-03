sql
-- ============================================================
-- 05_active_vs_terminated.sql
-- Purpose: Compare average values for Active and Terminated
--          employees on numeric factors that are not grouped
--          in query 04 (pay, age, tenure, experience, etc.).
-- Table:   sa-hr-attrition.hr_data.attrition_clean
-- Note:    Terminated includes all separations; the dataset
--          does not distinguish voluntary from involuntary.
--
-- Key findings:
--   - Terminated employees averaged $4,787/month vs. $6,833
--     for Active, about 30% less ($2,046/month).
--   - Terminated employees were about 4 years younger (33.6
--     vs. 37.6) and had about 2 fewer years at the company
--     (5.1 vs. 7.4).
--   - Years since last promotion (1.9 vs. 2.2) and salary
--     increase % (15.1 vs. 15.2) were nearly identical, so
--     these do not distinguish the two groups.
--   - Pay, age, and tenure are related; this comparison shows
--     association, not cause.
-- ============================================================

SELECT
  EmploymentStatus,
  COUNT(*) AS employees,
  ROUND(AVG(MonthlyIncome)) AS avg_monthly_income,
  ROUND(AVG(Age), 1) AS avg_age,
  ROUND(AVG(YearsAtCompany), 1) AS avg_years_at_company,
  ROUND(AVG(TotalWorkingYears), 1) AS avg_total_working_years,
  ROUND(AVG(YearsSinceLastPromotion), 1) AS avg_years_since_promotion,
  ROUND(AVG(DistanceFromHome), 1) AS avg_distance_from_home,
  ROUND(AVG(PercentSalaryHike), 1) AS avg_salary_hike_pct
FROM `sa-hr-attrition.hr_data.attrition_clean`
GROUP BY EmploymentStatus;
