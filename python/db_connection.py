
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# Load environment variables from root .env file
load_dotenv()

def create_connection():
    try:
        password = os.getenv("DB_PASSWORD")

        if not password:
            raise ValueError("DB_PASSWORD not found. Check your .env file.")

        connection_url = URL.create(
            drivername="postgresql+psycopg2",
            username=os.getenv("DB_USER", "postgres"),
            password=password,
            host=os.getenv("DB_HOST", "localhost"),
            port=int(os.getenv("DB_PORT", "5432")),
            database=os.getenv("DB_NAME", "hr_analytics")
        )

        engine = create_engine(connection_url)

        with engine.connect():
            print("PostgreSQL connection successful!")

        return engine

    except Exception as error:
        print("Database connection failed:", error)
        return None


if __name__ == "__main__":
    engine = create_connection()

    if engine:
        engine.dispose()
        print("Connection closed.")
