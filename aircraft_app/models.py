from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone

# Kullanıcı modelini genişletmek için AbstractUser sınıfından türetilmiş özel bir kullanıcı modeli oluşturrduk
class CustomUser(AbstractUser):
    # Kullanıcı rollerini tanımlama
    ROLE_CHOICES = [
        ('kanat', 'Kanat'),
        ('govde', 'Gövde'),
        ('aviyonik', 'Aviyonik'),
        ('kuyruk', 'Kuyruk'),
        ('montaj', 'Montaj'),
    ]
    # Kullanıcıya bir rol atamak için role alanı
    role = models.CharField(max_length=10, choices=ROLE_CHOICES)

# Kanat modeli
class Kanat(models.Model):
    # Uçak Tiplerini Tanımlama
    AIRCRAFT_CHOICES = [
        ('TB2', 'TB2'),
        ('TB3', 'TB3'),
        ('Akıncı', 'Akıncı'),
        ('Kızılelma', 'Kızılelma'),
    ]

    # kanat durumunu tanımlama
    STATUS_CHOICES = [
        ('uygun', 'Uygun'),
        ('kullanimda', 'kullanimda')
    ]

    # status özellikleri
    status = models.CharField(
        max_length=20,
        choices = STATUS_CHOICES,
        default = 'uygun'
    )

     # Uçak adı ve seri numarası alanları
    ucak_adi = models.CharField(max_length=50, choices=AIRCRAFT_CHOICES)  # Uçak tipi
    kanat_seri_numarasi = models.CharField(max_length=100, blank=True)  # Kanat seri numarası (otomatik doldurulacak)
    uretim_tarihi = models.DateTimeField(default=timezone.now)  # Üretim tarihi

    def save(self, *args, **kwargs):
        if not self.kanat_seri_numarasi:
            # Aynı uçak adına ait mevcut kayıt sayısını al

            # Son eklenen kanadı al ve seri numarasını kontrol et
            last_kanat = Kanat.objects.filter(ucak_adi=self.ucak_adi).order_by('id').last()

            last_serial_number = last_kanat.kanat_seri_numarasi
            # Son seri numarasını '_' ile ayır
            last_serial_parts = last_serial_number.split('_')
            last_serial_index = int(last_serial_parts[-1])  # Son eleman
            new_serial_index = last_serial_index + 1  # 1 ekle

            # Seri numarasını oluştur: UçakAdı_Kanat_00X
            self.kanat_seri_numarasi = f"{self.ucak_adi}_Kanat_{new_serial_index:03d}"
        
        # Super sınıfın save metodunu çağır
        super(Kanat, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.ucak_adi} - Kanat Seri No: {self.kanat_seri_numarasi}"

class Govde(models.Model):
    # Uçak Tipleri
    AIRCRAFT_CHOICES = [
        ('TB2', 'TB2'),
        ('TB3', 'TB3'),
        ('Akıncı', 'Akıncı'),
        ('Kızılelma', 'Kızılelma'),
    ]

    STATUS_CHOICES = [
        ('uygun', 'Uygun'),
        ('kullanimda', 'kullanimda')
    ]

    status = models.CharField(
        max_length=20,
        choices = STATUS_CHOICES,
        default = 'uygun'
    )

    ucak_adi = models.CharField(max_length=50, choices=AIRCRAFT_CHOICES)  # Uçak tipi
    govde_seri_numarasi = models.CharField(max_length=100, blank=True)  # Kanat seri numarası (otomatik doldurulacak)
    uretim_tarihi = models.DateTimeField(default=timezone.now)  # Üretim tarihi

    def save(self, *args, **kwargs):
        if not self.govde_seri_numarasi:
            # Aynı uçak adına ait mevcut kayıt sayısını al
            mevcut_govde_sayisi = Govde.objects.filter(ucak_adi=self.ucak_adi).count()
            if mevcut_govde_sayisi == 0:
                new_serial_index = 1
            else:
                # Son eklenen kanadı al ve seri numarasını kontrol et
                last_govde = Govde.objects.filter(ucak_adi=self.ucak_adi).order_by('id').last()

                last_serial_number = last_govde.govde_seri_numarasi
                # Son seri numarasını '_' ile ayır
                last_serial_parts = last_serial_number.split('_')
                last_serial_index = int(last_serial_parts[-1])  # Son eleman
                new_serial_index = last_serial_index + 1  # 1 ekle


            # Seri numarasını oluştur: UçakAdı_Kanat_00X
            self.govde_seri_numarasi = f"{self.ucak_adi}_Govde_{new_serial_index:03d}"
        super(Govde, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.ucak_adi} - Gövde Seri No: {self.govde_seri_numarasi}"

class Kuyruk(models.Model):
    # Uçak Tipleri
    AIRCRAFT_CHOICES = [
        ('TB2', 'TB2'),
        ('TB3', 'TB3'),
        ('Akıncı', 'Akıncı'),
        ('Kızılelma', 'Kızılelma'),
    ]

    STATUS_CHOICES = [
        ('uygun', 'Uygun'),
        ('kullanimda', 'kullanimda')
    ]

    status = models.CharField(
        max_length=20,
        choices = STATUS_CHOICES,
        default = 'uygun'
    )

    ucak_adi = models.CharField(max_length=50, choices=AIRCRAFT_CHOICES)  # Uçak tipi
    kuyruk_seri_numarasi = models.CharField(max_length=100, blank=True)  # Kanat seri numarası (otomatik doldurulacak)
    uretim_tarihi = models.DateTimeField(default=timezone.now)  # Üretim tarihi

    def save(self, *args, **kwargs):
        if not self.kuyruk_seri_numarasi:
            # Aynı uçak adına ait mevcut kayıt sayısını al
            mevcut_kuyruk_sayisi = Kuyruk.objects.filter(ucak_adi=self.ucak_adi).count()
            if mevcut_kuyruk_sayisi == 0:
                new_serial_index = 1
            else:
                # Son eklenen kanadı al ve seri numarasını kontrol et
                last_kuyruk = Kuyruk.objects.filter(ucak_adi=self.ucak_adi).order_by('id').last()

                last_serial_number = last_kuyruk.kuyruk_seri_numarasi
                # Son seri numarasını '_' ile ayır
                last_serial_parts = last_serial_number.split('_')
                last_serial_index = int(last_serial_parts[-1])  # Son eleman
                new_serial_index = last_serial_index + 1  # 1 ekle


            # Seri numarasını oluştur: UçakAdı_Kanat_00X
            self.kuyruk_seri_numarasi = f"{self.ucak_adi}_Kuyruk_{new_serial_index:03d}"
        super(Kuyruk, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.ucak_adi} - Kuyruk Seri No: {self.kuyruk_seri_numarasi}"

class Aviyonik(models.Model):
    # Uçak Tipleri
    AIRCRAFT_CHOICES = [
        ('TB2', 'TB2'),
        ('TB3', 'TB3'),
        ('Akıncı', 'Akıncı'),
        ('Kızılelma', 'Kızılelma'),
    ]

    STATUS_CHOICES = [
        ('uygun', 'Uygun'),
        ('kullanimda', 'kullanimda')
    ]

    status = models.CharField(
        max_length=20,
        choices = STATUS_CHOICES,
        default = 'uygun'
    )

    ucak_adi = models.CharField(max_length=50, choices=AIRCRAFT_CHOICES)  # Uçak tipi
    aviyonik_seri_numarasi = models.CharField(max_length=100, blank=True)  # Kanat seri numarası (otomatik doldurulacak)
    uretim_tarihi = models.DateTimeField(default=timezone.now)  # Üretim tarihi

    def save(self, *args, **kwargs):
        if not self.aviyonik_seri_numarasi:
            # Aynı uçak adına ait mevcut kayıt sayısını al
            mevcut_aviyonik_sayisi = Aviyonik.objects.filter(ucak_adi=self.ucak_adi).count()
            if mevcut_aviyonik_sayisi == 0:
                new_serial_index = 1
            else:
                # Son eklenen kanadı al ve seri numarasını kontrol et
                last_aviyonik = Aviyonik.objects.filter(ucak_adi=self.ucak_adi).order_by('id').last()

                last_serial_number = last_aviyonik.aviyonik_seri_numarasi
                # Son seri numarasını '_' ile ayır
                last_serial_parts = last_serial_number.split('_')
                last_serial_index = int(last_serial_parts[-1])  # Son eleman
                new_serial_index = last_serial_index + 1  # 1 ekle


            # Seri numarasını oluştur: UçakAdı_Kanat_00X
            self.aviyonik_seri_numarasi = f"{self.ucak_adi}_Aviyonik_{new_serial_index:03d}"
        super(Aviyonik, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.ucak_adi} - Aviyonik Seri No: {self.aviyonik_seri_numarasi}"

class Ucak(models.Model):
    ucak_adi = models.CharField(max_length=100)
    seri_numarasi = models.CharField(max_length=100)
    govde_serial = models.CharField(max_length=100)
    kanat_serial = models.CharField(max_length=100)
    kuyruk_serial = models.CharField(max_length=100)
    aviyonik_serial = models.CharField(max_length=100)
    uretim_tarihi = models.DateTimeField(auto_now_add=True)