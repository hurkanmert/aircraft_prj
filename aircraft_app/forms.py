from django.contrib.auth.forms import AuthenticationForm
from django import forms
from .models import Kanat, Govde, Kuyruk, Aviyonik

# Özel bir kimlik doğrulama formu oluşturuyoruz.
class CustomAuthenticationForm(AuthenticationForm):
    pass # İhtiyaç duyulursa daha fazla özelleştirme yapılabilir.


# Modeller için formlar oluşturuldu.

class KanatForm(forms.ModelForm):
    class Meta:
        model = Kanat # formun hangi model ile ilişkili olduğu belirtiliyor
        fields = ['ucak_adi']  # Sadece uçak tipi seçilecek
        widgets = {
            'ucak_adi': forms.Select(choices=Kanat.AIRCRAFT_CHOICES), # Uçak tipini seçim listesi olarak gösteriyoruz.
        }

class GovdeForm(forms.ModelForm):
    class Meta:
        model = Govde
        fields = ['ucak_adi']  
        widgets = {
            'ucak_adi': forms.Select(choices=Govde.AIRCRAFT_CHOICES),
        }

class KuyrukForm(forms.ModelForm):
    class Meta:
        model = Kuyruk
        fields = ['ucak_adi']  
        widgets = {
            'ucak_adi': forms.Select(choices=Kuyruk.AIRCRAFT_CHOICES),
        }

class AviyonikForm(forms.ModelForm):
    class Meta:
        model = Aviyonik
        fields = ['ucak_adi']  
        widgets = {
            'ucak_adi': forms.Select(choices=Aviyonik.AIRCRAFT_CHOICES),
        }