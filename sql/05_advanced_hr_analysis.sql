
-- ============================================================
-- HR ANALYTICS PROJECT
-- File: 05_advanced_hr_analysis.sql
-- Purpose: Advanced HR and Employee Retention Analysis
-- Database: hr_analytics
-- Table: hr_employee
-- ============================================================


-- 1. Job level-wise attrition analysis

SELECT
    job_level,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM hr_employee
GROUP BY job_level
ORDER BY job_level;


-- 2. Total working years-wise attrition analysis

SELECT
    CASE
        WHEN total_working_years <= 5 THEN '0-5 Years'
        WHEN total_working_years <= 10 THEN '6-10 Years'
        WHEN total_working_years <= 20 THEN '11-20 Years'
        ELSE '21+ Years'
    END AS experience_group,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY experience_group
ORDER BY MIN(total_working_years);


-- 3. Years at company-wise attrition analysis

SELECT
    CASE
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '11+ Years'
    END AS company_tenure_group,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY company_tenure_group
ORDER BY MIN(years_at_company);


-- 4. Years in current role-wise attrition analysis

SELECT
    CASE
        WHEN years_in_current_role <= 2 THEN '0-2 Years'
        WHEN years_in_current_role <= 5 THEN '3-5 Years'
        WHEN years_in_current_role <= 10 THEN '6-10 Years'
        ELSE '11+ Years'
    END AS current_role_tenure,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY current_role_tenure
ORDER BY MIN(years_in_current_role);


-- 5. Years since last promotion-wise attrition analysis

SELECT
    CASE
        WHEN years_since_last_promotion = 0 THEN '0 Years'
        WHEN years_since_last_promotion BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN years_since_last_promotion BETWEEN 3 AND 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS promotion_gap,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY promotion_gap
ORDER BY MIN(years_since_last_promotion);


-- 6. Performance rating-wise attrition analysis

SELECT
    performance_rating,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY performance_rating
ORDER BY performance_rating;


-- 7. Training times-wise attrition analysis

SELECT
    training_times_last_year,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY training_times_last_year
ORDER BY training_times_last_year;


-- 8. Stock option level-wise attrition analysis

SELECT
    stock_option_level,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY stock_option_level
ORDER BY stock_option_level;


-- 9. Relationship satisfaction-wise attrition analysis

SELECT
    relationship_satisfaction,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY relationship_satisfaction
ORDER BY relationship_satisfaction;


-- 10. Employee tenure and monthly income by attrition

SELECT
    attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(years_at_company), 2) AS avg_years_at_company,
    ROUND(AVG(total_working_years), 2) AS avg_total_working_years,
    ROUND(AVG(years_in_current_role), 2) AS avg_years_in_current_role,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    ROUND(AVG(years_since_last_promotion), 2)
        AS avg_years_since_last_promotion
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;


-- ============================================================
-- END OF FILE
-- ============================================================
