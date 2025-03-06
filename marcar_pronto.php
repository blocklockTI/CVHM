<?php
include 'conexao.php';

$id = $_POST['id'];
$pronto = $_POST['pronto'];
$sql = "UPDATE vendas SET pronto = $pronto WHERE id = $id";
$conexao->query($sql);

echo "Status atualizado!";
?>