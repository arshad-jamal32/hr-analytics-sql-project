
import pandas as pd
from db_connection import create_connection

# Connect to PostgreSQL using SQLAlchemy
engine = create_connection()

if engine:
    try:
        query = "SELECT * FROM hr_employee"

        df = pd.read_sql_query(query, engine)

        print("\nFIRST 5 EMPLOYEE RECORDS:")
        print(df.head())

        print("\nDATA TYPES:")
        print(df.dtypes)

        print("\nMISSING VALUES:")
        print(df.isnull().sum().sum())

        print("\nDATASET SHAPE:")
        print(df.shape)

    finally:
        engine.dispose()
        print("\nDatabase connection closed.")
