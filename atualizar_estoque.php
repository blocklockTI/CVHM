<?php
include 'conexao.php';

// Verifica se os dados foram recebidos corretamente
if (!isset($_POST['id'], $_POST['tipo'], $_POST['acao'])) {
    echo json_encode(["status" => "error", "message" => "Dados incompletos."]);
    exit;
}

$id = intval($_POST['id']);
$tipo = $_POST['tipo']; // 'materia_prima' ou 'secundaria'
$quantidade = isset($_POST['quantidade']) ? intval($_POST['quantidade']) : 0;
$acao = $_POST['acao']; // 'atualizar' ou 'remover'

// Define a tabela correta
$tabela = ($tipo === 'materia_prima') ? 'estoque_materia_prima' : 'materia_prima_secundaria';

if ($acao === 'atualizar') {
    $sql = "UPDATE $tabela SET quantidade = ? WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("ii", $quantidade, $id);
} elseif ($acao === 'remover') {
    $sql = "DELETE FROM $tabela WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("i", $id);
} else {
    echo json_encode(["status" => "error", "message" => "Ação inválida."]);
    exit;
}

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Estoque atualizado!"]);
} else {
    echo json_encode(["status" => "error", "message" => "Erro ao atualizar estoque: " . $stmt->error]);
}

$stmt->close();
$conexao->close();
?>