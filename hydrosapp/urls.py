
from django.contrib import admin
from django.urls import path
from hydrosapp import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('start/', views.start, name='start'),
    path('greenhouse/', views.get_greenhouse, name='greenhouse'),
    path('waterbed/', views.get_waterbed, name='waterbed'),
    path('', views.start),
]
