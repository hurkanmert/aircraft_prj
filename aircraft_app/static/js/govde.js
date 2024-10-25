$(document).ready(function () {

    // Gövde üretim başlangıç kısmı
    // AJAX kullanılarak üretim işlemi yapıldıktan sonra total sayıların güncellenmesi ve
    // listeleme kısmında mevcut uçağın son sayfasının gelmesi sağlanmıştır
    // Eklenen güncel veri gözükmektedir. 
    $('#govdeForm').on('submit', function (event) {
        var ucakAdi = $('#ucak_adi').val(); // seçilen uçağı adı çekildi. 
        console.log(ucakAdi);
        event.preventDefault();
        $.ajax({
            url: '',
            type: 'POST',
            data: $(this).serialize(),
            cache: false,
            success: function (response) {
                // Gövde sayılarının güncellenmesi
                $('#tb2-govde-sayisi').text("TB2: " + response.govde_sayilari.TB2 + " Gövde");
                $('#tb3-govde-sayisi').text("TB3: " + response.govde_sayilari.TB3 + " Gövde");
                $('#akinci-govde-sayisi').text("Akıncı: " + response.govde_sayilari.Akıncı + " Gövde");
                $('#kizilelma-govde-sayisi').text("Kızılelma: " + response.govde_sayilari.Kızılelma + " Gövde");

                $('#tb2-k-govde-sayisi').text("TB2: " + response.k_govde_sayilari.TB2 + " Gövde");
                $('#tb3-k-govde-sayisi').text("TB3: " + response.k_govde_sayilari.TB3 + " Gövde");
                $('#akinci-k-govde-sayisi').text("Akıncı: " + response.k_govde_sayilari.Akıncı + " Gövde");
                $('#kizilelma-k-govde-sayisi').text("Kızılelma: " + response.k_govde_sayilari.Kızılelma + " Gövde");

                $('#tb2-govde-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.govde_sayilari.TB2 < 2 ? 'list-group-item-danger' : (response.govde_sayilari.TB2 < 3 ? 'list-group-item-warning' : ''));
                $('#tb3-govde-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.govde_sayilari.TB3 < 2 ? 'list-group-item-danger' : (response.govde_sayilari.TB3 < 3 ? 'list-group-item-warning' : ''));
                $('#akinci-govde-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.govde_sayilari.Akıncı < 2 ? 'list-group-item-danger' : (response.govde_sayilari.Akıncı < 3 ? 'list-group-item-warning' : ''));
                $('#kizilelma-govde-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.govde_sayilari.Kızılelma < 2 ? 'list-group-item-danger' : (response.govde_sayilari.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                // Güncelleme ve ekleme işleminden sonra listeleme sayfasında mevcut uçağın kısmı gelmektedir.
                loadGovde(-1, ucakAdi);
            },
            async: "false",
            error: function (response) {
                alert('Bir hata oluştu.');
            }
        });
    });
    // Gövde üretim bitiş kısmı


    // Listeleme ve Silme işlemleri başlangıç
    function loadGovde(page_number, ucakAdi) {

        if (ucakAdi !== "") {
            // AJAX isteği yap
            $.ajax({
                url: govdeListUrl,  // AJAX ile verileri alacağımız URL
                data: {
                    'ucak_adi': ucakAdi,  // Seçilen uçak adı
                    'page': page_number
                },
                dataType: 'json',
                success: function (data) {
                    // Tabloyu temizle
                    $('#govdeListesi tbody').empty();

                    // Gövdeleri tabloya ekle
                    $.each(data.govdeler, function (index, govde) {
                        $('#govdeListesi tbody').append(
                            '<tr>' +
                            '<td>' + govde.ucak_adi + '</td>' +
                            '<td>' + govde.govde_seri_numarasi + '</td>' +
                            '<td>' + govde.uretim_tarihi + '</td>' +
                            '<td>' + govde.status + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger geri-donusum" data-govde-id="' + govde.id + '" id="geri-donusum-' + govde.id + '">' +
                            'Geri Dönüşüm</button>' +
                            '</td>' +
                            '</tr>'
                        );

                        // Eğer status "kullanimda" ise butonu devre dışı bırak
                        if (govde.status === 'kullanimda') {
                            $('#geri-donusum-' + govde.id).prop('disabled', true);
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
                        loadGovde(selected_page, ucakAdi);  // Seçilen sayfayı yükle
                        console.log("aa");
                    });

                    // Geri Dönüşüm butonuna tıklama işlemi
                    $('.geri-donusum').click(function () {
                        var govdeId = $(this).data('govde-id');  // Silinecek gövdenin ID'sini al

                        if (confirm("Bu kanadı silmek istediğinize emin misiniz?")) {
                            $.ajax({
                                url: govdeSilUrl,  // Silme işlemi için URL
                                type: 'POST',
                                data: {
                                    'govde_id': govdeId,
                                    'ucak_adi': ucakAdi,
                                    'csrfmiddlewaretoken': '{{ csrf_token }}'  // CSRF token
                                },
                                success: function (response) {
                                    // Silme işlemi başarılıysa tabloyu yeniden yükle
                                    $('#tb2-govde-sayisi').text("TB2: " + response.new_govde.TB2 + " Gövde");
                                    $('#tb3-govde-sayisi').text("TB3: " + response.new_govde.TB3 + " Gövde");
                                    $('#akinci-govde-sayisi').text("Akıncı: " + response.new_govde.Akıncı + " Gövde");
                                    $('#kizilelma-govde-sayisi').text("Kızılelma: " + response.new_govde.Kızılelma + " Gövde");

                                    $('#tb2-k-govde-sayisi').text("TB2: " + response.k_govde_sayilari.TB2 + " Gövde");
                                    $('#tb3-k-govde-sayisi').text("TB3: " + response.k_govde_sayilari.TB3 + " Gövde");
                                    $('#akinci-k-govde-sayisi').text("Akıncı: " + response.k_govde_sayilari.Akıncı + " Gövde");
                                    $('#kizilelma-k-govde-sayisi').text("Kızılelma: " + response.k_govde_sayilari.Kızılelma + " Gövde");

                                    $('#tb2-govde-sayisi').addClass(response.new_govde.TB2 < 2 ? 'list-group-item-danger' : (response.new_govde.TB2 < 3 ? 'list-group-item-warning' : ''));
                                    $('#tb3-govde-sayisi').addClass(response.new_govde.TB3 < 2 ? 'list-group-item-danger' : (response.new_govde.TB3 < 3 ? 'list-group-item-warning' : ''));
                                    $('#akinci-govde-sayisi').addClass(response.new_govde.Akıncı < 2 ? 'list-group-item-danger' : (response.new_govde.Akıncı < 3 ? 'list-group-item-warning' : ''));
                                    $('#kizilelma-govde-sayisi').addClass(response.new_govde.Kızılelma < 2 ? 'list-group-item-danger' : (response.new_govde.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                                    loadGovde(data.current_page, ucakAdi);

                                },
                                error: function (xhr, status, error) {
                                    alert("Silme işlemi sırasında bir hata oluştu.");
                                }
                            });
                        }
                    });
                }
            });
        }
        else {
            // Eğer uçak seçilmediyse tabloyu boşalt
            $('#govdeListesi tbody').empty();
        }
    }

    // Uçak seçildiğinde gövdeleri yükle
    $('.card').click(function () {
        var ucakAdi = $(this).data('ucak');
        loadGovde(1, ucakAdi);  // İlk sayfayı yükle
    });

    // Listeleme ve silme işlemleri bitiş
});