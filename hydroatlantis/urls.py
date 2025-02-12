
from django.contrib import admin
from django.urls import path
from django.urls import path, include
from hydrosapp import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('hydrosapp.urls')),
]
