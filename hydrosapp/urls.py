
from django.contrib import admin
from django.urls import path
from hydrosapp import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('start/', views.start, name='start'),
    path('greenhouse/', views.get_greenhouse, name='greenhouse'),
    path('waterbed/', views.get_waterbed, name='waterbed'),
    path('waterbiofilter/', views.get_waterbio, name='waterbiofilter'),
    path('waterbiofiltercharts/', views.get_waterbiochart, name='waterbiofilter'),
    path('waterbedcharts/', views.get_waterbedchart, name='waterbedcharts'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('register/', views.register, name='register'),
    path('', views.start),
]
