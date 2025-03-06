<?php
include 'conexao.php';

if ($_FILES['arquivo']['error'] == UPLOAD_ERR_OK) {
    $arquivo_tmp = $_FILES['arquivo']['tmp_name'];
    $dados = array_map('str_getcsv', file($arquivo_tmp));
    
    array_shift($dados); // Remove cabeçalho

    foreach ($dados as $linha) {
        $pedido_plataforma = $linha[0]; // Nº de Pedido da Plataforma
        $plataforma = $linha[2]; // Plataformas
        $sku = $linha[5]; // SKU
        $variacao = $linha[6]; // Variação
        $imagem_url = $linha[7]; // Link da Imagem
        $quantidade = (int)$linha[9]; // Qtd. do Produto
        $data_venda = date('Y-m-d H:i:s'); // Data atual

        // Insere a venda no banco de dados
        $sql = "INSERT INTO vendas (pedido_plataforma, plataforma, sku, variacao, imagem_url, data_venda, qtd_produto)
                VALUES ('$pedido_plataforma', '$plataforma', '$sku', '$variacao', '$imagem_url', '$data_venda', $quantidade)";
        $conexao->query($sql);

        // Extrai os números da variação (ex.: "Preto-38" → 38)
        preg_match_all('/\d+/', $variacao, $matches);
        $numeros = array_unique($matches[0]); // Remove duplicações

        // Atualiza o estoque para cada número encontrado
        foreach ($numeros as $numero) {
            $sql = "UPDATE estoque_materia_prima SET quantidade = quantidade - $quantidade WHERE numeracao = '$numero'";
            $conexao->query($sql);
        }
    }

    header('Location: index.php'); // Redireciona após importar
    exit();
} else {
    echo "Erro ao enviar o arquivo.";
}
?>