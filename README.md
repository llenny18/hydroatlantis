# Hydroponics Monitoring and Control System

## Overview
This project is a **smart hydroponics monitoring and control system** that integrates **Django** with **MySQL** to store and manage sensor data. The system uses **machine learning (LSTM and other techniques)** to predict water quality, schedule sensor calibration and maintenance, and provide automated control of actuators.

## Features
- **Sensor Data Collection:** Data from multiple sensors across different locations (**Greenhouse, Water Test Bed, Water Bed, Water Bio Filter, and Fish Tank**) are collected and stored in MySQL.
- **Alerts & Notifications:** The system triggers alerts for:
  - Sensor calibration and maintenance needs.
  - Water quality deviations.
- **Data Visualization:** Display sensor data using **tables and charts**.
- **Machine Learning Predictions:** LSTM-based predictions for:
  - Water quality trends.
  - Sensor maintenance schedules.
- **User Management:**
  - **Admin:** Can manage sensors, users, and control devices.
  - **User:** Can register, log in, and view sensor data.
- **Device Control:** Ability to turn devices ON/OFF based on sensor conditions.

## Components
### **Hardware**
#### **Sensor Panel**
- Collects data from multiple sensors using **RS485 communication**.
- Sends data to MySQL via **RS485 to USB converter**.

#### **Actuator Panel**
Devices controlled by the system:
1. **EXHAUST FAN**
2. **WATER PUMP**
3. **WATER BLENDER**
4. **EVAPORATOR COOLER**
5. **AERATION PUMP**
6. **SOLENOID VALVE 1**
7. **GREENHOUSE LIGHT**
8. **FISH FEEDER**
9. **SOLENOID VALVE 2**
10. **NAIMER LAMPS**
11. **SOLENOID VALVE 3**
12. **GREENHOUSE SHADING**
13. **WATER AERATOR**
14. **SOLENOID VALVE 4**

#### **Main Panel**
- Uses **Jetson Nano** for data processing.
- A **7-inch LCD Display** provides a graphical interface.
- **10-Port USB Hub** for device connectivity.
- Power managed via **220VAC Power Distribution Unit**.

### **Software Stack**
- **Django (Backend)**: Handles user authentication, sensor data storage, and control logic.
- **MySQL (Database)**: Stores sensor readings, user data, and device states.
- **Machine Learning**: LSTM and other models predict water quality and maintenance needs.
- **JavaScript (Frontend)**: For interactive charts, tables, and control buttons.
- **Bootstrap & DataTables**: Enhances UI for data presentation.

## Installation
1. **Clone the Repository**
```bash
  git clone https://github.com/llenny18/hydroatlantis.git
  cd hydroatlantis
```
2. **Install Dependencies**
```bash
  pip install -r requirements.txt
```
3. **Run Database Migrations**
```bash
  python manage.py migrate
```
4. **Start the Django Server**
```bash
  python manage.py runserver
```

## Usage
- **Login/Register** as an **Admin** or **User**.
- **View sensor data** in tables and charts.
- **Receive alerts** for water quality and sensor issues.
- **Control devices** remotely from the dashboard.

## Future Enhancements
- **Mobile App Integration** for remote monitoring.
- **AI-based automation** for actuator control.
- **Cloud-based Data Storage** for scalability.

## Contributors
- **Digital Transformation Center** - Developer & Researcher

## License
This project is licensed under the MIT License.

