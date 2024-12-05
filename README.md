# Dashboard Customer Behavior
This Repositories include syntax of R to make dashboard using ShinnyApp. 


## 📖 : Deskripsi Dashboard
Dashboard ini dirancang secara interaktif untuk mendukung proses analisis data dengan fitur-fitur yang intuitif dan informatif. Pengguna dapat memilih dataset bawaan atau dapat mengunggah dataset sendiri.

## 🖥️ : Deskripsi Dataset
### Konteks:
Dataset Perilaku Konsumen dan Kebiasaan Belanja memberikan wawasan yang komprehensif tentang preferensi, kecenderungan, dan pola konsumen selama pengalaman belanja mereka. Dataset ini mencakup beragam variabel, termasuk informasi demografis, riwayat pembelian, preferensi produk, frekuensi belanja, dan perilaku belanja online/luring. Dengan kumpulan data yang kaya ini, analis dan peneliti dapat mempelajari seluk-beluk proses pengambilan keputusan konsumen, membantu bisnis dalam menyusun strategi pemasaran yang ditargetkan, mengoptimalkan penawaran produk, dan meningkatkan kepuasan pelanggan secara keseluruhan.

### Isi
Dataset Perilaku Konsumen dan Kebiasaan Belanja memberikan gambaran umum terperinci tentang preferensi konsumen dan perilaku pembelian. Ini mencakup informasi demografis, riwayat pembelian, preferensi produk, dan saluran belanja pilihan (online atau offline). Dataset ini sangat penting bagi bisnis yang ingin menyesuaikan strategi mereka untuk memenuhi kebutuhan pelanggan dan meningkatkan pengalaman berbelanja mereka, yang pada akhirnya mendorong penjualan dan loyalitas.

### Daftar Istilah Dataset (berdasarkan kolom)
ID Pelanggan: Pengenal unik yang diberikan kepada setiap pelanggan, yang memfasilitasi pelacakan dan analisis perilaku belanja mereka dari waktu ke waktu.

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
  
## 📊 : Regresi Linear dan Random Forest
## 1. Regresi Linear
Regresi linear adalah teknik statistik yang digunakan untuk memodelkan hubungan antara satu atau lebih variabel independen (prediktor) dengan variabel dependen (target). Hubungan ini diasumsikan bersifat linear. Jenis Regresi Linear terbagi menjadi 2 yaitu Regresi Linear Sederhana yang	melibatkan satu variabel independen dan Regresi Linear Berganda yang melibatkan lebih dari satu variabel independen.
### Asumsi Regresi Linear
1.	Hubungan antara variabel independen dan dependen bersifat linear.
2.	Residual (galat) terdistribusi normal.
3.	Variansi residual konstan (homoskedastisitas).
4.	Tidak ada multikolinearitas antara variabel independen.
#### Contoh Penggunaan
1. Memprediksi harga rumah berdasarkan luas tanah, jumlah kamar, dan lokasi.
2. Menentukan hubungan antara konsumsi kalori dan berat badan.
 
## 2. Random Forest
Random Forest adalah algoritma pembelajaran mesin berbasis ensemble yang menggabungkan banyak pohon keputusan (decision trees) untuk meningkatkan akurasi dan mengurangi overfitting. ### Algoritma ini dapat digunakan untuk regresi dan klasifikasi.
Cara Kerja Random Forest
1.	Bagging (Bootstrap Aggregating):
Membuat beberapa subset data dari dataset pelatihan menggunakan sampling dengan pengembalian (bootstrapping).
2.	Membangun Decision Trees:
Setiap subset data digunakan untuk melatih satu pohon keputusan. Pada setiap split, hanya subset fitur yang dipilih secara acak digunakan untuk membagi data.
3.	Prediksi:
Regresi: Prediksi akhir adalah rata-rata dari prediksi semua pohon.
Klasifikasi: Prediksi akhir adalah hasil voting mayoritas dari semua pohon.
### Contoh Penggunaan1
1. Memprediksi harga saham berdasarkan data historis.
2. Mengklasifikasikan penyakit berdasarkan data kesehatan pasien.



## 💻 : Dashboard
Berikut link dashboard :
[Dashboard kelompok kami]

## 🐖 : Developers
- Monica Rahmah Fauziah (G1501231057)
- Siti Hafsah           (G1501231060)
- Fajar Athallah Yusuf  (G1501231038)
