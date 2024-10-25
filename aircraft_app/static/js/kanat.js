$(document).ready(function () {

    // Kanat üretim başlangıç kısmı
    // AJAX kullanılarak üretim işlemi yapıldıktan sonra total sayıların güncellenmesi ve
    // listeleme kısmında mevcut uçağın son sayfasının gelmesi sağlanmıştır
    // Eklenen güncel veri gözükmektedir. 
    $('#kanatForm').on('submit', function (event) {
        var ucakAdi = $('#ucak_adi').val(); // seçilen uçağı adı çekildi. 
        console.log(ucakAdi);
        event.preventDefault();
        $.ajax({
            url: '',
            type: 'POST',
            data: $(this).serialize(),
            cache: false,
            success: function (response) {
                // Kanat sayılarının güncellenmesi
                $('#tb2-kanat-sayisi').text("TB2: " + response.kanat_sayilari.TB2 + " Kanat");
                $('#tb3-kanat-sayisi').text("TB3: " + response.kanat_sayilari.TB3 + " Kanat");
                $('#akinci-kanat-sayisi').text("Akıncı: " + response.kanat_sayilari.Akıncı + " Kanat");
                $('#kizilelma-kanat-sayisi').text("Kızılelma: " + response.kanat_sayilari.Kızılelma + " Kanat");

                $('#tb2-k-kanat-sayisi').text("TB2: " + response.k_kanat_sayilari.TB2 + " Kanat");
                $('#tb3-k-kanat-sayisi').text("TB3: " + response.k_kanat_sayilari.TB3 + " Kanat");
                $('#akinci-k-kanat-sayisi').text("Akıncı: " + response.k_kanat_sayilari.Akıncı + " Kanat");
                $('#kizilelma-k-kanat-sayisi').text("Kızılelma: " + response.k_kanat_sayilari.Kızılelma + " Kanat");

                $('#tb2-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kanat_sayilari.TB2 < 2 ? 'list-group-item-danger' : (response.kanat_sayilari.TB2 < 3 ? 'list-group-item-warning' : ''));
                $('#tb3-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kanat_sayilari.TB3 < 2 ? 'list-group-item-danger' : (response.kanat_sayilari.TB3 < 3 ? 'list-group-item-warning' : ''));
                $('#akinci-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kanat_sayilari.Akıncı < 2 ? 'list-group-item-danger' : (response.kanat_sayilari.Akıncı < 3 ? 'list-group-item-warning' : ''));
                $('#kizilelma-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kanat_sayilari.Kızılelma < 2 ? 'list-group-item-danger' : (response.kanat_sayilari.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                // Güncelleme ve ekleme işleminden sonra listeleme sayfasında mevcut uçağın kısmı gelmektedir.
                loadKanatlar(-1, ucakAdi);
            },
            async: "false",
            error: function (response) {
                alert('Bir hata oluştu.');
            }
        });
    });
    // Kanat üretim bitiş kısmı


    // Listeleme ve Silme işlemleri başlangıç
    function loadKanatlar(page_number, ucakAdi) {

        if (ucakAdi !== "") {
            // AJAX isteği yap
            $.ajax({
                url: kanatListAjaxUrl,  // AJAX ile verileri alacağımız URL
                data: {
                    'ucak_adi': ucakAdi,  // Seçilen uçak adı
                    'page': page_number
                },
                dataType: 'json',
                success: function (data) {
                    // Tabloyu temizle
                    $('#kanatListesi tbody').empty();

                    // Kanatları tabloya ekle
                    $.each(data.kanatlar, function (index, kanat) {
                        $('#kanatListesi tbody').append(
                            '<tr>' +
                            '<td>' + kanat.ucak_adi + '</td>' +
                            '<td>' + kanat.kanat_seri_numarasi + '</td>' +
                            '<td>' + kanat.uretim_tarihi + '</td>' +
                            '<td>' + kanat.status + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger geri-donusum" data-kanat-id="' + kanat.id + '" data-kanat-status="' + kanat.status + '" id="geri-donusum-' + kanat.id + '">' +
                            'Geri Dönüşüm</button>' +
                            '</td>' +
                            '</tr>'
                            

                        );

                        // Eğer status "kullanimda" ise butonu devre dışı bırak
                        if (kanat.status === 'kullanimda') {
                            $('#geri-donusum-' + kanat.id).prop('disabled', true);
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
                        loadKanatlar(selected_page, ucakAdi);  // Seçilen sayfayı yükle
                    });

                    // Geri Dönüşüm butonuna tıklama işlemi
                    $('.geri-donusum').click(function () {
                        var kanatId = $(this).data('kanat-id');  // Silinecek kanatın ID'sini al
                        var kanatStatus = $(this).data('kanat-status');

                        if ( kanatStatus === 'kullanimda'){
                            alert("Yaptığınız işlem doğru değil lütfen bir daha denemeyin !");
                        }
                        else{
                            if (confirm("Bu kanadı silmek istediğinize emin misiniz?")) {
                                $.ajax({
                                    url: kanatSilAjaxUrl,  // Silme işlemi için URL
                                    type: 'POST',
                                    data: {
                                        'kanat_id': kanatId,
                                        'ucak_adi': ucakAdi,
                                        'csrfmiddlewaretoken': '{{ csrf_token }}'  // CSRF token
                                    },
                                    success: function (response) {
                                        // Silme işlemi başarılıysa tabloyu yeniden yükle
                                        $('#tb2-kanat-sayisi').text("TB2: " + response.new_kanat.TB2 + " Kanat");
                                        $('#tb3-kanat-sayisi').text("TB3: " + response.new_kanat.TB3 + " Kanat");
                                        $('#akinci-kanat-sayisi').text("Akıncı: " + response.new_kanat.Akıncı + " Kanat");
                                        $('#kizilelma-kanat-sayisi').text("Kızılelma: " + response.new_kanat.Kızılelma + " Kanat");
    
                                        $('#tb2-k-kanat-sayisi').text("TB2: " + response.k_kanat_sayilari.TB2 + " Kanat");
                                        $('#tb3-k-kanat-sayisi').text("TB3: " + response.k_kanat_sayilari.TB3 + " Kanat");
                                        $('#akinci-k-kanat-sayisi').text("Akıncı: " + response.k_kanat_sayilari.Akıncı + " Kanat");
                                        $('#kizilelma-k-kanat-sayisi').text("Kızılelma: " + response.k_kanat_sayilari.Kızılelma + " Kanat");
    
                                        $('#tb2-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kanat.TB2 < 2 ? 'list-group-item-danger' : (response.new_kanat.TB2 < 3 ? 'list-group-item-warning' : ''));
                                        $('#tb3-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kanat.TB3 < 2 ? 'list-group-item-danger' : (response.new_kanat.TB3 < 3 ? 'list-group-item-warning' : ''));
                                        $('#akinci-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kanat.Akıncı < 2 ? 'list-group-item-danger' : (response.new_kanat.Akıncı < 3 ? 'list-group-item-warning' : ''));
                                        $('#kizilelma-kanat-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kanat.Kızılelma < 2 ? 'list-group-item-danger' : (response.new_kanat.Kızılelma < 3 ? 'list-group-item-warning' : ''));
                        
                                        loadKanatlar(data.current_page, ucakAdi);
    
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
            $('#kanatListesi tbody').empty();
        }
    }

    // Uçak seçildiğinde kanatları yükle
    $('.card').click(function () {
        var ucakAdi = $(this).data('ucak');
        loadKanatlar(1, ucakAdi);  // İlk sayfayı yükle
    });

    // Listeleme ve silme işlemleri bitiş
});