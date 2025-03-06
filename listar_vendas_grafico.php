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

// Busca as vendas agrupadas por variação
$sql = "SELECT variacao, SUM(qtd_produto) as total_vendido FROM vendas 
        WHERE data_venda BETWEEN '$dataInicio' AND '$dataFim'
        GROUP BY variacao";
$resultado = $conexao->query($sql);

$dados = array();
while ($row = $resultado->fetch_assoc()) {
    // Extrai apenas os números da variação (ex.: "preto-38" → 38)
    preg_match('/\d+/', $row['variacao'], $matches);
    if (!empty($matches)) {
        $numero = $matches[0]; // Pega o primeiro número encontrado
        $dados[$numero] = ($dados[$numero] ?? 0) + $row['total_vendido'];
    }
}

// Formata os dados para o gráfico
$labels = array_keys($dados);
$valores = array_values($dados);

echo json_encode([
    'labels' => $labels,
    'valores' => $valores
]);
?>