from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomAuthenticationForm
from .decorators import role_required
from .forms import KanatForm, GovdeForm, KuyrukForm, AviyonikForm
from .models import Kanat, Govde, Kuyruk, Aviyonik, Ucak
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from django.db.models import Max


def user_login(request):
    # kullanıcı giriş sayfası    
    if request.user.is_authenticated:
        # Eğer kullanıcı giriş yapmışsa rolüne göre yönlendir
        if request.user.role == 'kanat':
            return redirect('kanat_page')
        elif request.user.role == 'govde':
            return redirect('govde_page')
        elif request.user.role == 'aviyonik':
            return redirect('aviyonik_page')
        elif request.user.role == 'kuyruk':
            return redirect('kuyruk_page')
        elif request.user.role == 'montaj':
            return redirect('montaj_page')


    if request.method == 'POST':
        # post isteği ile gelen form verilerini al
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password) # kullanıcı adı ve şifre ile doğrulama yapılıyor
            if user is not None:
                login(request, user)
                # Kullanıcı rolüne göre yönlendirme yapalım
                if user.role == 'kanat':
                    return redirect('kanat_page')
                elif user.role == 'govde':
                    return redirect('govde_page')
                elif user.role == 'aviyonik':
                    return redirect('aviyonik_page')
                elif user.role == 'kuyruk':
                    return redirect('kuyruk_page')
                elif user.role == 'montaj':
                    return redirect('montaj_page')
    else:
        # eğer istek GET ise boş bir form göster
        form = CustomAuthenticationForm()
    # giriş sayfasını render ediyor
    return render(request, 'login.html', {'form': form})

def user_logout(request):
    # kullanıcı çıkış işlemi
    logout(request)
    return redirect('login')

# Kullanıcılar kendi rollerine uygun sayfalara girebilir. 
# eğer başka sayfaya girmeye çalışırlarsa buna izin verilmeyecek
@login_required
@role_required('kanat')
def kanat_page(request):
    return render(request, 'kanat.html')

@login_required
@role_required('govde')
def govde_page(request):
    return render(request, 'govde.html')

@login_required
@role_required('aviyonik')
def aviyonik_page(request):
    return render(request, 'aviyonik.html')

@login_required
@role_required('kuyruk')
def kuyruk_page(request):
    return render(request, 'kuyruk.html')

@login_required
@role_required('montaj')
def montaj_page(request):
    return render(request, 'montaj.html')

def forbidden(request):
    # erişim engellendi sayfası
    return render(request, '403.html', status=403)


## Kanat
@login_required # giriş gerekliliği
@role_required('kanat') # rolün uygunluğu
def kanat_page(request):
    
    # Formu işlemek için
    form = KanatForm(request.POST or None)
    
    if request.method == 'POST':
        # POST isteği ile form verilerini al
        if form.is_valid():
            form.save()  # Form geçerliyse veritabanına kaydet
            
            # Kullanıma uygun kanat sayıları güncelleniyor
            kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="uygun").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="uygun").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="uygun").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="uygun").count(),
            }

            # Kullanıma uygun olmayan kanat sayıları güncelleniyor
            k_kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="kullanimda").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="kullanimda").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="kullanimda").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="kullanimda").count(),
            }

            # AJAX isteği olduğunda kanat sayıları JSON olarak geri döner
            return JsonResponse({'kanat_sayilari': kanat_sayilari, 'k_kanat_sayilari': k_kanat_sayilari})

        else:
            # Form geçersizse hata mesajı döner
            return JsonResponse({'error': 'Form geçersiz.'}, status=400)

    # GET isteği ile sayfa yüklendiğinde
    selected_aircraft = request.GET.get('ucak_adi')  # Seçilen uçak adı
    # Seçilen uçağa göre kanatları filtrele
    kanatlar = Kanat.objects.filter(ucak_adi=selected_aircraft) if selected_aircraft else []

    # Her uçak için kaç kanat üretildiğini hesapla
    kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="uygun").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="uygun").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="uygun").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="uygun").count(),
    }
    k_kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="kullanimda").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="kullanimda").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="kullanimda").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="kullanimda").count(),
    }

    # Sayfayı render et
    return render(request, 'kanat.html', {
        'form': form,
        'kanatlar': kanatlar,
        'selected_aircraft': selected_aircraft,
        'kanat_sayilari': kanat_sayilari,
        'k_kanat_sayilari': k_kanat_sayilari
    })

def kanat_list_ajax(request):
    ucak_adi = request.GET.get('ucak_adi') # istemciden gelen uçak adını al
    page_number = request.GET.get('page')  # Sayfa numarasını al
    kanatlar = Kanat.objects.filter(ucak_adi=ucak_adi).order_by('id') # seçilen uçağa ait kanat bilgilerini al

    # Paginator ile sayfalama
    paginator = Paginator(kanatlar, 7)  # Her sayfada 7 kanat göster
    page_obj = paginator.get_page(page_number)

    # Kanatları JSON formatında döndür
    kanatlar_list = [{
        'ucak_adi': kanat.ucak_adi,
        'id': kanat.id,
        'kanat_seri_numarasi': kanat.kanat_seri_numarasi,
        'status': kanat.status,
        'uretim_tarihi': kanat.uretim_tarihi
    } for kanat in page_obj]

    return JsonResponse({
        'kanatlar': kanatlar_list,
        'num_pages': paginator.num_pages,  # Toplam sayfa sayısı
        'current_page': page_obj.number    # Geçerli sayfa numarası
    })

@csrf_exempt
def kanat_sil_ajax(request):
    ucak_adi = request.POST.get('ucak_adi') # istemciden gelen uçak adını al
    if request.method == 'POST':
        kanat_id = request.POST.get('kanat_id') # silinecek kanat ID'si
        try:
            kanat = Kanat.objects.get(id=kanat_id)
            kanat.delete()
            # Her uçak için kaç tane uygun kanat olduğunu hesapla
            kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="uygun").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="uygun").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="uygun").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="uygun").count(),
            }
            # Her uçak için kaç tane uygun olmayan kanat olduğunu hesapla
            k_kanat_sayilari = {
                'TB2': Kanat.objects.filter(ucak_adi='TB2', status="kullanimda").count(),
                'TB3': Kanat.objects.filter(ucak_adi='TB3', status="kullanimda").count(),
                'Akıncı': Kanat.objects.filter(ucak_adi='Akıncı', status="kullanimda").count(),
                'Kızılelma': Kanat.objects.filter(ucak_adi='Kızılelma', status="kullanimda").count(),
            }
            return JsonResponse({'message': 'Kanat başarıyla silindi.','new_kanat': kanat_sayilari, 'k_kanat_sayilari': k_kanat_sayilari})
        except Kanat.DoesNotExist:
            return JsonResponse({'message': 'Kanat bulunamadı.'}, status=404)
    return JsonResponse({'message': 'Geçersiz istek.'}, status=400)

        

## Gövde
@login_required
@role_required('govde')
def govde_page(request):
    # Formu işlemek için
    form = GovdeForm(request.POST or None)
    
    if request.method == 'POST':
        # POST isteği ile form verilerini al
        if form.is_valid():
            form.save()  # Form geçerliyse veritabanına kaydet
            
            # Gövde sayıları güncelleniyor
            govde_sayilari = {
                'TB2': Govde.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Govde.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }
            k_govde_sayilari = {
                'TB2': Govde.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Govde.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            # AJAX isteği olduğunda gövde sayıları JSON olarak geri döner
            return JsonResponse({'govde_sayilari': govde_sayilari, 'k_govde_sayilari': k_govde_sayilari})

        else:
            # Form geçersizse hata mesajı döner
            return JsonResponse({'error': 'Form geçersiz.'}, status=400)

    # GET isteği ile sayfa yüklendiğinde
    selected_aircraft = request.GET.get('ucak_adi')  # Seçilen uçak adı
    # Seçilen uçağa göre kanatları filtrele
    govdeler = Govde.objects.filter(ucak_adi=selected_aircraft) if selected_aircraft else []

    # Her uçak için kaç gövde üretildiğini hesapla
    govde_sayilari = {
        'TB2': Govde.objects.filter(ucak_adi='TB2', status='uygun').count(),
        'TB3': Govde.objects.filter(ucak_adi='TB3', status='uygun').count(),
        'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
        'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
    }

    k_govde_sayilari = {
        'TB2': Govde.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
        'TB3': Govde.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
        'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
        'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
    }


    # Sayfayı render et
    return render(request, 'govde.html', {
        'form': form,
        'govdeler': govdeler,
        'selected_aircraft': selected_aircraft,
        'govde_sayilari': govde_sayilari,
        'k_govde_sayilari': k_govde_sayilari
    })

def govde_list_ajax(request):
    ucak_adi = request.GET.get('ucak_adi')
    page_number = request.GET.get('page')  # Sayfa numarasını al
    govdeler = Govde.objects.filter(ucak_adi=ucak_adi).order_by('id')

    # Paginator ile sayfalama
    paginator = Paginator(govdeler, 7)  # Her sayfada 7 kanat göster
    page_obj = paginator.get_page(page_number)

    # Kanatları JSON formatında döndür
    govdeler_list = [{
        'ucak_adi': govde.ucak_adi,
        'id': govde.id,
        'govde_seri_numarasi': govde.govde_seri_numarasi,
        'status': govde.status,
        'uretim_tarihi': govde.uretim_tarihi
    } for govde in page_obj]

    return JsonResponse({
        'govdeler': govdeler_list,
        'num_pages': paginator.num_pages,  # Toplam sayfa sayısı
        'current_page': page_obj.number    # Geçerli sayfa numarası
    })

@csrf_exempt
def govde_sil_ajax(request):

    ucak_adi = request.POST.get('ucak_adi')
    if request.method == 'POST':
        govde_id = request.POST.get('govde_id')
        try:
            govde = Govde.objects.get(id=govde_id)
            govde.delete()
            # Her uçak için kaç gövde üretildiğini hesapla
            govde_sayilari = {
                'TB2': Govde.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Govde.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }
            k_govde_sayilari = {
                'TB2': Govde.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Govde.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Govde.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Govde.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            return JsonResponse({'message': 'Gövde başarıyla silindi.','new_govde': govde_sayilari, 'k_govde_sayilari': k_govde_sayilari})
        except Govde.DoesNotExist:
            return JsonResponse({'message': 'Gövde bulunamadı.'}, status=404)
    return JsonResponse({'message': 'Geçersiz istek.'}, status=400)



## Kanat
@login_required
@role_required('kuyruk')
def kuyruk_page(request):
    
    # Formu işlemek için
    form = KuyrukForm(request.POST or None)
    
    if request.method == 'POST':
        # POST isteği ile form verilerini al
        if form.is_valid():
            form.save()  # Form geçerliyse veritabanına kaydet
            
            # Kanat sayıları güncelleniyor
            kuyruk_sayilari = {
                'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }

            k_kuyruk_sayilari = {
                'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            # AJAX isteği olduğunda kanat sayıları JSON olarak geri döner
            return JsonResponse({'kuyruk_sayilari': kuyruk_sayilari, 'k_kuyruk_sayilari': k_kuyruk_sayilari})

        else:
            # Form geçersizse hata mesajı döner
            return JsonResponse({'error': 'Form geçersiz.'}, status=400)

    # GET isteği ile sayfa yüklendiğinde
    selected_aircraft = request.GET.get('ucak_adi')  # Seçilen uçak adı
    # Seçilen uçağa göre kanatları filtrele
    kuyruklar = Kuyruk.objects.filter(ucak_adi=selected_aircraft) if selected_aircraft else []

    # Her uçak için kaç kanat üretildiğini hesapla
    kuyruk_sayilari = {
        'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='uygun').count(),
        'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='uygun').count(),
        'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
        'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
    }
    
    k_kuyruk_sayilari = {
                'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
        }

    # Sayfayı render et
    return render(request, 'kuyruk.html', {
        'form': form,
        'kuyruklar': kuyruklar,
        'selected_aircraft': selected_aircraft,
        'kuyruk_sayilari': kuyruk_sayilari,
        'k_kuyruk_sayilari': k_kuyruk_sayilari
    })

def kuyruk_list_ajax(request):
    ucak_adi = request.GET.get('ucak_adi')
    page_number = request.GET.get('page')  # Sayfa numarasını al
    kuyruklar = Kuyruk.objects.filter(ucak_adi=ucak_adi).order_by('id')

    # Paginator ile sayfalama
    paginator = Paginator(kuyruklar, 7)  # Her sayfada 7 kanat göster
    page_obj = paginator.get_page(page_number)

    # Kanatları JSON formatında döndür
    kuyruklar_list = [{
        'ucak_adi': kuyruk.ucak_adi,
        'id': kuyruk.id,
        'kuyruk_seri_numarasi': kuyruk.kuyruk_seri_numarasi,
        'status': kuyruk.status,
        'uretim_tarihi': kuyruk.uretim_tarihi
    } for kuyruk in page_obj]

    return JsonResponse({
        'kuyruklar': kuyruklar_list,
        'num_pages': paginator.num_pages,  # Toplam sayfa sayısı
        'current_page': page_obj.number    # Geçerli sayfa numarası
    })

@csrf_exempt
def kuyruk_sil_ajax(request):
    ucak_adi = request.POST.get('ucak_adi')
    
    if request.method == 'POST':
        kuyruk_id = request.POST.get('kuyruk_id')
        try:
            kuyruk = Kuyruk.objects.get(id=kuyruk_id)
            kuyruk.delete()
            # Her uçak için kaç kanat üretildiğini hesapla
            kuyruk_sayilari = {
                'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }

            k_kuyruk_sayilari = {
                'TB2': Kuyruk.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Kuyruk.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Kuyruk.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Kuyruk.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            return JsonResponse({'message': 'Kuyruk başarıyla silindi.','new_kuyruk': kuyruk_sayilari, 'k_kuyruk_sayilari': k_kuyruk_sayilari})
        except Kuyruk.DoesNotExist:
            return JsonResponse({'message': 'Kuyruk bulunamadı.'}, status=404)
    return JsonResponse({'message': 'Geçersiz istek.'}, status=400)


## Aviyonik
@login_required
@role_required('aviyonik')
def aviyonik_page(request):
    
    # Formu işlemek için
    form = AviyonikForm(request.POST or None)
    
    if request.method == 'POST':
        # POST isteği ile form verilerini al
        if form.is_valid():
            form.save()  # Form geçerliyse veritabanına kaydet
            
            # Aviyonik sayıları güncelleniyor
            aviyonik_sayilari = {
                'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }
            k_aviyonik_sayilari = {
                'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            
            # AJAX isteği olduğunda kanat sayıları JSON olarak geri döner
            return JsonResponse({'aviyonik_sayilari': aviyonik_sayilari, 'k_aviyonik_sayilari': k_aviyonik_sayilari})

        else:
            # Form geçersizse hata mesajı döner
            return JsonResponse({'error': 'Form geçersiz.'}, status=400)

    # GET isteği ile sayfa yüklendiğinde
    selected_aircraft = request.GET.get('ucak_adi')  # Seçilen uçak adı
    # Seçilen uçağa göre kanatları filtrele
    aviyonikler = Aviyonik.objects.filter(ucak_adi=selected_aircraft) if selected_aircraft else []

    # Her uçak için kaç kanat üretildiğini hesapla
    aviyonik_sayilari = {
        'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='uygun').count(),
        'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='uygun').count(),
        'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
        'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
    }
    k_aviyonik_sayilari = {
                'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }

    # Sayfayı render et
    return render(request, 'aviyonik.html', {
        'form': form,
        'aviyonikler': aviyonikler,
        'selected_aircraft': selected_aircraft,
        'aviyonik_sayilari': aviyonik_sayilari,
        'k_aviyonik_sayilari': k_aviyonik_sayilari
    })

def aviyonik_list_ajax(request):
    ucak_adi = request.GET.get('ucak_adi')
    page_number = request.GET.get('page')  # Sayfa numarasını al
    aviyonikler = Aviyonik.objects.filter(ucak_adi=ucak_adi).order_by('id')

    # Paginator ile sayfalama
    paginator = Paginator(aviyonikler, 7)  # Her sayfada 7 kanat göster
    page_obj = paginator.get_page(page_number)

    # Kanatları JSON formatında döndür
    aviyonikler_list = [{
        'ucak_adi': aviyonik.ucak_adi,
        'id': aviyonik.id,
        'aviyonik_seri_numarasi': aviyonik.aviyonik_seri_numarasi,
        'status': aviyonik.status,
        'uretim_tarihi': aviyonik.uretim_tarihi
    } for aviyonik in page_obj]

    return JsonResponse({
        'aviyonikler': aviyonikler_list,
        'num_pages': paginator.num_pages,  # Toplam sayfa sayısı
        'current_page': page_obj.number    # Geçerli sayfa numarası
    })

@csrf_exempt
def aviyonik_sil_ajax(request):
    ucak_adi = request.POST.get('ucak_adi')
    
    if request.method == 'POST':
        aviyonik_id = request.POST.get('aviyonik_id')
        try:
            aviyonik = Aviyonik.objects.get(id=aviyonik_id)
            aviyonik.delete()
            # Her uçak için kaç kanat üretildiğini hesapla
            aviyonik_sayilari = {
                'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='uygun').count(),
                'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='uygun').count(),
                'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='uygun').count(),
                'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='uygun').count(),
            }
            k_aviyonik_sayilari = {
                'TB2': Aviyonik.objects.filter(ucak_adi='TB2', status='kullanimda').count(),
                'TB3': Aviyonik.objects.filter(ucak_adi='TB3', status='kullanimda').count(),
                'Akıncı': Aviyonik.objects.filter(ucak_adi='Akıncı', status='kullanimda').count(),
                'Kızılelma': Aviyonik.objects.filter(ucak_adi='Kızılelma', status='kullanimda').count(),
            }
            
            return JsonResponse({'message': 'Aviyonik başarıyla silindi.','new_aviyonik': aviyonik_sayilari, 'k_aviyonik_sayilari': k_aviyonik_sayilari})
        except Aviyonik.DoesNotExist:
            return JsonResponse({'message': 'Aviyonik bulunamadı.'}, status=404)
    return JsonResponse({'message': 'Geçersiz istek.'}, status=400)


## Montaj
def montaj_view(request):
    # Montaj sayfasını getirir
    return render(request, 'montaj.html')

def get_ucak_parts(request):
    # Belirtilen uçak adı için uygun parça bilgilerini alır

    ucak_adi = request.GET.get('ucak_adi') # istemciden uçak adını al

    # uygun parça bilgileri
    govde = Govde.objects.filter(ucak_adi=ucak_adi, status='uygun').order_by('-uretim_tarihi').first()
    kanat = Kanat.objects.filter(ucak_adi=ucak_adi, status='uygun').order_by('-uretim_tarihi').first()
    kuyruk = Kuyruk.objects.filter(ucak_adi=ucak_adi, status='uygun').order_by('-uretim_tarihi').first()
    aviyonik = Aviyonik.objects.filter(ucak_adi=ucak_adi, status='uygun').order_by('-uretim_tarihi').first()

    # uygun parça sayısı
    govde_count = Govde.objects.filter(ucak_adi=ucak_adi, status='uygun').count()
    kanat_count = Kanat.objects.filter(ucak_adi=ucak_adi, status='uygun').count()
    kuyruk_count = Kuyruk.objects.filter(ucak_adi=ucak_adi, status='uygun').count()
    aviyonik_count = Aviyonik.objects.filter(ucak_adi=ucak_adi, status='uygun').count()

    # Sonuçları JSON formatında döndür
    data = {
        'ucak_adi': ucak_adi,
        'govde': govde.govde_seri_numarasi if govde else 'Yok',
        'kanat': kanat.kanat_seri_numarasi if kanat else 'Yok',
        'kuyruk': kuyruk.kuyruk_seri_numarasi if kuyruk else 'Yok',
        'aviyonik': aviyonik.aviyonik_seri_numarasi if aviyonik else 'Yok',
        'govde_count': govde_count,
        'kanat_count': kanat_count,
        'kuyruk_count': kuyruk_count,
        'aviyonik_count': aviyonik_count,
    }
    return JsonResponse(data) # JSON verisini döndür

def get_ucak(request):
    # Belirtilen uçak adı için uçak bilgilerini alır
    
    ucak_adi = request.GET.get('ucak_adi')
    ucaklar = Ucak.objects.filter(ucak_adi=ucak_adi).order_by('id')

    # Kanatları JSON formatında döndür
    ucaklar_list = [{
        'ucak_adi': ucak.ucak_adi,
        'ucak_seri_numarasi': ucak.seri_numarasi,
        'govde_seri_numarasi': ucak.govde_serial,
        'kanat_seri_numarasi': ucak.kanat_serial,
        'kuyruk_seri_numarasi': ucak.kuyruk_serial,
        'aviyonik_seri_numarasi': ucak.aviyonik_serial,
        'uretim_tarihi': ucak.uretim_tarihi
    }for ucak in ucaklar]

    return JsonResponse({
        'ucaklar': ucaklar_list,
    })

def create_ucak(request):
    # Yeni bir uçak oluşturmak için gerekli işlevsellik burada yer alacak
    
    if request.method == 'POST':
        ucak_adi = request.POST.get('ucak_adi')
        govde_serial = request.POST.get('govde_serial')
        kanat_serial = request.POST.get('kanat_serial')
        kuyruk_serial = request.POST.get('kuyruk_serial')
        aviyonik_serial = request.POST.get('aviyonik_serial')

        # Mevcut en yüksek seri numarasını bul
        last_ucak = Ucak.objects.filter(ucak_adi=ucak_adi).aggregate(Max('seri_numarasi'))
        last_seri = last_ucak['seri_numarasi__max']

        # Yeni seri numarasını oluştur (örneğin TB2_001)
        if last_seri:
            next_num = int(last_seri.split('_')[-1]) + 1
        else:
            next_num = 1

        yeni_seri_numarasi = f"{ucak_adi}_{next_num:03}"

        # Yeni kayıt oluşturma işlemi
        new_ucak = Ucak(
            ucak_adi=ucak_adi,
            seri_numarasi=yeni_seri_numarasi,
            govde_serial=govde_serial,
            kanat_serial=kanat_serial,
            kuyruk_serial=kuyruk_serial,
            aviyonik_serial=aviyonik_serial
        )
        new_ucak.save()

        # İlgili parçaların statusunu güncelleme
        Govde.objects.filter(govde_seri_numarasi=govde_serial).update(status='kullanimda')
        Kanat.objects.filter(kanat_seri_numarasi=kanat_serial).update(status='kullanimda')
        Kuyruk.objects.filter(kuyruk_seri_numarasi=kuyruk_serial).update(status='kullanimda')
        Aviyonik.objects.filter(aviyonik_seri_numarasi=aviyonik_serial).update(status='kullanimda')

        return JsonResponse({'message': 'Üretim başarıyla gerçekleştirildi.'})