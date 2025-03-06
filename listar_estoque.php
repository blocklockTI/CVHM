<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'conexao.php';

// Consulta ao banco de dados para estoque de mat«±ria-prima
$sqlEstoquePrimario = "SELECT id, numeracao, quantidade FROM estoque_materia_prima";
$resultEstoquePrimario = $conexao->query($sqlEstoquePrimario);

$estoquePrimario = [];
if ($resultEstoquePrimario->num_rows > 0) {
    while ($row = $resultEstoquePrimario->fetch_assoc()) {
        $estoquePrimario[] = $row;
    }
}

// Consulta ao banco de dados para estoque de mat«±ria-prima secund«¡ria
$sqlEstoqueSecundario = "SELECT id, descricao, quantidade FROM materia_prima_secundaria";
$resultEstoqueSecundario = $conexao->query($sqlEstoqueSecundario);

$estoqueSecundario = [];
if ($resultEstoqueSecundario->num_rows > 0) {
    while ($row = $resultEstoqueSecundario->fetch_assoc()) {
        $estoqueSecundario[] = $row;
    }
}

// Fechar conex«ªo
$conexao->close();

// Retorna os dados em formato JSON
echo json_encode([
    'estoque_materia_prima' => $estoquePrimario,
    'materia_prima_secundaria' => $estoqueSecundario
]);
?>