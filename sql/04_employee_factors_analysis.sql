
-- ============================================================
-- HR ANALYTICS PROJECT
-- File: 04_employee_factors_analysis.sql
-- Purpose: Employee Factors and Attrition Analysis
-- Database: hr_analytics
-- Table: hr_employee
-- ============================================================


-- 1. Age group-wise attrition analysis

SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY age_group
ORDER BY MIN(age);


-- 2. Gender-wise attrition analysis

SELECT
    gender,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY gender
ORDER BY attrition_rate DESC;


-- 3. Overtime-wise attrition analysis

SELECT
    over_time,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY over_time
ORDER BY attrition_rate DESC;


-- 4. Job satisfaction level-wise attrition analysis

SELECT
    job_satisfaction,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY job_satisfaction
ORDER BY job_satisfaction;


-- 5. Work-life balance-wise attrition analysis

SELECT
    work_life_balance,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY work_life_balance
ORDER BY work_life_balance;


-- 6. Marital status-wise attrition analysis

SELECT
    marital_status,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY marital_status
ORDER BY attrition_rate DESC;


-- 7. Distance from home-wise attrition analysis

SELECT
    CASE
        WHEN distance_from_home BETWEEN 0 AND 5 THEN '0-5 km'
        WHEN distance_from_home BETWEEN 6 AND 10 THEN '6-10 km'
        WHEN distance_from_home BETWEEN 11 AND 20 THEN '11-20 km'
        ELSE '21+ km'
    END AS distance_group,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY distance_group
ORDER BY MIN(distance_from_home);


-- 8. Business travel-wise attrition analysis

SELECT
    business_travel,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY business_travel
ORDER BY attrition_rate DESC;


-- 9. Education level-wise attrition analysis

SELECT
    education,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY education
ORDER BY education;


-- 10. Department and overtime-wise attrition analysis

SELECT
    department,
    over_time,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY department, over_time
ORDER BY department, over_time;


-- ============================================================
-- END OF FILE
-- ============================================================
