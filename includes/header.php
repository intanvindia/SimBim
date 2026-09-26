<?php
require_once __DIR__.'/../config/koneksi.php';
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}
$sudah_login = isset($_SESSION['id_user']);
$level_user = $sudah_login ? $_SESSION['level'] : '';
$nama_user = $sudah_login ? $_SESSION['nama_lengkap'] : '';

// Ambil Pengaturan Global
$settings = [];
$res_set = $conn->query("SELECT * FROM pengaturan");
while($s = $res_set->fetch_assoc()) {
    $settings[$s['nama_key']] = $s['nilai_value'];
}

// Logika Multi-Language Support
if (isset($_GET['lang'])) {
    $_SESSION['lang'] = $_GET['lang'] == 'en' ? 'en' : 'id';
}
$lang = $_SESSION['lang'] ?? 'id';

$txt = [
    'id' => [
        'home' => 'Beranda', 'login' => 'Masuk', 'reg' => 'Daftar Akun', 'dash' => 'Dashboard',
        'logout' => 'Keluar', 'lang_name' => 'Bahasa'
    ],
    'en' => [
        'home' => 'Home', 'login' => 'Login', 'reg' => 'Register', 'dash' => 'Dashboard',
        'logout' => 'Logout', 'lang_name' => 'Language'
    ]
];

// Logika Maintenance Mode — admin dan staf tetap bisa akses
if (($settings['maintenance_mode'] ?? '0') == '1' && $level_user != 'admin' && $level_user != 'staf') {
    if (basename($_SERVER['PHP_SELF']) != 'maintenance.php' && basename($_SERVER['PHP_SELF']) != 'login.php' && basename($_SERVER['PHP_SELF']) != 'logout.php') {
        header("Location: maintenance.php");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($page_title) ? $page_title : ($settings['site_name'] ?? 'SIMBIM') . ' - Rekomendasi Bimbel'; ?></title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/style.css">
    <?php if(!empty($settings['site_favicon'])): ?>
    <link rel="icon" type="image/x-icon" href="<?= htmlspecialchars($settings['site_favicon']) ?>">
    <?php endif; ?>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-light sticky-top shadow-sm border-bottom">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary d-flex align-items-center" href="index.php">
            <?php if(!empty($settings['site_logo'])): ?>
                <img src="<?= htmlspecialchars($settings['site_logo']) ?>" alt="Logo" height="30" class="me-2">
            <?php else: ?>
                <i class="bi bi-rocket-takeoff-fill me-2"></i>
            <?php endif; ?>
            <?= htmlspecialchars($settings['site_name'] ?? 'SIMBIM') ?>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="index.php">Beranda</a></li>
                <?php if ($sudah_login): ?>
                    <?php if (in_array($level_user, ['admin', 'staf'])): ?>
                        <li class="nav-item"><a class="nav-link" href="asesmen.php">Buat Asesmen</a></li>
                    <?php endif; ?>
                    <?php if ($level_user == 'admin'): ?>
                        <li class="nav-item"><a href="admin_dashboard.php" class="nav-link btn btn-primary text-white fw-bold px-3 ms-lg-2 py-1 mt-2 mt-lg-0">Admin Panel</a></li>
                    <?php elseif ($level_user == 'staf'): ?>
                        <li class="nav-item"><a href="staff_dashboard.php" class="nav-link btn btn-warning text-dark fw-bold px-3 ms-lg-2 py-1 mt-2 mt-lg-0">Staff Panel</a></li>
                    <?php else: ?>
                        <li class="nav-item"><a href="dashboard.php" class="nav-link btn btn-primary text-white fw-bold px-3 ms-lg-2 py-1 mt-2 mt-lg-0">Dashboard</a></li>
                    <?php endif; ?>
                    <li class="nav-item ms-lg-3">
                        <div class="d-flex align-items-center bg-light rounded-pill p-1 pe-3 border">
                            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px; font-size: 14px;"><?= strtoupper(substr($nama_user, 0, 1)) ?></div>
                            <a href="logout.php" class="text-danger fw-bold text-decoration-none small"><?= $txt[$lang]['logout'] ?></a>
                        </div>
                    </li>
                <?php else: ?>
                    <li class="nav-item"><a class="nav-link" href="login.php"><?= $txt[$lang]['login'] ?></a></li>
                    <li class="nav-item ms-lg-2"><a href="daftar.php" class="nav-link btn btn-primary text-white fw-bold px-3 py-1"><?= $txt[$lang]['reg'] ?></a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>
