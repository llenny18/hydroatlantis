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
            