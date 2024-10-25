from django.http import HttpResponseForbidden
from django.shortcuts import redirect


# Kullanıcı rolüne göre sınırlama getirdik.
# Bu sınırlamaya istinaden kullanıcı başka bir sayfaya girmeye çalışırsa 403.html sayfasına yönlendiriliyor.

def role_required(role):
    def decorator(func):
        def wrapped(request, *args, **kwargs):
            # Kullanıcının rolünü kontrol edin
            if not request.user.is_authenticated or request.user.role != role:
                # Yetki yoksa 403 sayfasına yönlendirin
                return redirect('403')  # '403' URL adını kendi URL'ye göre güncelleyin
            return func(request, *args, **kwargs)
        return wrapped
    return decorator