<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    // Usuário não está logado, redireciona para a página de login
    header("Location: login.html");
    exit();
}
?>