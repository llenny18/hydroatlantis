#ATLANTIS System Water Parameter Correction MPC
#Use SI Units for all variables

#------------------------------------------------
#         INITIALIZATION
#------------------------------------------------
import numpy as np
from numpy.linalg import matrix_rank
from scipy.linalg import expm
from control import obsv
from scipy.optimize import minimize, Bounds
import serial
import time
from cronbus import get_mpc_sensor_readings, collect_sensor_data

#------------------------------------------------
#         MPC FUNCTION
#------------------------------------------------
def atlantis_mpc(Y_ref, Y_history, U_history, X_hat_0, Est_Hori):
    #------------------------------------------------
    #         MODEL PARAMETERS
    #------------------------------------------------
    n_states = 6 #no. of states
    n_y = 6 #no. of sensors
    n_u = 5 #no. of actuators
    V1 = 12.92 #Fish tank volume
    V2 = 1.25 #Biofilter volume
    V3 = 7.02 #Hydroponics Volume
    Q1 = 0.0009 #Flow rate from fish tank to bio-filter
    Q2 = 0.0009 #Flow rate from bio-filter to hydroponics
    Q3 = 0.0009 #Flow rate from hydroponics to fish tank
    mu_max = 0.01 #Total nitrification (active surface area of bio-carrier x TAN conversion rate)
    k_NHx_pHup_1 = 280 #Factor for effect of pH up on fish tank ammonia absorption
    k_NO3_pHup_1 = 1.2 #Factor for effect of pH up on fish tank nitrates absorption
    k_NHx_pHdn_3 = 2 #Factor for effect of pH down on hydroponics ammonia absorption
    k_NO3_pHdn_3 = 0.7 #Factor for effect of pH down on hydroponics nitrates absorption
    k_NHx_Mg_3 = 0.85 #Factor for effect of magnesium on hydroponics ammonia absorption
    k_NHx_Ca_3 = 0.8 #Factor for effect of calcium on hydroponics ammonia absorption
    k_NHx_NPK_3 = 1.2 #Factor for effect of NPK on hydroponics ammonia absorption
    k_NO3_Mg_3 = 1.3 #Factor for effect of magnesium on hydroponics nitrates absorption
    k_NO3_Ca_3 = 1.2 #Factor for effect of calcium on hydroponics nitrates absorption
    k_NO3_NPK_3 = 1.3 #Factor for effect of NPK on hydroponics nitrates absorption
    k_EC_NHx_1 = 0.01 #Factor for effect of fish tank ammonia on fish tank EC
    k_EC_NO3_1 = 0.05 #Factor for effect of fish tank nitrates on fish tank EC
    k_pH_NHx_3 = -0.01 #Factor for effect of hydroponics ammonia on hydroponics pH
    k_pH_NO3_3 = 0.01 #Factor for effect of hydroponics nitrates on hydroponics pH
    k_pH_pHdn_3 = -1 #Factor for effect of pH down on hydroponics pH
    k_pH_Mg_3 = 0.05 #Factor for effect of magnesium on hydroponics pH
    k_pH_Ca_3 = 0.1 #Factor for effect of calcium on hydroponics pH
    k_pH_NPK_3 = 0.2 #Factor for effect of NPK on hydroponics pH
    k_EC_phUp_1 = 0.01 #Factor for effect of pH up on fish tank EC
    dX_NHx_exc = 0.1 #Fish ammonia excretion rate
    dX_NHx_abs = -0.1 #Plant ammonia absorption rate (<0)
    dX_NO3_abs = -0.1 #Plant nitrates absorption rate (<0)
    Predict_Hor = 10 #Prediction horizon
    Cont_Hor = 3 #Control horizon
    max_pHdn = 1 #Maximum pHup
    max_pHup = 1 #Maximum pHdn
    max_Mg = 1 #Maximum Mg
    max_Ca = 1 #Maximum Ca
    max_NPK = 1 #Maximum NPK
    control_bounds_max_base = np.array([max_pHdn, max_pHup, max_Mg, max_Ca, max_NPK])
    control_bounds_max = np.repeat(a=control_bounds_max_base, repeats=Cont_Hor, axis=0).flatten()
    control_bounds_min = np.zeros((1, n_u * Cont_Hor)).flatten()
    control_bounds = Bounds(control_bounds_min, control_bounds_max) #Control bounds
    tau = 1 #Time constant

    #------------------------------------------------
    #         MODEL
    #------------------------------------------------
    #STATE MATRIX
    A = np.matrix([[-Q1/V1, 0, Q3/V1, 0, 0, 0],
                  [Q1/V2, -Q2/V2, 0, 0, 0, 0],
                  [0, Q2/V3, -Q3/V3, 0, 0, 0],
                  [0, 0, 0, -Q1/V1, 0, Q3/V1],
                  [0, 0, 0, Q1/V2, -Q2/V2, 0],
                  [0, 0, 0, 0, Q2/V3, -Q3/V3]])

    #INPUT MATRIX
    B = np.matrix([[0, k_NHx_pHup_1, 0, 0, 0, 1/V1, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 1/V2, 0, 0, 0, 0],
                  [k_NHx_pHdn_3, 0, k_NHx_Mg_3, k_NHx_Ca_3, k_NHx_NPK_3, 0, 0, 1/V3, 0, 0, 0],
                  [0, k_NO3_pHup_1, 0, 0, 0, 0, 0, 0, 1/V1, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1/V2, 0],
                  [k_NO3_pHdn_3, 0, k_NO3_Mg_3, k_NO3_Ca_3, k_NO3_NPK_3, 0, 0, 0, 0, 0, 1/V3]])

    #OUTPUT MATRIX
    C = np.matrix([[0, 1, 0, 0, 0, 0],
                  [0, 0, 1, 0, 0, 0],
                  [0, 0, 0, 0, 1, 0],
                  [0, 0, 0, 0, 0, 1],
                  [k_EC_NHx_1, 0, 0, k_EC_NO3_1, 0, 0],
                  [0, 0, k_pH_NHx_3, 0, 0, k_pH_NO3_3]])

    #FEEDFORWARD MATRIX
    D = np.matrix([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, k_EC_phUp_1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [k_pH_pHdn_3, 0, k_pH_Mg_3, k_pH_Ca_3, k_pH_NPK_3, 0, 0, 0, 0, 0, 0]])

    #DISCRETIZATION
    AdBd=expm((np.concatenate((np.concatenate((A,B),axis=1),np.zeros((11,17))),axis=0))*tau)
    Ad = AdBd[0:n_states:1, 0:n_states:1]
    Bd = AdBd[0:n_y:1, n_states:2*n_states+n_y:1]
    #print(AdBd[n_states:2*n_states+n_y:1, n_states:2*n_states+n_y:1]) #for checking only, must be an identity matrix
    Cd = C
    Dd = D

    #------------------------------------------------
    #         ANALYTICS
    #------------------------------------------------
    if matrix_rank(obsv(A, C)) == n_states:
        print("System is observable.")
    else:
        print("System is not observable")

    # ------------------------------------------------
    #         MOVING HORIZON ESTIMATOR
    # ------------------------------------------------
    def mhe(X_hat_0_mhe):
        X_hat_0_mhe_reshaped = X_hat_0_mhe.reshape((n_states, 1))
        W_X = np.diag([1, 1, 1, 1, 1, 1]) #Weights for arrival cost
        W_Y = np.diag([1, 1, 1, 1, 1, 1]) #Weights for output fit
        Ks = mu_max/2
        X_hat_est = np.zeros((n_states, Est_Hor))
        X_hat_est[:, 0] = X_hat_0_mhe_reshaped[:, 0]
        DD = np.matrix([[dX_NHx_exc / V1],
                       [-(mu_max * X_hat_est[1, 0]) / (Ks + X_hat_est[1, 0])],
                       [dX_NHx_abs / V3],
                       [0],
                       [(mu_max * X_hat_est[3, 0]) / (Ks + X_hat_est[3, 0])],
                       [dX_NO3_abs]])
        X_hat_diff = np.subtract(X_hat_0, X_hat_0_mhe_reshaped)
        J_mhe_1 = float(np.dot(np.transpose(X_hat_diff), np.matmul(W_X, X_hat_diff))) #Arrival cost
        Y_hat_est = np.zeros((n_states, Est_Hor))
        U_history_mhe = np.concatenate((U_history, np.zeros((n_states, Est_Hor))))
        U_history_mhe[n_u:n_u+n_states:1, [0]] = DD
        Y_hat_est[:, [0]] = np.add(np.matmul(Cd, X_hat_0_mhe_reshaped),
                                 np.matmul(Dd, U_history_mhe[:, [0]]))
        Y_diff = np.subtract(Y_history[:, [0]], Y_hat_est[:, [0]])
        J_mhe_2 = float(np.dot(np.transpose(Y_diff), np.matmul(W_Y, Y_diff))) #Output fit - initial
        for k in range(Est_Hor-1):
            X_hat_est[:, [k+1]] = np.add(np.matmul(Ad, X_hat_est[:, [k]]),
                                       np.matmul(Bd, U_history_mhe[:, [k]]))
            DD = np.matrix([[dX_NHx_exc / V1],
                            [-(mu_max * X_hat_est[1, k+1]) / (Ks + X_hat_est[1, k+1])],
                            [dX_NHx_abs / V3],
                            [0],
                            [(mu_max * X_hat_est[3, k+1]) / (Ks + X_hat_est[3, k+1])],
                            [dX_NO3_abs]])
            U_history_mhe[n_u:n_u + n_states:1, [k+1]] = DD
            Y_hat_est[:, [k+1]] = np.add(np.matmul(Cd, X_hat_est[:, [k+1]]),
                                       np.matmul(Dd, U_history_mhe[:, [k+1]]))
            Y_diff = np.subtract(Y_history[:, k+1], Y_hat_est[:, k+1])
            J_mhe_2 = J_mhe_2 + float(np.dot(Y_diff, np.matmul(W_Y, Y_diff))) #Output fit
        global X_hat_current
        X_hat_current = X_hat_est[:, [-1]] #State estimate, passed to MPC
        J_mhe = J_mhe_1 + J_mhe_2 #MHE cost
        return J_mhe

    X_hat = minimize(mhe, X_hat_0.flatten(), method='SLSQP').x.reshape(n_states, 1)

    #------------------------------------------------
    #         MPC PROPER
    #------------------------------------------------
    def mpc(U_mpc):
        U_mpc = U_mpc.reshape((n_u, Cont_Hor), order='F')
        Q = np.diag([1,1,1,1,10,10]) #Output Cost Matrix
        R = np.diag([1,1,1,1,1]) #Input Cost Matrix
        Ks = mu_max/2
        X_hat_k = X_hat_current
        Y_mpc_diff = np.subtract(Y_history[:, [-1]], Y_ref)
        J_mpc_1 = float(np.dot(np.transpose(Y_mpc_diff), np.matmul(Q, Y_mpc_diff)))
        J_mpc_2 = 0
        for k in range(Predict_Hor):
            DD = np.matrix([[dX_NHx_exc / V1],
                           [-(mu_max * X_hat_k[1, 0]) / (Ks + X_hat_k[1, 0])],
                           [dX_NHx_abs / V3],
                           [0],
                           [(mu_max * X_hat_k[3, 0]) / (Ks + X_hat_k[3, 0])],
                           [dX_NO3_abs]])
            if k < Cont_Hor:
                U_k = np.concatenate((U_mpc[:, [k]], DD), axis=0)
            else:
                U_k = np.concatenate((U_mpc[:, [Cont_Hor-1]], DD), axis=0)
            X_hat_kp1 = np.add(np.matmul(Ad, X_hat_k), np.matmul(Bd, U_k))
            Y_hat_kp1 = np.add(np.matmul(Cd, X_hat_k), np.matmul(Dd, U_k))
            X_hat_k = X_hat_kp1
            if k < Predict_Hor:
                Y_mpc_diff = np.subtract(Y_hat_kp1, Y_ref)
                J_mpc_1 = J_mpc_1 + float(np.dot(np.transpose(Y_mpc_diff), np.matmul(Q, Y_mpc_diff)))
            if k < Cont_Hor:
                J_mpc_2 = J_mpc_2 + float(np.dot(np.transpose(U_mpc[:, k]), np.matmul(R, U_mpc[:, k])))
            else:
                J_mpc_2 = J_mpc_2 + float(np.dot(np.transpose(U_mpc[:, Cont_Hor-1]), np.matmul(R, U_mpc[:, Cont_Hor-1])))
        J_mpc = J_mpc_1 + J_mpc_2
        return J_mpc
    U_optimal = minimize(mpc, np.zeros(n_u * Cont_Hor), method='SLSQP', bounds=control_bounds)
    U_opt_k = U_optimal.x[0:n_u].reshape(n_u, 1)
    return U_opt_k, X_hat

#------------------------------------------------
#         SENSOR INPUT GENERATION
#------------------------------------------------
def estimate_ammonia_from_ph_nitrate(pH, nitrate, tank_type='biofilter'):
    """
    Estimate ammonia concentration based on pH and nitrate levels
    Higher pH typically indicates lower ammonia (NH3/NH4+ equilibrium)
    Higher nitrates may indicate completed nitrification (lower ammonia)
    """
    if tank_type == 'biofilter':
        # Biofilter: active nitrification, pH affects NH3/NH4+ ratio
        # Lower pH (more acidic) = more NH4+, higher pH = more toxic NH3
        base_ammonia = 0.5  # mg/L base level
        ph_factor = max(0.1, (8.5 - pH) * 0.3)  # pH effect (ideal pH ~7-8)
        nitrate_factor = max(0.1, (2.0 - nitrate) * 0.2)  # Lower nitrates = incomplete nitrification
        estimated_ammonia = base_ammonia * ph_factor * nitrate_factor
        
    elif tank_type == 'hydroponics':
        # Hydroponics: plant uptake affects both ammonia and nitrates
        base_ammonia = 0.3  # mg/L base level (lower due to plant uptake)
        ph_factor = max(0.05, (7.5 - pH) * 0.25)  # Plants prefer pH 6-7
        nitrate_factor = max(0.05, (1.5 - nitrate) * 0.15)
        estimated_ammonia = base_ammonia * ph_factor * nitrate_factor
        
    else:  # fish_tank
        # Fish tank: ammonia production from fish waste
        base_ammonia = 0.8  # mg/L higher base due to fish waste
        ph_factor = max(0.2, (8.0 - pH) * 0.4)
        nitrate_factor = max(0.2, (3.0 - nitrate) * 0.3)
        estimated_ammonia = base_ammonia * ph_factor * nitrate_factor
    
    return max(0.01, min(5.0, estimated_ammonia))  # Clamp between 0.01-5.0 mg/L

def get_sensor_readings_with_fallback(Y_set, iteration, previous_Y=None):
    """
    Get sensor readings with fallback to generated values
    """
    try:
        # Try to get real sensor readings
        return get_mpc_sensor_readings(Y_set, previous_Y)
    except Exception as e:
        print(f"Error reading sensors, using fallback: {e}")
        # Fallback to generated readings
        return generate_sensor_inputs(Y_set, iteration, previous_Y)

#------------------------------------------------
#         RUNNING
#------------------------------------------------
Est_Hor = 10
num_states = 6
num_u = 5
num_y = 6
Y_Hist = np.zeros((num_y, Est_Hor))
U_Hist = np.zeros((num_u, Est_Hor))
X_hat_current = np.zeros((num_states, 1))
Y_set = np.matrix([[1],    # Setpoint for ammonia in biofilter
                  [1],     # Setpoint for ammonia in hydroponics
                  [75],    # Setpoint for nitrates in biofilter
                  [75],    # Setpoint for nitrates in hydroponics
                  [6.9],   # Setpoint for EC in fish tank
                  [6.5]])  # Setpoint for pH in hydroponics

# Initialize with real sensor readings where possible
print("Initializing with sensor readings...")
for i in range(Est_Hor):
    if i == 0:
        Y_Hist[:, [i]] = get_sensor_readings_with_fallback(Y_set, i)
    else:
        Y_Hist[:, [i]] = get_sensor_readings_with_fallback(Y_set, i, Y_Hist[:, [i-1]])

X_hat_prev = np.zeros((num_states, 1))

Qu_pHup = 0.000002   # pH up pump flow rate
Qu_pHdn = 0.000002   # pH down pump flow rate
Qu_Mg = 0.000002     # Magnesium pump flow rate
Qu_Ca = 0.000002     # Calcium pump flow rate
Qu_NPK = 0.000002    # NPK pump flow rate
Xu_pHup = 0.1        # pH up concentration
Xu_pHdn = 0.1        # pH down concentration
Xu_Mg = 0.1          # Magnesium concentration
Xu_Ca = 0.1          # Calcium concentration
Xu_NPK = 0.1         # NPK concentration
#------------------------------------------------
#         ARDUINO COMMUNICATION SETUP
#------------------------------------------------
def setup_arduino_connection(port='/dev/ttyUSB0', baudrate=9600):
    """Setup serial connection to Arduino"""
    try:
        arduino = serial.Serial(port, baudrate, timeout=1)
        time.sleep(2)  # Wait for Arduino to initialize
        print(f"Connected to Arduino on {port}")
        return arduino
    except serial.SerialException:
        print(f"Failed to connect to Arduino on {port}")
        return None

def send_pump_times_to_arduino(arduino, time_pHdn, time_pHup, time_Mg, time_Ca, time_NPK):
    """Send pump timing data to Arduino"""
    if arduino is None:
        return
    
    # Format: "pHdn:time,pHup:time,Mg:time,Ca:time,NPK:time\n"
    message = f"{time_pHdn:.3f},{time_pHup:.3f},{time_Mg:.3f},{time_Ca:.3f},{time_NPK:.3f}\n"
    
    try:
        arduino.write(message.encode())
        print(f"Sent to Arduino: {message.strip()}")
    except serial.SerialException:
        print("Failed to send data to Arduino")

#------------------------------------------------------------------
# Initialize Arduino connection
arduino_connection = setup_arduino_connection('/dev/ttyUSB0', 9600)

end_timestep = 10
for i in range(end_timestep):
    print(f"\n=== MPC Iteration {i+1}/{end_timestep} ===")
    
    # Collect fresh sensor data
    print("Collecting sensor data...")
    sensor_status = collect_sensor_data()
    if sensor_status:
        available_sensors = sensor_status['available_sensors']
        print("Available sensors:", {k: v for k, v in available_sensors.items() if v})
        missing_sensors = [k for k, v in available_sensors.items() if not v]
        if missing_sensors:
            print("Missing/Failed sensors:", missing_sensors)
    
    control, X_est = atlantis_mpc(Y_set, Y_Hist, U_Hist, X_hat_prev, Est_Hor)
    print("Optimal Control Inputs: ")
    print(control)
    
    # Print current sensor readings for monitoring
    print(f"Current Sensor Readings (Step {i}):")
    print(f"  NH3 Biofilter: {Y_Hist[0, -1]:.3f} mg/L (estimated)")
    print(f"  NH3 Hydroponics: {Y_Hist[1, -1]:.3f} mg/L (estimated)")
    print(f"  NO3 Biofilter: {Y_Hist[2, -1]:.3f} mg/L")
    print(f"  NO3 Hydroponics: {Y_Hist[3, -1]:.3f} mg/L")
    print(f"  EC Fish Tank: {Y_Hist[4, -1]:.3f} mS/cm")
    print(f"  pH Hydroponics: {Y_Hist[5, -1]:.3f}")
    
    X_hat_prev = X_est
    U_Hist = np.roll(U_Hist, -1)
    U_Hist[:, [-1]] = control
    Y_Hist = np.roll(Y_Hist, -1)
    
    # Get new sensor readings (real + estimated)
    Y_Hist[:, [-1]] = get_sensor_readings_with_fallback(Y_set, i + Est_Hor, Y_Hist[:, [-2]])
    
    # Calculate pump times and send to Arduino
    time_pHdn = control[0, 0]/(Xu_pHdn * Qu_pHdn)
    time_pHup = control[1, 0]/(Xu_pHup * Qu_pHup)
    time_Mg = control[2, 0]/(Xu_Mg * Qu_Mg)
    time_Ca = control[3, 0]/(Xu_Ca * Qu_Ca)
    time_NPK = control[4, 0]/(Xu_NPK * Qu_NPK)
    
    send_pump_times_to_arduino(arduino_connection, time_pHdn, time_pHup, time_Mg, time_Ca, time_NPK)
    
    time.sleep(2)  # Increased delay for sensor reading stability

# Close Arduino connection when done
if arduino_connection:
    arduino_connection.close()
    print("Arduino connection closed")

