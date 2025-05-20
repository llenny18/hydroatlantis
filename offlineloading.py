import csv
import os
import time
import uuid
import math
import socket
import logging
from datetime import datetime
from pymodbus.client import ModbusSerialClient
import pymysql
import threading

# Setup logging
logging.basicConfig(level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    handlers=[logging.FileHandler("sensor_log.txt"), logging.StreamHandler()])
logger = logging.getLogger()

# Create a Modbus RTU client
client = ModbusSerialClient(
    port="COM4",
    baudrate=9600,
    parity='N',
    stopbits=1,
    bytesize=8,
    timeout=0.1
)

# Database connection parameters
db_config = {
    "host": "mysql-atlantis-hydros.alwaysdata.net",
    "user": "404016_admin",
    "password": "020525_Admin",
    "database": "atlantis-hydros_db",
    "port": 3306
}

# CSV file paths
DATA_DIR = "sensor_data"
os.makedirs(DATA_DIR, exist_ok=True)

GREENHOUSE_CSV = os.path.join(DATA_DIR, "greenhouse_data.csv")
WATERBED_CSV = os.path.join(DATA_DIR, "waterbed_data.csv")
BIOFILTER_CSV = os.path.join(DATA_DIR, "biofilter_data.csv")
FISHTANK_CSV = os.path.join(DATA_DIR, "fishtank_data.csv")

# Status tracking CSV
UPLOAD_STATUS_CSV = os.path.join(DATA_DIR, "upload_status.csv")

# Sensor data conversion functions
def raw_to_lux(data):
    """Convert raw sensor data to lux values"""
    if len(data) != 4:
        raise ValueError("Data must be a list of 4 integers (bytes)")
    
    raw_value = data[0] | (data[1] << 8) | (data[2] << 16) | (data[3] << 24)
    lux = raw_value * 0.01  # Placeholder scale factor
    return lux / 1000

def raw_to_ec(data, v_ref=5.0, adc_resolution=1024, calibration_constant=1.0):
    """Convert raw ADC data into electrical conductivity (EC)"""
    def bytes_to_adc(low, high):
        return (high << 8) | low

    adc1 = bytes_to_adc(data[0], data[1])
    adc2 = bytes_to_adc(data[2], data[3])

    # Convert ADC value to voltage
    voltage1 = (adc1 / (adc_resolution - 1)) * v_ref
    voltage2 = (adc2 / (adc_resolution - 1)) * v_ref

    # Convert voltage to EC using calibration
    ec1 = voltage1 * calibration_constant
    ec2 = voltage2 * calibration_constant

    return (ec1 + ec2) / 2

def convert_raw_to_nitrite(raw_data, adc_bits=10, ref_voltage=5.0, max_nitrite_mg_per_l=10.0):
    """Convert raw sensor data to nitrite values"""
    values = raw_data[::2]  # Get every other value starting from index 0
    avg_adc = sum(values) / len(values)

    # Convert ADC to voltage
    adc_max = (2 ** adc_bits) - 1
    voltage = (avg_adc / adc_max) * ref_voltage

    # Map voltage to nitrite concentration (linear)
    nitrite_mg_per_l = (voltage / ref_voltage) * max_nitrite_mg_per_l
    return round(nitrite_mg_per_l, 3) / 100

def convert_raw_to_nitrate(raw_data):
    """Convert raw sensor data to nitrate values"""
    sensor_value = raw_data[0]
    nitrate_value = (sensor_value - 1000) * 0.01  # Hypothetical scaling factor
    return (nitrate_value - 200.0) * 0.5

def raw_to_ph(raw_data):
    """Convert raw sensor data to pH values"""
    # Example conversion parameters
    min_raw = 0      # Minimum raw value from the sensor
    max_raw = 1023   # Maximum raw value from the sensor (e.g., for a 10-bit ADC)
    min_ph = 0       # pH corresponding to the minimum raw value
    max_ph = 14      # pH corresponding to the maximum raw value

    # Function to map the raw data to a pH value
    ph_values = []
    for raw in raw_data:
        # Normalize the raw data to a 0-1 scale
        normalized = (raw - min_raw) / (max_raw - min_raw)
        # Convert the normalized value to a pH value
        ph = min_ph + normalized * (max_ph - min_ph)
        ph_values.append(ph)

    return (-math.log10(ph_values[0]) * -10) * 1.7

def convert_to_nitrite(raw_data):
    """Convert raw sensor data to nitrite values (alternative method)"""
    adc_values = [raw_data[0], raw_data[2]]
    a = 0.002  # scale
    b = 0.0    # offset
    nitrite_values = [a * adc + b for adc in adc_values]
    return nitrite_values[0] / 10

def convert_air_data_temp(raw_data):
    """Extract air temperature from raw sensor data"""
    temperature_raw = raw_data[1]
    return (temperature_raw / 10.0) - 40  # Temperature in Celsius

def convert_air_data_humidity(raw_data):
    """Extract humidity from raw sensor data"""
    humidity_raw = raw_data[0]
    return humidity_raw / 10.0  # Humidity value (percent)

# CSV File Initialization Functions
def initialize_csv_files():
    """Create CSV files with headers if they don't exist"""
    # Initialize greenhouse data CSV
    if not os.path.exists(GREENHOUSE_CSV):
        with open(GREENHOUSE_CSV, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['id', 'created_at', 'air_temperature', 'relative_humidity', 
                             'co2_level', 'illumination_intensity', 'uploaded'])
    
    # Initialize waterbed data CSV
    if not os.path.exists(WATERBED_CSV):
        with open(WATERBED_CSV, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['id', 'created_at', 'water_temperature', 'dissolved_o2_level', 
                             'electrical_conductivity', 'total_dissolved_solids', 
                             'nitrate', 'nitrite', 'ammonia', 'ph_level', 'uploaded'])
    
    # Initialize biofilter data CSV
    if not os.path.exists(BIOFILTER_CSV):
        with open(BIOFILTER_CSV, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['id', 'created_at', 'nitrate', 'nitrite', 'ammonia', 'uploaded'])
    
    # Initialize fishtank data CSV
    if not os.path.exists(FISHTANK_CSV):
        with open(FISHTANK_CSV, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['id', 'created_at', 'ec', 'ph', 'nitrate', 'uploaded'])
    
    # Initialize upload status CSV
    if not os.path.exists(UPLOAD_STATUS_CSV):
        with open(UPLOAD_STATUS_CSV, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['table_name', 'record_id', 'uploaded', 'retry_count', 'last_attempt'])

def check_internet_connection():
    """Check if there is an internet connection by attempting to connect to a reliable server"""
    try:
        # Attempt to connect to Google's DNS server
        socket.create_connection(("8.8.8.8", 53), timeout=3)
        return True
    except OSError:
        return False

def save_to_csv(data_type, data_dict):
    """Save sensor data to the appropriate CSV file"""
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    record_id = str(uuid.uuid4())
    
    if data_type == 'greenhouse':
        csv_file = GREENHOUSE_CSV
        row = [
            record_id,
            timestamp,
            data_dict.get('air_temperature', 0),
            data_dict.get('relative_humidity', 0),
            data_dict.get('co2_level', 0),
            data_dict.get('illumination_intensity', 0),
            False
        ]
    elif data_type == 'waterbed':
        csv_file = WATERBED_CSV
        row = [
            record_id,
            timestamp,
            data_dict.get('water_temperature', 0),
            data_dict.get('dissolved_o2_level', 0),
            data_dict.get('electrical_conductivity', 0),
            data_dict.get('total_dissolved_solids', 0),
            data_dict.get('nitrate', 0),
            data_dict.get('nitrite', 0),
            data_dict.get('ammonia', 0),
            data_dict.get('ph_level', 0),
            False
        ]
    elif data_type == 'biofilter':
        csv_file = BIOFILTER_CSV
        row = [
            record_id,
            timestamp,
            data_dict.get('nitrate', 0),
            data_dict.get('nitrite', 0),
            data_dict.get('ammonia', 0),
            False
        ]
    elif data_type == 'fishtank':
        csv_file = FISHTANK_CSV
        row = [
            record_id,
            timestamp,
            data_dict.get('ec', 0),
            data_dict.get('ph', 0),
            data_dict.get('nitrate', 0),
            False
        ]
    else:
        logger.error(f"Unknown data type: {data_type}")
        return None
    
    try:
        with open(csv_file, 'a', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(row)
        logger.info(f"Data saved to {csv_file} with ID {record_id}")
        return record_id
    except Exception as e:
        logger.error(f"Error saving to CSV: {e}")
        return None

def update_csv_status(csv_file, record_id, status=True):
    """Update the 'uploaded' status for a specific record in a CSV file"""
    try:
        # Read all rows
        rows = []
        with open(csv_file, 'r', newline='') as file:
            reader = csv.reader(file)
            header = next(reader)  # Get header
            for row in reader:
                if row and row[0] == record_id:
                    row[-1] = status  # Update the 'uploaded' status
                rows.append(row)
        
        # Write updated data back
        with open(csv_file, 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(header)
            writer.writerows(rows)
        
        logger.info(f"Updated record {record_id} in {csv_file} with status {status}")
        return True
    except Exception as e:
        logger.error(f"Error updating CSV status: {e}")
        return False

def get_pending_records():
    """Get all records that have not been uploaded to the database yet"""
    pending_records = {
        'greenhouse': [],
        'waterbed': [],
        'biofilter': [],
        'fishtank': []
    }
    
    # Check greenhouse data
    if os.path.exists(GREENHOUSE_CSV):
        with open(GREENHOUSE_CSV, 'r', newline='') as file:
            reader = csv.reader(file)
            header = next(reader)  # Skip header
            for row in reader:
                if row and row[-1] == 'False':
                    record = {
                        'id': row[0],
                        'created_at': row[1],
                        'air_temperature': row[2],
                        'relative_humidity': row[3],
                        'co2_level': row[4],
                        'illumination_intensity': row[5]
                    }
                    pending_records['greenhouse'].append(record)
    
    # Check waterbed data
    if os.path.exists(WATERBED_CSV):
        with open(WATERBED_CSV, 'r', newline='') as file:
            reader = csv.reader(file)
            header = next(reader)  # Skip header
            for row in reader:
                if row and row[-1] == 'False':
                    record = {
                        'id': row[0],
                        'created_at': row[1],
                        'water_temperature': row[2],
                        'dissolved_o2_level': row[3],
                        'electrical_conductivity': row[4],
                        'total_dissolved_solids': row[5],
                        'nitrate': row[6],
                        'nitrite': row[7],
                        'ammonia': row[8],
                        'ph_level': row[9]
                    }
                    pending_records['waterbed'].append(record)
    
    # Check biofilter data
    if os.path.exists(BIOFILTER_CSV):
        with open(BIOFILTER_CSV, 'r', newline='') as file:
            reader = csv.reader(file)
            header = next(reader)  # Skip header
            for row in reader:
                if row and row[-1] == 'False':
                    record = {
                        'id': row[0],
                        'created_at': row[1],
                        'nitrate': row[2],
                        'nitrite': row[3],
                        'ammonia': row[4]
                    }
                    pending_records['biofilter'].append(record)
    
    # Check fishtank data
    if os.path.exists(FISHTANK_CSV):
        with open(FISHTANK_CSV, 'r', newline='') as file:
            reader = csv.reader(file)
            header = next(reader)  # Skip header
            for row in reader:
                if row and row[-1] == 'False':
                    record = {
                        'id': row[0],
                        'created_at': row[1],
                        'ec': row[2],
                        'ph': row[3],
                        'nitrate': row[4]
                    }
                    pending_records['fishtank'].append(record)
    
    return pending_records

def upload_record_to_db(data_type, record):
    """Upload a single record to the database"""
    try:
        connection = pymysql.connect(**db_config)
        cursor = connection.cursor()
        
        if data_type == 'greenhouse':
            query = """
            INSERT INTO greenhouse 
            (id, created_at, updated_at, deleted_at, air_temperature, relative_humidity, 
            co2_level, illumination_intensity, timestamp, sensor_id, airtemp_sensID, 
            relhumid_sensID, co2_sensID, illumination_sensID, increment_id) 
            VALUES (%s, %s, '0', '0', %s, %s, %s, %s, %s, '1', '1', '1', '1', '1', NULL)
            """
            params = (
                record['id'],
                record['created_at'],
                record['air_temperature'],
                record['relative_humidity'],
                record['co2_level'],
                record['illumination_intensity'],
                record['created_at']
            )
        
        elif data_type == 'waterbed':
            query = """
            INSERT INTO water_bed 
            (id, created_at, updated_at, deleted_at, water_temperature, dissolved_o2_level, 
            electrical_conductivity, total_dissolved_solids, nitrate, nitrite, ammonia, 
            ph_level, timestamp, sensor_id, do2_sensID, watertemp_sensID, tds_sensID, 
            nitrate_sensID, nitrite_sensID, ammonia_sensID, ph_sensID) 
            VALUES (%s, %s, '0', '0', %s, %s, %s, %s, %s, %s, %s, %s, %s, '0', '0', '0', '0', '0', '0', '0', '0')
            """
            params = (
                record['id'],
                record['created_at'],
                record['water_temperature'],
                record['dissolved_o2_level'],
                record['electrical_conductivity'],
                record['total_dissolved_solids'],
                record['nitrate'],
                record['nitrite'],
                record['ammonia'],
                record['ph_level'],
                record['created_at']
            )
        
        elif data_type == 'biofilter':
            query = """
            INSERT INTO water_biofilter 
            (id, created_at, updated_at, deleted_at, nitrate, nitrite, ammonia, 
            timestamp, sensor_id, nitrate_sensID, nitrite_sensID, ammonia_sensID) 
            VALUES (%s, %s, '0', '0', %s, %s, %s, %s, '0', '0', '0', '0')
            """
            params = (
                record['id'],
                record['created_at'],
                record['nitrate'],
                record['nitrite'],
                record['ammonia'],
                record['created_at']
            )
        
        elif data_type == 'fishtank':
            query = """
            INSERT INTO fish_tank 
            (id, created_at, deleted_at, ec, ph, nitrate, timestamp, 
            ec_sensID, ph_sensID, nitrate_sensID, increment_id) 
            VALUES (%s, %s, NULL, %s, %s, %s, %s, '0', '0', '0', NULL)
            """
            params = (
                record['id'],
                record['created_at'],
                record['ec'],
                record['ph'],
                record['nitrate'],
                record['created_at']
            )
        
        else:
            logger.error(f"Unknown data type: {data_type}")
            return False
        
        cursor.execute(query, params)
        connection.commit()
        
        logger.info(f"Successfully uploaded {data_type} record {record['id']} to database")
        return True
    
    except Exception as e:
        logger.error(f"Error uploading to database: {e}")
        return False
    
    finally:
        if 'connection' in locals() and connection:
            cursor.close()
            connection.close()

def upload_pending_records():
    """Upload all pending records to the database if internet is available"""
    if not check_internet_connection():
        logger.warning("No internet connection. Skipping upload of pending records.")
        return False
    
    logger.info("Internet connection available. Processing pending records...")
    
    # Get all pending records
    pending_records = get_pending_records()
    
    # Upload records for each data type
    for data_type, records in pending_records.items():
        if records:
            logger.info(f"Found {len(records)} pending {data_type} records to upload")
            
            csv_file = {
                'greenhouse': GREENHOUSE_CSV,
                'waterbed': WATERBED_CSV,
                'biofilter': BIOFILTER_CSV,
                'fishtank': FISHTANK_CSV
            }[data_type]
            
            for record in records:
                success = upload_record_to_db(data_type, record)
                if success:
                    # Update the status in the CSV file
                    update_csv_status(csv_file, record['id'], True)
    
    return True

def background_upload_task():
    """Run as a background thread to periodically check and upload pending data"""
    while True:
        try:
            upload_pending_records()
        except Exception as e:
            logger.error(f"Error in background upload task: {e}")
        
        # Wait for 5 minutes before checking again
        time.sleep(300)

def read_sensor_data():
    """Read sensor data from all connected sensors"""
    sensor_data = {}
    
    # Lux sensor (slave 3)
    response = client.read_holding_registers(address=0, count=4, slave=3)
    if not response.isError():
        sensor_data['lux'] = raw_to_lux(response.registers)
        logger.info(f"Lux value: {sensor_data['lux']}")
    else:
        logger.error(f"Modbus error on lux sensor: {response}")
    
    # EC sensor (slave 5)
    response = client.read_holding_registers(address=0, count=4, slave=5)
    if not response.isError():
        sensor_data['ec'] = raw_to_ec(response.registers)
        logger.info(f"EC value: {sensor_data['ec']}")
    else:
        logger.error(f"Modbus error on EC sensor: {response}")
    
    # Nitrite sensor (slave 6)
    response = client.read_holding_registers(address=0, count=4, slave=6)
    if not response.isError():
        sensor_data['nitrite'] = convert_raw_to_nitrite(response.registers)
        logger.info(f"Nitrite value: {sensor_data['nitrite']}")
    else:
        logger.error(f"Modbus error on nitrite sensor: {response}")
    
    # Nitrate sensor (slave 7)
    response = client.read_holding_registers(address=0, count=4, slave=7)
    if not response.isError():
        sensor_data['nitrate_waterbed'] = convert_raw_to_nitrate(response.registers)
        logger.info(f"Nitrate (waterbed) value: {sensor_data['nitrate_waterbed']}")
    else:
        logger.error(f"Modbus error on nitrate (waterbed) sensor: {response}")
    
    # pH sensor (slave 8)
    response = client.read_holding_registers(address=0, count=4, slave=8)
    if not response.isError():
        sensor_data['ph'] = raw_to_ph(response.registers)
        logger.info(f"pH value: {sensor_data['ph']}")
    else:
        logger.error(f"Modbus error on pH sensor: {response}")
    
    # Nitrate sensor (slave 14)
    response = client.read_holding_registers(address=0, count=4, slave=14)
    if not response.isError():
        sensor_data['nitrate_biofilter'] = convert_raw_to_nitrate(response.registers)
        logger.info(f"Nitrate (biofilter) value: {sensor_data['nitrate_biofilter']}")
    else:
        logger.error(f"Modbus error on nitrate (biofilter) sensor: {response}")
    
    # Air temperature and humidity sensor (slave 16)
    response = client.read_holding_registers(address=0, count=4, slave=16)
    if not response.isError():
        sensor_data['air_temp'] = convert_air_data_temp(response.registers)
        sensor_data['humidity'] = convert_air_data_humidity(response.registers)
        logger.info(f"Air temperature: {sensor_data['air_temp']}, Humidity: {sensor_data['humidity']}")
    else:
        logger.error(f"Modbus error on air temp/humidity sensor: {response}")
    
    return sensor_data

def process_sensor_data(sensor_data):
    """Process sensor data and save to CSV files"""
    # Prepare data dictionaries for each system
    greenhouse_data = {
        'air_temperature': sensor_data.get('air_temp', 0),
        'relative_humidity': sensor_data.get('humidity', 0),
        'co2_level': 0,  # No CO2 sensor data available
        'illumination_intensity': sensor_data.get('lux', 0)
    }
    
    waterbed_data = {
        'water_temperature': 0,  # No water temp sensor data available
        'dissolved_o2_level': 0,  # No DO2 sensor data available
        'electrical_conductivity': 0,  # EC sensor data goes to fish tank
        'total_dissolved_solids': 0,  # No TDS sensor data available
        'nitrate': sensor_data.get('nitrate_waterbed', 0),
        'nitrite': 0,  # No nitrite sensor for waterbed
        'ammonia': 0,  # No ammonia sensor data available
        'ph_level': sensor_data.get('ph', 0)
    }
    
    biofilter_data = {
        'nitrate': sensor_data.get('nitrate_biofilter', 0),
        'nitrite': sensor_data.get('nitrite', 0),
        'ammonia': 0  # No ammonia sensor data available
    }
    
    fishtank_data = {
        'ec': sensor_data.get('ec', 0),
        'ph': 0,  # No pH sensor for fish tank
        'nitrate': 0  # No nitrate sensor for fish tank
    }
    
    # Save to CSV files
    greenhouse_id = save_to_csv('greenhouse', greenhouse_data)
    waterbed_id = save_to_csv('waterbed', waterbed_data)
    biofilter_id = save_to_csv('biofilter', biofilter_data)
    fishtank_id = save_to_csv('fishtank', fishtank_data)
    
    # Try to upload to database if internet is available
    if check_internet_connection():
        logger.info("Internet connection available. Attempting to upload recent data...")
        try:
            if greenhouse_id:
                success = upload_record_to_db('greenhouse', {'id': greenhouse_id, **greenhouse_data, 'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
                if success:
                    update_csv_status(GREENHOUSE_CSV, greenhouse_id, True)
            
            if waterbed_id:
                success = upload_record_to_db('waterbed', {'id': waterbed_id, **waterbed_data, 'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
                if success:
                    update_csv_status(WATERBED_CSV, waterbed_id, True)
            
            if biofilter_id:
                success = upload_record_to_db('biofilter', {'id': biofilter_id, **biofilter_data, 'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
                if success:
                    update_csv_status(BIOFILTER_CSV, biofilter_id, True)
            
            if fishtank_id:
                success = upload_record_to_db('fishtank', {'id': fishtank_id, **fishtank_data, 'created_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')})
                if success:
                    update_csv_status(FISHTANK_CSV, fishtank_id, True)
            
        except Exception as e:
            logger.error(f"Error during direct upload: {e}")
    else:
        logger.warning("No internet connection. Data saved locally only.")

def main():
    """Main function to run the sensor data collection and upload process"""
    # Initialize CSV files
    initialize_csv_files()
    
    # Start background upload thread
    upload_thread = threading.Thread(target=background_upload_task, daemon=True)
    upload_thread.start()
    
    # Connect to Modbus device
    if client.connect():
        logger.info("Connected to Modbus device successfully")
        
        try:
            while True:
                try:
                    # Read sensor data
                    sensor_data = read_sensor_data()
                    
                    # Process and save sensor data
                    process_sensor_data(sensor_data)
                    
                    # Wait for next reading cycle (e.g., every 5 minutes)
                    logger.info("Waiting for next data collection cycle...")
                    time.sleep(300)  # 5 minutes
                    
                except KeyboardInterrupt:
                    logger.info("Program stopped by user")
                    break
                except Exception as e:
                    logger.error(f"Error in main loop: {e}")
                    time.sleep(60)  # Wait 1 minute before retrying
        
        finally:
            client.close()
            logger.info("Modbus connection closed")
    else:
        logger.error("Failed to connect to Modbus device")

if __name__ == "__main__":
    main()