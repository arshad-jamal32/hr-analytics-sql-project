
-- =====================================================
-- HR ANALYTICS PROJECT
-- FILE: 01_data_exploration.sql
-- PURPOSE: Initial data exploration and validation
-- =====================================================

-- 1. Check total number of employee records
SELECT COUNT(*) AS total_employees
FROM hr_employee;


-- 2. Display first 10 employee records
SELECT *
FROM hr_employee
LIMIT 10;


-- 3. Check table column names and data types
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'hr_employee'
ORDER BY ordinal_position;


-- 4. Check attrition categories
SELECT
    attrition,
    COUNT(*) AS employee_count
FROM hr_employee
GROUP BY attrition
ORDER BY attrition;


-- 5. Check department categories
SELECT
    department,
    COUNT(*) AS employee_count
FROM hr_employee
GROUP BY department
ORDER BY department;


-- 6. Check job role categories
SELECT
    job_role,
    COUNT(*) AS employee_count
FROM hr_employee
GROUP BY job_role
ORDER BY job_role;


-- 7. Check missing values in important columns
SELECT
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE department IS NULL) AS missing_department,
    COUNT(*) FILTER (WHERE job_role IS NULL) AS missing_job_role,
    COUNT(*) FILTER (WHERE attrition IS NULL) AS missing_attrition,
    COUNT(*) FILTER (WHERE monthly_income IS NULL) AS missing_monthly_income
FROM hr_employee;


-- 8. Check minimum, maximum and average age
SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    ROUND(AVG(age), 2) AS average_age
FROM hr_employee;


-- 9. Check monthly income statistics
SELECT
    MIN(monthly_income) AS minimum_income,
    MAX(monthly_income) AS maximum_income,
    ROUND(AVG(monthly_income), 2) AS average_income
FROM hr_employee;


-- 10. Check unique employee IDs
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT employee_number) AS unique_employee_ids
FROM hr_employee;
