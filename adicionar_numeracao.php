<?php
include 'conexao.php';

$numeracao = $conexao->real_escape_string($_POST['numeracao']);
$quantidade = intval($_POST['quantidade']);

$sql = "INSERT INTO estoque_materia_prima (numeracao, quantidade) VALUES ('$numeracao', $quantidade)";
if ($conexao->query($sql) === TRUE) {
    echo "Numeração adicionada!";
} else {
    echo "Erro ao adicionar numeração: " . $conexao->error;
}
?>