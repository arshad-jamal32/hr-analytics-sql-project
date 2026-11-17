
import pandas as pd

# Load HR dataset
file_path = "data/raw/WA_Fn-UseC_-HR-Employee-Attrition.csv"

df = pd.read_csv(file_path)

# Display first 5 records
print("FIRST 5 RECORDS:")
print(df.head())

# Dataset dimensions
print("\nDATASET SHAPE:")
print(df.shape)

# Column names
print("\nCOLUMN NAMES:")
print(df.columns.tolist())

# Dataset information
print("\nDATASET INFORMATION:")
df.info()

# Check missing values
print("\nMISSING VALUES:")
print(df.isnull().sum())

# Total missing values
print("\nTOTAL MISSING VALUES:")
print(df.isnull().sum().sum())

# Check duplicate rows
print("\nDUPLICATE ROWS:")
print(df.duplicated().sum())

# Check duplicate employee IDs
print("\nDUPLICATE EMPLOYEE NUMBERS:")
print(df["EmployeeNumber"].duplicated().sum())

# Check unique values in categorical columns

categorical_columns = df.select_dtypes(include="str").columns

print("\nCATEGORICAL VALUE CHECK:")

for column in categorical_columns:
    print(f"\n{column}:")
    print(df[column].unique())
    
# Statistical summary of numerical columns

print("\nNUMERICAL DATA SUMMARY:")
print(df.describe())

# Check constant columns

columns_to_check = [
    "EmployeeCount",
    "StandardHours",
    "Over18"
]

print("\nCONSTANT COLUMN ANALYSIS:")

for column in columns_to_check:
    print(f"\n{column}:")
    print("Unique values:", df[column].unique())
    print("Number of unique values:", df[column].nunique())
