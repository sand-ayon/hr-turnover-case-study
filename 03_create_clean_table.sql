sql
-- ============================================================
-- 03_create_clean_table.sql
-- Purpose: Build an analysis-ready table from the raw data.
-- Source:  sa-hr-attrition.hr_data.attrition (1,470 rows)
-- Output:  sa-hr-attrition.hr_data.attrition_clean (1,470 rows)
--
-- Cleaning steps:
--   1. Removed constant columns EmployeeCount, Over18, and
--      StandardHours (see 02_check_constant_columns.sql).
--   2. Removed DailyRate, HourlyRate, and MonthlyRate because
--      the dataset does not define them; MonthlyIncome is used
--      as the pay measure.
--   3. Added EmploymentStatus (Active/Terminated) and
--      AttritionFlag (1/0) to simplify counts and rates.
--   4. Grouped Age into AgeBand and YearsAtCompany into
--      TenureBand for easier comparison.
--   5. Converted coded rating fields (1-4 or 1-5) into text
--      labels using the dataset's data dictionary.
--   6. Converted OverTime from TRUE/FALSE to Yes/No.
-- ============================================================

CREATE OR REPLACE TABLE `sa-hr-attrition.hr_data.attrition_clean` AS
SELECT
  EmployeeNumber,
  Age,
  CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age < 40 THEN '30-39'
    WHEN Age < 50 THEN '40-49'
    ELSE '50+'
  END AS AgeBand,
  Attrition,
  IF(Attrition, 'Terminated', 'Active') AS EmploymentStatus,
  IF(Attrition, 1, 0) AS AttritionFlag,
  BusinessTravel,
  Department,
  DistanceFromHome,
  Education,
  CASE Education
    WHEN 1 THEN 'Below College' WHEN 2 THEN 'College' WHEN 3 THEN 'Bachelor'
    WHEN 4 THEN 'Master' WHEN 5 THEN 'Doctor'
  END AS EducationLabel,
  EducationField,
  EnvironmentSatisfaction,
  CASE EnvironmentSatisfaction
    WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium' WHEN 3 THEN 'High' WHEN 4 THEN 'Very High'
  END AS EnvironmentSatisfactionLabel,
  Gender,
  JobInvolvement,
  CASE JobInvolvement
    WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium' WHEN 3 THEN 'High' WHEN 4 THEN 'Very High'
  END AS JobInvolvementLabel,
  JobLevel,
  JobRole,
  JobSatisfaction,
  CASE JobSatisfaction
    WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium' WHEN 3 THEN 'High' WHEN 4 THEN 'Very High'
  END AS JobSatisfactionLabel,
  MaritalStatus,
  MonthlyIncome,
  NumCompaniesWorked,
  IF(OverTime, 'Yes', 'No') AS OverTime,
  PercentSalaryHike,
  PerformanceRating,
  CASE PerformanceRating
    WHEN 1 THEN 'Low' WHEN 2 THEN 'Good' WHEN 3 THEN 'Excellent' WHEN 4 THEN 'Outstanding'
  END AS PerformanceRatingLabel,
  RelationshipSatisfaction,
  CASE RelationshipSatisfaction
    WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium' WHEN 3 THEN 'High' WHEN 4 THEN 'Very High'
  END AS RelationshipSatisfactionLabel,
  StockOptionLevel,
  TotalWorkingYears,
  TrainingTimesLastYear,
  WorkLifeBalance,
  CASE WorkLifeBalance
    WHEN 1 THEN 'Bad' WHEN 2 THEN 'Good' WHEN 3 THEN 'Better' WHEN 4 THEN 'Best'
  END AS WorkLifeBalanceLabel,
  YearsAtCompany,
  CASE
    WHEN YearsAtCompany < 2 THEN '0-1 years'
    WHEN YearsAtCompany < 5 THEN '2-4 years'
    WHEN YearsAtCompany < 10 THEN '5-9 years'
    ELSE '10+ years'
  END AS TenureBand,
  YearsInCurrentRole,
  YearsSinceLastPromotion,
  YearsWithCurrManager
FROM `sa-hr-attrition.hr_data.attrition`;
