<?php
require_once __DIR__.'/../config/koneksi.php';
session_start();

// Proteksi: Hanya user 'orang_tua' yang bisa melakukan aksi ini
if (!isset($_SESSION['id_user']) || $_SESSION['level'] != 'orang_tua') {
    header("Location: ../login.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['aksi'])) {
    $id_user = $_SESSION['id_user'];

    if ($_POST['aksi'] == 'tambah') {
        $nama_anak = trim($_POST['nama_anak']);
        $usia = intval($_POST['usia']);

        if (!empty($nama_anak) && $usia > 0) {
            $stmt = $conn->prepare("INSERT INTO anak (nama_anak, usia, id_user) VALUES (?, ?, ?)");
            $stmt->bind_param("sii", $nama_anak, $usia, $id_user);

            if ($stmt->execute()) {
                header("Location: ../dashboard.php?pesan=sukses_tambah");
            } else {
                header("Location: ../dashboard.php?pesan=gagal");
            }
            $stmt->close();
            exit;
        }
    } else if ($_POST['aksi'] == 'edit') {
        $id_anak = intval($_POST['id_anak']);
        $nama_anak = trim($_POST['nama_anak']);
        $usia = intval($_POST['usia']);

        if ($id_anak > 0 && !empty($nama_anak) && $usia > 0) {
            // Pastikan orang tua hanya bisa mengedit anaknya sendiri
            $stmt = $conn->prepare("UPDATE anak SET nama_anak = ?, usia = ? WHERE id_anak = ? AND id_user = ?");
            $stmt->bind_param("siii", $nama_anak, $usia, $id_anak, $id_user);

            if ($stmt->execute()) {
                header("Location: ../dashboard.php?pesan=sukses_edit");
            } else {
                header("Location: ../dashboard.php?pesan=gagal");
            }
            $stmt->close();
            exit;
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['aksi']) && $_GET['aksi'] == 'hapus') {
    $id_user = $_SESSION['id_user'];
    $id_anak = intval($_GET['id']);

    if ($id_anak > 0) {
        // Pastikan orang tua hanya bisa menghapus anaknya sendiri
        $stmt = $conn->prepare("DELETE FROM anak WHERE id_anak = ? AND id_user = ?");
        $stmt->bind_param("ii", $id_anak, $id_user);
        $stmt->execute() ? header("Location: ../dashboard.php?pesan=sukses_hapus") : header("Location: ../dashboard.php?pesan=gagal");
        $stmt->close();
        exit;
    }
}

header("Location: ../dashboard.php");
exit;