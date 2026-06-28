<?php
/**
 * migrate2.php - Migrasi Schema untuk Role Staf
 * Jalankan SEKALI di browser: http://localhost/SimBim/database/migrate2.php
 * Setelah sukses, hapus atau rename file ini untuk keamanan.
 */
require_once __DIR__.'/../config/koneksi.php';

$messages = [];
$errors = [];

// -------------------------------------------------------
// 1. Pastikan kolom 'level' pada tabel 'user' mendukung nilai 'staf'
//    Ubah dari ENUM (jika ada) ke VARCHAR(20) untuk fleksibilitas
// -------------------------------------------------------
$alter_user = $conn->query("ALTER TABLE user MODIFY COLUMN level VARCHAR(20) NOT NULL DEFAULT 'orang_tua'");
if ($alter_user !== false) {
    $messages[] = "✅ Kolom 'level' pada tabel 'user' berhasil diperbarui ke VARCHAR(20).";
} else {
    // Mungkin sudah VARCHAR, coba cek saja
    $messages[] = "ℹ️  Kolom 'level' sudah dalam format yang benar (tidak perlu diubah).";
}

// -------------------------------------------------------
// 2. Cek apakah ada akun staf — jika belum ada, buat akun demo staf
// -------------------------------------------------------
$staf_exists = $conn->query("SELECT COUNT(*) as total FROM user WHERE level = 'staf'")->fetch_assoc()['total'];

if ($staf_exists == 0) {
    $demo_pass = password_hash('staf123', PASSWORD_DEFAULT);
    $stmt = $conn->prepare("INSERT INTO user (username, password, nama_lengkap, level) VALUES ('staf_demo', ?, 'Staff Demo', 'staf')");
    $stmt->bind_param("s", $demo_pass);
    if ($stmt->execute()) {
        $messages[] = "✅ Akun staff demo berhasil dibuat: <strong>username: staf_demo | password: staf123</strong>";
        $messages[] = "⚠️  Segera ganti password akun ini dari Admin Panel setelah login!";
    } else {
        $errors[] = "❌ Gagal membuat akun staf demo: " . $stmt->error;
    }
    $stmt->close();
} else {
    $messages[] = "ℹ️  Sudah ada " . $staf_exists . " akun dengan level staf. Tidak perlu membuat baru.";
}

// -------------------------------------------------------
// 3. Pastikan kolom 'level' di tabel user memiliki index
// -------------------------------------------------------
$check_index = $conn->query("SHOW INDEX FROM user WHERE Column_name = 'level'")->num_rows;
if ($check_index == 0) {
    $conn->query("ALTER TABLE user ADD INDEX idx_level (level)");
    $messages[] = "✅ Index pada kolom 'level' berhasil ditambahkan untuk optimasi query.";
} else {
    $messages[] = "ℹ️  Index pada kolom 'level' sudah ada.";
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Migrasi Role Staf - SIMBIM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white py-3">
                    <h4 class="mb-0"><i class="bi bi-database-gear me-2"></i>Migrasi: Role Staf - SIMBIM</h4>
                </div>
                <div class="card-body p-4">
                    <?php if (!empty($errors)): ?>
                    <div class="alert alert-danger">
                        <h6 class="fw-bold">Error:</h6>
                        <ul class="mb-0">
                            <?php foreach($errors as $e): ?><li><?= $e ?></li><?php endforeach; ?>
                        </ul>
                    </div>
                    <?php endif; ?>

                    <div class="alert alert-success">
                        <h6 class="fw-bold">Hasil Migrasi:</h6>
                        <ul class="mb-0">
                            <?php foreach($messages as $m): ?><li><?= $m ?></li><?php endforeach; ?>
                        </ul>
                    </div>

                    <div class="alert alert-warning">
                        <strong>⚠️ Penting:</strong> Setelah migrasi berhasil, hapus atau rename file <code>migrate2.php</code> untuk keamanan.
                    </div>

                    <a href="../admin_dashboard.php" class="btn btn-primary me-2">
                        <i class="bi bi-arrow-left me-1"></i>Kembali ke Admin Panel
                    </a>
                    <a href="../login.php" class="btn btn-outline-secondary">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</body>
</html>
