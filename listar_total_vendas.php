<?php
include 'conexao.php';

$filtro = $_GET['filtro'] ?? 'semanal'; // Filtro padrão: semanal

// Define o intervalo de datas com base no filtro
$dataInicio = date('Y-m-d');
$dataFim = date('Y-m-d');

switch ($filtro) {
    case 'semanal':
        // Domingo da semana atual
        $dataInicio = date('Y-m-d', strtotime('last sunday'));
        // Sábado da semana atual
        $dataFim = date('Y-m-d', strtotime('next saturday'));
        break;
    case 'mensal':
        // Primeiro dia do mês atual
        $dataInicio = date('Y-m-01');
        // Último dia do mês atual
        $dataFim = date('Y-m-t');
        break;
}

// Consulta o total de vendas no período
$sql = "SELECT 
    SUM(CASE WHEN plataforma = 'Shein' THEN qtd_produto ELSE 0 END) as totalShein,
    SUM(CASE WHEN plataforma = 'Shopee' THEN qtd_produto ELSE 0 END) as totalShopee,
    SUM(qtd_produto) as totalGeral
    FROM vendas
    WHERE data_venda BETWEEN '$dataInicio' AND '$dataFim'";

$result = $conexao->query($sql);
$dados = $result->fetch_assoc();

// Retorna os dados em formato JSON
echo json_encode([
    'totalShein' => $dados['totalShein'] ?? 0,
    'totalShopee' => $dados['totalShopee'] ?? 0,
    'totalGeral' => $dados['totalGeral'] ?? 0
]);
?>