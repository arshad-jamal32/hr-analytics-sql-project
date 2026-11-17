# HR Analytics – Employee Attrition Analysis

## Project Overview

This project focuses on analyzing employee attrition using the IBM HR Analytics Employee Attrition & Performance dataset.

The objective is to identify patterns associated with employee attrition, understand workforce trends, and generate actionable insights that can help HR teams improve employee retention.

The project combines **PostgreSQL, SQL, and Python** to perform data exploration, business analysis, and visualization.

## Business Problem

Employee attrition can increase recruitment costs, reduce productivity, and affect organizational performance.

This analysis explores questions such as:

- Which department has the highest employee attrition?
- Which job roles experience the most employee turnover?
- Is overtime associated with higher attrition?
- How does age relate to employee attrition?
- Do job satisfaction and work-life balance show any relationship with attrition?
- How do income, business travel, and commuting distance relate to employee turnover?

## Dataset Overview

**Dataset:** IBM HR Analytics Employee Attrition & Performance

- Total Employees: 1,470
- Total Columns: 32
- Employees Who Stayed: 1,233
- Employees Who Left: 237
- Overall Attrition Rate: 16.12%

The dataset contains employee information such as age, department, job role, monthly income, job satisfaction, overtime, work-life balance, and attrition status.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL 18 | Database management |
| SQL | Business data analysis |
| Python 3.11 | Data analysis |
| Pandas | Data manipulation |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| SQLAlchemy | PostgreSQL connection |
| VS Code | Development environment |

## Project Workflow

### 1. Data Exploration & Profiling
- Explored the original CSV dataset.
- Checked dataset dimensions and column names.
- Examined data types and missing values.
- Performed initial data quality checks.

### 2. PostgreSQL Database Management
- Created the HR Analytics database.
- Imported 1,470 employee records.
- Validated the imported data.
- Connected PostgreSQL with Python using SQLAlchemy.

### 3. SQL Business Analysis
Performed approximately 90 SQL analysis queries to investigate:

- Overall employee attrition.
- Department-wise attrition.
- Job role-wise attrition.
- Age group analysis.
- Gender and marital status analysis.
- Overtime and income analysis.
- Job satisfaction and work-life balance.
- Business travel and distance from home.
- Combined department and job role analysis.

### 4. Python Exploratory Data Analysis
Used Pandas to analyze employee attrition patterns across different categories.

### 5. Data Visualization
Created five visualizations using Matplotlib and Seaborn:

1. Overall Employee Attrition
2. Department-wise Attrition
3. Job Role-wise Attrition
4. Age Group-wise Attrition
5. Overtime-wise Attrition

## Key Business Insights

### 1. Overall Attrition
The overall employee attrition rate is **16.12%**, with 237 employees leaving out of 1,470.

### 2. Department-wise Attrition
- Sales: 20.63%
- Human Resources: 19.05%
- Research & Development: 13.84%

The Sales department has the highest attrition rate.

### 3. Job Role-wise Attrition
- Sales Representative: 39.76%
- Laboratory Technician: 23.94%
- Human Resources: 23.08%

Sales Representatives have the highest attrition rate among the analyzed job roles.

### 4. Age Group-wise Attrition
- Under 25: 35.77%
- 25–34: 19.14%
- 35–44: 9.19%
- 45–54: 11.50%
- 55+: 17.02%

Employees under 25 show the highest attrition rate.

### 5. Overtime Analysis
- Employees working overtime: 30.53%
- Employees not working overtime: 10.44%

Employees working overtime have a considerably higher attrition rate.

### 6. Monthly Income Analysis
- Average monthly income of employees who stayed: 6,832.74
- Average monthly income of employees who left: 4,787.09

Employees who left had a lower average monthly income.

### 7. Job Satisfaction
Employees with job satisfaction level 1 show the highest attrition rate at 22.84%.

### 8. Work-Life Balance
Employees with work-life balance level 1 show the highest attrition rate at 31.25%.

### 9. Business Travel
Employees who travel frequently have an attrition rate of 24.91%, compared with 8.00% for employees who do not travel.

### 10. Distance from Home
Employees living 21 km or more from work have an attrition rate of 22.06%, compared with 13.77% for employees living within 5 km.

## Business Recommendations

Based on the analysis:

1. Review overtime policies and workload distribution.
2. Develop employee retention strategies for high-attrition job roles.
3. Improve career development and compensation opportunities.
4. Conduct regular employee satisfaction surveys.
5. Promote better work-life balance.
6. Review frequent business travel requirements.
7. Explore flexible work arrangements where practical.

## Project Structure

```text
hr-analytics-sql-project/
│
├── data/
│   └── raw/
│       └── WA_Fn-UseC_-HR-Employee-Attrition.csv
│
├── python/
│   ├── db_connection.py
│   ├── eda_analysis.py
│   ├── fetch_data.py
│   └── visualizations.py
│
├── reports/
│   ├── 01_overall_attrition.png
│   ├── 02_department_attrition.png
│   ├── 03_jobrole_attrition.png
│   ├── 04_age_attrition.png
│   ├── 05_overtime_attrition.png
│   └── final_eda_summary.txt
│
├── sql/
│
├── data_profiling.py
└── README.md
```

## How to Run This Project

### Prerequisites
- Python 3.11 or above
- PostgreSQL
- VS Code

### Install Required Libraries

```bash
pip install pandas matplotlib seaborn sqlalchemy psycopg2-binary
```

### Configure Database Connection

Update the PostgreSQL connection settings in `python/db_connection.py` with your local database credentials.

Do not upload database passwords or other credentials to GitHub.

### Run Python Scripts

From the project root directory:

```bash
python data_profiling.py
```

```bash
python .\python\fetch_data.py
```

```bash
python .\python\eda_analysis.py
```

```bash
python .\python\visualizations.py
```

Ensure that the PostgreSQL database and imported `hr_employee` table are available before running the database-connected scripts.

## Final Conclusion

This project demonstrates the use of SQL and Python for practical HR analytics.

By analyzing employee demographics, job roles, compensation, overtime, satisfaction, and work-life balance, the project identifies important attrition patterns and potential employee retention priorities.

**Note:** The findings represent associations within the dataset and do not establish direct causation.

---

**Project Category:** Data Analytics | HR Analytics | SQL | Python