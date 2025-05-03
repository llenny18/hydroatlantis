import serial
from pymodbus.client.sync import ModbusSerialClient
from pymodbus.exceptions import ModbusException

def scan_slave_ids(port, baudrate=9600, timeout=1):
    # Initialize the modbus serial client
    client = ModbusSerialClient(
        method='rtu',
        port=port,
        baudrate=baudrate,
        timeout=timeout,
        parity='N',
        stopbits=1,
        bytesize=8
    )

    if not client.connect():
        print(f"Failed to connect on port {port}")
        return

    print(f"Scanning slave IDs on port {port}...")
    responding_slaves = []

    # Modbus slave IDs range from 1 to 247
    for slave_id in range(1, 248):
        try:
            # Commonly, reading holding register 0 (address 0) with count 1 is a safe way to check
            result = client.read_holding_registers(address=0, count=1, unit=slave_id)
            if not result.isError():
                print(f"Slave ID {slave_id} responded")
                responding_slaves.append(slave_id)
        except (ModbusException, AttributeError):
            # No response or error
            pass

    client.close()
    if responding_slaves:
        print("Responsive slave IDs:", responding_slaves)
    else:
        print("No slave IDs responded.")

if __name__ == "__main__":
    # Change COM3 to your actual COM port name, and baudrate to your sensor's baudrate
    scan_slave_ids(port="COM4", baudrate=9600)
