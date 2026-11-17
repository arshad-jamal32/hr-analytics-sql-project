import pandas as pd
from db_connection import create_connection

# Connect to PostgreSQL
engine = create_connection()

if engine:
    try:
        # Fetch complete dataset
        query = "SELECT * FROM hr_employee"
        df = pd.read_sql_query(query, engine)

        print("\n========== HR DATASET OVERVIEW ==========")

        # Total employees
        print("\nTotal Employees:", df.shape[0])

        # Total columns
        print("Total Columns:", df.shape[1])

        # Attrition count
        print("\nAttrition Distribution:")
        print(df["attrition"].value_counts())

        # Attrition percentage
        print("\nAttrition Percentage:")
        print(df["attrition"].value_counts(normalize=True) * 100)

    finally:
        engine.dispose()
        print("\nDatabase connection closed.")
        # Department-wise attrition analysis
        print("\nDepartment-wise Attrition:")

        department_attrition = (
            df.groupby("department")["attrition"].value_counts().unstack(fill_value=0)
        )

        department_attrition["Attrition_Rate"] = (
            department_attrition["Yes"]
            / (department_attrition["Yes"] + department_attrition["No"])
        ) * 100

        print(department_attrition)
        # Job Role-wise Attrition Analysis
        print("\nJob Role-wise Attrition:")

        jobrole_attrition = (
            df.groupby("job_role")["attrition"].value_counts().unstack(fill_value=0)
        )

        jobrole_attrition["Attrition_Rate"] = (
            jobrole_attrition["Yes"]
            / (jobrole_attrition["Yes"] + jobrole_attrition["No"])
        ) * 100

        print(
            jobrole_attrition.sort_values(by="Attrition_Rate", ascending=False).round(2)
        )
        # Age-wise Attrition Analysis
        print("\nAge-wise Attrition:")

        df["Age_Group"] = pd.cut(
            df["age"],
            bins=[0, 25, 35, 45, 55, 100],
            labels=["Under 25", "25-34", "35-44", "45-54", "55+"],
        )

        age_attrition = (
            df.groupby("Age_Group", observed=True)["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        age_attrition["Attrition_Rate"] = (
            age_attrition["Yes"] / (age_attrition["Yes"] + age_attrition["No"])
        ) * 100

        print(age_attrition.round(2))
        # Gender-wise Attrition Analysis
        print("\nGender-wise Attrition:")

        gender_attrition = (
            df.groupby("gender")["attrition"].value_counts().unstack(fill_value=0)
        )

        gender_attrition["Attrition_Rate"] = (
            gender_attrition["Yes"] / (gender_attrition["Yes"] + gender_attrition["No"])
        ) * 100

        print(gender_attrition.round(2))
        # Overtime-wise Attrition Analysis
        print("\nOvertime-wise Attrition:")

        overtime_attrition = (
            df.groupby("over_time")["attrition"].value_counts().unstack(fill_value=0)
        )

        overtime_attrition["Attrition_Rate"] = (
            overtime_attrition["Yes"]
            / (overtime_attrition["Yes"] + overtime_attrition["No"])
        ) * 100

        print(overtime_attrition.round(2))
        # Monthly Income-wise Attrition
        print("\nMonthly Income-wise Attrition:")

        income_attrition = df.groupby("attrition")["monthly_income"].agg(
            ["count", "mean", "median"]
        )

        print(income_attrition.round(2))
        # Job Satisfaction-wise Attrition
        print("\nJob Satisfaction-wise Attrition:")

        satisfaction_attrition = (
            df.groupby("job_satisfaction")["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        satisfaction_attrition["Attrition_Rate"] = (
            satisfaction_attrition["Yes"]
            / (satisfaction_attrition["Yes"] + satisfaction_attrition["No"])
        ) * 100

        print(satisfaction_attrition.round(2))
        # Work-Life Balance-wise Attrition
        print("\nWork-Life Balance-wise Attrition:")

        worklife_attrition = (
            df.groupby("work_life_balance")["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        worklife_attrition["Attrition_Rate"] = (
            worklife_attrition["Yes"]
            / (worklife_attrition["Yes"] + worklife_attrition["No"])
        ) * 100

        print(worklife_attrition.round(2))
        # Business Travel-wise Attrition
        print("\nBusiness Travel-wise Attrition:")

        travel_attrition = (
            df.groupby("business_travel")["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        travel_attrition["Attrition_Rate"] = (
            travel_attrition["Yes"] / (travel_attrition["Yes"] + travel_attrition["No"])
        ) * 100

        print(travel_attrition.round(2))
        # Distance-wise Attrition
        print("\nDistance-wise Attrition:")

        df["Distance_Group"] = pd.cut(
            df["distance_from_home"],
            bins=[0, 5, 10, 20, 100],
            labels=["0-5 km", "6-10 km", "11-20 km", "21+ km"],
        )

        distance_attrition = (
            df.groupby("Distance_Group", observed=True)["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        distance_attrition["Attrition_Rate"] = (
            distance_attrition["Yes"]
            / (distance_attrition["Yes"] + distance_attrition["No"])
        ) * 100

        print(distance_attrition.round(2))
        # Marital Status-wise Attrition
        print("\nMarital Status-wise Attrition:")

        marital_attrition = (
            df.groupby("marital_status")["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        marital_attrition["Attrition_Rate"] = (
            marital_attrition["Yes"]
            / (marital_attrition["Yes"] + marital_attrition["No"])
        ) * 100

        print(marital_attrition.round(2))
        # Education-wise Attrition
        print("\nEducation-wise Attrition:")

        education_attrition = (
            df.groupby("education")["attrition"].value_counts().unstack(fill_value=0)
        )

        education_attrition["Attrition_Rate"] = (
            education_attrition["Yes"]
            / (education_attrition["Yes"] + education_attrition["No"])
        ) * 100

        print(education_attrition.round(2))
        # Department + Overtime Attrition Analysis
        print("\nDepartment + Overtime-wise Attrition:")

        dept_overtime = (
            df.groupby(["department", "over_time"])["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        dept_overtime["Attrition_Rate"] = (
            dept_overtime["Yes"] / (dept_overtime["Yes"] + dept_overtime["No"])
        ) * 100

        print(dept_overtime.round(2))
        # Department + Job Role Attrition Analysis
        print("\nDepartment + Job Role-wise Attrition:")

        dept_jobrole = (
            df.groupby(["department", "job_role"])["attrition"]
            .value_counts()
            .unstack(fill_value=0)
        )

        dept_jobrole["Attrition_Rate"] = (
            dept_jobrole["Yes"] / (dept_jobrole["Yes"] + dept_jobrole["No"])
        ) * 100

        print(dept_jobrole.round(2))
