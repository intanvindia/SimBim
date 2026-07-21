# Changelog

Semua perubahan penting pada proyek ini akan didokumentasikan dalam file ini.

Format file ini didasarkan pada [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), dan proyek ini mematuhi [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.6.0] - 2026-07-06

### Changed
- **Pengalaman Memuat Modern:** Mengganti *spinner* klasik dengan efek *Skeleton Loading* saat memuat data matriks di panel admin.
- **Konsistensi Desain Form:** Merombak desain form input (`login`, `daftar`) menjadi gaya "boxy" yang lebih bersih.
- **Hierarki Aksi yang Jelas:** Menetapkan satu tombol aksi utama (`btn-primary`) per halaman untuk memandu alur pengguna.
- **Teks Aksi yang Lebih Baik:** Memperjelas teks pada tombol-tombol di seluruh aplikasi.
- **Pengalaman Personal:** Pesan selamat datang di dasbor orang tua kini menyapa nama depan pengguna.

### Added
- **Dokumentasi Dinamis:** Menambahkan fitur bagi Admin untuk mencetak Dokumen Persyaratan Produk (PRD) terbaru langsung dari dasbor.

## [1.5.0]

### Added
- **Transformasi Peran Staf (Mini-CRM):**
    - Staf dapat mengelola status *follow-up* (`Belum Dihubungi`, `Sudah Dihubungi`, `Mendaftar`) dan menambahkan catatan.
    - Tombol "Hubungi WA" untuk tindak lanjut yang lebih cepat.
    - Staf dapat mereset password orang tua dan mencetak kartu pendaftaran fisik (PDF).
- **Utilitas & Kebersihan Data:**
    - Fitur untuk mendeteksi dan membersihkan akun orang tua duplikat.
    - Panel untuk memantau aktivitas login terakhir dari orang tua.
- **Peningkatan Fungsionalitas Asesmen:**
    - Staf dan Admin kini dapat mengisi form asesmen atas nama orang tua.
    - Fitur "Demo Auto-Fill" kini eksklusif untuk Staf dan Admin.
- **Peningkatan Sistem:**
    - Sistem pencatatan log komprehensif untuk semua aktivitas penting.
    - Penambahan kolom `no_hp` saat pendaftaran.

### Changed
- Perbaikan total pada UI `staff_dashboard.php` dan `cetak_kartu.php`.

### Fixed
- Mengatasi masalah label grafik yang terpotong pada laporan PDF hasil asesmen.

## [1.4.0]

### Changed
- **Refactor Alur Inti (Manajemen Anak):** Orang tua kini mengelola daftar anak di dasbor dan memilih anak saat akan tes.
- Grafik di dasbor orang tua menjadi spesifik per anak yang dipilih.
- Tabel "Manajemen Pengguna" di dasbor admin kini menampilkan semua level user.

### Added
- **Profil Anak:** Halaman `profil_anak.php` untuk menampilkan riwayat asesmen dan grafik perkembangan khusus per anak.

### Fixed
- Bug pada grafik "Perkembangan Potensi" dan "Top 5 Kelas Terdaftar".
- Perbaikan UI pada *welcome banner* dan halaman hasil asesmen.

### Removed
- Seluruh fitur integrasi **Google Sheets API** dan **Analisis AI** untuk menjaga stabilitas.

## [1.2.0]

### Added
- **Kontrol Akses Berbasis Peran:** Penambahan level **Staf** dengan hak akses *read-only*.
- **Peningkatan Dasbor:** 3 kartu statistik baru dan grafik "Top 5 Kelas Terdaftar".
- **Visualisasi Profil Kecerdasan:** *Progress Bar* per aspek kriteria di dasbor orang tua.
- **Ekspor Excel:** Ekspor rekap laporan asesmen berdasarkan rentang tanggal.
- **Pengumuman Dalam Aplikasi:** Pengumuman global dari admin tampil di dasbor orang tua.

### Changed
- **Peningkatan UI Arsip:** Mengintegrasikan panel arsip ke dalam tab yang relevan.
- **Reorganisasi Folder:** Memindahkan file pendukung ke subfolder terstruktur.

## [1.1.0]

### Added
- **Keamanan:** Hashing password (BCRYPT) dan sistem Audit Log otomatis.
- **UI/UX:** Penambahan *Progress Bar* asesmen dan *Show/Hide Password*.
- **Analitik:** Fitur perbandingan asesmen (Line Chart) untuk orang tua.
- **Pemeliharaan:** Penambahan *Maintenance Mode* dan kontrol pendaftaran.

### Changed
- **Optimasi:** Implementasi *Single Join Query* untuk performa kalkulasi lebih cepat.

## [1.0.0] - Initial Release

### Added
- Implementasi dasar algoritma Weighted Product.
- Fitur kuesioner standar.
- Manajemen data master kriteria dan pertanyaan.
- Hasil rekomendasi berbasis tabel sederhana.