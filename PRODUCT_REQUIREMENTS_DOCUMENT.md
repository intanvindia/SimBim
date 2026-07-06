# Dokumen Persyaratan Produk (Product Requirements Document): SIMBIM

**Versi Dokumen:** 1.6.0
**Tanggal:** 6 Juli 2026
**Penulis:** Intan V.K

---

## 1. Pendahuluan

### 1.1. Tujuan
Dokumen ini merincikan persyaratan fungsional dan non-fungsional untuk **SIMBIM**, sebuah Sistem Pendukung Keputusan (SPK) berbasis web. Tujuan utama sistem ini adalah untuk membantu orang tua dalam memilih kelas bimbingan belajar (bimbel) yang paling sesuai untuk anak mereka berdasarkan asesmen minat dan bakat. Sistem menggunakan metode *Weighted Product* (WP) untuk menghasilkan rekomendasi yang objektif dan terpersonalisasi.

### 1.2. Ruang Lingkup
Aplikasi ini mencakup fungsionalitas untuk tiga jenis pengguna: **Orang Tua**, **Staf**, dan **Administrator**. Ruang lingkupnya meliputi pendaftaran pengguna, manajemen profil anak, pelaksanaan asesmen online, kalkulasi rekomendasi otomatis, visualisasi hasil, manajemen data master oleh admin, serta fitur pelaporan dan tindak lanjut oleh staf.

### 1.3. Teknologi yang Digunakan (Technology Stack)
- **Bahasa Pemrograman:** Native PHP 8.x (Digunakan sebagai *backend* utama untuk logika bisnis dan interaksi database.)
- **Database:** MySQL / MariaDB (Sistem manajemen database relasional untuk menyimpan semua data aplikasi.)
- **Frontend Framework:** Bootstrap 5.3 + Bootstrap Icons (Digunakan untuk membangun antarmuka pengguna yang responsif dan modern.)
- **Visualisasi Data:** Chart.js (Pustaka JavaScript untuk membuat grafik interaktif seperti Radar Chart dan Line Chart.)
- **Generasi PDF:** Dompdf (Pustaka PHP untuk mengonversi HTML menjadi dokumen PDF, digunakan untuk laporan dan kartu akses.)
- **Markdown Parser:** Parsedown (Pustaka PHP ringan untuk mengonversi teks Markdown menjadi HTML, digunakan untuk dokumen dinamis seperti PRD.)
- **Font Engine:** Google Fonts (Poppins) (Digunakan untuk tipografi yang konsisten dan estetis di seluruh aplikasi.)

---

## 2. Pengguna dan Peran (User Roles & Personas)

### 2.1. Orang Tua (Peran: `orang_tua`)
Pengguna utama sistem yang bertujuan mencari rekomendasi kelas bimbingan belajar yang paling sesuai untuk anak mereka.
- **Kebutuhan & Tujuan:**
    - Mendapatkan rekomendasi kelas yang objektif dan sesuai dengan potensi anak.
    - Memantau perkembangan hasil asesmen anak dari waktu ke waktu.
    - Mengelola data pribadi dan data anak dengan mudah.
- **Akses File Utama:**
    - `dashboard.php`: Halaman utama untuk melihat riwayat asesmen, grafik perkembangan, dan profil kecerdasan anak.
    - `profil_anak.php`: Melihat riwayat asesmen spesifik per anak.
    - `asesmen.php`: Mengisi kuesioner asesmen untuk anak.
    - `hasil.php`: Melihat hasil rinci rekomendasi setelah asesmen.

### 2.2. Staf (Peran: `staf`)
Bertugas sebagai garda depan yang menindaklanjuti hasil asesmen dan melakukan tugas administratif.
- **Kebutuhan & Tujuan:**
    - Memantau semua hasil asesmen yang masuk.
    - Menghubungi orang tua untuk konsultasi (fungsi Mini-CRM).
    - Melakukan tugas administratif dasar terkait akun pengguna.
- **Akses File Utama:**
    - `staff_dashboard.php`: Dasbor untuk melihat laporan asesmen, mengubah status *follow-up*, mencatat interaksi, dan mengakses utilitas data (deteksi duplikat, monitor login).
    - Dapat mereset kata sandi orang tua, mencetak kartu pendaftaran, dan mengisi asesmen atas nama orang tua.
    - Staf juga memiliki kemampuan untuk mereset kata sandi akun orang tua, mencetak kartu pendaftaran fisik, dan membantu mengisi asesmen atas nama orang tua.

### 2.3. Administrator (Peran: `admin`)
Pemilik sistem dengan hak akses penuh, bertanggung jawab atas konfigurasi inti, manajemen semua data, dan pemantauan sistem secara keseluruhan.
- **Kebutuhan & Tujuan:**
    - Mengelola semua data master (kriteria, pertanyaan, kelas bimbel).
- **Akses File Utama:**
    - `admin_dashboard.php`: Panel kontrol pusat dengan hak akses penuh untuk mengelola seluruh aspek sistem, termasuk CRUD data master (kelas, kriteria, pertanyaan), manajemen pengguna, konfigurasi parameter algoritma Weighted Product, serta pemantauan analitik sistem secara menyeluruh.

---

## 3. Persyaratan Fungsional (Functional Requirements)

### 3.1. Evolusi Fitur (v1.0 - v1.5)

#### v1.0: Fondasi Awal
- **F-1.0.1:** Implementasi dasar algoritma **Weighted Product (WP)**.
- **F-1.0.2:** Fitur kuesioner asesmen dengan input `radio button`.
- **F-1.0.3:** Manajemen data master untuk kriteria dan pertanyaan oleh Admin.
- **F-1.0.4:** Halaman hasil rekomendasi dalam bentuk tabel sederhana.

#### v1.1: Peningkatan Kinerja & UX
- **F-1.1.1:** Optimasi query kalkulasi WP menggunakan *Single Join Query*.
- **F-1.1.2:** Implementasi keamanan dasar: Hashing password (BCRYPT) dan Audit Log aktivitas admin.
- **F-1.1.3:** Peningkatan UX: *Progress Bar* pada asesmen, tombol *Show/Hide Password*.
- **F-1.1.4:** Fitur perbandingan asesmen (Line Chart) untuk orang tua.
- **F-1.1.5:** Fitur *Maintenance Mode* dan kontrol pembukaan pendaftaran oleh Admin.

#### v1.2: Peran Staf & Analitik Lanjutan
- **F-1.2.1:** Penambahan peran **Staf** dengan hak akses *read-only* pada laporan.
- **F-1.2.2:** Peningkatan UI Admin: Panel arsip (soft delete) dengan fitur *restore*.
- **F-1.2.3:** Peningkatan Dasbor Admin: 3 kartu statistik perbandingan dan grafik "Top 5 Kelas Terdaftar".
- **F-1.2.4:** Visualisasi "Profil Kecerdasan" (Progress Bar) di dasbor orang tua.
- **F-1.2.5:** Fitur ekspor rekap laporan asesmen ke format **Excel (.xls)**.
- **F-1.2.6:** Fitur pengumuman global dari admin yang tampil di dasbor orang tua.

#### v1.3: Integrasi Eksternal & Perbaikan Bug
- **F-1.3.1:** (Dihapus di v1.4) Fitur sinkronisasi hasil asesmen ke **Google Sheets** via OAuth2.
- **F-1.3.2:** Perbaikan bug kompatibilitas PHP 8.x.

#### v1.4: Refaktor Alur Inti & Profil Anak
- **F-1.4.1:** Perubahan alur asesmen: Orang tua kini mengelola daftar anak di dasbor, lalu memilih anak saat akan tes (tidak lagi input nama berulang).
- **F-1.4.2:** Halaman **Profil Anak** (`profil_anak.php`) yang menampilkan seluruh riwayat asesmen dan grafik perkembangan potensi khusus untuk anak tersebut.
- **F-1.4.3:** Grafik di dasbor orang tua menjadi spesifik per anak yang dipilih.
- **F-1.4.4:** Penghapusan fitur integrasi Google Sheets untuk stabilitas.

#### v1.5: Transformasi Peran Staf (Mini-CRM)
- **F-1.5.1:** **Manajemen Follow-Up:** Staf dapat mengubah status tindak lanjut (`Belum Dihubungi`, `Sudah Dihubungi`, `Mendaftar`) dan menambahkan catatan untuk setiap hasil asesmen.
- **F-1.5.2:** **Integrasi WhatsApp:** Tombol "Hubungi WA" untuk follow-up cepat.
- **F-1.5.3:** **Manajemen Pengguna oleh Staf:** Staf dapat mereset password orang tua dan mencetak kartu pendaftaran fisik (PDF).
- **F-1.5.4:** **Utilitas Data:** Fitur deteksi akun duplikat dan monitor aktivitas login terakhir orang tua.
- **F-1.5.5:** **Asesmen oleh Staf/Admin:** Staf/Admin dapat mengisi form asesmen atas nama orang tua.

### 3.2. Rincian Fungsionalitas Kunci (per v1.5)

#### Modul Autentikasi & Manajemen Pengguna
- **F-AUTH-1:** Pengguna (Orang Tua) dapat mendaftar (`daftar.php`) dengan nama, username, no. HP, dan password. Password di-hash menggunakan `PASSWORD_BCRYPT`.
- **F-AUTH-2:** Pengguna dapat login dan diarahkan ke dasbor sesuai peran (`admin_dashboard.php`, `staff_dashboard.php`, `dashboard.php`).
- **F-USER-1 (Admin):** CRUD penuh untuk semua akun pengguna.
- **F-USER-2 (Staf):** Dapat mereset password akun `orang_tua`.

#### Modul Asesmen & Rekomendasi
- **F-ASES-1:** Orang tua/Staf/Admin memilih anak, lalu mengisi kuesioner (`asesmen.php`) dengan jawaban skala 1-5.
- **F-ASES-2:** Jawaban disimpan ke `asesmen` dan `detail_asesmen` (`includes/proses_simpan.php`).
- **F-WP-1 (Kalkulasi):** Sistem secara otomatis menghitung rekomendasi di `hasil.php` setelah asesmen:
    - **Bobot (W):** Skor rata-rata jawaban pengguna per kriteria dinormalisasi menjadi bobot preferensi.
    - **Vektor S:** Nilai matriks `nilai_kriteria_kelas` dipangkatkan dengan bobot preferensi (W).
    - **Vektor V:** Nilai S dinormalisasi untuk mendapatkan nilai preferensi akhir.
    - **Ranking:** Alternatif (kelas) diurutkan berdasarkan nilai V tertinggi.
- **F-HASIL-1 (Tampilan):** Hasil ditampilkan di `hasil.php` dengan:
    - Tabel peringkat kelas yang direkomendasikan.
    - Visualisasi **Radar Chart** untuk pemetaan potensi kecerdasan.
    - Kesimpulan deskriptif otomatis berdasarkan skor tertinggi.

#### Modul Administrasi & Staf
- **F-ADMIN-1 (Manajemen Data):** Admin memiliki akses CRUD penuh pada: `kelas_bimbel`, `kriteria`, dan `pertanyaan`.
- **F-ADMIN-2 (Tuning Algoritma):** Admin dapat mengubah matriks `nilai_kriteria_kelas` secara massal melalui antarmuka *Grid Matrix* di dasbor.
- **F-ADMIN-3 (Analitik):** Dasbor admin menampilkan 3 grafik: tren pendaftaran, distribusi minat, dan top 5 kelas.
- **F-ADMIN-4 (Pengaturan Situs):** Admin mengontrol nama situs, logo, mode pemeliharaan, status pendaftaran, dan pengumuman global.
- **F-STAF-1 (Mini-CRM):** Staf mengelola status follow-up dan catatan untuk setiap asesmen di `staff_dashboard.php`.

#### Modul Pelaporan & Utilitas
- **F-REPORT-1 (Cetak PDF):** Semua peran dapat mencetak laporan hasil asesmen individu dalam format PDF (`cetak_pdf.php`).
- **F-REPORT-2 (Ekspor Excel):** Admin dapat mengekspor rekap laporan asesmen berdasarkan rentang tanggal (`export_excel.php`).
- **F-UTIL-1 (Backup DB):** Admin dapat mengunduh backup database dalam format `.sql` (`export_db.php`).
- **F-UTIL-2 (Audit Trail):** Sistem mencatat aktivitas penting (login, update, hapus) ke dalam tabel `logs`.
- **F-UTIL-3 (Cetak PRD):** Admin dapat mengunduh Dokumen Persyaratan Produk (PRD) ini dalam format PDF langsung dari dasbor (`cetak_prd.php`).

---

## 4. Persyaratan Non-Fungsional (Non-Functional Requirements)

- **NF-4.1 Keamanan:**
    - **Pencegahan SQL Injection:** Semua query yang melibatkan input pengguna menggunakan **Prepared Statements** (`mysqli::prepare`).
    - **Keamanan Password:** Password di-hash menggunakan `password_hash()` dengan `PASSWORD_BCRYPT` dan diverifikasi dengan `password_verify()`.
    - **Pencegahan XSS:** Output data ke HTML disanitasi menggunakan `htmlspecialchars()`.
    - **Kontrol Akses:** Akses halaman dibatasi secara ketat berdasarkan `$_SESSION['level']`.
- **NF-4.2 Kinerja:** Aplikasi harus memberikan respons dalam waktu kurang dari 3 detik untuk interaksi pengguna standar. Kalkulasi WP dieksekusi secara *real-time* setelah asesmen selesai.
- **NF-4.3 Usabilitas:** Antarmuka harus bersih, responsif (dibangun dengan Bootstrap 5), dan intuitif. Alur pengisian asesmen dilengkapi *progress bar* untuk memandu pengguna.
- **NF-4.4 Pemeliharaan:**
    - **Struktur Kode:** Kode terstruktur dengan pemisahan yang jelas antara konfigurasi (`config/`), logika pemrosesan (`includes/`), dan tampilan (file-file root).
    - **Komentar:** Kode dilengkapi komentar untuk menjelaskan bagian-bagian yang kompleks.
    - **Keamanan Rilis:** Skrip migrasi (`migrate2.php`) diinstruksikan untuk dihapus setelah digunakan.

---

## 5. Model Data (Database Schema)

Database `simbim` menjadi dasar dari seluruh operasi aplikasi. Berikut adalah deskripsi tabel-tabel utamanya (berdasarkan `database/simbim.sql` dan evolusi fitur):

- **`user`**: Menyimpan data login semua pengguna.
  - `id_user` (PK), `nama_lengkap`, `username`, `password`, `no_hp`, `level` (enum: 'admin', 'staf', 'orang_tua').

- **`anak`**: Menyimpan profil anak yang dimiliki oleh `user` (orang tua).
  - `id_anak` (PK), `id_user` (FK), `nama_anak`, `usia`.

- **`kriteria`**: Data master untuk kriteria penilaian (misal: Logika, Kreativitas).
  - `id_kriteria` (PK), `nama_kriteria`, `sifat` (Benefit/Cost), `bobot_awal`.

- **`pertanyaan`**: Data master untuk pertanyaan dalam kuesioner.
  - `id_pertanyaan` (PK), `id_kriteria` (FK), `teks_pertanyaan`, `deleted_at` (untuk soft delete).

- **`kelas_bimbel`**: Data master untuk alternatif kelas yang direkomendasikan.
  - `id_kelas` (PK), `nama_kelas`, `status_kelas` (Aktif/Coming Soon), `deleted_at`.

- **`asesmen`**: Mencatat setiap sesi asesmen yang dilakukan.
  - `id_asesmen` (PK), `id_anak` (FK), `tgl_asesmen`, `status_followup`, `catatan_followup`.

- **`detail_asesmen`**: Menyimpan jawaban untuk setiap pertanyaan dalam sebuah sesi asesmen.
  - `id_detail_asesmen` (PK), `id_asesmen` (FK), `id_pertanyaan` (FK), `nilai_input` (skor 1-5).

- **`nilai_kriteria_kelas`**: **Tabel Matriks Inti WP.** Menghubungkan setiap kelas dengan setiap kriteria.
  - `id_nilai_kelas` (PK), `id_kelas` (FK), `id_kriteria` (FK), `nilai_default` (nilai matriks 1-5).

- **`rekomendasi_hasil`**: Menyimpan log rekomendasi teratas untuk setiap asesmen.
  - `id_asesmen` (PK, FK), `id_kelas` (FK).

- **`pengaturan`**: Menyimpan konfigurasi situs dalam format key-value.
  - `nama_key` (PK), `nilai_value`.

- **`logs`**: Mencatat jejak audit (Audit Trail) aktivitas pengguna.
  - `id_log` (PK), `id_user` (FK), `aktivitas`, `waktu`.
