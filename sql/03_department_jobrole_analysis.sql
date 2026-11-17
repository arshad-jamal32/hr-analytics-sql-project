
-- ============================================================
-- HR ANALYTICS PROJECT
-- File: 03_department_jobrole_analysis.sql
-- Purpose: Department-wise and Job Role-wise Attrition Analysis
-- Database: hr_analytics
-- Table: hr_employee
-- ============================================================


-- 1. Department-wise employee count and attrition rate

SELECT
    department,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY department
ORDER BY attrition_rate DESC;


-- 2. Job role-wise employee count and attrition rate

SELECT
    job_role,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY job_role
ORDER BY attrition_rate DESC;


-- 3. Department-wise attrition distribution

SELECT
    department,
    attrition,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY department), 2
    ) AS percentage
FROM hr_employee
GROUP BY department, attrition
ORDER BY department, attrition;


-- 4. Job role-wise attrition distribution

SELECT
    job_role,
    attrition,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY job_role), 2
    ) AS percentage
FROM hr_employee
GROUP BY job_role, attrition
ORDER BY job_role, attrition;


-- 5. Department and job role-wise attrition analysis

SELECT
    department,
    job_role,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY department, job_role
ORDER BY department, attrition_rate DESC;


-- 6. Department-wise average monthly income

SELECT
    department,
    COUNT(*) AS total_employees,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income,
    ROUND(AVG(monthly_income) FILTER (WHERE attrition = 'Yes'), 2)
        AS avg_income_employees_left,
    ROUND(AVG(monthly_income) FILTER (WHERE attrition = 'No'), 2)
        AS avg_income_employees_stayed
FROM hr_employee
GROUP BY department
ORDER BY average_monthly_income DESC;


-- 7. Job role-wise average monthly income

SELECT
    job_role,
    COUNT(*) AS total_employees,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income,
    ROUND(AVG(monthly_income) FILTER (WHERE attrition = 'Yes'), 2)
        AS avg_income_employees_left,
    ROUND(AVG(monthly_income) FILTER (WHERE attrition = 'No'), 2)
        AS avg_income_employees_stayed
FROM hr_employee
GROUP BY job_role
ORDER BY average_monthly_income DESC;


-- 8. Department-wise employee count by job role

SELECT
    department,
    job_role,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed
FROM hr_employee
GROUP BY department, job_role
ORDER BY department, total_employees DESC;


-- ============================================================
-- END OF FILE
-- ============================================================
