from django.contrib import admin
from django.urls import path
from hydrosapp import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', views.start, name='start'),
    path('', views.landing, name='landing'),
    path('/', views.landing, name='landing'),

    path('prediction-lstm/', views.prediction_lstm_summary, name='prediction_lstm'),


    path('greenhouse/', views.get_greenhouse, name='greenhouse'),
    path('api/current_temp/', views.current_temp, name='current_temp'),
    path('api/environmental-scores/', views.environmental_scores, name='environmental_scores'),
    path('pumpcontrol/', views.pump_control_view, name='pumpcontrol'),
    
    
    path('biofilter_live_chart_data_predicted/', views.biofilter_live_chart_data_predicted, name='biofilter_live_chart_data_predicted'),
    path('waterbed_live_chart_data_predicted/', views.waterbed_live_chart_data_predicted, name='waterbed_live_chart_data_predicted'),
    path('greenhouse_live_chart_data_predicted/', views.greenhouse_live_chart_data_predicted, name='greenhouse_live_chart_data_predicted'),
    path('fish_tank_live_chart_data_predicted/', views.fish_tank_live_chart_data_predicted, name='fish_tank_live_chart_data_predicted'),


    path('greenhouse_live_data/', views.greenhouse_live_chart_data, name='greenhouse_live_chart_data'),
    path('waterbed_live_data/', views.waterbed_live_chart_data, name='waterbed_live_chart_data'),
    path('biofilter_live_data/', views.biofilter_live_chart_data, name='biofilter_live_chart_data'),
    path('fish_tank_live_chart_data/', views.fish_tank_live_chart_data, name='fish_tank_live_chart_data'),

    path('fish_tank_data/', views.fish_tank_data, name='fish_tank_data'),
    path('waterbed/', views.get_waterbed, name='waterbed'),
    path('waterbiofilter/', views.get_waterbio, name='waterbiofilter'),
    path('waterbiofiltercharts/', views.get_waterbiochart, name='waterbiofiltercharts'),
    path('api/waterbedchart/', views.get_waterbedchart, name='waterbedcharts'),
    path('greencharts/', views.get_greenchart, name='greencharts'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('register/', views.register, name='register'),
    path('verify_otp/', views.verify_otp, name='verify_otp'),
    path('cameras/', views.cameras, name='cameras'),
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    path('actuators/', views.get_actuator_list, name='actuators'),
    path('actuator_updates/', views.get_actuator_updates, name='actuator_updates'),
    path('edge_devices/', views.get_edge_devices, name='edge_devices'),
    path('sensor/sensors/<str:sensor_id>/', views.sensor_detail, name='sensor_detail'),
    path('sensor/sensors/<int:sensor_type_id>/', views.sensor_list_by_type, name='sensor_list_by_type'),
    path('edge_devices/<str:device_id>/data/<str:data_type>/', views.view_device_data, name='view_device_data'),
    path('edge_devices/<str:device_id>/data/', views.view_device_data_modal, name='view_device_data_modal'),
    path('thresholds/submit/', views.submit_threshold, name='submit_threshold'),
    path('', views.start),
]
