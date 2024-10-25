<h2>Uçak Montaj Yönetim Sistemi</h2>
<p>
Bu proje, uçak montajı sürecini yönetmek için geliştirilmiş bir web uygulamasıdır. Kullanıcılar, çeşitli uçak parçalarını yönetebilir, üretim sürecini takip edebilir ve montaj işlemlerini gerçekleştirebilir.
</p>

<h3>Kullanılan Teknolojiler</h3>
<ul>
    <li><strong>Python</strong>: Sunucu tarafı programlama dili.</li>
    <li><strong>Django</strong>: Web uygulaması framework'ü.</li>
    <li><strong>Django REST Framework</strong>: RESTful API geliştirmek için kullanıldı.</li>
    <li><strong>PostgreSQL</strong>: Veritabanı yönetim sistemi.</li>
    <li><strong>HTML/CSS/JavaScript</strong>: Ön yüz geliştirme için kullanıldı.</li>
    <li><strong>Bootstrap</strong>: Responsive tasarım için kullanılmaktadır.</li>
</ul>

<h2>Çalışma Prensibi</h2>
<ol>
    <li>
        <strong>Kullanıcı Yönetimi:</strong>
        <p>Kullanıcılar, rollere göre (Kanat, Gövde, Aviyonik, Kuyruk, Montaj) tanımlanır. Kullanıcı giriş işlemleri, yetkilendirme ile korunmaktadır.</p>
        <p>Sayfalar arası erişime izin verilmemektedir. Her kullanıcının bir rolü vardır ve sadece kendi sayfasına giriş yapabilir. Başka sayfalara giriş yapmak istersen 403 sayfasına yönlendirilip
        5 saniye sonrasında tekrar kendi sayfasına gönderilmektedir. </p>
    </li>
    <li>
        <strong>Uçak Parçaları Yönetimi:</strong>
        <p>Uçak parçaları (kanatlar, gövde, kuyruk, aviyonik) veritabanında saklanır. Her parça için üretim tarihi, seri numarası ve durum bilgileri bulunmaktadır.</p>
        <p>Seri numaraları mevcut parçanın veritabanında son sırada bulunan parçanın seri numarasının + 1 hali olarak devam etmektedir. </p>
        <p>Durum bilgileri (status) parçanın kullanıma uygun ya da kullanımda olduğunu belirtmektedir.</p>
        <p>Parça üretim sayfalarında uçak seçimi ile birlikte bu durum listelenmektedir. Eğer kullanımda yani bu parça kullanılarak bir uçak üretildiyse bu parçayı geri dönüşüme gönderemez.</p>
        <p>Parça sayıları aktif olarak sistemde gözükmektedir. Bir parçanın sayısı 3'ün altına düştüğü zaman Sarı renk ile uyarılmaktadır.2'nin altına düşerse kırmızı renk ile uyarı vermektedir.</p>
        <p>Uçak seçimi ile birlikte parça üretildiği zaman aynı sayfada bulunan listeleme kısmında eklediği parçanın sayfasına gitmektedir.</p>
    </li>
    <li>
        <strong>Montaj Süreci:</strong>
        <p>Uçak seçimi yapıldıktan sonra, uygun parçaların durumu kontrol edilir. Montaj işlemi, seçilen parçaların kombinasyonu ile gerçekleştirilir ve sonuç veritabanına kaydedilir.</p>
        <p>Bu işlemler kontrollü bir şekilde yapılmaktadır. Eğer üretilmek istenilen uçağın parçalarının da eksik var ise sistem uyarı verir ve Üret butonunu disable yapar.</p>
        <p>Üretilen uçak sonrasında üretimde kullanılan parçaların tablolarında "status":'kullanimda' olarak güncellenir ve artık sistemden silinemez.</p>
        <p>Uçak seçim sayfasının altında aynı anda seçilen uçağa dair üretim bilgileride verilmiştir. Üretim sonrası aktif olarak gözükmektedir. Kullanılmış parçaların seri numaraları ve uçağın üretim tarihi verilmektedir.</p>
    </li>
    <li>
        <strong>AJAX Kullanımı:</strong>
        <p>Parça sayıları ve montaj bilgileri sayfa yenilenmeden güncellenir. Kullanıcı deneyimini artırmak için asenkron veri işlemleri gerçekleştirilir.</p>
    </li>
</ol>

<h2>Projeyi Çalıştırma</h2>
<ol>
    <li><strong>Gerekli Kütüphaneleri Kurma:</strong>
        <pre><code>pip install -r requirements.txt</code></pre>
    </li>
    <li><strong>Veritabanı Ayarları:</strong>
        <p>PostgreSQL veritabanı ayarlarını <code>settings.py</code> dosyasında güncelleyin.</p>
        <p>Veritabanını oluşturun ve gerekli tabloları oluşturmak için migrations işlemini gerçekleştirin:</p>
        <pre><code>python manage.py migrate</code></pre>
    </li>
    <li><strong>Sunucuyu Başlatma:</strong>
        <pre><code>python manage.py runserver</code></pre>
    </li>
    <li><strong>Uygulamaya Erişim:</strong>
        <p>Tarayıcınızda <code>http://localhost:8000/</code> adresine giderek uygulamayı kullanabilirsiniz.</p>
    </li>
</ol>