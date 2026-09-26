<?php
require_once __DIR__.'/../config/koneksi.php';
session_start();

// Proteksi Keamanan: Hanya user 'staf_demo' yang bisa menjalankan ini
if (!isset($_SESSION['id_user']) || $_SESSION['username'] != 'staf_demo') {
    header("Location: ../login.php");
    exit;
}

if (isset($_GET['aksi']) && $_GET['aksi'] == 'reset') {

    // ID Akun orang tua fiktif yang datanya akan direset
    // From simbim.sql: user(2), user2(4), user3(5), user4(6)
    $demo_user_ids = [2, 4, 5, 6];
    $placeholders = implode(',', array_fill(0, count($demo_user_ids), '?'));

    // Hapus semua asesmen yang terkait dengan anak-anak milik akun orang tua fiktif
    // Ini secara otomatis akan menghapus 'detail_asesmen' dan 'rekomendasi_hasil' karena ON DELETE CASCADE
    $sql_delete_asesmen = "DELETE FROM asesmen WHERE id_anak IN (SELECT id_anak FROM anak WHERE id_user IN ($placeholders))";
    $stmt_delete_asesmen = $conn->prepare($sql_delete_asesmen);
    
    $types = str_repeat('i', count($demo_user_ids));
    $stmt_delete_asesmen->bind_param($types, ...$demo_user_ids);
    $stmt_delete_asesmen->execute();
    $stmt_delete_asesmen->close();

    // Hapus semua log aktivitas, kecuali milik admin (ID=1)
    $conn->query("DELETE FROM logs WHERE id_user != 1");

    header("Location: ../staff_dashboard.php?pesan=reset_sukses");
    exit;
}

header("Location: ../staff_dashboard.php");
exit;