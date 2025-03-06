<?php
include 'conexao.php';

$numeracao = $_POST['numeracao'];
$quantidade = $_POST['quantidade'];

// Atualiza o estoque de matéria-prima
$sql = "UPDATE estoque_materia_prima SET quantidade = quantidade - $quantidade WHERE numeracao = '$numeracao'";
$conexao->query($sql);

echo "Estoque atualizado após venda!";
?>