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
    V1 = 8 #Fish tank volume
    V2 = 1 #Biofilter volume
    V3 = 15 #Hydroponics Volume
    Q1 = 0.7 #Flow rate from fish tank to bio-filter
    Q2 = 0.5 #Flow rate from bio-filter to hydroponics
    Q3 = 1 #Flow rate from hydroponics to fish tank
    mu_max = 0.01 #Total nitrification (active surface area of bio-carrier x TAN conversion rate)
    k_NHx_pHup_1 = 0.01 #Factor for effect of pH up on fish tank ammonia absorption
    k_NO3_pHup_1 = 0.01 #Factor for effect of pH up on fish tank nitrates absorption
    k_NHx_pHdn_3 = 0.01 #Factor for effect of pH down on hydroponics ammonia absorption
    k_NO3_pHdn_3 = 0.01 #Factor for effect of pH down on hydroponics nitrates absorption
    k_NHx_Mg_3 = 0.01 #Factor for effect of magnesium on hydroponics ammonia absorption
    k_NHx_Ca_3 = 0.01 #Factor for effect of calcium on hydroponics ammonia absorption
    k_NHx_NPK_3 = 0.01 #Factor for effect of NPK on hydroponics ammonia absorption
    k_NO3_Mg_3 = 0.01 #Factor for effect of magnesium on hydroponics nitrates absorption
    k_NO3_Ca_3 = 0.01 #Factor for effect of calcium on hydroponics nitrates absorption
    k_NO3_NPK_3 = 0.01 #Factor for effect of NPK on hydroponics nitrates absorption
    k_EC_NHx_1 = 0.01 #Factor for effect of fish tank ammonia on fish tank EC
    k_EC_NO3_1 = 0.01 #Factor for effect of fish tank nitrates on fish tank EC
    k_pH_NHx_3 = 0.01 #Factor for effect of hydroponics ammonia on hydroponics pH
    k_pH_NO3_3 = 0.01 #Factor for effect of hydroponics nitrates on hydroponics pH
    k_pH_pHdn_3 = 0.01 #Factor for effect of pH down on hydroponics pH
    k_pH_Mg_3 = 0.01 #Factor for effect of magnesium on hydroponics pH
    k_pH_Ca_3 = 0.01 #Factor for effect of calcium on hydroponics pH
    k_pH_NPK_3 = 0.01 #Factor for effect of NPK on hydroponics pH
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
        J_mhe_1 = np.dot(np.transpose(X_hat_diff), np.matmul(W_X, X_hat_diff)) #Arrival cost
        Y_hat_est = np.zeros((n_states, Est_Hor))
        U_history_mhe = np.concatenate((U_history, np.zeros((n_states, Est_Hori))))
        U_history_mhe[n_u:n_u+n_states:1, [0]] = DD
        Y_hat_est[:, [0]] = np.add(np.matmul(Cd, X_hat_0_mhe_reshaped),
                                 np.matmul(Dd, U_history_mhe[:, [0]]))
        Y_diff = np.subtract(Y_history[:, [0]], Y_hat_est[:, [0]])
        J_mhe_2 = np.dot(np.transpose(Y_diff), np.matmul(W_Y, Y_diff)) #Output fit - initial
        for k in range(Est_Hori-1):
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
            J_mhe_2 = J_mhe_2 + np.dot(Y_diff, np.matmul(W_Y, Y_diff)) #Output fit
        global X_hat_current
        X_hat_current = X_hat_est[:, [-1]] #State estimate, passed to MPC
        J_mhe = J_mhe_1 + J_mhe_2 #MHE cost
        return J_mhe.flatten()
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
        J_mpc_1 = np.dot(np.transpose(Y_mpc_diff), np.matmul(Q, Y_mpc_diff))
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
                J_mpc_1 = J_mpc_1 + np.dot(np.transpose(Y_mpc_diff), np.matmul(Q, Y_mpc_diff))
            if k < Cont_Hor:
                J_mpc_2 = J_mpc_2 + np.dot(np.transpose(U_mpc[:, k]), np.matmul(R, U_mpc[:, k]))
            else:
                J_mpc_2 = J_mpc_2 + np.dot(np.transpose(U_mpc[:, Cont_Hor-1]), np.matmul(R, U_mpc[:, Cont_Hor-1]))
        J_mpc = J_mpc_1 + J_mpc_2
        return J_mpc.flatten()
    U_optimal = minimize(mpc, np.zeros(n_u * Cont_Hor), method='SLSQP', bounds=control_bounds)
    U_opt_k = U_optimal.x[0:n_u].reshape(n_u, 1)
    return U_opt_k, X_hat

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
for i in range(Est_Hor):
    Y_Hist[:, [i]] = np.random.rand(num_states, 1) #Get sensor measurements Est_Hor times
X_hat_prev = np.zeros((num_states, 1)) #Initial state estimates from previous MHE result
Y_set = np.matrix([[0.2],  # Setpoint for ammonia in biofilter
                  [0.2],  # Setpoint for ammonia in hydroponics
                  [0.2],  # Setpoint for nitrates in biofilter
                  [0.2],  # Setpoint for nitrates in hydroponics
                  [0.2],  # Setpoint for EC in fish tank
                  [0.2]])  # Setpoint for pH in hydroponics
Qu_pHup = 0.1  # pH up pump flow rate
Qu_pHdn = 0.1  # pH down pump flow rate
Qu_Mg = 0.1  # Magnesium pump flow rate
Qu_Ca = 0.1  # Calcium pump flow rate
Qu_NPK = 0.1  # NPK pump flow rate
Xu_pHup = 0.1  # pH up concentration
Xu_pHdn = 0.1  # pH down concentration
Xu_Mg = 0.1  # Magnesium concentration
Xu_Ca = 0.1  # Calcium concentration
Xu_NPK = 0.1  # NPK concentration
#------------------------------------------------------------------
end_timestep = 10
for i in range(end_timestep):
    control, X_est = atlantis_mpc(Y_set, Y_Hist, U_Hist, X_hat_prev, Est_Hor)
    print("Optimal Control Inputs: ")
    print(control)  # Outputs optimal injection amount of pumps
    X_hat_prev = X_est
    U_Hist = np.roll(U_Hist, -1) #Shift input history to the left
    U_Hist[:, [-1]] = control
    Y_Hist = np.roll(Y_Hist, -1) #Shift output history to the left
    Y_Hist[:, [-1]] = np.random.rand(num_y, 1) #Get sensor measurements Est_Hor times
    #---------------------------------------------------------------
    time_pHdn = control[0, 0]/(Xu_pHdn * Qu_pHdn)
    time_pHup = control[1, 0]/(Xu_pHup * Qu_pHup)
    time_Mg = control[2, 0]/(Xu_Mg * Qu_Mg)
    time_Ca = control[3, 0]/(Xu_Ca * Qu_Ca)
    time_NPK = control[4, 0]/(Xu_NPK * Qu_NPK)
