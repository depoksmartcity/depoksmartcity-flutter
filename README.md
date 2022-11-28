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
Platform Depok Smart City merupakan platform yang bermanfaat sebagai kanal digital Kota Depok. Hal ini bertujuan untuk meningkatkan produktivitas penduduk kota depok dan memudahkan gaya hidup masyarakat dengan digitalisasi.

### Peran Pengguna Aplikasi
**1. User yang tidak login**

- Melihat halaman homepage
- Melihat list layanan pembuatan KTP yang tersedia
- Melihat aspirasi masyarakat
- Melihat list restoran di Kota Depok dan ratingnya
- Melihat list layanan kesehatan di Kota Depok yang tersedia
- Melihat list buku-buku yang tersedia di perpustakaan daring
- Membaca artikel yang terkait keperpustakaan
- Membuat akun (register)

**2. User yang sudah login**
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
1. Modul Kependudukan - Maureen Esther Wijaya

    Pengguna dapat melihat tempat pembuatan KTP dan membuat jadwal pembuatan KTP.
    
2. Modul Aspirasi - Muhammad Arief Braja Putra

    Pengguna dapat melihat aspirasi-aspirasi penduduk lain dan menyampaikan aspirasinya
    
3. Modul Kesehatan - Bagas Shalahuddin Wahid

    Pengguna dapat melihat list layanan-layanan kesehatan yang tersedia dan membuat jadwal konsultasi dokter umum pada pilihan layanan kesehatan
    
4. Modul Restoran - Muhammad Abizar Rachmanda

    Pengguna dapat melihat list restoran dan tempat makan di Depok serta ratingnya. Kemudian pengguna juga dapat memberikan review
    
5. Modul Perpustakaan - Muhammad Rizqy Ramadhan

    Pengguna dapat melihat buku-buku yang tersedia di perpustakaan daring, meminjam buku tersebut, dan memberikan ulasan setelah peminjaman buku.

## Alur Integrasi
Integrasi dengan _web service_ yang telah dibuat sebelumnya dengan langkah sebagai berikut.
1. Pembuatan _endpoint_ autentikasi dengan memanfaatkan JSON pada _web service_
2. Pembuatan autentikasi pada aplikasi Flutter
3. Penyimpanan _cookie session_ yang telah dikirim oleh _web service_
4. Pembuatan aplikasi Flutter dengan memanfaatkan _cookie session_. Hal ini berguna untuk melakukan _request_.
