# HR Attrition Case Study

**Google Data Analytics Professional Certificate – Capstone Project**

Author: Sandra Ayon · [LinkedIn](https://www.linkedin.com/in/sandra-ayon)

## Dashboard
[View the Tableau dashboard](https://public.tableau.com/app/profile/sandra.ayon7278/viz/HRAttritionCaseStudy_17936714709390/HRAttritionDashboard)

## Business Task
A mid-sized company is losing about 16% of its workforce to attrition and wants to understand why. This analysis identifies which employee groups and factors (such as overtime, tenure, job level, pay, and satisfaction) are most associated with employees leaving, and recommends actions HR leadership can take to reduce turnover.

**Key stakeholders:** VP of Human Resources (primary audience), HR business partners, and department managers.
**Metric:** Attrition rate (employees who left ÷ total employees), compared across employee groups.

## Data Source
[IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) (Kaggle). The dataset is fictional and was created by IBM data scientists. It contains 1,470 employee records and 35 columns.

## Tools
- **Google BigQuery (SQL):** data verification, cleaning, and analysis
- **Tableau Public:** dashboard and visualizations
- **GitHub:** documentation and portfolio hosting

## Process (SQL Queries)
| File | Purpose |
|---|---|
| [01_verify_upload.sql](01_verify_upload.sql) | Confirm a complete upload with no duplicate employees |
| [02_check_constant_columns.sql](02_check_constant_columns.sql) | Identify columns with only one value |
| [03_create_clean_table.sql](03_create_clean_table.sql) | Build the analysis-ready table (remove unusable columns, add labels and groupings) |
| [04_attrition_by_factor.sql](04_attrition_by_factor.sql) | Attrition rate across 12 factors in one table |
| [05_active_vs_terminated.sql](05_active_vs_terminated.sql) | Compare averages for Active vs. Terminated employees |
| [06_check_stock_by_maritalstatus.sql](06_check_stock_by_maritalstatus.sql) | Check the overlap between stock options and marital status |
| [07_stock_options_excl_single.sql](07_stock_options_excl_single.sql) | Retest stock options with Single employees excluded |

Results from query 04: [attrition_by_factor_results.csv](attrition_by_factor_results.csv)

## Key Findings
Overall attrition rate: **16.1%** (237 of 1,470 employees).

1. **Overtime:** 30.5% attrition with overtime vs. 10.4% without. Overtime workers are 28% of employees but 54% of terminations.
2. **Early tenure:** 34.9% attrition in the first two years, declining steadily as tenure increases. New hires (0–1 years) working overtime had **55.1% attrition** (38 of 69), and overtime raised attrition at every tenure level.
3. **Entry-level roles and pay:** Job Level 1 has 26.3% attrition and accounts for 60% of terminations. Sales Representatives have the highest rate by role (39.8%). Terminated employees earned about $2,046/month less on average.
4. **Low satisfaction:** Low environment satisfaction (25.4%) and low job satisfaction (22.8%) are well above the baseline.

**Supporting finding:** Employees with no stock options (Level 0) have 24.4% attrition. All Single employees are at Level 0, but even with them excluded, Level 0 attrition (21.1%) is more than twice that of Levels 1–2.

**Not a factor:** Years since last promotion and salary increase % were nearly identical for Active and Terminated employees.

These factors overlap and largely describe one high-risk group: early-career, entry-level, lower-paid employees.

## Recommendations
1. **Review overtime practices** in high-overtime roles and consider staffing adjustments or overtime limits.
2. **Strengthen onboarding and first-two-year retention** with structured check-ins (for example, at 30/60/90 days and at 1 year).
3. **Review pay and career paths for Job Level 1 roles,** starting with Sales Representatives and Laboratory Technicians.
4. **Act on satisfaction survey results** for groups reporting low environment or job satisfaction.

## Limitations
- The data is fictional and represents a single point in time.
- "Terminated" includes all separations; the dataset does not distinguish voluntary from involuntary exits.
- The findings show association, not cause, and several factors are related to one another.
- Some groups are small, which limits confidence in their rates.
