<?php
$servername = "localhost";
$username = "chm_vendas";
$password = "Genesis2010@";
$dbname = "chm_vendas";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['file'])) {
    $file = $_FILES['file']['tmp_name'];
    require 'vendor/autoload.php';
    
    $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($file);
    $sheet = $spreadsheet->getActiveSheet();
    $data = $sheet->toArray(null, true, true, true);
    
    $conn->query("DELETE FROM pedidos");
    
    foreach ($data as $index => $row) {
        if ($index == 1) continue; // Ignorar cabeçalho
        $sku = $row['A'];
        $tamanho = $row['B'];
        $imagem = $row['C'];
        
        $stmt = $conn->prepare("INSERT INTO pedidos (sku, tamanho, imagem) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $sku, $tamanho, $imagem);
        $stmt->execute();
    }
    
    echo "Arquivo processado com sucesso";
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $result = $conn->query("SELECT sku, tamanho, imagem FROM pedidos ORDER BY data DESC");
    $pedidos = [];
    while ($row = $result->fetch_assoc()) {
        $pedidos[] = $row;
    }
    header('Content-Type: application/json');
    echo json_encode($pedidos);
    exit;
}

$conn->close();
?>
