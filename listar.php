<?php
include 'conexao.php';

$data_selecionada = $_GET['data'] ?? date('Y-m-d');
$sql = "SELECT * FROM vendas WHERE DATE(data_venda) = '$data_selecionada' ORDER BY sku ASC";
$resultado = $conexao->query($sql);

$vendas = array();
while ($row = $resultado->fetch_assoc()) {
    // Força os valores para inteiros (0 ou 1)
    $row['produzindo'] = (int)$row['produzindo'];
    $row['acabamento'] = (int)$row['acabamento'];
    $row['pronto'] = (int)$row['pronto'];
    $row['enviado'] = (int)$row['enviado'];
    $row['qtd_produto'] = (int)$row['qtd_produto']; // Garante que a quantidade seja um número
    $vendas[] = $row;
}

echo json_encode($vendas);
?>