
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os

from db_connection import create_connection

# Create reports folder if it does not exist
os.makedirs("reports", exist_ok=True)

# Set chart style
sns.set_theme(style="whitegrid")

# Connect to PostgreSQL
engine = create_connection()

if engine:
    try:
        query = "SELECT * FROM hr_employee"
        df = pd.read_sql_query(query, engine)

        print("\nCreating HR Analytics Visualizations...")

        # 1. Overall Employee Attrition
        plt.figure(figsize=(7, 5))
        sns.countplot(data=df, x="attrition", order=["No", "Yes"])

        plt.title("Overall Employee Attrition")
        plt.xlabel("Attrition")
        plt.ylabel("Number of Employees")

        plt.tight_layout()
        plt.savefig("reports/01_overall_attrition.png", dpi=300)
        plt.close()

        # 2. Department-wise Attrition Rate
        dept_rate = (
            df.groupby("department")["attrition"]
            .apply(lambda x: (x == "Yes").mean() * 100)
            .reset_index(name="Attrition_Rate")
        )

        plt.figure(figsize=(8, 5))
        sns.barplot(data=dept_rate, x="department", y="Attrition_Rate")

        plt.title("Department-wise Attrition Rate")
        plt.xlabel("Department")
        plt.ylabel("Attrition Rate (%)")

        plt.tight_layout()
        plt.savefig("reports/02_department_attrition.png", dpi=300)
        plt.close()

        # 3. Job Role-wise Attrition Rate
        role_rate = (
            df.groupby("job_role")["attrition"]
            .apply(lambda x: (x == "Yes").mean() * 100)
            .reset_index(name="Attrition_Rate")
            .sort_values("Attrition_Rate", ascending=False)
        )

        plt.figure(figsize=(10, 7))
        sns.barplot(data=role_rate, y="job_role", x="Attrition_Rate")

        plt.title("Job Role-wise Attrition Rate")
        plt.xlabel("Attrition Rate (%)")
        plt.ylabel("Job Role")

        plt.tight_layout()
        plt.savefig("reports/03_jobrole_attrition.png", dpi=300)
        plt.close()

        # 4. Age Group-wise Attrition Rate
        df["Age_Group"] = pd.cut(
            df["age"],
            bins=[0, 25, 35, 45, 55, 100],
            labels=["Under 25", "25-34", "35-44", "45-54", "55+"]
        )

        age_rate = (
            df.groupby("Age_Group", observed=True)["attrition"]
            .apply(lambda x: (x == "Yes").mean() * 100)
            .reset_index(name="Attrition_Rate")
        )

        plt.figure(figsize=(8, 5))
        sns.barplot(data=age_rate, x="Age_Group", y="Attrition_Rate")

        plt.title("Age Group-wise Attrition Rate")
        plt.xlabel("Age Group")
        plt.ylabel("Attrition Rate (%)")

        plt.tight_layout()
        plt.savefig("reports/04_age_attrition.png", dpi=300)
        plt.close()

        # 5. Overtime-wise Attrition Rate
        overtime_rate = (
            df.groupby("over_time")["attrition"]
            .apply(lambda x: (x == "Yes").mean() * 100)
            .reset_index(name="Attrition_Rate")
        )

        plt.figure(figsize=(7, 5))
        sns.barplot(data=overtime_rate, x="over_time", y="Attrition_Rate")

        plt.title("Overtime-wise Attrition Rate")
        plt.xlabel("Overtime")
        plt.ylabel("Attrition Rate (%)")

        plt.tight_layout()
        plt.savefig("reports/05_overtime_attrition.png", dpi=300)
        plt.close()

        print("\nAll 5 visualizations created successfully!")
        print("Charts saved inside the reports folder.")

    finally:
        engine.dispose()
        print("\nDatabase connection closed.")
