<p align="center">
  <img width="1000" height="400" src="Data/images.png">
</p>

<div align="center">

  
# Dashboard Customer Behavior
[Deskripsi Dashboard](#scroll-deskripsi-dashboard)
•
[Dataset](#blue_book-dataset)
•
[Metode](#bar_chart-metode)
•
[Dokumentasi](#bookmark_tabs-dokumentasi)
•
[Dashboard](#computer-dashboard)
•
[Developers](#rabbit-developers)
•

</div>


## :scroll: Deskripsi Dashboard 
Dashboard ini dirancang secara interaktif untuk mendukung proses analisis data dengan fitur-fitur yang intuitif dan informatif. Dashboard ini bertujuan untuk menganalisis perilaku pelanggan dengan menggunakan data interaktif yang mencakup berbagai dimensi seperti kategori produk, metode pembayaran, lokasi, usia, hingga pola pengeluaran. Melalui dashboard interaktif, pengguna dapat mengeksplorasi data secara mendalam untuk mendapatkan wawasan tentang:

1. Preferensi Pelanggan: Produk atau kategori yang paling banyak diminati berdasarkan volume penjualan dan nilai pengeluaran.
2. Metode Pembayaran Terpopuler: Mengetahui metode pembayaran yang sering digunakan untuk mempermudah perencanaan sistem pembayaran yang lebih efisien.
3. Distribusi Pelanggan: Melihat segmentasi pelanggan berdasarkan demografi seperti usia, lokasi, dan pola belanja.
4. Rating dan Ulasan: Menilai bagaimana pengalaman pelanggan terhadap produk tertentu melalui analisis ulasan dan rating.
5. Frekuensi Pembelian dan Pengiriman: Mengidentifikasi kebiasaan pembelian pelanggan dan preferensi pengiriman untuk optimalisasi rantai pasok.

Dengan proyek ini, kami membantu pemilik bisnis dan pengambil keputusan untuk memahami perilaku pelanggan secara mendalam, sehingga mereka dapat:
- Menyusun strategi pemasaran yang lebih terarah.
- Mengoptimalkan pengalaman pelanggan.
- Meningkatkan loyalitas pelanggan dengan pendekatan yang lebih personal.
Dashboard ini menggunakan pendekatan berbasis data dan visualisasi interaktif untuk memudahkan eksplorasi serta pengambilan keputusan strategis berbasis fakta.

## :blue_book: Dataset
#### Konteks:
Dataset Perilaku Konsumen dan Kebiasaan Belanja memberikan wawasan yang komprehensif tentang preferensi, kecenderungan, dan pola konsumen selama pengalaman belanja mereka. Dataset ini mencakup beragam variabel, termasuk informasi demografis, riwayat pembelian, preferensi produk, frekuensi belanja, dan perilaku belanja online/luring. Dengan kumpulan data yang kaya ini, analis dan peneliti dapat mempelajari seluk-beluk proses pengambilan keputusan konsumen, membantu bisnis dalam menyusun strategi pemasaran yang ditargetkan, mengoptimalkan penawaran produk, dan meningkatkan kepuasan pelanggan secara keseluruhan.

#### Isi
Dataset Perilaku Konsumen dan Kebiasaan Belanja memberikan gambaran umum terperinci tentang preferensi konsumen dan perilaku pembelian. Ini mencakup informasi demografis, riwayat pembelian, preferensi produk, dan saluran belanja pilihan (online atau offline). Dataset ini sangat penting bagi bisnis yang ingin menyesuaikan strategi mereka untuk memenuhi kebutuhan pelanggan dan meningkatkan pengalaman berbelanja mereka, yang pada akhirnya mendorong penjualan dan loyalitas.

#### Daftar Istilah Dataset (berdasarkan kolom)
- ID Pelanggan: Pengenal unik yang diberikan kepada setiap pelanggan, yang memfasilitasi pelacakan dan analisis perilaku belanja mereka dari waktu ke waktu.
- Usia: Usia pelanggan, memberikan informasi demografis untuk segmentasi dan strategi pemasaran yang ditargetkan.
- Jenis Kelamin: Identifikasi jenis kelamin pelanggan, variabel demografis utama yang memengaruhi preferensi produk dan pola pembelian.
- Barang yang Dibeli: Produk atau item spesifik yang dipilih oleh pelanggan selama transaksi.
- Kategori: Klasifikasi atau kelompok yang luas dari barang yang dibeli (misalnya, pakaian, elektronik, bahan makanan).
- Jumlah Pembelian (USD): Nilai moneter dari transaksi, yang dinyatakan dalam Dolar Amerika Serikat (USD), yang menunjukkan harga barang yang dibeli.
- Lokasi: Lokasi geografis tempat pembelian dilakukan, yang memberikan wawasan tentang preferensi regional dan tren pasar.
- Ukuran: Spesifikasi ukuran (jika ada) dari barang yang dibeli, yang relevan untuk pakaian, alas kaki, dan barang konsumen tertentu.
- Warna: Varian atau pilihan warna yang terkait dengan barang yang dibeli, yang memengaruhi preferensi pelanggan dan ketersediaan produk.
- Musim: Relevansi musiman dari barang yang dibeli (misalnya, musim semi, musim panas, musim gugur, musim dingin), yang berdampak pada manajemen inventaris dan strategi pemasaran.
- Peringkat Ulasan: Penilaian numerik atau kualitatif yang diberikan oleh pelanggan mengenai kepuasan mereka terhadap barang yang dibeli.
- Status Langganan: Menunjukkan apakah pelanggan telah memilih layanan berlangganan, menawarkan wawasan tentang tingkat kesetiaan dan potensi pendapatan berulang.
- Jenis Pengiriman: Menentukan metode yang digunakan untuk mengirimkan barang yang dibeli (misalnya, pengiriman standar, pengiriman ekspres), yang mempengaruhi waktu dan biaya pengiriman.
- Diskon yang Diterapkan: Menunjukkan apakah ada diskon promosi yang diterapkan pada pembelian, menjelaskan sensitivitas harga dan efektivitas promosi.
- Kode Promo yang Digunakan: Mencatat apakah kode promosi atau kupon digunakan selama transaksi, membantu dalam evaluasi keberhasilan kampanye pemasaran.
- Pembelian Sebelumnya: Memberikan informasi tentang jumlah atau frekuensi pembelian sebelumnya yang dilakukan oleh pelanggan, yang berkontribusi pada segmentasi pelanggan dan strategi retensi.
- Metode Pembayaran: Menentukan cara pembayaran yang digunakan oleh pelanggan (misalnya, kartu kredit, uang tunai), memberikan wawasan tentang opsi pembayaran yang disukai.
- Frekuensi Pembelian: Menunjukkan seberapa sering pelanggan terlibat dalam aktivitas pembelian, sebuah metrik penting untuk menilai loyalitas pelanggan dan nilai seumur hidup.
  
## :bar_chart: Metode
## Regresi Linear dan Random Forest
### 1. Regresi Linear
Regresi linear adalah teknik statistik yang digunakan untuk memodelkan hubungan antara satu atau lebih variabel independen (prediktor) dengan variabel dependen (target). Hubungan ini diasumsikan bersifat linear. Jenis Regresi Linear terbagi menjadi 2 yaitu Regresi Linear Sederhana yang	melibatkan satu variabel independen dan Regresi Linear Berganda yang melibatkan lebih dari satu variabel independen.
#### Asumsi Regresi Linear
1.	Hubungan antara variabel independen dan dependen bersifat linear.
2.	Residual (galat) terdistribusi normal.
3.	Variansi residual konstan (homoskedastisitas).
4.	Tidak ada multikolinearitas antara variabel independen.
#### Contoh Penggunaan
1. Memprediksi harga rumah berdasarkan luas tanah, jumlah kamar, dan lokasi.
2. Menentukan hubungan antara konsumsi kalori dan berat badan.
 
### 2. Random Forest
Random Forest adalah algoritma pembelajaran mesin berbasis ensemble yang menggabungkan banyak pohon keputusan (decision trees) untuk meningkatkan akurasi dan mengurangi overfitting. #### Algoritma ini dapat digunakan untuk regresi dan klasifikasi.
Cara Kerja Random Forest
1.	Bagging (Bootstrap Aggregating):
Membuat beberapa subset data dari dataset pelatihan menggunakan sampling dengan pengembalian (bootstrapping).
2.	Membangun Decision Trees:
Setiap subset data digunakan untuk melatih satu pohon keputusan. Pada setiap split, hanya subset fitur yang dipilih secara acak digunakan untuk membagi data.
3.	Prediksi:
Regresi: Prediksi akhir adalah rata-rata dari prediksi semua pohon.
Klasifikasi: Prediksi akhir adalah hasil voting mayoritas dari semua pohon.
#### Contoh Penggunaan1
1. Memprediksi harga saham berdasarkan data historis.
2. Mengklasifikasikan penyakit berdasarkan data kesehatan pasien.

## :bookmark_tabs: Dokumentasi
Penjelasan singkat untuk masing-masing library yang digunakan

1.	library(shiny) adalah library untuk membangun aplikasi web interaktif menggunakan R. Memungkinkan pembuatan dashboard atau aplikasi yang interaktif dengan antarmuka pengguna berbasis web.
2.	library(rpart) adalah library untuk membangun pohon keputusan (decision trees) untuk masalah regresi atau klasifikasi.
3.	library(shinydashboard) adalah paket yang memungkinkan pembuatan dashboard interaktif di dalam aplikasi shiny, dengan layout dan komponen seperti tab, sidebar, dan panel.
4.	library(ggplot2) adalah library untuk visualisasi data yang menggunakan sistem grammar of graphics. Memudahkan pembuatan grafik yang kompleks dengan sintaksis yang jelas.
5.	library(dplyr) adalah library untuk manipulasi data. Mempermudah pengolahan data dalam bentuk tabel atau data frame dengan operasi seperti filtering, grouping, dan summarizing.
6.	library(plotly) adalah library untuk membuat visualisasi interaktif, termasuk grafik 3D dan peta. Bisa digunakan dalam aplikasi shiny untuk menambah interaktivitas.
7.	library(DT) adalah library untuk menampilkan tabel interaktif di R, menggunakan paket DataTables dari JavaScript. Dapat digunakan untuk menampilkan data dengan fitur pencarian dan pengurutan.
8.	library(leaflet) adalah library untuk membuat peta interaktif. Dapat digunakan untuk menampilkan data geografis atau peta dinamis dalam aplikasi web.
9.	library(highcharter) adalah library untuk visualisasi data interaktif menggunakan Highcharts. Memungkinkan pembuatan grafik canggih dengan banyak opsi interaktivitas.
10.	library(caret) adalah library untuk memfasilitasi proses pelatihan dan evaluasi model pembelajaran mesin (machine learning).
11.	library(randomForest) adalah library untuk membangun model pembelajaran mesin berbasis ensemble menggunakan banyak pohon keputusan (decision trees) dalam Random Forest.



## :computer: Dashboard
Berikut link dashboard :
[[Dashboard kelompok kami]](https://fajarathallah.shinyapps.io/Dashboard/)

## :rabbit: Developers
- Monica Rahmah Fauziah (G1501231057)
- Siti Hafsah           (G1501231060)
- Fajar Athallah Yusuf  (G1501231038)
