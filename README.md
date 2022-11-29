# Depok Smart City
> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia pada Semester Gasal, Tahun Ajaran 2022/2023.

## Pengembang
### Kelompok F04
1.  Bagas Shalahuddin Wahid - 2106708904
2.  Maureen Esther Wijaya - 2106705335
3.  Muhammad Abizar Rachmanda - 2106751133
4.  Muhammad Arief Braja Putra - 2106702352
5.  Muhammad Rizqy Ramadan - 2106632182

## Deskripsi Aplikasi
### Nama Aplikasi
Depok Smart City

### Fungsi Aplikasi
Platform Depok Smart City merupakan platform yang bermanfaat sebagai kanal digital Kota Depok. Hal ini bertujuan untuk meningkatkan produktivitas penduduk kota depok dan memudahkan gaya hidup masyarakat dengan digitalisasi. Aplikasi ini merupakan aplikasi mobile yang diadaptasi dari aplikasi web Depok Smart City. Latar belakang pembuatan aplikasi ini adalah pengimplementasian dari tujuan Konferensi G20 mengenai digitalisasi dan inovasi. Fitur-fitur yang terdapat pada aplikasi ini adalah fitur kependudukan, aspirasi, kesehatan, restoran, dan perpustakaan. Fitur kependudukan berguna untuk melihat layanan pembuatan KTP yang tersedia dan membuat jadwal pembuatan KTP. Kemudian, fitur aspirasi memberikan pengguna untuk melihat aspirasi yang diberikan pengguna lain dan memberikan aspirasi sendiri. Selanjutnya, fitur kesehatan merupakan fitur untuk pengguna melihat list layanan kesehatan di Kota Depok dan membuat jadwal konsultasi dokter umum. Berikutnya, fitur restoran berguna untuk pengguna melihat list restoran yang ada pada Kota Depok dan memberikan ulasan serta rating pada restoran. Terakhir, fitur perpustakaan merupkan perpustakaan daring di mana pengguna dapat membaca artikel mengenai keperpustakaan dan melihat buku yang tersedia pada perpustakaan. Selain itu, fitur ini juga dapat dimanfaatkan pengguna untuk meminjam, mengembalikan, dan memberikan ulasan terhadap suatu buku. 

### Peran Pengguna Aplikasi
**1. Admin**
- CRUD layanan pembuatan KTP
- CRUD aspirasi masyarakat
- CRUD restoran 
- CRUD layanan kesehatan
- CRUD buku (perpustakaan)

**2. User yang tidak login**

- Melihat halaman homepage
- Melihat list layanan pembuatan KTP yang tersedia
- Melihat aspirasi masyarakat
- Melihat list restoran di Kota Depok dan ratingnya
- Melihat list layanan kesehatan di Kota Depok yang tersedia
- Melihat list buku-buku yang tersedia di perpustakaan daring
- Membaca artikel yang terkait keperpustakaan
- Membuat akun (register) dan login

**3. User yang sudah login**
- Melihat halaman homepage
- Melihat list layanan pembuatan KTP yang tersedia
- Melihat aspirasi masyarakat
- Melihat list restoran di Kota Depok dan ratingnya
- Melihat list layanan kesehatan di Kota Depok yang tersedia
- Melihat list buku-buku yang tersedia di perpustakaan daring
- Membaca artikel yang terkait keperpustakaan
- Membuat jadwal pembuatan KTP
- Membuat jadwal pembuatan konsultasi kesehatan
- Membuat review terhadap suatu restoran
- Memberikan aspirasi, kritik, saran, dan rekomendasi kepada Kota Depok
- Meminjam buku pada perpustakaan daring dan memberikan ulasan terhadap buku yang dipinjam.

## Modul Aplikasi
1. Homepage dan Autentikasi - Kelompok F04

2. Modul Kependudukan - Maureen Esther Wijaya

    Pengguna dapat melihat tempat pembuatan KTP dan membuat jadwal pembuatan KTP.
    
3. Modul Aspirasi - Muhammad Arief Braja Putra

    Pengguna dapat melihat aspirasi-aspirasi penduduk lain dan menyampaikan aspirasinya
    
4. Modul Kesehatan - Bagas Shalahuddin Wahid

    Pengguna dapat melihat list layanan-layanan kesehatan yang tersedia dan membuat jadwal konsultasi dokter umum pada pilihan layanan kesehatan
    
5. Modul Restoran - Muhammad Abizar Rachmanda

    Pengguna dapat melihat list restoran dan tempat makan di Depok serta ratingnya. Kemudian pengguna juga dapat memberikan review
    
6. Modul Perpustakaan - Muhammad Rizqy Ramadhan

    Pengguna dapat melihat buku-buku yang tersedia di perpustakaan daring, meminjam buku tersebut, dan memberikan ulasan setelah peminjaman buku.

## Alur Integrasi
Integrasi dengan _web service_ yang telah dibuat sebelumnya dengan langkah sebagai berikut.
1. Pembuatan model sesuai modul yang diimplementasikan dan menyesuaikan response data dari _web service_.
2. Pengambilan data dari _endpoint_ memanfaatkan JSON pada _web service_ yang telah di-_deploy_ dalam Railway.
3. Menampilkan data tersebut pada aplikasi melalui FutureBuilder dengan memanfaatkan HTTP GET.
4. Menampilkan data pada setiap halaman.

