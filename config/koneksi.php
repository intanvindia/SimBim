<?php
// Konfigurasi Database
$host = "localhost";
$user = "root";     // Default XAMPP
$pass = "";         // Default XAMPP biasanya kosong
$db   = "simbim";   // Nama database sesuai kesepakatan

// Membuat koneksi menggunakan ekstensi mysqli (Object-Oriented)
$conn = new mysqli($host, $user, $pass, $db);

// Cek apakah koneksi berhasil atau gagal
if ($conn->connect_error) {
    // Jika gagal, hentikan script dan tampilkan error
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Set charset ke UTF-8 agar pembacaan karakter teks aman dan rapi
$conn->set_charset("utf8mb4");

// Variabel $conn ini yang akan kita panggil di file-file lain
?>