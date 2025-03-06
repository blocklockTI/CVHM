<?php
$host = 'localhost';
$usuario = '';
$senha = '@';
$banco = '';

$conexao = new mysqli($host, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Erro de conex���o: " . $conexao->connect_error);
}
?>
