<?php
require_once __DIR__.'/../config/koneksi.php';
session_start();

// Proteksi Keamanan: Tolak akses jika bukan Orang Tua siswa yang menekan tombol submit
if (!isset($_SESSION['id_user']) || !in_array($_SESSION['level'], ['orang_tua', 'admin', 'staf'])) {
    header("Location: ../login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_user = $_SESSION['id_user'];
    $id_anak = intval($_POST['id_anak']);
    $tgl_sekarang = date('Y-m-d');

    // 1. Buat record asesmen baru dengan id_anak yang sudah ada
    $stmt_asesmen = $conn->prepare("INSERT INTO asesmen (id_anak, tgl_asesmen) VALUES (?, ?)");
    $stmt_asesmen->bind_param("is", $id_anak, $tgl_sekarang);
    
    if ($stmt_asesmen->execute()) {
        $id_asesmen_baru = $stmt_asesmen->insert_id; // Dapatkan ID Utama asesmen
        $stmt_asesmen->close();
        // 2. Validasi dan simpan detail jawaban
        if (isset($_POST['skor']) && is_array($_POST['skor'])) {
                // Siapkan teknik penyiapan query gabungan (Prepared Statement/Multi Insert) agar hemat memori database
                $stmt_detail = $conn->prepare("INSERT INTO detail_asesmen (id_asesmen, id_pertanyaan, nilai_input) VALUES (?, ?, ?)");
                
                foreach ($_POST['skor'] as $id_pertanyaan => $nilai_skor) {
                    $id_p = intval($id_pertanyaan);
                    $skor_mentah = intval($nilai_skor);

                    // Batasi nilai skor keras antara skala 1 hingga 5 saja demi keamanan hitung WP
                    if ($skor_mentah < 1) $skor_mentah = 1;
                    if ($skor_mentah > 5) $skor_mentah = 5;

                    // Masukkan rekam jejak jawaban ke tabel detail_asesmen satu per satu
                    $stmt_detail->bind_param("iii", $id_asesmen_baru, $id_p, $skor_mentah);
                    $stmt_detail->execute();
                }
                $stmt_detail->close();
        }

        // 3. BERHASIL: Lempar data ke halaman hasil dengan menyertakan parameter ID Asesmen baru
        header("Location: ../hasil.php?id_asesmen=" . $id_asesmen_baru);
        exit;

    }
} else {
    // Jika ada yang mencoba mengakses file ini langsung tanpa form POST, kembalikan ke form awal
    header("Location: ../asesmen.php");
    exit;
}
?>