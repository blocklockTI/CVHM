<?php
include 'conexao.php';

$id = $_POST['id'];
$enviado = $_POST['enviado'];
$sql = "UPDATE vendas SET enviado = $enviado WHERE id = $id";
$conexao->query($sql);

echo "Status atualizado!";
?>