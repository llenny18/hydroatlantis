import pymysql
import subprocess

# Database connection parameters
db_config = {
    "host": "mysql-atlantis-hydros.alwaysdata.net",
    "user": "404016_admin",
    "password": "020525_Admin",
    "database": "atlantis-hydros_db",
    "port": 3306
}

try:
    # Connect to the database
    connection = pymysql.connect(**db_config)
    cursor = connection.cursor()

    # Fetch latest status from pumpstatus table
    cursor.execute("SELECT status FROM pumpstatus ORDER BY status_id DESC LIMIT 1")
    result = cursor.fetchone()

    if result:
        status = result[0]
        print(f"Latest status: {status}")

        if status.lower() == 'activate':
            print("Status is 'activate'. Running pump_control.py...")
            subprocess.run(["python", "pump_control.py"])  # Replace with actual script path

    else:
        print("No data found in pumpstatus table.")

except pymysql.MySQLError as e:
    print(f"Database error: {e}")

finally:
    if connection:
        connection.close()
