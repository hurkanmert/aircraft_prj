from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('aircraft_app.urls')),
    path('aircraft_app/', include('aircraft_app.urls')),
]
