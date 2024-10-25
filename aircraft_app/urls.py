from django.urls import path
from . import views

urlpatterns = [
    path('', views.user_login, name='login'),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'), 
    path('kanat/', views.kanat_page, name='kanat_page'),
    path('govde/', views.govde_page, name='govde_page'),
    path('aviyonik/', views.aviyonik_page, name='aviyonik_page'),
    path('kuyruk/', views.kuyruk_page, name='kuyruk_page'),
    path('montaj/', views.montaj_page, name='montaj_page'),

    # AJAX isteği ile kanat listesini çeken URL
    path('kanat-list-ajax/', views.kanat_list_ajax, name='kanat_list_ajax'),
    path('kanat-sil-ajax/', views.kanat_sil_ajax, name='kanat_sil_ajax'),  # Yeni silme işlemi URL'i

    # AJAX isteği ile gövde listesini çeken URL
    path('govde-list-ajax/', views.govde_list_ajax, name='govde_list_ajax'),
    path('govde-sil-ajax/', views.govde_sil_ajax, name='govde_sil_ajax'),  # Yeni silme işlemi URL'i

    # AJAX isteği ile kuyruk listesini çeken URL
    path('kuyruk-list-ajax/', views.kuyruk_list_ajax, name='kuyruk_list_ajax'),
    path('kuyruk-sil-ajax/', views.kuyruk_sil_ajax, name='kuyruk_sil_ajax'),  # Yeni silme işlemi URL'i

    # AJAX isteği ile aviyonik listesini çeken URL
    path('aviyonik-list-ajax/', views.aviyonik_list_ajax, name='aviyonik_list_ajax'),
    path('aviyonik-sil-ajax/', views.aviyonik_sil_ajax, name='aviyonik_sil_ajax'),  # Yeni silme işlemi URL'i

    path('montaj/', views.montaj_view, name='montaj_view'),
    path('get_ucak_parts/', views.get_ucak_parts, name='get_ucak_parts'),
    path('create_ucak/', views.create_ucak, name='create_ucak'),
    path('get_ucak/', views.get_ucak, name='get_ucak'),

    path('403/', views.forbidden, name='403'),  # 403 sayfası için URL tanımı


]
