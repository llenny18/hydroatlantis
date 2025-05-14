
from pymodbus.client import ModbusSerialClient
import uuid
import math


# Create a Modbus RTU client
client = ModbusSerialClient(
    port="COM4",
    baudrate=9600,
    parity='N',
    stopbits=1,
    bytesize=8,
    timeout=0.1
)





import pymysql

# Database connection parameters
db_config = {
    "host": "mysql-atlantis-hydros.alwaysdata.net",  # Example: "db.example.com" or "localhost"
    "user": "404016_admin",
    "password": "020525_Admin",
    "database": "atlantis-hydros_db",
    "port": 3306  # Ensure correct port
}



def raw_to_lux(data):
    if len(data) != 4:
        raise ValueError("Data must be a list of 4 integers (bytes)")

    # Convert list of 4 bytes to a 32-bit integer (little-endian)
    raw_value = data[0] | (data[1] << 8) | (data[2] << 16) | (data[3] << 24)

    # Example scale factor (varies by sensor)
    # Adjust this according to your sensor's datasheet
    lux = raw_value * 0.01  # Just a placeholder scale factor

    return lux / 1000

def raw_to_ec(data, v_ref=5.0, adc_resolution=1024, calibration_constant=1.0):
    """
    Convert raw ADC data into electrical conductivity (EC).

    Parameters:
    - data: List of 4 integers [low1, high1, low2, high2]
    - v_ref: Reference voltage for ADC
    - adc_resolution: Resolution of ADC (e.g., 1024 for 10-bit ADC)
    - calibration_constant: Sensor-specific calibration factor

    Returns:
    - Tuple of two EC values in mS/cm (or relevant units)
    """

    def bytes_to_adc(low, high):
        return (high << 8) | low

    adc1 = bytes_to_adc(data[0], data[1])
    adc2 = bytes_to_adc(data[2], data[3])

    # Convert ADC value to voltage
    voltage1 = (adc1 / (adc_resolution - 1)) * v_ref
    voltage2 = (adc2 / (adc_resolution - 1)) * v_ref

    # Convert voltage to EC using calibration (example: EC = voltage * K)
    ec1 = voltage1 * calibration_constant
    ec2 = voltage2 * calibration_constant

    return (ec1 + ec2) / 2


def convert_raw_to_nitrite(raw_data, adc_bits=10, ref_voltage=5.0, max_nitrite_mg_per_l=10.0):
    # Extract only the raw values (ignore status bits)
    values = raw_data[::2]  # Get every other value starting from index 0
    avg_adc = sum(values) / len(values)

    # Convert ADC to voltage
    adc_max = (2 ** adc_bits) - 1
    voltage = (avg_adc / adc_max) * ref_voltage

    # Map voltage to nitrite concentration (linear)
    nitrite_mg_per_l = (voltage / ref_voltage) * max_nitrite_mg_per_l
    return round(nitrite_mg_per_l, 3) / 100


def convert_raw_to_nitrate(raw_data):
    # Assuming raw_data is a list of [sensor_value1, sensor_value2, sensor_value3, sensor_value4]
    # Apply a specific formula or scaling based on the sensor's datasheet
    sensor_value = raw_data[0]  # Example: First value is the one we want to process

    # Example conversion (this is a placeholder, replace it with the actual formula)
    # Assuming the sensor's data is scaled such that this is the conversion:
    nitrate_value = (sensor_value - 1000) * 0.01  # Hypothetical scaling factor

    return (nitrate_value - 200.0) * 0.5

def raw_to_ph(raw_data):
    # Assuming the raw data is an ADC value and pH has a linear relationship
    # This is a simplified example. You might need to adjust it with your sensor's calibration.

    # Example calibration values (adjust these as needed):
    sensor_offset = 0  # Sensor offset for zero pH
    sensor_sensitivity = 0.1  # Sensitivity factor (change this based on your sensor)

    # Convert raw data to a single integer value
    raw_value = raw_data[0] + (raw_data[1] << 8) + (raw_data[2] << 16) + (raw_data[3] << 24)

    # Apply calibration (adjust these formulas for your sensor)
    ph_value = (raw_value - sensor_offset) * sensor_sensitivity

    return (-math.log10(ph_value[0]) * -10)*1.7


def raw_to_ph(raw_data):
    # Example conversion parameters (these may need to be adjusted for your specific sensor)
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

    return (-math.log10(ph_values[0]) * -10)*1.7

def convert_to_nitrite(raw_data):
    # Assuming raw_data = [adc1, flag1, adc2, flag2]
    adc_values = [raw_data[0], raw_data[2]]

    # Example calibration coefficients (replace with actual values)
    a = 0.002  # scale
    b = 0.0    # offset

    # Convert ADC readings to nitrite concentrations
    nitrite_values = [a * adc + b for adc in adc_values]

    return nitrite_values /10

def convert_air_data_air_temp(raw_data):
    # Assuming raw_data is in the format [humidity_raw, temperature_raw, sensor_error1, sensor_error2]

    humidity_raw = raw_data[0]
    temperature_raw = raw_data[1]

    # Example conversion formulas (adjust these according to your sensor's datasheet)
    humidity = humidity_raw / 10.0  # Humidity value (percent)
    temperature = (temperature_raw / 10.0) - 40  # Temperature in Celsius (adjust for your sensor)

    return humidity


def convert_air_data_humidity(raw_data):
    # Assuming raw_data is in the format [humidity_raw, temperature_raw, sensor_error1, sensor_error2]

    humidity_raw = raw_data[0]
    temperature_raw = raw_data[1]

    # Example conversion formulas (adjust these according to your sensor's datasheet)
    humidity = humidity_raw / 10.0  # Humidity value (percent)
    temperature = (temperature_raw / 10.0) - 40  # Temperature in Celsius (adjust for your sensor)

    return temperature

# Connect to the Modbus slave
if client.connect():
    while True:
        '''
        responsePH = client.read_holding_registers(address=0, count=4, slave=1)
        if not responsePH.isError():
            print("Register values for pH:", responsePH.registers)
        else:
            print("Modbus error:", responsePH)
        '''
        response = client.read_holding_registers(address=0, count=4, slave=3)
        if not response.isError():
            print("Register values for slave 3:", raw_to_lux(response.registers))
        else:
            print("Modbus error:", response)

        response3 = client.read_holding_registers(address=0, count=4, slave=5)
        if not response3.isError():
            print("Register values for slave 5:", raw_to_ec(response3.registers))
        else:
            print("Modbus error:", response3)

        response1 = client.read_holding_registers(address=0, count=4, slave=6)
        if not response1.isError():
            print("Register values for slave 6:", convert_raw_to_nitrite(response1.registers))
        else:
            print("Modbus error:", response1)

        response4 = client.read_holding_registers(address=0, count=4, slave=7)
        if not response4.isError():
            print("Register values for slave 7:", convert_raw_to_nitrate(response4.registers))
        else:
            print("Modbus error:", response4)

        response5 = client.read_holding_registers(address=0, count=4, slave=8)
        if not response5.isError():
            print("Register values for slave 8:", raw_to_ph(response5.registers))
        else:
            print("Modbus error:", response5)

        response6 = client.read_holding_registers(address=0, count=4, slave=14)
        if not response6.isError():
            print("Register values for slave 14:", convert_raw_to_nitrate(response6.registers))
        else:
            print("Modbus error:", response6)

        response2 = client.read_holding_registers(address=0, count=4, slave=16)
        if not response2.isError():
            print("Register values for slave 16:", convert_air_data_air_temp(response2.registers))
        else:
            print("Modbus error:", response2)


        # Establish connection
        try:
            connection = pymysql.connect(**db_config)
            cursor = connection.cursor()

            # Insert query
            random_uuid = str(uuid.uuid4())
            greehouse_query = "INSERT INTO `greenhouse` (`id`, `created_at`, `updated_at`, `deleted_at`, `air_temperature`, `relative_humidity`, `co2_level`, `illumination_intensity`, `timestamp`, `sensor_id`, `airtemp_sensID`, `relhumid_sensID`, `co2_sensID`, `illumination_sensID`, `increment_id`) VALUES ("+random_uuid+", NOW(), '0', '0', '"+str(convert_air_data_air_temp(response2.registers))+"', '"+str(convert_air_data_humidity(response2.registers))+"', '0', '"+str(raw_to_lux(response.registers))+"', current_timestamp(), '1', '1', '1', '1', '1', NULL)"

            random_uuid = str(uuid.uuid4())
            waterbed_query = "INSERT INTO `water_bed` (`id`, `created_at`, `updated_at`, `deleted_at`, `water_temperature`, `dissolved_o2_level`, `electrical_conductivity`, `total_dissolved_solids`, `nitrate`, `nitrite`, `ammonia`, `ph_level`, `timestamp`, `sensor_id`, `do2_sensID`, `watertemp_sensID`, `tds_sensID`, `nitrate_sensID`, `nitrite_sensID`, `ammonia_sensID`, `ph_sensID`) VALUES ("+random_uuid+", NOW(), '0', '0', '0', '0', '0', '0', '"+str(convert_raw_to_nitrate(response6.registers))+"', '0', '0', '"+str(raw_to_ph(response5.registers))+"', current_timestamp(), '0', '0', '0', '0', '0', '0', '0', '0'))"

            random_uuid = str(uuid.uuid4())
            waterbiofilter_query = "INSERT INTO `water_biofilter` (`id`, `created_at`, `updated_at`, `deleted_at`, `nitrate`, `nitrite`, `ammonia`, `timestamp`, `sensor_id`, `nitrate_sensID`, `nitrite_sensID`, `ammonia_sensID`) VALUES ('"+random_uuid+"', NOW(), '0', '0', '"+str(convert_raw_to_nitrate(response6.registers))+"', '"+str(convert_raw_to_nitrite(response1.registers))+"', '0', 'current_timestamp()', '0', '0', '0', '0')"

            random_uuid = str(uuid.uuid4())
            fishtank_query = "INSERT INTO `fish_tank` (`id`, `created_at`, `updated_at`, `deleted_at`, `ec`, `ph`, `nitrate`, `timestamp`, `ec_sensID`, `ph_sensID`, `nitrate_sensID`, `increment_id`) VALUES ('"+random_uuid+"', NOW(), NULL, NULL, '"+str(raw_to_ec(response3.registers))+"', '0', '0', '0', '0', '0', '0', NULL);"


            cursor.execute(greehouse_query)
            cursor.execute(waterbed_query)
            cursor.execute(waterbiofilter_query)
            cursor.execute(fishtank_query)
            connection.commit()  # Commit the transaction
            print("Data inserted successfully!")

        except Exception as e:
            print("Error:", e)

        finally:
            cursor.close()
        connection.close()

        print("-"*15)
else:
    print("Connection to Modbus device failed.")




client.close()

