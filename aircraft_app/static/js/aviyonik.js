$(document).ready(function () {

    // Aviyonik üretim başlangıç kısmı
    // AJAX kullanılarak üretim işlemi yapıldıktan sonra total sayıların güncellenmesi ve
    // listeleme kısmında mevcut uçağın son sayfasının gelmesi sağlanmıştır
    // Eklenen güncel veri gözükmektedir. 
    $('#aviyonikForm').on('submit', function (event) {
        var ucakAdi = $('#ucak_adi').val(); // seçilen uçağı adı çekildi. 
        event.preventDefault(); // form gönderimi engellendi
        $.ajax({
            url: '',
            type: 'POST', // post ile veri gönderildi
            data: $(this).serialize(), // form verileri serileştiriliyor
            cache: false, // önbelleğe alma devre dışı bırakıldı
            success: function (response) {
                // kullanıma uygun aviyonik sayılarının güncellenmesi
                $('#tb2-aviyonik-sayisi').text("TB2: " + response.aviyonik_sayilari.TB2 + " Aviyonik");
                $('#tb3-aviyonik-sayisi').text("TB3: " + response.aviyonik_sayilari.TB3 + " Aviyonik");
                $('#akinci-aviyonik-sayisi').text("Akıncı: " + response.aviyonik_sayilari.Akıncı + " Aviyonik");
                $('#kizilelma-aviyonik-sayisi').text("Kızılelma: " + response.aviyonik_sayilari.Kızılelma + " Aviyonik");

                // kullanıma uygun olmayan aviyonik sayılarının güncellenmesi
                $('#tb2-k-aviyonik-sayisi').text("TB2: " + response.k_aviyonik_sayilari.TB2 + " Aviyonik");
                $('#tb3-k-aviyonik-sayisi').text("TB3: " + response.k_aviyonik_sayilari.TB3 + " Aviyonik");
                $('#akinci-k-aviyonik-sayisi').text("Akıncı: " + response.k_aviyonik_sayilari.Akıncı + " Aviyonik");
                $('#kizilelma-k-aviyonik-sayisi').text("Kızılelma: " + response.k_aviyonik_sayilari.Kızılelma + " Aviyonik");

                // uygun aviyoniklerin sayılarına göre background rengi değiştiriliyor.
                // bu sayede uyarı verilmiş oluyor
                $('#tb2-aviyonik-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.aviyonik_sayilari.TB2 < 2 ? 'list-group-item-danger' : (response.aviyonik_sayilari.TB2 < 3 ? 'list-group-item-warning' : ''));
                $('#tb3-aviyonik-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.aviyonik_sayilari.TB3 < 2 ? 'list-group-item-danger' : (response.aviyonik_sayilari.TB3 < 3 ? 'list-group-item-warning' : ''));
                $('#akinci-aviyonik-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.aviyonik_sayilari.Akıncı < 2 ? 'list-group-item-danger' : (response.aviyonik_sayilari.Akıncı < 3 ? 'list-group-item-warning' : ''));
                $('#kizilelma-aviyonik-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.aviyonik_sayilari.Kızılelma < 2 ? 'list-group-item-danger' : (response.aviyonik_sayilari.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                // Güncelleme ve ekleme işleminden sonra listeleme sayfasında mevcut uçağın kısmı gelmektedir.
                loadAviyonikler(-1, ucakAdi); // mevcut uçağın aviyoniklerini yüklemek için fonksiyon çağrılıyor
            },
            async: "false", // senkronize olarak çalıştır
            error: function (response) {
                alert('Bir hata oluştu.');
            }
        });
    });
    // aviyonik üretim bitiş kısmı


    // Listeleme ve Silme işlemleri başlangıç
    function loadAviyonikler(page_number, ucakAdi) {

        if (ucakAdi !== "") {
            // AJAX isteği yap
            $.ajax({
                url: aviyonikListAjaxUrl,  // AJAX ile verileri alacağımız URL
                data: {
                    'ucak_adi': ucakAdi,  // Seçilen uçak adı
                    'page': page_number
                },
                dataType: 'json',
                success: function (data) {
                    // Tabloyu temizle
                    $('#aviyonikListesi tbody').empty();
                    // aviyonikleri tabloya ekle
                    $.each(data.aviyonikler, function (index, aviyonik) {
                        $('#aviyonikListesi tbody').append(
                            '<tr>' +
                            '<td>' + aviyonik.ucak_adi + '</td>' +
                            '<td>' + aviyonik.aviyonik_seri_numarasi + '</td>' +
                            '<td>' + aviyonik.uretim_tarihi + '</td>' +
                            '<td>' + aviyonik.status + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger geri-donusum" data-aviyonik-id="' + aviyonik.id + '" data-aviyonik-status="' + aviyonik.status + '" id="geri-donusum-' + aviyonik.id + '">' +
                            'Geri Dönüşüm</button>' +
                            '</td>' +
                            '</tr>'
                        );

                        // Eğer status "kullanimda" ise butonu devre dışı bırak
                        if (aviyonik.status === 'kullanimda') {
                            $('#geri-donusum-' + aviyonik.id).prop('disabled', true);
                        }
                    });

                    // Sayfalama düğmelerini temizle
                    $('#pagination').empty();

                    // Sayfalama düğmelerini oluştur
                    for (var i = 1; i <= data.num_pages; i++) {
                        $('#pagination').append(
                            '<button class="page-link" data-page="' + i + '">' + i + '</button>'
                        );
                    }

                    // Geçerli sayfayı işaretle
                    $('.page-link[data-page="' + data.current_page + '"]').addClass('active');

                    // Sayfa düğmelerine tıklama işlemi
                    $('.page-link').click(function () {
                        var selected_page = $(this).data('page');
                        loadAviyonikler(selected_page, ucakAdi);  // Seçilen sayfayı yükle
                    });

                    // Geri Dönüşüm butonuna tıklama işlemi
                    $('.geri-donusum').click(function () {
                        var aviyonikId = $(this).data('aviyonik-id');  // Silinecek aviyoniğin ID'sini al
                        var aviyonikStatus = $(this).data('aviyonik-status');

                        if( aviyonikStatus === 'kullanimda'){
                            alert("Yaptığınız işlem doğru değil lütfen bir daha denemeyin !");
                        }
                        else{
                            if (confirm("Bu kanadı silmek istediğinize emin misiniz?")) {
                                $.ajax({
                                    url: aviyonikSilAjaxUrl,  // Silme işlemi için URL
                                    type: 'POST',
                                    data: {
                                        'aviyonik_id': aviyonikId,
                                        'ucak_adi': ucakAdi,
                                        'csrfmiddlewaretoken': '{{ csrf_token }}'  // CSRF token
                                    },
                                    success: function (response) {
                                        // Silme işlemi başarılıysa tabloyu yeniden yükle
                                        $('#tb2-aviyonik-sayisi').text("TB2: " + response.new_aviyonik.TB2 + " Aviyonik");
                                        $('#tb3-aviyonik-sayisi').text("TB3: " + response.new_aviyonik.TB3 + " Aviyonik");
                                        $('#akinci-aviyonik-sayisi').text("Akıncı: " + response.new_aviyonik.Akıncı + " Aviyonik");
                                        $('#kizilelma-aviyonik-sayisi').text("Kızılelma: " + response.new_aviyonik.Kızılelma + " Aviyonik");
    
                                        $('#tb2-k-aviyonik-sayisi').text("TB2: " + response.k_aviyonik_sayilari.TB2 + " Aviyonik");
                                        $('#tb3-k-aviyonik-sayisi').text("TB3: " + response.k_aviyonik_sayilari.TB3 + " Aviyonik");
                                        $('#akinci-k-aviyonik-sayisi').text("Akıncı: " + response.k_aviyonik_sayilari.Akıncı + " Aviyonik");
                                        $('#kizilelma-k-aviyonik-sayisi').text("Kızılelma: " + response.k_aviyonik_sayilari.Kızılelma + " Aviyonik");
    
                                        $('#tb2-aviyonik-sayisi').addClass(response.new_aviyonik.TB2 < 2 ? 'list-group-item-danger' : (response.new_aviyonik.TB2 < 3 ? 'list-group-item-warning' : ''));
                                        $('#tb3-aviyonik-sayisi').addClass(response.new_aviyonik.TB3 < 2 ? 'list-group-item-danger' : (response.new_aviyonik.TB3 < 3 ? 'list-group-item-warning' : ''));
                                        $('#akinci-aviyonik-sayisi').addClass(response.new_aviyonik.AkıncıAkıncı < 2 ? 'list-group-item-danger' : (response.new_aviyonik.TB2 < 3 ? 'list-group-item-warning' : ''));
                                        $('#kizilelma-aviyonik-sayisi').addClass(response.new_aviyonik.Kızılelma < 2 ? 'list-group-item-danger' : (response.new_aviyonik.Kızılelma < 3 ? 'list-group-item-warning' : ''));
                        
                                        loadAviyonikler(data.current_page, ucakAdi);
    
                                    },
                                    error: function (xhr, status, error) {
                                        alert("Silme işlemi sırasında bir hata oluştu.");
                                    }
                                });
                            }
                        }


                    });
                }
            });
        }
        else {
            // Eğer uçak seçilmediyse tabloyu boşalt
            $('#aviyonikListesi tbody').empty();
        }
    }

    // Uçak seçildiğinde aviyonikleri yükle
    $('.card').click(function () {
        var ucakAdi = $(this).data('ucak');
        loadAviyonikler(1, ucakAdi);  // her zaman ilk sayfayı yükle
    });

    // Listeleme ve silme işlemleri bitiş
});