from .models import SensorType

def sensor_menu(request):
    sensor_types = SensorType.objects.all()

    # Add a new "title" attribute to each object
    for sensor in sensor_types:
        sensor.title = sensor.name.replace('_', ' ').title()

    return {
        'sensor_types': sensor_types
    }