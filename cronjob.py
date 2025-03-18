
import pymysql

# Database connection parameters
db_config = {
    "host": "mysql-atlantis-hydros.alwaysdata.net",  # Example: "db.example.com" or "localhost"
    "user": "404016_admin",
    "password": "020525_Admin",
    "database": "atlantis-hydros_db",
    "port": 3306  # Ensure correct port
}


# Establish connection
try:
    connection = pymysql.connect(**db_config)
    cursor = connection.cursor()

    # Insert query
    insert_query = """
    INSERT INTO `greenhouse` (`id`, `created_at`, `updated_at`, `deleted_at`, `air_temperature`, `relative_humidity`, `co2_level`, `illumination_intensity`, `timestamp`, `sensor_id`, `airtemp_sensID`, `relhumid_sensID`, `co2_sensID`, `illumination_sensID`) VALUES ('1', '1', '1', '1', '1', '1', b'1', '1', '1', '1', '1', '1', '1', '1')
    """
    
    cursor.execute(insert_query)
    connection.commit()  # Commit the transaction
    print("Data inserted successfully!")

except Exception as e:
    print("Error:", e)

finally:
    cursor.close()
    connection.close()
