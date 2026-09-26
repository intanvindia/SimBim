<?php
ob_start();
require_once 'config/koneksi.php';
require_once __DIR__ . '/assets/dompdf/vendor/autoload.php';
// Tambahkan pustaka parser Markdown
require_once __DIR__ . '/includes/Parsedown.php';
use Dompdf\Dompdf;
use Dompdf\Options;

session_start();

// Proteksi: Hanya admin yang bisa cetak
if (!isset($_SESSION['id_user']) || $_SESSION['level'] != 'admin') {
    die("Akses ditolak. Hanya Administrator yang dapat mengakses halaman ini.");
}

// Ambil Pengaturan Global untuk nama situs
$settings = [];
$res_set = $conn->query("SELECT nama_key, nilai_value FROM pengaturan WHERE nama_key = 'site_name'");
if ($res_set) {
    while($s = $res_set->fetch_assoc()) {
        $settings[$s['nama_key']] = $s['nilai_value'];
    }
}

// Konten PRD dinamis dari file PRODUCT_REQUIREMENTS_DOCUMENT.md
$prd_markdown_path = __DIR__ . '/PRODUCT_REQUIREMENTS_DOCUMENT.md';
$prd_content = '';

if (file_exists($prd_markdown_path)) {
    $markdown_content = file_get_contents($prd_markdown_path);
    
    // Hapus blok header YAML-like di awal file markdown agar tidak ikut di-render
    $markdown_content = preg_replace('/^# Dokumen Persyaratan Produk.*\n\n(.*\n)*?---\n\n/m', '', $markdown_content, 1);
    
    $Parsedown = new Parsedown();
    $prd_content = $Parsedown->text($markdown_content);

} else {
    $prd_content = '<p style="color: red; text-align: center;"><strong>Error:</strong> File <code>PRODUCT_REQUIREMENTS_DOCUMENT.md</code> tidak ditemukan.</p>';
}

// Konstruksi HTML Lengkap untuk PDF
$html = '
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        @page {
            margin: 35px 40px;
        }
        body { /* Default body styles */
            font-family: "Helvetica", "Arial", sans-serif;
            color: #333;
            line-height: 1.6;
            font-size: 11px;
        }
        .header-table {
            width: 100%;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 8px;
            margin-bottom: 25px;
        }
        .report-title h1 {
            margin: 0;
            font-size: 22px;
            font-weight: bold;
            color: #0d6efd;
            text-align: right;
        }
        .report-title p {
            margin: 0;
            font-size: 12px;
            color: #6c757d;
            text-align: right;
        }
        h1 { /* Main document title, used for cover */
            font-size: 32px;
            color: #0d6efd;
            text-align: center;
            margin-bottom: 20px;
        }
        h2 { /* Corresponds to ## in Markdown, main sections */
            font-size: 20px;
            color: #0d6efd;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 8px;
            margin-top: 20px;
            margin-bottom: 15px;
        }
        h3 { /* Corresponds to ### in Markdown, sub-sections */
            font-size: 16px;
            color: #1e293b;
            margin-top: 15px;
            margin-bottom: 8px;
            border-bottom: 1px solid #f1f1f1;
            padding-bottom: 5px;
        }
        p { margin-bottom: 10px; }
        ul, ol { padding-left: 20px; margin-bottom: 10px; }
        li { margin-bottom: 5px; }
        code { 
            background-color: #eef2ff; 
            padding: 2px 5px; 
            font-family: "Courier New", monospace;
            border: 1px solid #e0e7ff;
            border-radius: 4px;
            font-size: 10px;
            color: #4338ca;
        }
        pre {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            padding: 12px;
            border-radius: 6px;
            page-break-inside: avoid;
            font-size: 10px;
        }
        pre code {
            background-color: transparent;
            border: none;
            padding: 0;
        }
        blockquote {
            border-left: 4px solid #93c5fd;
            padding-left: 15px;
            margin-left: 0;
            color: #64748b;
            font-style: italic;
            page-break-inside: avoid;
        }
        strong { font-weight: bold; }
        em { font-style: italic; }
        /* Table styles */
        table {
            border-collapse: collapse;
            width: 100%;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 15px; 
            margin-bottom: 15px; 
            page-break-inside: avoid;
        }
        th, td { 
            border: 1px solid #e2e8f0; 
            padding: 8px 10px; 
            text-align: left; 
            font-size: 10px; 
            vertical-align: top;
        }
        th { 
            background-color: #f1f5f9; 
            color: #1e293b;
        }
        .page-break { 
            page-break-before: always; 
        }
        .footer { 
            position: fixed; 
            bottom: -25px;
            left: 0px; 
            right: 0px; 
            height: 50px;
            font-size: 9px; 
            text-align: center; 
            color: #999; 
        }
        .pagenum:before {
            content: counter(page);
        }
        /* Cover Page Specific Styles */
        .cover-page {
            text-align: center;
            height: 100%; /* Take full page height */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .cover-title { font-size: 48px; font-weight: bold; color: #0d6efd; margin-bottom: 15px; }
        .cover-subtitle { font-size: 24px; color: #333; margin-bottom: 30px; }
        .cover-meta { font-size: 16px; color: #6c757d; line-height: 1.8; }
    </style>
</head>
<body>

    <div class="footer">
        Dokumen Persyaratan Produk (PRD) SIMBIM | Dibuat pada ' . date('d/m/Y H:i') . ' | Halaman <span class="pagenum"></span>
    </div>

    <div class="cover-page">
        <div class="cover-title">PRODUCT REQUIREMENTS DOCUMENT</div>
        <div class="cover-subtitle">Sistem Pendukung Keputusan Pemilihan Bimbingan Belajar Anak</div>
        <div class="cover-meta">
            <p><strong>Versi Dokumen:</strong> 1.5.2</p>
            <p><strong>Tanggal:</strong> ' . date('d F Y') . '</p>
            <p><strong>Penulis:</strong> Intan V.K</p>
        </div>
    </div>
    <div class="page-break"></div>

    <table class="header-table">
        <tr>
            <td class="report-title">
                <h2>Dokumen Persyaratan Produk</h2>
                <p>' . htmlspecialchars($settings['site_name'] ?? 'SIMBIM Indonesia') . '</p>
            </td>
        </tr>
    </table>

    ' . $prd_content . '

</body>
</html>
';

$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true);

$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();

$filename = "PRD_SIMBIM_v1.5_" . date('Ymd') . ".pdf";
$dompdf->stream($filename, ["Attachment" => false]); // false = preview di browser
ob_end_flush();
?>