# ✈️ Uçak Montaj Yönetim Sistemi
### Aircraft Assembly Management System

[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)](https://python.org)
[![Django](https://img.shields.io/badge/Django-4.x-green?logo=django)](https://djangoproject.com)
[![DRF](https://img.shields.io/badge/Django_REST_Framework-red)](https://django-rest-framework.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-blue?logo=postgresql)](https://postgresql.org)

---

## 📌 Proje Hakkında / About

**TR:** Uçak üretim sürecini uçtan uca yönetmek için geliştirilmiş rol tabanlı web uygulaması. Her kullanıcı rolü yalnızca kendi sorumluluğundaki sayfaya erişebilir; montaj ekibi tüm parçaların hazır olup olmadığını kontrol ederek nihai uçak üretimini gerçekleştirir.

**EN:** A role-based web application for end-to-end aircraft assembly management. Each user role can only access its own production page; the assembly team verifies part availability and performs final aircraft production.

---

## 🚀 Özellikler / Features

- 🔐 **Rol tabanlı kimlik doğrulama** — 5 farklı kullanıcı rolü: Kanat, Gövde, Kuyruk, Aviyonik, Montaj
- 🏭 **Parça üretim yönetimi** — Her ekip kendi parça tipini üretir, seri numarası otomatik atanır
- 🟡🔴 **Stok uyarı sistemi** — Stok 3'ün altında sarı, 2'nin altında kırmızı uyarı
- ⚙️ **Montaj doğrulama** — Eksik parça varsa üretim engellenir, hangi parça eksik olduğu bildirilir
- 📋 **Uçak listesi** — Üretilen her uçağın tüm bileşen seri numaraları ve üretim tarihi kayıt altında
- 🚫 **Sayfa erişim kontrolü** — Yetkisiz erişimde 5 saniyelik geri sayım ile 403 yönlendirmesi
- 🔄 **AJAX ile gerçek zamanlı güncelleme** — Sayfa yenilenmeden stok sayıları güncellenir
- 🛠️ **Django Admin** — Tüm modeller ve kullanıcı yönetimi admin panelinden yönetilebilir

---

## 🖼️ Ekran Görüntüleri / Screenshots

### Giriş Sayfası / Login
![Login](ProjeGoruntu/01_login_page.png)

### Kanat Üretim Sayfası / Wing Production
![Kanat Üretim](ProjeGoruntu/02_kanat_uretim.png)

### Stok Uyarıları / Stock Warnings
> Sarı: stok ≤ 3 | Kırmızı: stok = 0

![Stok Uyarı](ProjeGoruntu/03_kanat_uretim.png)

### Montaj Sayfası — Parça Kontrolü / Assembly — Parts Check
![Montaj](ProjeGoruntu/22_montaj.png)

### Montaj Sayfası — Eksik Parça Uyarısı / Missing Part Warning
![Eksik Parça](ProjeGoruntu/25_montaj.png)

### Üretim Başarılı / Production Success
![Başarılı](ProjeGoruntu/23_montaj.png)

### Sayfa Erişim Engeli / Access Denied (403)
![403](ProjeGoruntu/20_sayfa_kontrol.png)

### Django Admin Paneli / Admin Panel
![Admin](ProjeGoruntu/26_admin.png)

---

## 🛠️ Teknoloji Yığını / Tech Stack

| Katman | Teknoloji |
|--------|-----------|
| Backend | Python, Django, Django REST Framework |
| Veritabanı | PostgreSQL |
| Frontend | HTML, CSS, JavaScript, Bootstrap |
| Asenkron | AJAX (sayfa yenilemesiz güncelleme) |
| Yönetim | Django Admin (özelleştirilmiş) |

---

## 🏗️ Mimari Kararlar / Architecture Decisions

**Django REST Framework** — Parça stok verileri ve montaj işlemleri REST API üzerinden yönetildi. Bu sayede frontend ve backend birbirinden bağımsız çalışır; ileride mobil uygulama veya farklı bir frontend entegre edilebilir.

**AJAX ile asenkron güncelleme** — Stok sayılarının her üretim işleminden sonra sayfa yenilenmeden güncellenmesi için AJAX kullanıldı. Kullanıcı deneyimini önemli ölçüde iyileştirir.

**Custom User Model** — Django'nun varsayılan kullanıcı modeli genişletilerek `role` alanı eklendi. Bu sayede her kullanıcıya bir üretim rolü atanabilir ve view katmanında role göre yetkilendirme yapılır.

**PostgreSQL** — İlişkisel veri yapısı (uçak → parçalar arası foreign key ilişkileri) ve üretim geçmişi sorguları için PostgreSQL tercih edildi.

---

## ⚙️ Kurulum / Installation

### Gereksinimler / Requirements
```bash
pip install -r requirements.txt
```

### Veritabanı Kurulumu / Database Setup
```bash
# PostgreSQL'de yeni veritabanı oluşturun
# settings.py içindeki veritabanı bilgilerini güncelleyin

python manage.py migrate
python manage.py createsuperuser
```

### Örnek Veri Yükleme / Load Sample Data
```bash
# Veritabanı yedeğini yükleyin
psql -U postgres -d <veritabanı_adı> < backup_db.sql
```

### Sunucuyu Başlatın / Run Server
```bash
python manage.py runserver
```

Tarayıcıda açın: `http://localhost:8000/aircraft_app/login/`

---

## 👥 Test Kullanıcıları / Test Users

| Kullanıcı | Rol | Şifre |
|-----------|-----|-------|
| hasan | Kanat | 12345 |
| veli | Kuyruk | 12345 |
| ali | Kuyruk | 12345 |
| ahmet | Gövde | 12345 |
| mert | Aviyonik | 12345 |
| hmd | Montaj | 12345 |

> Admin paneli için superuser oluşturun: `python manage.py createsuperuser`

---

## 🔗 API Endpoints

| Endpoint | Metot | Açıklama |
|----------|-------|----------|
| `/aircraft_app/login/` | GET/POST | Kullanıcı girişi |
| `/aircraft_app/kanat/` | GET/POST | Kanat üretim ve listeleme |
| `/aircraft_app/govde/` | GET/POST | Gövde üretim ve listeleme |
| `/aircraft_app/kuyruk/` | GET/POST | Kuyruk üretim ve listeleme |
| `/aircraft_app/aviyonik/` | GET/POST | Aviyonik üretim ve listeleme |
| `/aircraft_app/montaj/` | GET/POST | Montaj ve uçak üretimi |
| `/aircraft_app/403/` | GET | Erişim engeli sayfası |
| `/admin/` | GET | Django admin paneli |

---

## 📁 Proje Yapısı / Project Structure

```
aircraft_prj/
├── aircraft_app/          # Ana uygulama
│   ├── models.py          # Kanat, Gövde, Kuyruk, Aviyonik, Uçak, Kullanıcı modelleri
│   ├── views.py           # Rol tabanlı view'lar
│   ├── serializers.py     # DRF serializer'ları
│   ├── urls.py            # URL yönlendirmeleri
│   └── templates/         # HTML şablonları
├── aircraft_prj/          # Proje ayarları
│   └── settings.py
├── backup_db.sql          # Örnek veri
└── requirements.txt
```

---

## 📝 Lisans / License

Bu proje açık kaynaklıdır. / This project is open source.
