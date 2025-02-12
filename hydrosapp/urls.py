
from django.contrib import admin
from django.urls import path
from hydrosapp import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('start/', views.start, name='start'),
    path('', views.start),
]
