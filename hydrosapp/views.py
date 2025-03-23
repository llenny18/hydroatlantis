from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings
from .models import Greenhouse, WaterBed, Biofilter, UserAccount, ActuatorDeviceInfo, EdgeActuatorView, EdgeDeviceInfo, ActuatorUpdate, ServerNotifications, SensorType, SensorDeviceInfo
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
    labels = [bio.timestamp for bio in biofilters]

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
        datasets["total_dissolved_solids"]["data"].append(float(bio.total_dissolved_solids))
        datasets["dissolved_o2_level"]["data"].append(float(bio.dissolved_O2_level))

    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "waterbeddt": json.dumps(response_data),
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
    }
    
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse(response_data)
    return render(request, "waterbed_charts.html", context)


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
            db_start = start_datetime.strftime("%d/%m/%Y %H:%M")
            db_end = end_datetime.strftime("%d/%m/%Y %H:%M")

            # Filter using the VARCHAR field (e.g., "timestamp")
            biofilters = biofilters.filter(
                timestamp__gte=db_start,
                timestamp__lte=db_end
            )
        except ValueError as e:
            return JsonResponse({"error": f"Invalid date format: {e}"}, status=400)
    labels = [bio.timestamp for bio in biofilters]

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
        datasets["nitrate"]["data"].append(float(bio.nitrate))
        datasets["nitrite"]["data"].append(float(bio.nitrite))
        datasets["ammonia"]["data"].append(float(bio.ammonia))

    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_biofilterdt": json.dumps(response_data),
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
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
def get_greenchart(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    biofilters = Greenhouse.objects.all().order_by('timestamp')

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
    labels = [bio.timestamp for bio in biofilters]

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
        datasets["air_temperature"]["data"].append(float(bio.air_temperature))
        datasets["relative_humidity"]["data"].append(float(bio.relative_humidity))

    response_data = {
        "labels": labels,
        "datasets": list(datasets.values())
    }

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "greenchartdt": json.dumps(response_data),
        "user_id" : user_id, 
        "username" : username,
        "fullname" : fullname
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
        queryset = ClusterGreenData.objects.filter(indentifier=device_id)
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
        queryset = ClusterBiofilterData.objects.filter(indentifier=device_id)
        data = list(queryset.values())
        data_label = "🧪 Biofilter Data"
        columns = [
            {'display': 'Nitrate', 'field': 'biofilter_nitrate'},
            {'display': 'Nitrite', 'field': 'biofilter_nitrite'},
            {'display': 'Ammonia', 'field': 'biofilter_ammonia'},
            {'display': 'Timestamp', 'field': 'biofilter_timestamp'},
        ]
    elif data_type == 'waterbed':
        queryset = ClusterWaterBedData.objects.filter(indentifier=device_id)
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