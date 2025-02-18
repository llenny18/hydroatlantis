
from django.shortcuts import render, redirect, reverse
from django.contrib import messages
from django.contrib.auth import login
from .models import Greenhouse, WaterBed, Biofilter, UserAccount
import json
from django.db import connection
from django.views.decorators.http import require_GET
from django.http import JsonResponse
from django.utils.dateparse import parse_datetime
import json
def start(request):

    user_id = request.session.get('user_id', None)
    username = request.session.get('username', None)
    if not user_id:
        return redirect(reverse('login')) 
    context = {
        "user_id" : user_id, 
        "username" : username
    }
    return render(request, "index.html", context)


def logout(request):
    request.session.flush()
    return redirect('login')

def get_greenhouse(request):
    # Fetch all Greenhouse data
    greenhouse_data = Greenhouse.objects.all()

    # Prepare context for the template
    context = {
        "greenhouse_data": greenhouse_data
    }

    # Return HTML response rendered from template
    return render(request, "greenhousetable.html", context)

def get_waterbed(request):
    waterbed_data = WaterBed.objects.all()
    
    context = {
        "waterbed_data": waterbed_data
    }
    
    return render(request, "waterbedtable.html", context)

def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password1 = request.POST.get('password')
        
        # Query the faculty account
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT id, username, password FROM useraccounts 
                WHERE username = %s
            """, [username])
            user = cursor.fetchone()

        if user:
            id, username, password = user

            # Assuming 'password' is hashed, compare it with the entered password
            if password1 == password:  # Use check_password to compare the hashes
                request.session['user_id'] = id  # Store session for the user
                request.session['username'] = username  # Store session for username

                messages.success(request, "Login successful!")
                return redirect('start')  # Redirect to the desired dashboard or page
            else:
                messages.error(request, "Invalid password!")
        else:
            messages.error(request, "User not found!")

    return render(request, "login.html")



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

    context = {
        "water_beddt": json.dumps({
            "labels": labels,
            "datasets": datasets_list
        })
    }
    
    return render(request, "waterbed_charts.html", context)

def get_waterbio(request):
    biofil= Biofilter.objects.all()
    
    context = {
        "water_biofilterdt": biofil
    }
    
    return render(request, "water_biofil.html", context)

@require_GET
def get_waterbiochart(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    biofilters = Biofilter.objects.all()

    if start_date and end_date:
        start_datetime = parse_datetime(start_date)
        end_datetime = parse_datetime(end_date)
        
        if start_datetime and end_datetime:
            start_date_str = start_datetime.strftime("%d/%m/%Y %H:%M")
            end_date_str = end_datetime.strftime("%d/%m/%Y %H:%M")
            
            biofilters = biofilters.filter(
                timestamp__gte=start_date_str,
                timestamp__lte=end_date_str
            )

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

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse(response_data)
    return render(request, "biofil_charts.html", {"water_biofilterdt": json.dumps(response_data)})
