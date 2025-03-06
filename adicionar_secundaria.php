<?php
include 'conexao.php';

$descricao = $_POST['descricao'];
$quantidade = $_POST['quantidade'];

$sql = "INSERT INTO materia_prima_secundaria (descricao, quantidade) VALUES ('$descricao', $quantidade)";
$conexao->query($sql);

echo "Item secundário adicionado!";
?>