<?php
require_once __DIR__.'/../config/koneksi.php';
session_start();

// Guard: hanya level 'staf' yang boleh akses
if (!isset($_SESSION['id_user']) || $_SESSION['level'] != 'staf') {
    // Jika request AJAX, kirim response JSON
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
        http_response_code(403);
        echo json_encode(['status' => 'error', 'message' => 'Akses ditolak.']);
    } else {
        header("Location: ../login.php");
    }
    exit;
}

// Fungsi helper untuk mencatat log aktivitas
function createLog($conn, $aktivitas) {
    if (isset($_SESSION['id_user'])) {
        $id_user_log = $_SESSION['id_user'];
        $stmt = $conn->prepare("INSERT INTO logs (id_user, aktivitas) VALUES (?, ?)");
        $stmt->bind_param("is", $id_user_log, $aktivitas);
        $stmt->execute();
        $stmt->close();
    }
}

$aksi = $_POST['aksi'] ?? $_GET['aksi'] ?? '';

if ($aksi == 'reset_password' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_user = intval($_POST['id_user']);
    $default_password = '123456';
    $password_hashed = password_hash($default_password, PASSWORD_DEFAULT);
    
    // Hanya bisa mereset password orang tua
    $stmt = $conn->prepare("UPDATE user SET password = ? WHERE id_user = ? AND level = 'orang_tua'");
    $stmt->bind_param("si", $password_hashed, $id_user);
    
    if ($stmt->execute() && $stmt->affected_rows > 0) {
        createLog($conn, "Mereset password untuk user ID: $id_user");
        header("Location: ../staff_dashboard.php?pesan=reset_pass_sukses#user-tab-pane");
    } else {
        header("Location: ../staff_dashboard.php?pesan=reset_pass_gagal#user-tab-pane");
    }
    $stmt->close();
    exit;
}

if ($aksi == 'update_follow_up' && $_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_asesmen = intval($_POST['id_asesmen']);
    $status = trim($_POST['status']);
    $catatan = trim($_POST['catatan']);

    $stmt = $conn->prepare("UPDATE asesmen SET status_follow_up = ?, catatan_follow_up = ? WHERE id_asesmen = ?");
    $stmt->bind_param("ssi", $status, $catatan, $id_asesmen);

    if ($stmt->execute()) {
        createLog($conn, "Memperbarui status follow-up untuk asesmen ID: $id_asesmen menjadi '$status'");
        echo json_encode(['status' => 'success', 'message' => 'Status berhasil diperbarui.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Gagal memperbarui status.']);
    }
    $stmt->close();
    exit;
}

if ($aksi == 'hapus_duplikat' && $_SERVER['REQUEST_METHOD'] == 'GET') {
    $id_user_hapus = intval($_GET['id_user']);
    
    // Ambil username sebelum dihapus untuk logging
    $stmt_get = $conn->prepare("SELECT username FROM user WHERE id_user = ? AND level = 'orang_tua'");
    $stmt_get->bind_param("i", $id_user_hapus);
    $stmt_get->execute();
    $user_to_delete = $stmt_get->get_result()->fetch_assoc();
    $stmt_get->close();

    $stmt_del = $conn->prepare("DELETE FROM user WHERE id_user = ? AND level = 'orang_tua'");
    $stmt_del->bind_param("i", $id_user_hapus);
    if ($stmt_del->execute() && $stmt_del->affected_rows > 0 && $user_to_delete) {
        createLog($conn, "Menghapus akun duplikat: " . $user_to_delete['username'] . " (ID: $id_user_hapus)");
        header("Location: ../staff_dashboard.php?pesan=hapus_duplikat_sukses#utilitas-tab-pane");
    } else {
        header("Location: ../staff_dashboard.php?pesan=hapus_duplikat_gagal#utilitas-tab-pane");
    }
    $stmt_del->close();
    exit;
}

// Default redirect jika aksi tidak dikenal
header("Location: ../staff_dashboard.php");
exit;