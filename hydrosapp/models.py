from django.db import models
import uuid

class Greenhouse(models.Model):
    id = models.CharField(max_length=36, primary_key=True)  # ID as varchar(36)
    created_at = models.CharField(max_length=35)  # created_at as varchar(35)
    updated_at = models.CharField(max_length=35)  # updated_at as varchar(35)
    deleted_at = models.CharField(max_length=30, null=True, blank=True)  # deleted_at as varchar(30), nullable
    air_temperature = models.DecimalField(max_digits=11, decimal_places=8)  # air_temperature as decimal(11,8)
    relative_humidity = models.DecimalField(max_digits=11, decimal_places=8)  # relative_humidity as decimal(11,8)
    co2_level = models.BooleanField()  # co2_level as bit(1), using a BooleanField
    illumination_intensity = models.DecimalField(max_digits=13, decimal_places=9)  # illumination_intensity as decimal(13,9)
    timestamp = models.CharField(max_length=16)  # timestamp as varchar(16)
    sensor_id = models.CharField(max_length=36)  # sensor_id as varchar(36)
    airtemp_sensID = models.CharField(max_length=36)  # airtemp_sensID as varchar(36)
    relhumid_sensID = models.CharField(max_length=36)  # relhumid_sensID as varchar(36)
    co2_sensID = models.CharField(max_length=36)  # co2_sensID as varchar(36)
    illumination_sensID = models.CharField(max_length=36)  # illumination_sensID as varchar(36)
    increment_id = models.IntegerField()  # Added increment_id from DB table

    def __str__(self):
        return self.id

    class Meta:
        db_table = 'greenhouse'  # The database table name
        managed = False  # Specify if the model should be managed by Django or not
        
class WaterBed(models.Model):
    id = models.CharField(max_length=36, primary_key=True)  # ID as varchar(36)
    created_at = models.CharField(max_length=35)  # created_at as varchar(35)   
    updated_at = models.CharField(max_length=35)  # updated_at as varchar(35)
    deleted_at = models.CharField(max_length=30, null=True, blank=True)  # deleted_at as varchar(30), nullable
    water_temperature = models.DecimalField(max_digits=11, decimal_places=8)  # water_temperature as decimal(11,8)
    dissolved_O2_level = models.DecimalField(max_digits=11, decimal_places=9)  # dissolved_02_level as decimal(11,9)
    electrical_conductivity =  models.DecimalField(max_digits=11, decimal_places=6)   # electrical_conductivity as int
    total_dissolved_solids =  models.DecimalField(max_digits=11, decimal_places=6)   # total_dissolved_solids as int 
    nitrate = models.DecimalField(max_digits=11, decimal_places=6)  # nitrate as decimal(11,6)
    nitrite = models.DecimalField(max_digits=11, decimal_places=8)  # nitrite as decimal(11,8)
    ammonia = models.DecimalField(max_digits=11, decimal_places=9)  # ammonia as decimal(11,9)
    ph_level = models.DecimalField(max_digits=11, decimal_places=9)  # ph_level as decimal(11,9)
    timestamp = models.CharField(max_length=16)  # timestamp as varchar(16)
    sensor_id = models.CharField(max_length=36)  # sensor_id as varchar(36)
    watertemp_sensID = models.CharField(max_length=36)  # watertemp_sensID as varchar(36)
    do2_sensID = models.CharField(max_length=36)  # do2_sensID as varchar(36)
    tds_sensID = models.CharField(max_length=36)  # tds_sensID as varchar(36)
    nitrate_sensID = models.CharField(max_length=36)  # nitrate_sensID as varchar(36)
    nitrite_sensID = models.CharField(max_length=36)  # nitrite_sensID as varchar(36)
    ammonia_sensID = models.CharField(max_length=36)  # ammonia_sensID as varchar(36)
    ph_sensID = models.CharField(max_length=36)  # ph_sensID as varchar(36)
    increment_id = models.IntegerField()  # Added increment_id from DB table
    
    # There is no Electrical Conductivity Sensors ID in the database table. 
    
    def __str__(self):
        return self.id
    
    class Meta:
        db_table = 'water_bed'
        managed = False


class Biofilter(models.Model):
    id = models.CharField(max_length=36, primary_key=True)  # ID as varchar(36)
    created_at = models.CharField(max_length=35)  # created_at as varchar(35)
    updated_at = models.CharField(max_length=35)  # updated_at as varchar(35)
    deleted_at = models.CharField(max_length=30, null=True, blank=True)  # deleted_at as varchar(30), nullable
    nitrate = models.DecimalField(max_digits=11, decimal_places=7)  # nitrate as decimal(11,7)
    nitrite = models.DecimalField(max_digits=11, decimal_places=8)  # nitrite as decimal(11,8)
    ammonia = models.DecimalField(max_digits=11, decimal_places=9)  # ammonia as decimal(11,9)
    timestamp = models.CharField(max_length=16)  # timestamp as varchar(16)
    nitrate_sensID = models.CharField(max_length=36)  # nitrate_sensID as varchar(36)
    nitrite_sensID = models.CharField(max_length=36)  # nitrite_sensorID as varchar(36)
    ammonia_sensID = models.CharField(max_length=36)  # ammonia_sensID as varchar(36)
    increment_id = models.IntegerField()  # Added increment_id from DB table
    def __str__(self):
        return self.id

    class Meta:
        db_table = 'water_biofilter'
        managed = False

class FishTank(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_at = models.CharField(max_length=35)
    updated_at = models.CharField(max_length=35)
    deleted_at = models.CharField(max_length=30, null=True, blank=True)

    ec = models.DecimalField(max_digits=11, decimal_places=8)
    ph = models.DecimalField(max_digits=11, decimal_places=9)
    nitrate = models.DecimalField(max_digits=11, decimal_places=9)

    timestamp = models.CharField(max_length=16)

    ec_sensID = models.CharField(max_length=36)
    ph_sensID = models.CharField(max_length=36, null=True, blank=True)
    nitrate_sensID = models.CharField(max_length=36, null=True, blank=True)

    increment_id = models.IntegerField()

    class Meta:
        db_table = 'fish_tank'
        managed = False

# Optional: Create a custom user model by extending the User model
class UserAccount(models.Model):
    id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=255)
    
    def __str__(self):
        return self.username

    class Meta:
        db_table = 'useraccounts'
        managed = False


class ServerNotifications(models.Model):
    id = models.AutoField(primary_key=True)
    created_at = models.CharField(max_length=100)
    updated_at = models.CharField(max_length=100)
    deleted_at = models.CharField(max_length=100)
    message = models.CharField(max_length=255)
    severity = models.DecimalField(max_digits=11, decimal_places=7)
    related_table = models.CharField(max_length=100) 
    related_record_id = models.CharField(max_length=100)
    timestamp = models.CharField(max_length=100)
    
    def __str__(self):
        return self.username

    class Meta:
        db_table = 'server_notifications'
        managed = False



class EdgeDeviceInfo(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    created_at = models.CharField(max_length=10, null=True, blank=True)
    updated_at = models.CharField(max_length=10, null=True, blank=True)
    deleted_at = models.CharField(max_length=10, null=True, blank=True)
    name = models.CharField(max_length=18, null=True, blank=True)
    description = models.CharField(max_length=57, null=True, blank=True)
    statusz = models.SmallIntegerField(null=True, blank=True)
    api_key = models.CharField(max_length=60, null=True, blank=True)
    passcode = models.CharField(max_length=60, null=True, blank=True)
    mqtt_client_id = models.CharField(max_length=44, null=True, blank=True)
    
    class Meta:
        db_table = 'cluster_info'


class EdgeActuatorView(models.Model):
    edge_device_id = models.CharField(max_length=36, primary_key=True)
    edge_device_name = models.CharField(max_length=18, null=True, blank=True)
    edge_device_description = models.CharField(max_length=57, null=True, blank=True)
    edge_device_status = models.SmallIntegerField(null=True, blank=True)
    api_key = models.CharField(max_length=60, null=True, blank=True)
    passcode = models.CharField(max_length=60, null=True, blank=True)
    mqtt_client_id = models.CharField(max_length=44, null=True, blank=True)
    actuator_id = models.CharField(max_length=36, null=True, blank=True)
    actuator_name = models.CharField(max_length=20, null=True, blank=True)
    actuator_type = models.CharField(max_length=36, null=True, blank=True)
    actuator_status = models.SmallIntegerField(null=True, blank=True)
    parent_edge_device_id = models.CharField(max_length=36, null=True, blank=True)

    class Meta:
        managed = False  # Since this is a database view
        db_table = 'cluster_actuator_view'

class ActuatorDeviceInfo(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    created_at = models.CharField(max_length=10, null=True, blank=True)
    updated_at = models.CharField(max_length=10, null=True, blank=True)
    deleted_at = models.CharField(max_length=10, null=True, blank=True)
    device_name = models.CharField(max_length=20, null=True, blank=True)
    type_id = models.CharField(max_length=36, null=True, blank=True)
    statusz = models.SmallIntegerField(null=True, blank=True)
    parent_edge_device = models.ForeignKey(EdgeDeviceInfo, on_delete=models.SET_NULL, null=True, blank=True, db_column='parent_edge_device_id')
    
    class Meta:
        db_table = 'actuator_device_infos'

class ActuatorUpdate(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    created_at = models.CharField(max_length=10, null=True, blank=True)
    updated_at = models.CharField(max_length=10, null=True, blank=True)
    deleted_at = models.CharField(max_length=10, null=True, blank=True)
    actuator_device_info = models.ForeignKey(ActuatorDeviceInfo, on_delete=models.SET_NULL, null=True, blank=True, db_column='actuator_device_info_id')
    statusz = models.SmallIntegerField(null=True, blank=True)
    timestamp = models.CharField(max_length=26, null=True, blank=True)
    remarks = models.TextField(null=True, blank=True)
    made_by = models.CharField(max_length=10, null=True, blank=True)
    
    class Meta:
        db_table = 'actuator_updates'

class SensorDeviceInfo(models.Model):
    sensor_id = models.CharField(max_length=36, primary_key=True)
    name = models.CharField(max_length=255, null=True)
    type_id = models.CharField(max_length=36, null=True)
    edge_device_status = models.IntegerField(null=True)
    parent_edge_device_id = models.CharField(max_length=36, null=True)
    edge_device_name = models.CharField(max_length=255, null=True)
    api_key = models.CharField(max_length=255, null=True)
    passcode = models.CharField(max_length=255, null=True)
    mqtt_client_id = models.CharField(max_length=255, null=True)
    sensor_type_name = models.CharField(max_length=255, null=True)
    icon_path = models.CharField(max_length=255, null=True)
    sensor_created_at = models.CharField(max_length=10, null=True)
    sensor_updated_at = models.CharField(max_length=10, null=True)
    sensor_deleted_at = models.CharField(max_length=10, null=True)
    edge_created_at = models.CharField(max_length=10, null=True)
    edge_updated_at = models.CharField(max_length=10, null=True)
    edge_deleted_at = models.CharField(max_length=10, null=True)
    sensor_type_created_at = models.CharField(max_length=10, null=True)
    sensor_type_updated_at = models.CharField(max_length=10, null=True)
    sensor_type_deleted_at = models.CharField(max_length=10, null=True)

    class Meta:
        managed = False  # Tells Django not to create/modify the table
        db_table = 'sensor_device_info' # matches your view name

class SensorType(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    created_at = models.CharField(max_length=10, null=True, blank=True)
    updated_at = models.CharField(max_length=10, null=True, blank=True)
    deleted_at = models.CharField(max_length=10, null=True, blank=True)
    name = models.CharField(max_length=22, null=True, blank=True)
    icon_path = models.CharField(max_length=45, null=True, blank=True)
    
    class Meta:
        db_table = 'sensor_types'
        ordering = ['name']

    def __str__(self):
        return self.name or f'Sensor {self.id}'


class ClusterGreenData(models.Model):
    cluster_id = models.IntegerField(primary_key=True)
    indentifier = models.CharField(max_length=36, null=True, blank=True)
    cluster_name = models.CharField(max_length=50, null=True, blank=True)
    mqtt_client_id = models.CharField(max_length=44, null=True, blank=True)
    api_key = models.CharField(max_length=60, null=True, blank=True)
    cl_status = models.SmallIntegerField(null=True, blank=True)
    air_temperature = models.DecimalField(max_digits=11, decimal_places=8, null=True, blank=True)
    greenhouse_airtemp_sensID = models.CharField(max_length=36, null=True, blank=True)
    relative_humidity = models.DecimalField(max_digits=11, decimal_places=8, null=True, blank=True)
    greenhouse_relhumid_sensID = models.CharField(max_length=36, null=True, blank=True)
    co2_level = models.BooleanField(null=True, blank=True)
    greenhouse_co2_sensID = models.CharField(max_length=36, null=True, blank=True)
    illumination_intensity = models.DecimalField(max_digits=13, decimal_places=9, null=True, blank=True)
    greenhouse_illumination_sensID = models.CharField(max_length=36, null=True, blank=True)
    greenhouse_timestamp = models.CharField(max_length=16, null=True, blank=True)
    class Meta:
        managed = False  # Since this is a database view
        db_table = 'cluster_greenhouse_data'    

class ClusterBiofilterData(models.Model):
    cluster_id = models.IntegerField(primary_key=True)
    indentifier = models.CharField(max_length=36, null=True, blank=True)
    cluster_name = models.CharField(max_length=50, null=True, blank=True)
    mqtt_client_id = models.CharField(max_length=44, null=True, blank=True)
    api_key = models.CharField(max_length=60, null=True, blank=True)
    cl_status = models.SmallIntegerField(null=True, blank=True)
    biofilter_nitrate = models.DecimalField(max_digits=11, decimal_places=7, null=True, blank=True)
    biofilter_nitrate_sensID = models.CharField(max_length=36, null=True, blank=True)
    biofilter_nitrite = models.DecimalField(max_digits=11, decimal_places=8, null=True, blank=True)
    biofilter_nitrite_sensID = models.CharField(max_length=36, null=True, blank=True)
    biofilter_ammonia = models.DecimalField(max_digits=11, decimal_places=9, null=True, blank=True)
    biofilter_ammonia_sensID = models.CharField(max_length=36, null=True, blank=True)
    biofilter_timestamp = models.CharField(max_length=16, null=True, blank=True)
    class Meta:
        managed = False  # Since this is a database view
        db_table = 'cluster_biofilter_data'

class ClusterWaterBedData(models.Model):
    cluster_id = models.IntegerField(primary_key=True)
    indentifier = models.CharField(max_length=36, null=True, blank=True)
    cluster_name = models.CharField(max_length=50, null=True, blank=True)
    mqtt_client_id = models.CharField(max_length=44, null=True, blank=True)
    api_key = models.CharField(max_length=60, null=True, blank=True)
    cl_status = models.SmallIntegerField(null=True, blank=True)
    water_temperature = models.DecimalField(max_digits=11, decimal_places=8, null=True, blank=True)
    waterbed_watertemp_sensID = models.CharField(max_length=36, null=True, blank=True)
    dissolved_o2_level = models.DecimalField(max_digits=11, decimal_places=9, null=True, blank=True)
    waterbed_do2_sensID = models.CharField(max_length=36, null=True, blank=True)
    electrical_conductivity = models.IntegerField(null=True, blank=True)
    waterbed_tds_sensID = models.CharField(max_length=36, null=True, blank=True)
    total_dissolved_solids = models.IntegerField(null=True, blank=True)
    waterbed_nitrate = models.DecimalField(max_digits=11, decimal_places=6, null=True, blank=True)
    waterbed_nitrate_sensID = models.CharField(max_length=36, null=True, blank=True)
    waterbed_nitrite = models.DecimalField(max_digits=11, decimal_places=8, null=True, blank=True)
    waterbed_nitrite_sensID = models.CharField(max_length=36, null=True, blank=True)
    waterbed_ammonia = models.DecimalField(max_digits=11, decimal_places=9, null=True, blank=True)
    waterbed_ammonia_sensID = models.CharField(max_length=36, null=True, blank=True)
    ph_level = models.DecimalField(max_digits=11, decimal_places=9, null=True, blank=True)
    waterbed_ph_sensID = models.CharField(max_length=36, null=True, blank=True)
    waterbed_timestamp = models.CharField(max_length=16, null=True, blank=True)

    class Meta:
        managed = False  # Since this is a database view
        db_table = 'cluster_waterbed_data'