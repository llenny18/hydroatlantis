from django.shortcuts import render
from .models import Greenhouse

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
