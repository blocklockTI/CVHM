<?php
session_start();
include 'conexao.php';

$id = $_POST['id'];
$campo = $_POST['campo'];
$valor = $_POST['valor'];


// Desmarca todos os outros status
$sql = "UPDATE vendas 
        SET produzindo = 0, 
            acabamento = 0, 
            pronto = 0, 
            enviado = 0 
        WHERE id = $id";
$conexao->query($sql);

// Marca o status selecionado
$sql = "UPDATE vendas SET $campo = $valor WHERE id = $id";
$conexao->query($sql);

echo "Status atualizado por $usuario!";
?>