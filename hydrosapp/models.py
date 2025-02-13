from django.db import models

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
    electrical_conductivity = models.IntegerField(max_length = 11)  # electrical_conductivity as int
    total_dissolved_solids = models.IntegerField(max_length = 11)  # total_dissolved_solids as int 
    nitrate = models.DecimalField(max_digits=11, decimal_places=6)  # nitrate as decimal(11,6)
    nitrite = models.DecimalField(max_digits=11, decimal_places=8)  # nitrite as decimal(11,8)
    ammonia = models.DecimalField(max_digits=11, decimal_places=9)  # ammonia as decimal(11,9)
    ph_level = models.DecimalField(max_digits=11, decimal_places=9)  # ph_level as decimal(11,9)
    timestamp = models.CharField(max_length=16)  # timestamp as varchar(16)
    sensor_id = models.CharField(max_length=36)  # sensor_id as varchar(36)
    
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
    def __str__(self):
        return self.id

    class Meta:
        db_table = 'water_biofilter'
        managed = False



# Optional: Create a custom user model by extending the User model
class UserAccount(models.Model):
    id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=255)
    
    def __str__(self):
        return self.username

    class Meta:
        db_table = 'useraccounts'
        managed = False