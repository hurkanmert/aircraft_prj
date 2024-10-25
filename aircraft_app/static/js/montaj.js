function loadParts(ucakAdi) {
    $.ajax({
        url: get_ucak_parts,  // URL'yi Django URL yapına göre ayarlayın
        data: {
            'ucak_adi': ucakAdi
        },
        success: function (response) {
            // Uçak adını ve parçaların seri numaralarını tabloya yerleştir
            $('#ucak-adi').text(response.ucak_adi);
            $('#govde-serial').text(response.govde);
            $('#kanat-serial').text(response.kanat);
            $('#kuyruk-serial').text(response.kuyruk);
            $('#aviyonik-serial').text(response.aviyonik);

            $('#govde-stock').text(response.govde_count);
            $('#kanat-stock').text(response.kanat_count);
            $('#kuyruk-stock').text(response.kuyruk_count);
            $('#aviyonik-stock').text(response.aviyonik_count);

            // Tabloyu görünür hale getir
            $('#parca-tablosu').show();



            // Eğer status "kullanimda" ise butonu devre dışı bırak
            if (response.govde_count === 0 || response.kanat_count === 0 || response.kuyruk_count === 0 || response.aviyonik_count === 0) {

                document.getElementById('uretimButon').disabled = true;

                let eksikParcalar = [];

                // Hangi parçanın eksik olduğunu kontrol edin ve diziye ekleyin
                if (response.govde_count === 0) eksikParcalar.push("Gövde");
                if (response.kanat_count === 0) eksikParcalar.push("Kanat");
                if (response.kuyruk_count === 0) eksikParcalar.push("Kuyruk");
                if (response.aviyonik_count === 0) eksikParcalar.push("Aviyonik");


                document.getElementById('modalEksikParcalar').innerText = eksikParcalar.join(", ");



                $('#myModal').modal('show');

                // Modal açıldığında buton tıklama olayını tanımlayın
                $('#myModal').on('shown.bs.modal', function () {
                    $('#modalOnay').off('click').on('click', function () { // Eski olay dinleyicilerini kaldır ve yeni bir tane ekle
                        console.log("Modal onaylandı.");
                        $('#myModal').modal('hide'); // Modal'ı kapat
                    });
                });
            }
            else {
                document.getElementById('uretimButon').disabled = false;
            }

        },
        error: function () {
            alert('Parçalar yüklenirken bir hata oluştu.');
        }
    });

    $.ajax({
        url: get_ucak,  // AJAX ile verileri alacağımız URL
        data: {
            'ucak_adi': ucakAdi,  // Seçilen uçak adı
        },
        dataType: 'json',
        success: function (data) {
            // Tabloyu temizle
            $('#ucakListesi tbody').empty();

            // Kanatları tabloya ekle
            $.each(data.ucaklar, function (index, ucak) {
                $('#ucakListesi tbody').append(
                    '<tr>' +
                    '<td>' + ucak.ucak_adi + '</td>' +
                    '<td>' + ucak.ucak_seri_numarasi + '</td>' +
                    '<td>' + ucak.govde_seri_numarasi + '</td>' +
                    '<td>' + ucak.kanat_seri_numarasi + '</td>' +
                    '<td>' + ucak.kuyruk_seri_numarasi + '</td>' +
                    '<td>' + ucak.aviyonik_seri_numarasi + '</td>' +
                    '<td>' + ucak.uretim_tarihi + '</td>' +
                    '</tr>'

                );

            });
            // Tabloyu görünür hale getir
            $('#ucak-tablosu').show();

        }
    });
}

$(document).ready(function () {
    $('#montajForm').submit(function (event) {
        event.preventDefault(); // Formun normal gönderimini engelle
        // Seri numaralarını ve stok sayısını al
        var govdeSerial = $('#govde-serial').text();
        var kanatSerial = $('#kanat-serial').text();
        var kuyrukSerial = $('#kuyruk-serial').text();
        var aviyonikSerial = $('#aviyonik-serial').text();
        var ucakadi = $('#ucak-adi').text();

        var count_govde = $('#govde-stock').text();
        var count_kanat = $('#kanat-stock').text();
        var count_kuyruk = $('#kuyruk-stock').text();
        var count_aviyonik = $('#aviyonik-stock').text();

        if (count_govde === "0" || count_kanat === "0" || count_kuyruk === "0" || count_aviyonik === "0"){
            $('#myModal').modal('show');

                // Modal açıldığında buton tıklama olayını tanımlayın
                $('#myModal').on('shown.bs.modal', function () {
                    $('#modalOnay').off('click').on('click', function () { // Eski olay dinleyicilerini kaldır ve yeni bir tane ekle
                        console.log("Modal onaylandı.");
                        $('#myModal').modal('hide'); // Modal'ı kapat
                    });
                });
        }
        else{
            $.ajax({
                url: create_ucak,
                type: 'POST',
                data: {
                    'ucak_adi': ucakadi,
                    'govde_serial': govdeSerial,
                    'kanat_serial': kanatSerial,
                    'kuyruk_serial': kuyrukSerial,
                    'aviyonik_serial': aviyonikSerial,
                    'csrfmiddlewaretoken': csrf_token
                },
                success: function (response) {
    
                    $('#myModal2').modal('show'); // Modal'ı göster
    
                    // Modal açıldığında buton tıklama olayını tanımlayın
                    $('#myModal2').on('shown.bs.modal', function () {
                        $('#modalOnay').off('click').on('click', function () { // Eski olay dinleyicilerini kaldır ve yeni bir tane ekle
                            console.log("Modal onaylandı.");
                            $('#myModal2').modal('hide'); // Modal'ı kapat
                        });
                    });
    
                    // Tüm alanları temizle ve tablonun görünümünü sıfırla
                    loadParts(ucakadi);
                },
                error: function (xhr, status, error) {
                    alert('Üretim sırasında bir hata oluştu: ' + error);
                }
            });
        }



    });
});