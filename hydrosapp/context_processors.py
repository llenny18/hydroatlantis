from .models import SensorType

def sensor_menu(request):
    return {
        'sensor_types': SensorType.objects.all()  # Queries the sensor_types table
    }