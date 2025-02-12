from django.shortcuts import render
from .models import Greenhouse, WaterBed, Biofilter
import json
def start(request):

    return render(request, "index.html")

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

def get_waterbio(request):
    biofil= Biofilter.objects.all()
    
    context = {
        "water_biofilterdt": biofil
    }
    
    return render(request, "water_biofil.html", context)

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

    context = {
        "water_biofilterdt": json.dumps({
            "labels": labels,
            "datasets": datasets_list
        })
    }
    
    return render(request, "biofil_charts.html", context)