from django.contrib import admin
from .models import Kanat, Govde, Kuyruk, Aviyonik, Ucak, CustomUser


# Bu kısımda modelleri yönetim panelinde nasıl görüneceğini ayarlıyoruz. 
# Modelleri sırasıyla admin paneline kayıt ediyoruz ve gösterilmesini istediğimiz alanları belirliyoruz.

@admin.register(Kanat)  # Kanat modelini admin paneline kaydediyoruz.
class KanatAdmin(admin.ModelAdmin):
    list_display = ('ucak_adi', 'kanat_seri_numarasi', 'uretim_tarihi', 'status') # Kanat listesinde gösterilecek alanlar.

@admin.register(Govde)
class GovdeAdmin(admin.ModelAdmin):
    list_display = ('ucak_adi', 'govde_seri_numarasi', 'uretim_tarihi', 'status') # Gövde listesinde gösterilecek alanlar.

@admin.register(Kuyruk)
class KuyrukAdmin(admin.ModelAdmin):
    list_display = ('ucak_adi', 'kuyruk_seri_numarasi', 'uretim_tarihi', 'status') # Kuyruk listesinde gösterilecek alanlar.

@admin.register(Aviyonik)
class AviyonikAdmin(admin.ModelAdmin):
    list_display = ('ucak_adi', 'aviyonik_seri_numarasi', 'uretim_tarihi', 'status') # Aviyonik listesinde gösterilecek alanlar.

@admin.register(Ucak)
class UcakAdmin(admin.ModelAdmin):
    list_display = ('ucak_adi', 'seri_numarasi', 'govde_serial', 'kanat_serial', 'aviyonik_serial', 'kuyruk_serial') # Uçak listesinde gösterilecek alanlar.

@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('username', 'role')