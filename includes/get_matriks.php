<?php
require_once __DIR__.'/../config/koneksi.php';
session_start();

if (!isset($_SESSION['id_user']) || $_SESSION['level'] != 'admin') exit;

$id_kelas = intval($_GET['id_kelas']);
$stmt = $conn->prepare("SELECT nkk.*, k.nama_kriteria FROM nilai_kriteria_kelas nkk 
                        JOIN kriteria k ON nkk.id_kriteria = k.id_kriteria 
                        WHERE nkk.id_kelas = ?");
$stmt->bind_param("i", $id_kelas);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    ?>
    <div class="mb-3">
        <label class="form-label small fw-bold"><?= htmlspecialchars($row['nama_kriteria']); ?></label>
        <div class="d-flex align-items-center gap-3">
            <input type="range" class="form-range" name="matriks[<?= $row['id_kriteria']; ?>]" 
                   min="1" max="5" step="1" value="<?= $row['nilai_default']; ?>" 
                   oninput="this.nextElementSibling.innerText = this.value">
            <span class="badge bg-primary rounded-pill"><?= $row['nilai_default']; ?></span>
        </div>
    </div>
    <?php
}
$stmt->close();
?>