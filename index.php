<?php
include 'check_session.php';
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Vendas</title>
    <link rel="icon" type="image/png" href="/images/chm.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .produzindo {
            border: 3px solid #0dcaf0; /* Azul */
            position: relative;
        }
        .produzindo::after {
            content: "PRODUZINDO";
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(13, 202, 240, 0.8);
            color: white;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 5px;
        }
        .acabamento {
            border: 3px solid #dc3545; /* Vermelho */
            position: relative;
        }
        .acabamento::after {
            content: "ACABAMENTO";
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(220, 53, 69, 0.8);
            color: white;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 5px;
        }
        .pronto {
            border: 3px solid green;
            position: relative;
        }
        .pronto::after {
            content: "PRONTO";
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(0, 128, 0, 0.8);
            color: white;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 5px;
        }
        .enviado {
            border: 3px solid #ff6a00;
            position: relative;
        }
        .enviado::after {
            content: "ENVIADO";
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(255, 106, 0, 0.8);
            color: white;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 5px;
        }
        .enviado-img {
            position: relative; /* Permite posicionar o overlay */
        }
        .enviado-img::after {
            content: "ENVIADO";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 106, 0, 0.5); /* Fundo laranja semi-transparente */
            color: white;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(255, 106, 0, 0.3); /* Sombra laranja */
        }
        .titulo-img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .card-img-top {
            width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }
        .card {
            margin-bottom: 20px;
        }
        @media (max-width: 768px) {
            .navbar-nav {
                flex-direction: column;
                text-align: center;
            }
            .col-md-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
            .card-title {
                font-size: 18px;
            }
            .card-text {
                font-size: 14px;
            }
            .btn {
                font-size: 12px;
                padding: 5px 10px;
            }
            .produzindo::after, .acabamento::after, .pronto::after, .enviado::after {
                font-size: 12px;
                padding: 3px 6px;
            }
        }
    </style>
</head>
<body>
    <header class="text-center">
        <img src="titulo.png" alt="Título" class="img-fluid titulo-img">
    </header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="upload.html">IMPORTAR</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html">VENDAS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="estoque.html">ESTOQUE</a>
                </li>
                <a href="logout.php" class="btn btn-danger">Sair</a>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-4">
                <input type="date" id="dataFiltro" class="form-control" 
                       value="<?php echo date('Y-m-d'); ?>">
            </div>
            <div class="col-md-8 text-end">
                <h4>Total de Peças: <span id="totalPecas">0</span></h4>
                <div class="d-flex gap-3 justify-content-end">
                    <button class="btn btn-info" onclick="filtrarPorStatus('produzindo')">Produzindo: <span id="totalProduzindo">0</span></button>
                    <button class="btn btn-danger" onclick="filtrarPorStatus('acabamento')">Acabamento: <span id="totalAcabamento">0</span></button>
                    <button class="btn btn-success" onclick="filtrarPorStatus('pronto')">Pronto: <span id="totalPronto">0</span></button>
                    <button class="btn btn-warning" onclick="filtrarPorStatus('enviado')">Enviado: <span id="totalEnviado">0</span></button>
                    <button class="btn btn-secondary" onclick="carregarVendas()">Limpar Filtros</button>
                </div>
            </div>
        </div>
        <div id="vendas" class="row"></div>
    </div>

    <script>
        let filtroAtual = null; // Variável para armazenar o filtro atual

        // Função para carregar vendas com filtro
        async function carregarVendas(filtro = null) {
            const data = document.getElementById('dataFiltro').value;
            const response = await fetch(`listar.php?data=${data}`);
            const vendas = await response.json();

            const container = document.getElementById('vendas');
            container.innerHTML = '';

            // Inicializa os contadores
            let totalPecas = 0;
            let totalProduzindo = 0;
            let totalAcabamento = 0;
            let totalPronto = 0;
            let totalEnviado = 0;

            vendas.forEach(venda => {
                const quantidade = parseInt(venda.qtd_produto); // Converte para número
                if (!isNaN(quantidade)) {
                    totalPecas += quantidade;

                    // Contabiliza por status
                    if (venda.produzindo === 1) totalProduzindo += quantidade;
                    if (venda.acabamento === 1) totalAcabamento += quantidade;
                    if (venda.pronto === 1) totalPronto += quantidade;
                    if (venda.enviado === 1) totalEnviado += quantidade;
                }
            });

            // Atualiza os totais no topo
            document.getElementById('totalPecas').textContent = totalPecas;
            document.getElementById('totalProduzindo').textContent = totalProduzindo;
            document.getElementById('totalAcabamento').textContent = totalAcabamento;
            document.getElementById('totalPronto').textContent = totalPronto;
            document.getElementById('totalEnviado').textContent = totalEnviado;

            if (vendas.length === 0) {
                container.innerHTML = `
                    <div class="col-12 text-center">
                        <p class="text-muted">Ainda não tem vendas disponíveis.</p>
                    </div>
                `;
                return;
            }

            vendas.forEach(venda => {
                // Aplica o filtro, se houver
                if (filtro && venda[filtro] !== 1) return;

                const div = document.createElement('div');
                div.className = `col-md-4 mb-3 
                    ${venda.produzindo === 1 ? 'produzindo' : ''} 
                    ${venda.acabamento === 1 ? 'acabamento' : ''} 
                    ${venda.pronto === 1 ? 'pronto' : ''} 
                    ${venda.enviado === 1 ? 'enviado' : ''}`;
                div.innerHTML = `
                    <div class="card h-100">
                        <div class="position-relative">
                            <img src="${venda.imagem_url}" class="card-img-top ${venda.enviado === 1 ? 'enviado-img' : ''}" alt="${venda.sku}">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${venda.sku} - ${venda.variacao}</h5>
                            <p class="card-text">
                                <small class="text-muted">${venda.plataforma}</small><br>
                                Pedido: ${venda.pedido_plataforma}<br>
                                Quantidade: ${venda.qtd_produto}
                            </p>
                            <div class="d-flex gap-2">
                                <button onclick="marcarStatus(${venda.id}, 'produzindo', ${venda.produzindo})" 
                                        class="btn ${venda.produzindo === 1 ? 'btn-info' : 'btn-outline-info'} flex-grow-1">
                                    ${venda.produzindo === 1 ? 'Produzindo ✔' : 'Produzindo'}
                                </button>
                                <button onclick="marcarStatus(${venda.id}, 'acabamento', ${venda.acabamento})" 
                                        class="btn ${venda.acabamento === 1 ? 'btn-danger' : 'btn-outline-danger'} flex-grow-1">
                                    ${venda.acabamento === 1 ? 'Acabamento ✔' : 'Acabamento'}
                                </button>
                                <button onclick="marcarStatus(${venda.id}, 'pronto', ${venda.pronto})" 
                                        class="btn ${venda.pronto === 1 ? 'btn-success' : 'btn-outline-success'} flex-grow-1">
                                    ${venda.pronto === 1 ? 'Pronto ✔' : 'Pronto'}
                                </button>
                                <button onclick="marcarStatus(${venda.id}, 'enviado', ${venda.enviado})" 
                                        class="btn ${venda.enviado === 1 ? 'btn-warning' : 'btn-outline-warning'} flex-grow-1">
                                    ${venda.enviado === 1 ? 'Enviado ✔' : 'Enviado'}
                                </button>
                            </div>
                        </div>
                    </div>
                `;
                container.appendChild(div);
            });
        }

        // Função para filtrar por status
        function filtrarPorStatus(status) {
            filtroAtual = status;
            carregarVendas(status);
        }

        // Função para marcar status
        async function marcarStatus(id, campo, valorAtual) {
            const novoValor = valorAtual === 1 ? 0 : 1;
            await fetch('marcar_status.php', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `id=${id}&campo=${campo}&valor=${novoValor}`
            });
            carregarVendas(filtroAtual); // Recarrega as vendas com o filtro atual
        }

        // Filtro por data
        document.getElementById('dataFiltro').addEventListener('change', () => carregarVendas(filtroAtual));

        // Carregar inicial
        document.addEventListener("DOMContentLoaded", function () {
            const dataAtual = new Date().toISOString().split("T")[0]; // Obtém a data atual no formato YYYY-MM-DD
            document.getElementById("dataFiltro").value = dataAtual; // Define a data atual no campo de filtro
            carregarVendas(); // Carrega as vendas do dia atual
        });
    </script>
</body>
</html>