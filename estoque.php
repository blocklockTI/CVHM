<?php
include 'check_session.php';
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle de Estoque</title>
    <link rel="icon" type="image/png" href="/images/chm.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .badge {
            font-size: 14px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-sm {
            margin: 2px;
        }
        canvas {
            max-width: 100%;
            height: auto !important;
        }
        .disabled-input {
            background-color: #f8f9fa;
            pointer-events: none;
        }
        .total-vendas {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
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
                    <a class="nav-link" href="index.html">VENDAS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="estoque.html">ESTOQUE</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="estoque_cru.html">ESTOQUE CRÚ HENRIQUE</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Total de Vendas -->
        <div class="row">
            <div class="col-md-12 total-vendas">
                <h4>Total de Vendas</h4>
                <div class="mb-3">
                    <select id="filtroTotalVendas" class="form-select" onchange="atualizarTotalVendas()">
                        
                        <option value="semanal">Semanal</option>
                        <option value="mensal">Mensal</option>
                    </select>
                </div>
                <p id="totalShein">Total de Vendas SHEIN: 0</p>
                <p id="totalShopee">Total de Vendas Shopee: 0</p>
                <p id="totalGeral">Total Geral: 0</p>
            </div>
        </div>

        <!-- Tabela de Estoque -->
        <div class="row">
            <div class="col-md-12">
                <h4>Controle de Estoque</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Numeração</th>
                            <th>Quantidade</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody id="estoqueRetiradoLavado">
                        <!-- Dados serão carregados via JavaScript -->
                    </tbody>
                </table>
                <button class="btn btn-primary" onclick="adicionarNumeracao()">Adicionar Numeração</button>
            </div>
        </div>

        <!-- Gráficos -->
        <div class="row mt-4">
    <div class="col-md-6">
        <h5>Peças Mais Vendidas</h5>
        <div class="mb-3">
            <select id="filtroGraficoPizza" class="form-select" onchange="atualizarGraficoPizza()">
                <option value="semanal">Semanal</option>
                <option value="mensal">Mensal</option>
            </select>
        </div>
        <canvas id="graficoPizza"></canvas>
    </div>
    <div class="col-md-6">
        <h5>Tendência de Vendas</h5>
        <div class="mb-3">
            <select id="filtroGraficoLinhas" class="form-select" onchange="atualizarGraficoLinhas()">
                <option value="semanal">Semanal</option>
                <option value="mensal">Mensal</option>
            </select>
        </div>
        <canvas id="graficoLinhas"></canvas>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Função para carregar o estoque
        async function carregarEstoque() {
            const response = await fetch('listar_estoque.php');
            const data = await response.json();

            // Atualiza a tabela de Retirado Lavado
            const estoqueRetiradoLavado = document.getElementById('estoqueRetiradoLavado');
            estoqueRetiradoLavado.innerHTML = '';
            data.estoque_materia_prima.forEach(item => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${item.numeracao}</td>
                    <td>
                        <input type="number" class="form-control disabled-input" value="${item.quantidade}" id="input-${item.id}" readonly>
                    </td>
                    <td>
                        <button onclick="editarQuantidade(${item.id})" class="btn btn-warning btn-sm" id="btn-editar-${item.id}">Editar</button>
                        <button onclick="removerItem(${item.id}, 'retirado-lavado')" class="btn btn-danger btn-sm">Remover</button>
                    </td>
                `;
                estoqueRetiradoLavado.appendChild(row);
            });

            // Atualiza os gráficos e totais
            atualizarGraficoPizza();
            atualizarGraficoLinhas();
            atualizarTotalVendas();
        }

        // Função para editar/salvar a quantidade
function editarQuantidade(id) {
    const input = document.getElementById(`input-${id}`);
    const btnEditar = document.getElementById(`btn-editar-${id}`);

    if (btnEditar.textContent === "Editar") {
        // Libera o campo para edição
        input.classList.remove('disabled-input');
        input.readOnly = false;
        input.focus();
        btnEditar.textContent = "Salvar";
        btnEditar.classList.remove('btn-warning');
        btnEditar.classList.add('btn-success');
    } else {
        // Bloqueia o campo após salvar
        const quantidade = input.value;
        if (quantidade === "" || isNaN(quantidade)) {
            alert("Por favor, insira uma quantidade válida.");
            return;
        }

        atualizarEstoque(id, 'materia_prima', quantidade); // Atualiza o estoque
        input.classList.add('disabled-input');
        input.readOnly = true;
        btnEditar.textContent = "Editar";
        btnEditar.classList.remove('btn-success');
        btnEditar.classList.add('btn-warning');
    }
}

// Função para atualizar o estoque
async function atualizarEstoque(id, tipo, quantidade) {
    const response = await fetch('atualizar_estoque.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `id=${id}&tipo=${tipo}&quantidade=${quantidade}&acao=atualizar`
    });

    const resultado = await response.json();
    if (resultado.status === "success") {
        alert(resultado.message);
        carregarEstoque(); // Recarrega o estoque após a atualização
    } else {
        alert("Erro: " + resultado.message);
    }
}

// Função para remover item do estoque
async function removerItem(id, tipo) {
    if (!confirm("Tem certeza que deseja remover este item?")) return;

    const response = await fetch('atualizar_estoque.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `id=${id}&tipo=${tipo}&acao=remover`
    });

    const resultado = await response.json();
    if (resultado.status === "success") {
        alert(resultado.message);
        carregarEstoque(); // Recarrega o estoque após a remoção
    } else {
        alert("Erro: " + resultado.message);
    }
}

        // Função para adicionar nova numeração
        async function adicionarNumeracao() {
            const numeracao = prompt("Digite a nova numeração:");
            if (numeracao) {
                await fetch('adicionar_numeracao.php', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    body: `numeracao=${numeracao}&quantidade=0&tipo=retirado-lavado`
                });
                carregarEstoque(); // Recarrega o estoque após adicionar
            }
        }

        // Variáveis globais para os gráficos
let graficoPizza = null;
let graficoLinhas = null;

// Função para atualizar o gráfico de pizza
async function atualizarGraficoPizza() {
    const filtro = document.getElementById('filtroGraficoPizza').value;
    const response = await fetch(`listar_vendas_grafico.php?filtro=${filtro}`);
    const data = await response.json();

    const ctxPizza = document.getElementById('graficoPizza').getContext('2d');

    // Destrói o gráfico anterior, se existir
    if (graficoPizza) {
        graficoPizza.destroy();
    }

    // Cria um novo gráfico
    graficoPizza = new Chart(ctxPizza, {
        type: 'pie',
        data: {
            labels: data.labels,
            datasets: [{
                label: 'Peças Mais Vendidas',
                data: data.valores,
                backgroundColor: [
                    '#0dcaf0', '#dc3545', '#198754', '#ff6a00', '#6610f2', '#6f42c1', '#d63384'
                ],
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Peças Mais Vendidas'
                }
            }
        }
    });
}

// Função para atualizar o gráfico de linhas
async function atualizarGraficoLinhas() {
    const filtro = document.getElementById('filtroGraficoLinhas').value;
    const response = await fetch(`listar_vendas_grafico.php?filtro=${filtro}`);
    const data = await response.json();

    const ctxLinhas = document.getElementById('graficoLinhas').getContext('2d');

    // Destrói o gráfico anterior, se existir
    if (graficoLinhas) {
        graficoLinhas.destroy();
    }

    // Cria um novo gráfico
    graficoLinhas = new Chart(ctxLinhas, {
        type: 'line',
        data: {
            labels: data.labels,
            datasets: [{
                label: 'Vendas Mensais',
                data: data.valores,
                borderColor: '#ff6a00',
                fill: false,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Tendência de Vendas'
                }
            }
        }
    });
}

// Carregar gráficos ao abrir a página
document.addEventListener("DOMContentLoaded", function () {
    atualizarGraficoPizza();
    atualizarGraficoLinhas();
});

        // Função para atualizar o total de vendas
        async function atualizarTotalVendas() {
            const filtro = document.getElementById('filtroTotalVendas').value;
            const response = await fetch(`listar_total_vendas.php?filtro=${filtro}`);
            const data = await response.json();

            document.getElementById('totalShein').textContent = `Total de Vendas SHEIN: ${data.totalShein}`;
            document.getElementById('totalShopee').textContent = `Total de Vendas Shopee: ${data.totalShopee}`;
            document.getElementById('totalGeral').textContent = `Total Geral: ${data.totalGeral}`;
        }

        // Carregar estoque ao abrir a página
        document.addEventListener("DOMContentLoaded", function () {
            carregarEstoque();
        });
    </script>
</body>
</html>
