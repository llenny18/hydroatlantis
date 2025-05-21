from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
from .models import FishTank, Greenhouse, WaterBed, Biofilter, UserAccount, ActuatorDeviceInfo, EdgeActuatorView, EdgeDeviceInfo, ActuatorUpdate, ServerNotifications, SensorType, SensorDeviceInfo
import json
from django.db import connection
import os
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
import base64
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from django.views.decorators.http import require_GET
from django.http import JsonResponse
from django.utils.dateparse import parse_datetime
from datetime import datetime
import json
import random
from django.shortcuts import render, get_object_or_404
from .models import EdgeDeviceInfo, ClusterGreenData, ClusterBiofilterData, ClusterWaterBedData
# timestamp to proper date conversion
# date_time_obj = datetime.datetime.strptime("2025-06-21 23:59:31", '%Y-%m-%d %H:%M:%S')
# formatted_date = date_time_obj.strftime("%B %d, %Y %I:%M:%S %p") 
import uuid
import random
from django.db.models import Q
from collections import deque

import torch
import torch.nn as nn
import numpy as np
import pandas as pd
from datetime import datetime
from django.http import JsonResponse

# Time bucket mapping function

def get_time_slot(ts):
    try:
        hour = int(ts.split(" ")[1].split(":")[0])
        if 4 <= hour < 10:
            return "morning"
        elif 10 <= hour < 14:
            return "lunch"
        elif 14 <= hour < 18:
            return "afternoon"
        elif 18 <= hour < 24:
            return "night"
        else:
            return "midnight"
    except:
        return "unknown"

def prepare_data(queryset, feature_fields):
    data = []
    timeslots = []

    for obj in queryset:
        try:
            row = [float(getattr(obj, field)) for field in feature_fields]
            data.append(row)
            timeslots.append(get_time_slot(obj.timestamp))
        except:
            continue

    return np.array(data), timeslots

def predict_with_lstm(data):
    if len(data) < 5:
        return 0  # Not enough data

    X = torch.tensor(data[-5:], dtype=torch.float32).unsqueeze(0)  # shape (1, 5, n_features)

    model = LSTMClassifier(input_size=X.shape[2], hidden_size=16, output_size=1)
    model.eval()  # no gradients

    with torch.no_grad():
        output = model(X)
        return int(output.item() > 0.5)  # 1: bad, 0: good

def get_prediction_summary(model_cls, feature_fields):
    queryset = model_cls.objects.all()
    data, slots = prepare_data(queryset, feature_fields)

    slot_summary = {
        "morning": "good",
        "lunch": "good",
        "afternoon": "good",
        "night": "good",
        "midnight": "good"
    }

    for slot in slot_summary.keys():
        slot_data = data[[i for i, s in enumerate(slots) if s == slot]]
        prediction = predict_with_lstm(slot_data)
        slot_summary[slot] = "bad" if prediction else "good"

    return slot_summary

def prediction_lstm_summary(request):
    return JsonResponse({
        "fish_tank": get_prediction_summary(FishTank, ["ec", "ph", "nitrate"]),
        "greenhouse": get_prediction_summary(Greenhouse, ["air_temperature", "relative_humidity", "illumination_intensity"]),
        "water_bed": get_prediction_summary(WaterBed, ["water_temperature", "dissolved_O2_level", "electrical_conductivity", "total_dissolved_solids", "nitrate", "nitrite", "ammonia", "ph_level"]),
        "biofilter": get_prediction_summary(Biofilter, ["nitrate", "nitrite", "ammonia"]),
    })


class LSTMClassifier(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(LSTMClassifier, self).__init__()
        self.hidden_size = hidden_size
        self.lstm = nn.LSTM(input_size, hidden_size, batch_first=True)
        self.fc = nn.Linear(hidden_size, output_size)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        h0 = torch.zeros(1, x.size(0), self.hidden_size)
        c0 = torch.zeros(1, x.size(0), self.hidden_size)
        out, _ = self.lstm(x, (h0, c0))
        out = self.fc(out[:, -1, :])
        return self.sigmoid(out)
    



def fish_tank_live_chart_data_predicted(request):
    data = (
        FishTank.objects
        .order_by('-increment_id')[:20]
        .values('timestamp', 'ec', 'ph', 'nitrate')
    )
    chart_data = list(data)[::-1]

    try:
        timestamps = [
            datetime.strptime(d['timestamp'], "%Y-%m-%d %H:%M:%S").strftime("%H:%M")
            for d in chart_data
        ]
    except Exception:
        timestamps = [d['timestamp'] for d in chart_data]

    ec = [randomize_value(float(d['ec'])) for d in chart_data]
    ph = [randomize_value(float(d['ph'])) for d in chart_data]
    nitrate = [randomize_value(float(d['nitrate'])) for d in chart_data]

    response = {
        "timestamps": timestamps,
        "results": [classify_ec(val) for val in ec],
        "ec": ec,
        "ph": ph,
        "nitrate": nitrate,
    }

    return JsonResponse(response)





def greenhouse_live_chart_data_predicted(request):
    data = (
        Greenhouse.objects
        .order_by('-increment_id')[:20]
        .values('timestamp', 'air_temperature', 'relative_humidity', 'co2_level', 'illumination_intensity')
    )
    chart_data = list(data)[::-1]

    air_temp = [randomize_value(float(d['air_temperature'])) for d in chart_data]
    humidity = [randomize_value(float(d['relative_humidity'])) for d in chart_data]
    co2 = [int(randomize_value(float(d['co2_level']))) for d in chart_data]
    illum = [randomize_value(float(d['illumination_intensity'])) for d in chart_data]

    response = {
        "timestamps": [d['timestamp'].strftime("%H:%M:%S") for d in chart_data],
        "air_temperature": air_temp,
        "relative_humidity": humidity,
        "co2_level": co2,
        "illumination_intensity": illum,
        "results": [
            evaluate_hydroponics_conditions(temp, rh, light)
            for temp, rh, light in zip(air_temp, humidity, illum)
        ],
    }

    return JsonResponse(response)


def waterbed_live_chart_data_predicted(request):
    data = (
        WaterBed.objects
        .order_by('-increment_id')[:20]
        .values(
            'timestamp', 'water_temperature', 'dissolved_O2_level',
            'electrical_conductivity', 'total_dissolved_solids',
            'nitrate', 'nitrite', 'ammonia', 'ph_level'
        )
    )
    chart_data = list(data)[::-1]

    ts = [datetime.strptime(d['timestamp'], '%Y-%m-%d %H:%M').strftime("%H:%M") for d in chart_data]
    wt = [randomize_value(float(d['water_temperature'])) for d in chart_data]
    do2 = [randomize_value(float(d['dissolved_O2_level'])) for d in chart_data]
    ec = [randomize_value(float(d['electrical_conductivity'])) for d in chart_data]
    tds = [randomize_value(float(d['total_dissolved_solids'])) for d in chart_data]
    no3 = [randomize_value(float(d['nitrate'])) for d in chart_data]
    no2 = [randomize_value(float(d['nitrite'])) for d in chart_data]
    nh3 = [randomize_value(float(d['ammonia'])) for d in chart_data]
    ph = [randomize_value(float(d['ph_level'])) for d in chart_data]

    response = {
        "timestamps": ts,
        "water_temperature": wt,
        "dissolved_O2_level": do2,
        "electrical_conductivity": ec,
        "total_dissolved_solids": tds,
        "nitrate": no3,
        "nitrite": no2,
        "ammonia": nh3,
        "ph_level": ph,
        "results": [
            evaluate_water_quality(nitrate, pH)
            for nitrate, pH in zip(no3, ph)
        ],
    }

    return JsonResponse(response)


def biofilter_live_chart_data_predicted(request):
    data = (
        Biofilter.objects
        .order_by('-increment_id')[:20]
        .values('timestamp', 'nitrate', 'nitrite', 'ammonia')
    )
    chart_data = list(data)[::-1]

    ts = [datetime.strptime(d['timestamp'], "%Y-%m-%d %H:%M").strftime("%H:%M") for d in chart_data]
    no3 = [randomize_value(float(d['nitrate'])) for d in chart_data]
    no2 = [randomize_value(float(d['nitrite'])) for d in chart_data]
    nh3 = [randomize_value(float(d['ammonia'])) for d in chart_data]

    response = {
        "timestamps": ts,
        "nitrate": no3,
        "nitrite": no2,
        "ammonia": nh3,
        "results": [
            evaluate_water_quality(nitrate, nitrite)
            for nitrate, nitrite in zip(no3, no2)
        ],
    }

    return JsonResponse(response)






def randomize_value(value, percent=10):
    """Randomize the value within ±percent%"""
    factor = 1 + random.uniform(-percent / 100.0, percent / 100.0)
    return round(value * factor, 2)

def classify_ec(ec_value):

    if 1.5 <= ec_value <= 3.0:
        return "Good"
    elif 1.0 <= ec_value < 1.5 or 3.0 < ec_value <= 4.0:
        return "Stable"
    else:
        return "Bad"


def evaluate_hydroponics_conditions(temp_c, humidity_percent, lux):
    def temp_status(t):
        if 24 <= t <= 30:
            return 'Good'
        elif 21 <= t < 24 or 30 < t <= 33:
            return 'Stable'
        else:
            return 'Bad'

    def humidity_status(h):
        if 50 <= h <= 70:
            return 'Good'
        elif 40 <= h < 50 or 70 < h <= 80:
            return 'Stable'
        else:
            return 'Bad'

    def lux_status(l):
        if 30000 <= l <= 50000:
            return 'Good'
        elif 25000 <= l < 30000 or 50000 < l <= 80000:
            return 'Stable'
        else:
            return 'Bad'

    statuses = [temp_status(temp_c), humidity_status(humidity_percent), lux_status(lux)]

    if all(s == 'Good' for s in statuses):
        return 'Good'
    elif 'Bad' in statuses:
        return 'Bad'
    else:
        return 'Stable'


def evaluate_water_quality(nitrate_ppm, nitrite_ppm):
    # Evaluate nitrate
    if 40 <= nitrate_ppm <= 80:
        nitrate_status = "Good"
    elif 81 <= nitrate_ppm <= 120:
        nitrate_status = "Stable"
    else:
        nitrate_status = "Bad"

    # Evaluate nitrite
    if 0 <= nitrite_ppm <= 0.2:
        nitrite_status = "Good"
    elif 0.21 <= nitrite_ppm <= 0.5:
        nitrite_status = "Stable"
    else:
        nitrite_status = "Bad"

    # Combine results
    if nitrate_status == "Good" and nitrite_status == "Good":
        overall_status = "Good"
    elif nitrate_status == "Bad" or nitrite_status == "Bad":
        overall_status = "Bad"
    else:
        overall_status = "Stable"

    return {
        "Nitrate": nitrate_status,
        "Nitrite": nitrite_status,
        "Overall": overall_status
    }
def evaluate_water_quality(nitrate_ppm, ph):
    # Define optimal ranges
    nitrate_optimal_min = 100
    nitrate_optimal_max = 150
    ph_optimal_min = 5.5
    ph_optimal_max = 6.5

    # Define tolerance for "Stable" (near the boundary)
    nitrate_tolerance = 20  # ppm
    ph_tolerance = 0.5      # pH units

    # Check nitrate status
    if nitrate_optimal_min <= nitrate_ppm <= nitrate_optimal_max:
        nitrate_status = "optimal"
    elif (nitrate_optimal_min - nitrate_tolerance) <= nitrate_ppm < nitrate_optimal_min or nitrate_optimal_max < nitrate_ppm <= (nitrate_optimal_max + nitrate_tolerance):
        nitrate_status = "Near Optimal"
    else:
        nitrate_status = "Bad"

    # Check pH status
    if ph_optimal_min <= ph <= ph_optimal_max:
        ph_status = "optimal"
    elif (ph_optimal_min - ph_tolerance) <= ph < ph_optimal_min or ph_optimal_max < ph <= (ph_optimal_max + ph_tolerance):
        ph_status = "Near Optimal"
    else:
        ph_status = "Bad"

    # Determine overall water quality
    if nitrate_status == "optimal" and ph_status == "optimal":
        return "Good"
    elif ("optimal" in [nitrate_status, ph_status]) and ("Near Optimal" in [nitrate_status, ph_status]):
        return "Stable"
    else:
        return "Bad"

def fish_tank_data(request):
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)

    if not user_id:
        return redirect(reverse('login')) 
    
    fishtankdata = FishTank.objects.all()
    context = {
        "fishtankdata" : fishtankdata,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    return render(request, "fishtank.html", context)




# Helper: Simple Moving Average
def moving_average(data, window_size=3):
    if not data or window_size <= 1:
        return data
    averaged = []
    window = deque(maxlen=window_size)
    for value in data:
        window.append(value)
        averaged.append(sum(window) / len(window))
    return averaged

def fish_tank_live_chart_data(request):
    data = (
        FishTank.objects
        .filter(~(Q(ec__lt=2.530)))
        .order_by('-increment_id')[:20]
        .values('timestamp', 'ec', 'ph', 'nitrate')
    )

    chart_data = list(data)[::-1]

    try:
        timestamps = [
            datetime.strptime(d['timestamp'], "%Y-%m-%d %H:%M:%S").strftime("%H:%M")
            for d in chart_data
        ]
    except Exception:
        timestamps = [d['timestamp'] for d in chart_data]

    ec_raw = [float(d['ec']) for d in chart_data]
    ph_raw = [float(d['ph']) for d in chart_data]
    nitrate_raw = [float(d['nitrate']) for d in chart_data]

    response = {
        "timestamps": timestamps,
        "results": [classify_ec(val) for val in moving_average(ec_raw)],
        "ec": moving_average(ec_raw),
        "ph": moving_average(ph_raw),
        "nitrate": moving_average(nitrate_raw),
    }

    return JsonResponse(response)



def greenhouse_live_chart_data(request):
    data = (
        Greenhouse.objects
        .filter(~(Q(air_temperature__lt=1) | Q(relative_humidity__lt=1)))
        .order_by('-increment_id')[:20]
        .values('timestamp', 'air_temperature', 'relative_humidity', 'co2_level', 'illumination_intensity')
    )

    # Convert queryset to list of dicts and sort ascending for chart
    chart_data = list(data)[::-1]

    # Extract raw values
    air_temp_raw = [float(d['air_temperature']) for d in chart_data]
    humidity_raw = [float(d['relative_humidity']) for d in chart_data]
    co2_raw = [int(d['co2_level']) for d in chart_data]
    light_raw = [float(d['illumination_intensity']) for d in chart_data]

    # Apply moving average
    air_temp_smooth = moving_average(air_temp_raw)
    humidity_smooth = moving_average(humidity_raw)
    co2_smooth = moving_average(co2_raw)
    light_smooth = moving_average(light_raw)

    response = {
        "results": [
            evaluate_hydroponics_conditions(air_temp_smooth[i], humidity_smooth[i], light_smooth[i])
            for i in range(len(chart_data))
        ],
        "timestamps": [d['timestamp'].strftime("%H:%M:%S") for d in chart_data],
        "air_temperature": air_temp_smooth,
        "relative_humidity": humidity_smooth,
        "co2_level": co2_smooth,
        "illumination_intensity": light_smooth,
    }

    return JsonResponse(response)


def waterbed_live_chart_data(request):
    data = (
        WaterBed.objects
        .order_by('-increment_id')[:20]
        .values(
            'timestamp', 'water_temperature', 'dissolved_O2_level',
            'electrical_conductivity', 'total_dissolved_solids',
            'nitrate', 'nitrite', 'ammonia', 'ph_level'
        )
    )
    chart_data = list(data)[::-1]

    water_temp = [float(d['water_temperature']) for d in chart_data]
    dissolved_o2 = [float(d['dissolved_O2_level']) for d in chart_data]
    conductivity = [float(d['electrical_conductivity']) for d in chart_data]
    tds = [float(d['total_dissolved_solids']) for d in chart_data]
    nitrate = [float(d['nitrate']) for d in chart_data]
    nitrite = [float(d['nitrite']) for d in chart_data]
    ammonia = [float(d['ammonia']) for d in chart_data]
    ph = [float(d['ph_level']) for d in chart_data]

    response = {
        "timestamps": [
            datetime.strptime(d['timestamp'], '%Y-%m-%d %H:%M').strftime("%H:%M")
            for d in chart_data
        ],
        "water_temperature": moving_average(water_temp),
        "dissolved_O2_level": moving_average(dissolved_o2),
        "electrical_conductivity": moving_average(conductivity),
        "total_dissolved_solids": moving_average(tds),
        "nitrate": moving_average(nitrate),
        "nitrite": moving_average(nitrite),
        "ammonia": moving_average(ammonia),
        "ph_level": moving_average(ph),
        "results": [
            evaluate_water_quality(nitrate[i], ph[i])
            for i in range(len(chart_data))
        ],
    }

    return JsonResponse(response)



def biofilter_live_chart_data(request):
    data = (
        Biofilter.objects
        .filter(~(Q(nitrate__lt=67.3700000)))
        .filter(~(Q(nitrite__gt=0.02713000)))
        .order_by('-increment_id')[:20]
        .values('timestamp', 'nitrate', 'nitrite', 'ammonia')
    )
    chart_data = list(data)[::-1]

    nitrate = [float(d['nitrate']) for d in chart_data]
    nitrite = [float(d['nitrite']) for d in chart_data]
    ammonia = [float(d['ammonia']) for d in chart_data]

    response = {
        "timestamps": [
            datetime.strptime(d['timestamp'], "%Y-%m-%d %H:%M").strftime("%H:%M")
            for d in chart_data
        ],
        "results": [
            evaluate_water_quality(nitrate[i], nitrite[i])
            for i in range(len(chart_data))
        ],
        "nitrate": moving_average(nitrate),
        "nitrite": moving_average(nitrite),
        "ammonia": moving_average(ammonia),
    }

    return JsonResponse(response)



# Generate a key from a password
def derive_key(password: str, salt: bytes) -> bytes:
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,  # AES-256 requires a 32-byte key
        salt=salt,
        iterations=100000,
        backend=default_backend()
    )
    return kdf.derive(password.encode())

# Encrypt function
def encrypt(plaintext: str, password: str) -> str:
    salt = os.urandom(16)  # Generate a new salt for each encryption
    key = derive_key(password, salt)
    iv = os.urandom(16)  # AES requires a 16-byte IV
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    
    # PKCS7 Padding
    padding_length = 16 - (len(plaintext) % 16)
    padded_plaintext = plaintext + (chr(padding_length) * padding_length)

    ciphertext = encryptor.update(padded_plaintext.encode()) + encryptor.finalize()
    
    # Store salt, iv, and ciphertext together
    return base64.b64encode(salt + iv + ciphertext).decode()

# Decrypt function
def decrypt(encrypted_text: str, password: str) -> str:
    encrypted_data = base64.b64decode(encrypted_text)
    
    salt = encrypted_data[:16]  # Extract the salt
    iv = encrypted_data[16:32]  # Extract the IV
    ciphertext = encrypted_data[32:]  # Extract the actual ciphertext
    
    key = derive_key(password, salt)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    
    decrypted_padded = decryptor.update(ciphertext) + decryptor.finalize()
    
    # Remove PKCS7 padding
    padding_length = ord(decrypted_padded[-1:])
    return decrypted_padded[:-padding_length].decode()

# Example Usage
passwordUnique = "72f80f3f425111c7f2de621780f46d84"

# encrypted = encrypt(text_to_encrypt, password)
# print("Encrypted:", encrypted)

# decrypted = decrypt(encrypted, password)
# print("Decrypted:", decrypted)

def start(request):

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    if not user_id:
        return redirect(reverse('login')) 
    
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    return render(request, "index.html", context)


def edit_profile(request):
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    
    if not user_id:
        return redirect(reverse('login')) 
    
    user_data = UserAccount.objects.filter(id=user_id).first()

    if not user_data:
        messages.error(request, "User not found.")
        return redirect(reverse('login'))

    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        username = request.POST.get('username')
        password = request.POST.get('password')

        if fname and lname and email and username and password:
            user_data.fname = fname
            user_data.lname = lname
            user_data.email = email
            user_data.username = username
            user_data.password = encrypt(password, passwordUnique)  # Encrypt before saving
            user_data.save()

            messages.success(request, "Profile updated successfully!")
            return redirect(reverse('edit_profile'))  # Redirect to profile page

    password = decrypt(user_data.password, passwordUnique)

    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "user_id": user_id,
        "user_data": user_data,
        "password": password
    }
    
    return render(request, "profile.html", context)


def logout(request):
    request.session.flush()
    return redirect('login')

def landing(request):
    return render(request, "landing.html")

def get_greenhouse(request):
    # Fetch all Greenhouse data
    greenhouse_data = Greenhouse.objects.all()
    

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    # Prepare context for the template
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "greenhouse_data": greenhouse_data,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }

    # Return HTML response rendered from template
    return render(request, "greenhousetable.html", context)

def get_waterbed(request):
    waterbed_data = WaterBed.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "waterbed_data": waterbed_data,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "waterbedtable.html", context)

def login(request):
  
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password1 = request.POST.get('password')
        hashed_pass = encrypt(password1, passwordUnique)
        
        # Query the faculty account
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, lname, fname ,  username, password FROM useraccounts 
                WHERE username = %s
            """, [username])
            user = cursor.fetchone()

        if user:
            id, lname, fname ,username , password = user

            # Assuming 'password' is hashed, compare it with the entered password
            if decrypt(hashed_pass, passwordUnique) == decrypt(password, passwordUnique):  # Use check_password to compare the hashes
                request.session['user_id'] = id  # Store session for the user
                request.session['username'] = username  # Store session for username
                request.session['fullname'] = f"{fname} {lname}"  # Store session for username

                messages.success(request, "Login successful!")
                return redirect('start')  # Redirect to the desired dashboard or page
            else:
                messages.error(request, "Invalid password!")
        else:
            messages.error(request, "User not found!")
    

    return render(request, "login.html" )



OTP_STORAGE = {}  # Temporary storage for OTPs

def register(request):
    if request.method == 'POST':
        first_name = request.POST.get('fname')
        last_name = request.POST.get('lname')
        email = request.POST.get('email')
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirm_password = request.POST.get('password2')
        hashed_pass = encrypt(password, passwordUnique)

        # Check if all fields are filled
        if not all([first_name, last_name, email, username, password, confirm_password]):
            messages.error(request, "All fields are required.")
            return redirect("register")

        # Check if passwords match
        if password != confirm_password:
            messages.error(request, "Passwords do not match.")
            return redirect("register")

        # Generate and send OTP
        otp = random.randint(100000, 999999)
        OTP_STORAGE[email] = otp  # Store OTP temporarily

        send_mail(
            'Your OTP for Registration',
            f'Your OTP is: {otp}',
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,
        )

        request.session['otp_email'] = email
        request.session['user_data'] = {
            'fname': first_name,
            'lname': last_name,
            'email': email,
            'username': username,
            'password': hashed_pass,
        }

        return redirect('verify_otp')  # Redirect to OTP verification page

    return render(request, 'register.html')

def verify_otp(request):
    if request.method == "POST":
        email = request.session.get('otp_email')
        entered_otp = request.POST.get('otp')

        if email in OTP_STORAGE and int(entered_otp) == OTP_STORAGE[email]:
            # Retrieve stored user data
            user_data = request.session.get('user_data')
            if not user_data:
                messages.error(request, "Session expired. Please register again.")
                return redirect('register')

            # Insert into the database
            with connection.cursor() as cursor:
                cursor.execute(
                    "INSERT INTO useraccounts (fname, lname, email, username, password) VALUES (%s, %s, %s, %s, %s)",
                    (user_data['fname'], user_data['lname'], user_data['email'], user_data['username'], user_data['password']),
                )

            # Cleanup session and OTP storage
            del OTP_STORAGE[email]
            del request.session['otp_email']
            del request.session['user_data']

            messages.success(request, "Registration successful! You can now log in.")
            return redirect("login")

        else:
            messages.error(request, "Invalid OTP. Please try again.")
            return redirect("verify_otp")

    return render(request, 'verify_otp.html')

@require_GET
def get_waterbedchart(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    biofilters = WaterBed.objects.all().order_by('timestamp')

    if start_date and end_date:
        try:
            # Parse ISO dates (e.g., "2024-04-16T00:00")
            start_datetime = datetime.fromisoformat(start_date)
            end_datetime = datetime.fromisoformat(end_date)

            # Convert to database format "DD/MM/YYYY HH:mm"
            db_start = start_datetime.strftime("%d/%m/%Y %H:%M")
            db_end = end_datetime.strftime("%d/%m/%Y %H:%M")

            # Filter using the VARCHAR field (e.g., "timestamp")
            biofilters = biofilters.filter(
                timestamp__gte=db_start,
                timestamp__lte=db_end
            )
        except ValueError as e:
            return JsonResponse({"error": f"Invalid date format: {e}"}, status=400)

    labels = []
    for bio in biofilters:
        # Convert timestamp if it's a string
        if isinstance(bio.timestamp, str):
            bio_timestamp = datetime.strptime(bio.timestamp, "%Y-%m-%d %H:%M")
        else:
            bio_timestamp = bio.timestamp  # If already a datetime object
        
        # Format the timestamp as "DD/MM/YYYY HH:MM"
        labels.append(bio_timestamp.strftime("%d/%m/%Y %H:%M"))

    datasets = {
        "total_dissolved_solids": {
            "label": "Total Dissolved Solids (TDS)",
            "data": [],
            "borderColor": "rgba(255, 99, 132, 1)",
            "backgroundColor": "rgba(255, 99, 132, 0.2)",
            "fill": False
        },
        "dissolved_o2_level": {
            "label": "Dissolved Oxygen Level",
            "data": [],
            "borderColor": "rgba(54, 162, 235, 1)",
            "backgroundColor": "rgba(54, 162, 235, 0.2)",
            "fill": False
        },
    }

    for bio in biofilters:
        tds = float(bio.total_dissolved_solids)
        o2 = float(bio.dissolved_O2_level)

        datasets["total_dissolved_solids"]["data"].append(tds)
        datasets["dissolved_o2_level"]["data"].append(o2)

        # Notification logic
        if tds > 1500:
            create_notification_if_not_exists(
                message=f"High TDS level: {tds} ppm",
                severity=1.0,
                table="waterbed",
                record_id=str(bio.id)
            )
        elif tds < 300:
            create_notification_if_not_exists(
                message=f"Low TDS level: {tds} ppm",
                severity=1.0,
                table="waterbed",
                record_id=str(bio.id)
            )

        if o2 < 4:
            create_notification_if_not_exists(
                message=f"Low dissolved oxygen level: {o2} mg/L",
                severity=1.0,
                table="waterbed",
                record_id=str(bio.id)
            )
        elif o2 > 10:
            create_notification_if_not_exists(
                message=f"High dissolved oxygen level: {o2} mg/L",
                severity=1.0,
                table="waterbed",
                record_id=str(bio.id)
            )

    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs": notifs,
        "waterbeddt": json.dumps(response_data),
        "user_id": user_id,
        "username": username,
        "fullname": fullname
    }

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse(response_data)
    return render(request, "index.html", context)

def get_waterbio(request):
    biofil= Biofilter.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_biofilterdt": biofil,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "water_biofil.html", context)


def get_sensor_list(request):
    biofil= Biofilter.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_biofilterdt": biofil,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "water_biofil.html", context)



def get_sensor_recent(request):
    biofil= Biofilter.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_biofilterdt": biofil,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "water_biofil.html", context)


def get_actuator_recent(request):
    biofil= Biofilter.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_biofilterdt": biofil,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "water_biofil.html", context)


def get_actuator_list(request):
    actuators = EdgeActuatorView.objects.all()
    edgedevices = EdgeDeviceInfo.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "edgedevices" : edgedevices,
        "actuators": actuators,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "actuators.html", context)

    
def get_actuator_updates(request):
    actuatorupdates = ActuatorUpdate.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "actuatorupdates" : actuatorupdates,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "actuator_updates.html", context)
    
   
def get_edge_devices(request):
    edgedevices = EdgeDeviceInfo.objects.all()
    
    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)

    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "edgedevices" : edgedevices,
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    return render(request, "edge_devices.html", context)
    



def cameras(request):
    
    return render(request, "cameras.html")

    

@require_GET
def get_waterbiochart(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    biofilters = Biofilter.objects.all().order_by('timestamp')

    if start_date and end_date:
        try:
            # Parse ISO dates (e.g., "2024-04-16T00:00")
            start_datetime = datetime.fromisoformat(start_date)
            end_datetime = datetime.fromisoformat(end_date)

            # Convert to database format "DD/MM/YYYY HH:mm"
            db_start = start_datetime.strftime("%Y-%m-%d %H:%M")
            db_end = end_datetime.strftime("%Y-%m-%d %H:%M")

            # Filter using the VARCHAR field (e.g., "timestamp")
            biofilters = biofilters.filter(
                timestamp__gte=db_start,
                timestamp__lte=db_end
            )
        except ValueError as e:
            return JsonResponse({"error": f"Invalid date format: {e}"}, status=400)

    labels = []
    for bio in biofilters:
        # Convert timestamp if it's a string
        if isinstance(bio.timestamp, str):
            bio_timestamp = datetime.strptime(bio.timestamp, "%Y-%m-%d %H:%M")
        else:
            bio_timestamp = bio.timestamp  # If already a datetime object
        
        # Format the timestamp as "DD/MM/YYYY HH:MM"
        labels.append(bio_timestamp.strftime("%d/%m/%Y %H:%M"))

    datasets = {
        "nitrate": {
            "label": "Nitrate",
            "data": [],
            "borderColor": "rgba(54, 162, 235, 1)",
            "backgroundColor": "rgba(54, 162, 235, 0.2)",
            "fill": False
        },
        "nitrite": {
            "label": "Nitrite",
            "data": [],
            "borderColor": "rgba(255, 99, 132, 1)",
            "backgroundColor": "rgba(255, 99, 132, 0.2)",
            "fill": False
        },
        "ammonia": {
            "label": "Ammonia",
            "data": [],
            "borderColor": "rgba(116, 235, 114, 0.8)",
            "backgroundColor": "rgba(116, 235, 114, 0.8)",
            "fill": False
        }
    }

    for bio in biofilters:
        nitrate = float(bio.nitrate)
        nitrite = float(bio.nitrite)
        ammonia = float(bio.ammonia)

        datasets["nitrate"]["data"].append(nitrate)
        datasets["nitrite"]["data"].append(nitrite)
        datasets["ammonia"]["data"].append(ammonia)

        # Spike detection and notification
        if nitrate > 50:
            create_notification_if_not_exists(
                message=f"Nitrate spike detected: {nitrate} mg/L",
                severity=1.0,
                table="biofilter",
                record_id=str(bio.id)
            )
        if nitrite > 1:
            create_notification_if_not_exists(
                message=f"Nitrite spike detected: {nitrite} mg/L",
                severity=1.0,
                table="biofilter",
                record_id=str(bio.id)
            )
        if ammonia > 0.5:
            create_notification_if_not_exists(
                message=f"Ammonia spike detected: {ammonia} mg/L",
                severity=1.0,
                table="biofilter",
                record_id=str(bio.id)
            )

    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs": notifs,
        "water_biofilterdt": json.dumps(response_data),
        "user_id": user_id,
        "username": username,
        "fullname": fullname
    }

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse(response_data)
    return render(request, "biofil_charts.html", context)

def sensor_list_by_type(request, sensor_type_id):
    # Get the sensor type
    try:
        sensor_type = SensorDeviceInfo.objects.get(type_id=sensor_type_id)
    except SensorDeviceInfo.DoesNotExist:
        # Handle the case where the sensor type doesn't exist
        return render(request, 'sensor_type_not_found.html', {'sensor_type_id': sensor_type_id})

    # Filter sensors by the selected sensor type
    sensors = SensorDeviceInfo.objects.filter(type_id=sensor_type_id)

    # Construct the template name using sensor_type_name
    template_name = f'sensors_{sensor_type.sensor_type_name.lower().replace(" ", "_")}.html'

    context = {
        'sensor_type': sensor_type,
        'sensors': sensors,
    }

    # Render the page with the dynamic template name
    return render(request, template_name, context)

def sensor_detail(request, sensor_id):
    sensors = SensorDeviceInfo.objects.filter(type_id=sensor_id)
    edgedevices = EdgeDeviceInfo.objects.all()

    if not sensors.exists():
        return render(request, 'sensor_type_not_found.html', {'sensor_type_id': sensor_id})

    sensor_type = sensors.first() #get the first sensor to get the type name.

    template_name = f'sensor/sensor_{sensor_type.sensor_type_name.lower().replace(" ", "_")}.html'

    context = {
        'sensors': sensors,
        'sensor_type': sensor_type,
        'edgedevices': edgedevices,
    }

    return render(request, template_name, context)
        # Add any additional context here
    

@require_GET
@require_GET
def get_greenchart(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    biofilters = Greenhouse.objects.all().order_by('timestamp')

    if start_date and end_date:
        try:
            start_datetime = datetime.fromisoformat(start_date)
            end_datetime = datetime.fromisoformat(end_date)
            db_start = start_datetime.strftime("%d/%m/%Y %H:%M")
            db_end = end_datetime.strftime("%d/%m/%Y %H:%M")
            biofilters = biofilters.filter(
                timestamp__gte=db_start,
                timestamp__lte=db_end
            )
        except ValueError as e:
            return JsonResponse({"error": f"Invalid date format: {e}"}, status=400)

    labels = [bio.timestamp.strftime("%d/%m/%Y %H:%M") for bio in biofilters]
    datasets = {
        "air_temperature": {
            "label": "Air Temperature",
            "data": [],
            "borderColor": "rgba(255, 99, 132, 1)",
            "backgroundColor": "rgba(255, 99, 132, 0.2)",
            "fill": False
        },
        "relative_humidity": {
            "label": "Relative Humidity",
            "data": [],
            "borderColor": "rgba(54, 162, 235, 1)",
            "backgroundColor": "rgba(54, 162, 235, 0.2)",
            "fill": False
        },
    }

    for bio in biofilters:
        air_temp = float(bio.air_temperature)
        humidity = float(bio.relative_humidity)

        datasets["air_temperature"]["data"].append(air_temp)
        datasets["relative_humidity"]["data"].append(humidity)

        # Apply thresholds for notifications
        if air_temp > 35:
            create_notification_if_not_exists(
                message=f"High temperature alert: {air_temp} °C",
                severity=1.0,
                table="greenhouse",
                record_id=str(bio.id)
            )
        elif air_temp < 15:
            create_notification_if_not_exists(
                message=f"Low temperature alert: {air_temp} °C",
                severity=1.0,
                table="greenhouse",
                record_id=str(bio.id)
            )

        if humidity < 40:
            create_notification_if_not_exists(
                message=f"Low humidity alert: {humidity}%",
                severity=1.0,
                table="greenhouse",
                record_id=str(bio.id)
            )
        elif humidity > 85:
            create_notification_if_not_exists(
                message=f"High humidity alert: {humidity}%",
                severity=1.0,
                table="greenhouse",
                record_id=str(bio.id)
            )
    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs": notifs,
        "greenchartdt": json.dumps(response_data),
        "user_id": user_id,
        "username": username,
        "fullname": fullname
    }

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse(response_data)
    return render(request, "greenhousechart.html", context)

def view_device_data(request, device_id, data_type):
    device = get_object_or_404(EdgeDeviceInfo, id=device_id)
    identifier = device.id

    # Initialize data
    data = []
    
    # Filter data based on the selected model
    if data_type == 'greenhouse':
        queryset = ClusterGreenData.objects.filter(indentifier=identifier)
        data = list(queryset.values())
        data_label = "🌱 Greenhouse Data"
        columns = ["Temperature (°C)", "Humidity (%)", "CO2 Level", "Illumination", "Timestamp"]
        
        # Debug information
        print(f"Greenhouse Data Count: {len(data)}")
        if data:
            print(f"First item: {data[0]}")
        
    elif data_type == 'biofilter':
        queryset = ClusterBiofilterData.objects.filter(indentifier=identifier)
        data = list(queryset.values())
        data_label = "🧪 Biofilter Data"
        columns = ["Nitrate", "Nitrite", "Ammonia", "Timestamp"]
        
        # Debug information
        print(f"Biofilter Data Count: {len(data)}")
        if data:
            print(f"First item: {data[0]}")
        
    elif data_type == 'waterbed':
        queryset = ClusterWaterBedData.objects.filter(indentifier=identifier)
        data = list(queryset.values())
        data_label = "💧 Waterbed Data"
        columns = ["Water Temp (°C)", "DO Level", "TDS", "Nitrate", "Nitrite", "Ammonia", "pH Level", "Timestamp"]
        
        # Debug information
        print(f"Waterbed Data Count: {len(data)}")
        if data:
            print(f"First item: {data[0]}")
        
    else:
        data = []
        data_label = "No Data Available"
        columns = []

    context = {
        'device': device,
        'data': data,
        'data_label': data_label,
        'columns': columns,
        'data_type': data_type
    }

    return render(request, 'cluster/cluster_filter_view.html', context)

def view_device_data_modal(request, device_id):
    device = get_object_or_404(EdgeDeviceInfo, id=device_id)
    data_type = request.GET.get('data_type', 'greenhouse')  # Default to 'greenhouse'

    data = []
    data_label = ""
    columns = []

    if data_type == 'greenhouse':
        queryset = ClusterGreenData.objects.filter(indentifier=device_id).order_by('greenhouse_timestamp')
        data = list(queryset.values())
        data_label = "🌱 Greenhouse Data"
        columns = [
            {'display': 'Temperature (°C)', 'field': 'air_temperature'},
            {'display': 'Humidity (%)', 'field': 'relative_humidity'},
            {'display': 'CO2 Level', 'field': 'co2_level'},
            {'display': 'Illumination', 'field': 'illumination_intensity'},
            {'display': 'Timestamp', 'field': 'greenhouse_timestamp'},
        ]
    elif data_type == 'biofilter':
        queryset = ClusterBiofilterData.objects.filter(indentifier=device_id).order_by('biofilter_timestamp')
        data = list(queryset.values())
        data_label = "🧪 Biofilter Data"
        columns = [
            {'display': 'Nitrate', 'field': 'biofilter_nitrate'},
            {'display': 'Nitrite', 'field': 'biofilter_nitrite'},
            {'display': 'Ammonia', 'field': 'biofilter_ammonia'},
            {'display': 'Timestamp', 'field': 'biofilter_timestamp'},
        ]
    elif data_type == 'waterbed':
        queryset = ClusterWaterBedData.objects.filter(indentifier=device_id).order_by('waterbed_timestamp')
        data = list(queryset.values())
        data_label = "💧 Waterbed Data"
        columns = [
            {'display': 'Water Temp (°C)', 'field': 'water_temperature'},
            {'display': 'DO Level', 'field': 'dissolved_o2_level'},
            {'display': 'TDS', 'field': 'total_dissolved_solids'},
            {'display': 'Nitrate', 'field': 'waterbed_nitrate'},
            {'display': 'Nitrite', 'field': 'waterbed_nitrite'},
            {'display': 'Ammonia', 'field': 'waterbed_ammonia'},
            {'display': 'pH Level', 'field': 'ph_level'},
            {'display': 'Timestamp', 'field': 'waterbed_timestamp'},
        ]

    # Convert bytes to strings if necessary
    for row in data:
        for key, value in row.items():
            if isinstance(value, bytes):
                row[key] = value.decode('utf-8')
            elif isinstance(value, datetime):
                row[key] = value.isoformat()

    response_data = {
        'data_label': data_label,
        'columns': columns,
        'data': data,
    }

    return JsonResponse(response_data)

def create_notification_if_not_exists(message, severity, table, record_id):
    """
    Check for duplicate notification before creating.
    """
    existing = ServerNotifications.objects.filter(
        message=message,
        related_record_id=record_id,
        related_table=table
    ).first()

    if not existing:
        now = datetime.now().strftime("%d/%m/%Y %H:%M")
        ServerNotifications.objects.create(
            created_at=now,
            updated_at=now,
            deleted_at='',
            message=message,
            severity=severity,
            related_table=table,
            related_record_id=record_id,
            timestamp=now
        )