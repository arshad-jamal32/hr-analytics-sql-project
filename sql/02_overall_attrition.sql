
-- =====================================================
-- HR ANALYTICS PROJECT
-- FILE: 02_overall_attrition.sql
-- PURPOSE: Overall employee attrition analysis
-- =====================================================


-- 1. Total employees, employees who left and employees who stayed
SELECT
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    COUNT(*) FILTER (WHERE attrition = 'No') AS employees_stayed
FROM hr_employee;


-- 2. Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee;


-- 3. Attrition distribution with percentages
SELECT
    attrition,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee),
        2
    ) AS percentage
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;


-- 4. Average monthly income by attrition status
SELECT
    attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;


-- 5. Minimum and maximum monthly income by attrition
SELECT
    attrition,
    MIN(monthly_income) AS minimum_income,
    MAX(monthly_income) AS maximum_income,
    ROUND(AVG(monthly_income), 2) AS average_income
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;


-- 6. Employee count by gender and attrition
SELECT
    gender,
    attrition,
    COUNT(*) AS employee_count
FROM hr_employee
GROUP BY gender, attrition
ORDER BY gender, attrition;


-- 7. Attrition rate by gender
SELECT
    gender,
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
    ROUND(
        COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
        / COUNT(*), 2
    ) AS attrition_rate
FROM hr_employee
GROUP BY gender
ORDER BY attrition_rate DESC;


-- 8. Median monthly income by attrition status
SELECT
    attrition,
    COUNT(*) AS employee_count,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY monthly_income) AS median_monthly_income
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;
