<?php
include 'check_session.php';
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload de Vendas</title>
</head>
<body>
    <h1>Upload de Vendas</h1>
    <form action="importar.php" method="post" enctype="multipart/form-data">
        <input type="file" name="arquivo" accept=".csv, .xlsx">
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
