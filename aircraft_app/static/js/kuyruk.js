$(document).ready(function () {

    // Kanat üretim başlangıç kısmı
    // AJAX kullanılarak üretim işlemi yapıldıktan sonra total sayıların güncellenmesi ve
    // listeleme kısmında mevcut uçağın son sayfasının gelmesi sağlanmıştır
    // Eklenen güncel veri gözükmektedir. 
    $('#kuyrukForm').on('submit', function (event) {
        var ucakAdi = $('#ucak_adi').val(); // seçilen uçağı adı çekildi. 
        event.preventDefault();
        $.ajax({
            url: '',
            type: 'POST',
            data: $(this).serialize(),
            cache: false,
            success: function (response) {
                // Kanat sayılarının güncellenmesi
                $('#tb2-kuyruk-sayisi').text("TB2: " + response.kuyruk_sayilari.TB2 + " Kuyruk");
                $('#tb3-kuyruk-sayisi').text("TB3: " + response.kuyruk_sayilari.TB3 + " Kuyruk");
                $('#akinci-kuyruk-sayisi').text("Akıncı: " + response.kuyruk_sayilari.Akıncı + " Kuyruk");
                $('#kizilelma-kuyruk-sayisi').text("Kızılelma: " + response.kuyruk_sayilari.Kızılelma + " Kuyruk");

                $('#tb2-k-kuyruk-sayisi').text("TB2: " + response.k_kuyruk_sayilari.TB2 + " Kuyruk");
                $('#tb3-k-kuyruk-sayisi').text("TB3: " + response.k_kuyruk_sayilari.TB3 + " Kuyruk");
                $('#akinci-k-kuyruk-sayisi').text("Akıncı: " + response.k_kuyruk_sayilari.Akıncı + " Kuyruk");
                $('#kizilelma-k-kuyruk-sayisi').text("Kızılelma: " + response.k_kuyruk_sayilari.Kızılelma + " Kuyruk");

                $('#tb2-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kuyruk_sayilari.TB2 < 2 ? 'list-group-item-danger' : (response.kuyruk_sayilari.TB2 < 3 ? 'list-group-item-warning' : ''));
                $('#tb3-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kuyruk_sayilari.TB3 < 2 ? 'list-group-item-danger' : (response.kuyruk_sayilari.TB3 < 3 ? 'list-group-item-warning' : ''));
                $('#akinci-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kuyruk_sayilari.Akıncı < 2 ? 'list-group-item-danger' : (response.kuyruk_sayilari.Akıncı < 3 ? 'list-group-item-warning' : ''));
                $('#kizilelma-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.kuyruk_sayilari.Kızılelma < 2 ? 'list-group-item-warning' : (response.kuyruk_sayilari.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                // Güncelleme ve ekleme işleminden sonra listeleme sayfasında mevcut uçağın kısmı gelmektedir.
                loadKuyruklar(-1, ucakAdi);
            },
            async: "false",
            error: function (response) {
                alert('Bir hata oluştu.');
            }
        });
    });
    // Kanat üretim bitiş kısmı


    // Listeleme ve Silme işlemleri başlangıç
    function loadKuyruklar(page_number, ucakAdi) {

        if (ucakAdi !== "") {
            // AJAX isteği yap
            $.ajax({
                url: kuyrukListAjaxUrl,  // AJAX ile verileri alacağımız URL
                data: {
                    'ucak_adi': ucakAdi,  // Seçilen uçak adı
                    'page': page_number
                },
                dataType: 'json',
                success: function (data) {
                    // Tabloyu temizle
                    $('#kuyrukListesi tbody').empty();

                    // Kanatları tabloya ekle
                    $.each(data.kuyruklar, function (index, kuyruk) {
                        $('#kuyrukListesi tbody').append(
                            '<tr>' +
                            '<td>' + kuyruk.ucak_adi + '</td>' +
                            '<td>' + kuyruk.kuyruk_seri_numarasi + '</td>' +
                            '<td>' + kuyruk.uretim_tarihi + '</td>' +
                            '<td>' + kuyruk.status + '</td>' +
                            '<td>' +
                            '<button class="btn btn-danger geri-donusum" data-kuyruk-id="' + kuyruk.id + '" data-kuyruk-status="' + kuyruk.status + '" id="geri-donusum-' + kuyruk.id + '">' +
                            'Geri Dönüşüm</button>' +
                            '</td>' +
                            '</tr>'


                        );

                        // Eğer status "kullanimda" ise butonu devre dışı bırak
                        if (kuyruk.status === 'kullanimda') {
                            $('#geri-donusum-' + kuyruk.id).prop('disabled', true);
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
                        loadKuyruklar(selected_page, ucakAdi);  // Seçilen sayfayı yükle
                        console.log("aa");
                    });

                    // Geri Dönüşüm butonuna tıklama işlemi
                    $('.geri-donusum').click(function () {
                        var kuyrukId = $(this).data('kuyruk-id');  // Silinecek kanatın ID'sini al
                        var kuyrukStatus = $(this).data('kuyruk-status');

                        if (kuyrukStatus === 'kullanimda') {
                            alert("Yaptığınız işlem doğru değil lütfen bir daha denemeyin !");
                        }
                        else {
                            $('#deleteConfirmationModal').modal('show');
                            // Modal kontrol
                            $('#deleteConfirmationModal').on('shown.bs.modal', function () {

                                $('#closeModal').off('click').on('click', function () {
                                    $('#deleteConfirmationModal').modal('hide'); // Modal'ı kapat
                                });

                                $('#confirmDeleteButton').off('click').on('click', function () {


                                    $.ajax({
                                        url: kuyrukSilAjaxUrl,  // Silme işlemi için URL
                                        type: 'POST',
                                        data: {
                                            'kuyruk_id': kuyrukId,
                                            'ucak_adi': ucakAdi,
                                            'csrfmiddlewaretoken': '{{ csrf_token }}'  // CSRF token
                                        },
                                        success: function (response) {
                                            // Silme işlemi başarılıysa tabloyu yeniden yükle
                                            $('#tb2-kuyruk-sayisi').text("TB2: " + response.new_kuyruk.TB2 + " Kuyruk");
                                            $('#tb3-kuyruk-sayisi').text("TB3: " + response.new_kuyruk.TB3 + " Kuyruk");
                                            $('#akinci-kuyruk-sayisi').text("Akıncı: " + response.new_kuyruk.Akıncı + " Kuyruk");
                                            $('#kizilelma-kuyruk-sayisi').text("Kızılelma: " + response.new_kuyruk.Kızılelma + " Kuyruk");

                                            $('#tb2-k-kuyruk-sayisi').text("TB2: " + response.k_kuyruk_sayilari.TB2 + " Kuyruk");
                                            $('#tb3-k-kuyruk-sayisi').text("TB3: " + response.k_kuyruk_sayilari.TB3 + " Kuyruk");
                                            $('#akinci-k-kuyruk-sayisi').text("Akıncı: " + response.k_kuyruk_sayilari.Akıncı + " Kuyruk");
                                            $('#kizilelma-k-kuyruk-sayisi').text("Kızılelma: " + response.k_kuyruk_sayilari.Kızılelma + " Kuyruk");

                                            $('#tb2-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kuyruk.TB2 < 2 ? 'list-group-item-danger' : (response.new_kuyruk.TB2 < 3 ? 'list-group-item-warning' : ''));
                                            $('#tb3-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kuyruk.TB3 < 2 ? 'list-group-item-danger' : (response.new_kuyruk.TB3 < 3 ? 'list-group-item-warning' : ''));
                                            $('#akinci-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kuyruk.Akıncı < 2 ? 'list-group-item-danger' : (response.new_kuyruk.Akıncı < 3 ? 'list-group-item-warning' : ''));
                                            $('#kizilelma-kuyruk-sayisi').removeClass('list-group-item-danger list-group-item-warning').addClass(response.new_kuyruk.Kızılelma < 2 ? 'list-group-item-danger' : (response.new_kuyruk.Kızılelma < 3 ? 'list-group-item-warning' : ''));

                                            loadKuyruklar(data.current_page, ucakAdi);

                                        },
                                        error: function (xhr, status, error) {
                                            alert("Silme işlemi sırasında bir hata oluştu.");
                                        }
                                    });
                                    $('#deleteConfirmationModal').modal('hide'); // Modal'ı kapat
                                    kanatId = null;
                                });
                            });


                        }

                    });
                }
            });
        }
        else {
            // Eğer uçak seçilmediyse tabloyu boşalt
            $('#kuyrukListesi tbody').empty();
        }
    }

    // Uçak seçildiğinde kanatları yükle
    $('.card').click(function () {
        var ucakAdi = $(this).data('ucak');
        loadKuyruklar(1, ucakAdi);  // İlk sayfayı yükle
    });

    // Listeleme ve silme işlemleri bitiş
});