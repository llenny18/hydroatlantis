
from django.shortcuts import render, redirect, reverse
from django.contrib import messages
from django.contrib.auth import login
from .models import Greenhouse, WaterBed, Biofilter, UserAccount, ActuatorDeviceInfo, EdgeActuatorView, EdgeDeviceInfo, ActuatorUpdate, ServerNotifications
import json
from django.db import connection
import os
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
import base64
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

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



def register(request):
    if request.method == 'POST':
        # Get form data
        first_name = request.POST.get('fname')
        last_name = request.POST.get('lname')
        email = request.POST.get('email')
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirm_password = request.POST.get('password2')
        

        # Create a new user
        with connection.cursor() as cursor:
                    # Insert into student_info table
            cursor.execute(
                "INSERT INTO useraccounts ( fname, lname, email, username, password) VALUES (%s, %s, %s, %s, %s)",
                    (first_name, last_name, email, username, password),
                )

                    
            return redirect("login")  # Redirect to login page after successful registration

    return render(request, 'register.html')


def get_waterbedchart(request):
    waterbeds = WaterBed.objects.all()

    labels = [str(wb.created_at) for wb in waterbeds] 
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
    for wb in waterbeds:
        datasets["total_dissolved_solids"]["data"].append(float(wb.total_dissolved_solids))
        datasets["dissolved_o2_level"]["data"].append(float(wb.dissolved_O2_level))

    datasets_list = list(datasets.values())

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
        "notifs" : notifs,
        "water_beddt": json.dumps({
            "labels": labels,
            "datasets": datasets_list,
            "user_id" : user_id, 
            "username" : username,
            "fullname" : fullname
        })
    }
    
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

    

def get_waterbiochart(request):
    biofilters = Biofilter.objects.all()

    labels = [str(bio.created_at) for bio in biofilters] 
    datasets = {
        "nitrate": {
            "label": "Nitrate",
            "data": [],
            "borderColor": "rgba(255, 99, 132, 1)",
            "backgroundColor": "rgba(255, 99, 132, 0.2)",
            "fill": False
        },
        "nitrite": {
            "label": "Nitrite",
            "data": [],
            "borderColor": "rgba(54, 162, 235, 1)",
            "backgroundColor": "rgba(54, 162, 235, 0.2)",
            "fill": False
        },
        "ammonia": {
            "label": "Ammonia",
            "data": [],
            "borderColor": "rgba(75, 192, 192, 1)",
            "backgroundColor": "rgba(75, 192, 192, 0.2)",
            "fill": False
        }
    }
    for bio in biofilters:
        datasets["nitrate"]["data"].append(float(bio.nitrate))
        datasets["nitrite"]["data"].append(float(bio.nitrite))
        datasets["ammonia"]["data"].append(float(bio.ammonia))

    datasets_list = list(datasets.values())

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    fullname = request.session.get('fullname', None)
    notifs = ServerNotifications.objects.all()
    context = {
            "notifs" : notifs,
            "water_biofilterdt": json.dumps({
            "labels": labels,
            "datasets": datasets_list,
            "user_id" : user_id, 
            "username" : username,
            "fullname" : fullname
        })
    }
    
    return render(request, "biofil_charts.html", context)