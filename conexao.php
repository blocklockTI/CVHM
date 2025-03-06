<?php
$host = 'localhost';
$usuario = 'cvhm_vendas';
$senha = 'Genesis2010@';
$banco = 'cvhm_vendas';

$conexao = new mysqli($host, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Erro de conex���o: " . $conexao->connect_error);
}
?>