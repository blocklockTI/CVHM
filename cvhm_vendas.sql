-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06/03/2025 às 12:20
-- Versão do servidor: 10.6.21-MariaDB-cll-lve
-- Versão do PHP: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cvhm_vendas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_materia_prima`
--

CREATE TABLE `estoque_materia_prima` (
  `id` int(11) NOT NULL,
  `numeracao` varchar(10) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `estoque_materia_prima`
--

INSERT INTO `estoque_materia_prima` (`id`, `numeracao`, `quantidade`) VALUES
(1, '38', 212),
(2, '40', 114),
(3, '42', 118),
(4, '44', 69),
(5, '46', 124),
(6, '48', 88),
(7, '50', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `materia_prima_secundaria`
--

CREATE TABLE `materia_prima_secundaria` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `materia_prima_secundaria`
--

INSERT INTO `materia_prima_secundaria` (`id`, `descricao`, `quantidade`) VALUES
(1, '38', 221),
(2, '40', 8),
(3, '42', 169),
(4, '44', 60),
(5, '46', 25),
(6, '48', 113);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `lida` tinyint(1) DEFAULT 0,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT NULL,
  `imagem` text DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `departamento` enum('administrador','operacional') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nome`, `departamento`, `created_at`) VALUES
(1, 'filipi', '$2y$10$xy9eTRJ1QE15n2DibA0xaep9ByBjmHCpzQGqsgn.gbhC2eRIWxd0S', 'Filipi Cardoso', 'administrador', '2025-03-06 13:59:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `pedido_plataforma` varchar(50) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `variacao` varchar(50) NOT NULL,
  `imagem_url` varchar(255) NOT NULL,
  `data_venda` datetime NOT NULL,
  `pronto` tinyint(1) DEFAULT 0,
  `plataforma` varchar(50) NOT NULL,
  `enviado` tinyint(1) DEFAULT 0,
  `produzindo` tinyint(1) DEFAULT 0,
  `acabamento` tinyint(1) DEFAULT 0,
  `qtd_produto` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `pedido_plataforma`, `sku`, `variacao`, `imagem_url`, `data_venda`, `pronto`, `plataforma`, `enviado`, `produzindo`, `acabamento`, `qtd_produto`) VALUES
(77, 'GSH1NN24B00MFWU', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-20 13:03:27', 0, 'Shein', 1, 0, 0, 1),
(78, 'GSH1NN24B00MFWU', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-20 13:03:27', 0, 'Shein', 1, 0, 0, 1),
(79, 'GSH1NN24B00MFWU', 'GringVerde-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/87/17328399902e6e28ae053eb454dd51dbefc3f28b0f_thumbnail_220x293.jpg', '2025-02-20 13:03:27', 0, 'Shein', 1, 0, 0, 1),
(80, '250220P9PG6FSE', 'raio-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-20 13:03:27', 0, 'Shopee', 1, 0, 0, 1),
(81, '250220P4XEJJHR', 'Emoji-X-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-20 13:03:27', 0, 'Shopee', 1, 0, 0, 1),
(82, '250220P8P3M6E5', 'emoji-azul', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-20 13:03:27', 0, 'Shopee', 1, 0, 0, 1),
(83, '250221PYMXCHJW', 'UrsoPink-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd0396h9z5cd_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(84, 'GSH1NN24B00MFWU', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(85, 'GSH1NN24B00MFWU', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(86, 'GSH1NN24B00MFWU', 'GringVerde-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/87/17328399902e6e28ae053eb454dd51dbefc3f28b0f_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(87, 'GSH1N143N000USR', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(88, 'GSH1N149400197L', 'urbanxadrez-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(89, 'GSH1N1250001UXB', 'urbanwave-caveira-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/05/4d/17201901783c211efc37349fadbb43cdc72407e722_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(90, '250221PS6AH6GN', 'stelar-46', 'Azul,46', 'https://cf.shopee.com.br/file/sg-11134201-7rdxu-lyve5wgs6vqg3b_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(91, 'GSH1N120T000EYJ', 'skullsplash-Preto-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/bc/171954935022f7ff3af92dbb2cbebe7ccdf275d0a1_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(92, 'GSH1N141C000ECB', 'skullsplash-Preto-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/bc/171954935022f7ff3af92dbb2cbebe7ccdf275d0a1_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(93, 'GSH1N102400N4NN', 'skullsplash-Preto-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/bc/171954935022f7ff3af92dbb2cbebe7ccdf275d0a1_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(94, 'GSH1N153T00NTKK', 'short-urbanx-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(95, 'GSH1N101C000UQP', 'short-urbanx-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(96, 'GSH1N133100NVFU', 'raioazul-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(97, '250221QYJ2298B', 'raio-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(98, '250221Q7K57F3S', 'raio-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(99, 'GSH1N1073001CEX', 'GringVerde-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/87/17328399902e6e28ae053eb454dd51dbefc3f28b0f_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(100, '250221QB68A786', 'GringBlackLimpo', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(101, '250221QP4B1M2C', 'GringBlackLimpo', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(102, 'GSH1N157000MKQR', 'GringBlack-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(103, 'GSH1N154200NDMD', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(104, 'GSH1N1440001E0V', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(105, '250221Q33HE0QD', 'GringBlack', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzguvdca2_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(106, '250221PFR72Q2W', 'gringbear-42', '42', 'https://cf.shopee.com.br/file/e8547b40c8c68f98ca28ce6a5ec48660_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(107, '250221Q49HBND6', 'GraySky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(108, '250221QBQMA5FQ', 'GraySky-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(109, '250221Q9Y5137X', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(110, 'GSH1N144U00NSRT', 'GraySky-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(111, '250221Q8U24H3J', 'FullBlack-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(112, 'GSH1N144Q00028A', 'emoji-red-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-02-21 06:01:57', 0, 'Shein', 1, 0, 0, 1),
(113, '250221Q6BC1YP6', 'emoji-red-38', 'Preto,38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(114, '250221PPRJCFXF', 'BlacklowSky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(115, '250221Q9QD48SU', 'BlacklowSky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(116, '250221PPE7FQSW', 'BlackList', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgw9xs4b_tn', '2025-02-21 06:01:57', 0, 'Shopee', 1, 0, 0, 1),
(117, 'GSH1N133800MPMQ', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(118, 'GSH1N263T000P02', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(119, 'GSH1N2129002QNA', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(120, '250223UCTABWRM', 'UrsoFend-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(121, 'GSH1NU07A00NG39', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(122, 'GSH1N260A00M62L', 'ursofend-46', 'Preto-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(123, 'GSH1NC30300NF6G', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(124, '2502241XER7A9G', 'UrsoFend-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(125, '250222SRCTXSEK', 'UrsoFend-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(126, 'GSH1N247C00N5B3', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(127, 'GSH1N247C00N5B3', 'short-urbanx-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(128, 'GSH1N239300NJQC', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(129, 'GSH1N232Q0015N4', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(130, 'GSH1NU19000NH9B', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(131, '250223VHD4EV9B', 'UrsoFend-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(132, 'GSH1N218B00MKV7', 'ursofend-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(133, '2502241Q28U0CR', 'UrsoFend-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(134, '25022417Y4RP5X', 'ursochm-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd039661fl2d_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(135, 'GSH1N219A002QV7', 'urso-ber-limpo-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/10/1719522715a73bc0beb6dfff8f8106b2499dac26bd_square_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(136, 'GSH1NC40N000HHU', 'urso-ber-limpo-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/10/1719522715a73bc0beb6dfff8f8106b2499dac26bd_square_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(137, 'GSH1N2312002WEX', 'urbanxadrez-46', 'Azul-46', 'http://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(138, 'GSH1NU39F002MA7', 'urbanxadrez-46', 'Azul-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(139, 'GSH1N147B0001PT', 'urbanxadrez-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(140, 'GSH1N1468000J3Q', 'urbanxadrez-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(141, 'GSH1N1468000J3Q', 'UrsoPink-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/08/43/1736272323a9df5c29d053866306b79a97c8eb7115_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(142, 'GSH1N102700MPX0', 'urbanxadrez-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(143, '250223UMU36JKU', 'urbanwave-caveira-44', 'Azul,44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lv3ykx11m1t546_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(144, 'GSH1N250U000V68', 'stelar-46', 'Azul-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(145, 'GSH1N230Q00048N', 'stelar-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(146, 'GSH1NU54F002CHU', 'stelar-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(147, 'GSH1N157F0000TH', 'skullsplash-Preto-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/bc/171954935022f7ff3af92dbb2cbebe7ccdf275d0a1_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(148, 'GSH1N118X00MU16', 'short-urbanx-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(149, 'GSH1NU45M0005V2', 'short-urbanx-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(150, 'GSH1N209100NWHW', 'raioazul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(151, 'GSH1N228Q00MUKU', 'raioazul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(152, 'GSH1NC07U00NE5X', 'raioazul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(153, 'GSH1NU42F00NAMN', 'raioazul-46', 'Azul-46', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(154, 'GSH1NU42F00NAMN', 'ursofend-46', 'Preto-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(155, 'GSH1NC01W000Q46', 'raioazul-46', 'Azul-46', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(156, 'GSH1NU54000M7Q2', 'raioazul-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(157, 'GSH1NC58W00NMQJ', 'raioazul-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(158, 'GSH1N248A0012E1', 'FullBlack-42', 'Preto-42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(159, 'GSH1NC02U00M2HS', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(160, 'GSH1NU06N0019YD', 'raioazul-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(161, '250222S56TANXW', 'raio-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(162, '250222TT7QNU92', 'raio-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(163, '250222U4WJ7Q0J', 'raio-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(164, '250222U4WJ7Q0J', 'emoji-azul', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(165, '250222RVAJ6NPE', 'raio-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(166, '2502240T0G385Q', 'raio-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(167, '250223VHXN7KJV', 'raio-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(168, 'GSH1NC48200N3RT', 'OP:024-42', 'Branco-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/d5/1720016078803d74ec4ab94606bc8a3f7a784568e1_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(169, 'GSH1NC48200N3RT', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(170, 'GSH1NC48200N3RT', 'stelar-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(171, '250222S6W3X5KR', 'GringBlackLimpo', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(172, '250222S6W3X5KR', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(173, '2502240XY6DJH1', 'GringBlackLimpo', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(174, '2502240XY6DJH1', 'Emoji-X-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(175, '250223V87UAFFD', 'GringBlackLimpo', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(176, '250223V87UAFFD', 'emoji-red-42', 'Preto,42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(177, '250222RXC1FS2Q', 'GringBlackLimpo', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(178, 'GSH1N233N00NLEK', 'GringBlack-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(179, 'GSH1N233N00NLEK', 'raioazul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(180, 'GSH1N206100N49F', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(181, 'GSH1NC48200NQDD', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(182, 'GSH1NC26C001ERM', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(183, 'GSH1N113800MBC8', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(184, 'GSH1N213Q001KG9', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(185, 'GSH1NU27B00ML1U', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(186, 'GSH1NU03B001YSK', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(187, '250223UWFYSVCB', 'gringbear-38', '38', 'https://cf.shopee.com.br/file/e8547b40c8c68f98ca28ce6a5ec48660_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(188, '2502230QRY7V7S', 'gringbear-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(189, '250222RXJ06UMJ', 'GraySky-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(190, '250222SVSH6KUU', 'GraySky-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(191, '250222RWV475TK', 'GraySky-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(192, 'GSH1N219300MPXP', 'GraySky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(193, 'GSH1NC190001E92', 'GraySky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(194, '250223USVK7HW5', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(195, '250223USVK7HW5', 'UrsoFend-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(196, '250222T02VF0TR', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(197, '250222T02VF0TR', 'emoji-azul', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(198, '250221RMJ3FDER', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(199, '250223V51S0MSV', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(200, 'GSH1NU23W000SE7', 'GraySky-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(201, '2502240SVQVAA5', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(202, '250223URUYVU4M', 'FullBlack-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(203, '2502240R222TQ8', 'FullBlack-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(204, 'GSH1NC086002924', 'EmojiSky-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(205, '2502240WQ4NGQQ', 'Emoji-X-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(206, '250223VWK65CR8', 'emoji-red-40', 'Preto,40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(207, '2502241JEBQWR5', 'emoji-red-40', 'Preto,40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(208, 'GSH1NU55U001KJ3', 'emoji-azul-48', 'Azul-48', 'http://img.ltwebstatic.com/images3_spmp/2024/11/02/6a/17304840356229ee8944cb84b6cdfc8200aed14253_square_thumbnail_220x293.png', '2025-02-24 06:09:56', 0, 'Shein', 1, 0, 0, 1),
(209, '2502230BKXY43W', 'emoji-azul', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(210, '2502241YWT0QJG', 'emoji-azul', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(211, '250223UQCCVD4S', 'BlueSky', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgp93k09_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(212, '250222SXXNRKHE', 'BlacklowSky-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(213, '250223VMFYQVRJ', 'BlacklowSky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(214, '250222S2P01MSF', 'BlacklowSky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-24 06:09:56', 0, 'Shopee', 1, 0, 0, 1),
(215, '2502242J3HRB2V', 'FullBlack-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-24 06:26:01', 0, 'Shopee', 1, 0, 0, 1),
(216, '2502242J3HRB2V', 'BlacklowSky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-24 06:26:01', 0, 'Shopee', 1, 0, 0, 1),
(217, 'GSH1NW43T00NGQW', 'emoji-red-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(218, 'GSH1NW11Q000A6E', 'ursofend-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(219, 'GSH1NW05400NWBU', 'raioazul-46', 'Azul-46', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(220, 'GSH1NW05400NWBU', 'urbanwave-caveira-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/05/4d/17201901783c211efc37349fadbb43cdc72407e722_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(221, 'GSH1NW303002RD3', 'ursofend-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(222, 'GSH1NW50300207D', 'Gringbear-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2025/02/12/2e/1739293495c54e58c0820af183aed2e01e7ff97782_square_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(223, '250225491MWJ0N', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(224, 'GSH1NW543000AF8', 'EmojiSky-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(225, '25022547U3TMVP', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(226, 'GSH1NW2030004H0', 'stelar-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(227, '25022547APBPVU', '139829121372', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lvu9vlisjerab4_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(228, '250225468NA3XT', 'raio-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(229, '25022543W4PK70', 'gringbear-42', '42', 'https://cf.shopee.com.br/file/e8547b40c8c68f98ca28ce6a5ec48660_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(230, 'GSH1NW18U002Q6R', 'urbanwave-caveira-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/05/4d/17201901783c211efc37349fadbb43cdc72407e722_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(231, 'GSH1NW18U002Q6R', 'short-urbanx-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(232, 'GSH1NW05C00NMJY', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(233, '25022541UESACV', 'emoji-azul', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(234, '25022540HY7R0A', 'emoji-red-38', 'Preto,38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(235, '2502253TX9JJ46', 'Emoji-X-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(236, '2502253R1B1H94', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(237, 'GSH1NW19N000DC8', 'raioazul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(238, 'GSH1NW331001PUT', 'urbanwave-caveira-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/05/4d/17201901783c211efc37349fadbb43cdc72407e722_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(239, 'GSH1NW05000NGXA', 'emoji-azul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/02/6a/17304840356229ee8944cb84b6cdfc8200aed14253_square_thumbnail_220x293.png', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(240, 'GSH1NW05000NGXA', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(241, '2502253CHFT10E', 'gringbear-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(242, '25022538UTQR0Q', 'gringbear-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(243, 'GSH1NC61900MKAT', 'ursofend-46', 'Preto-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(244, '250224357FHP0S', 'GringVerde', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088ejv7a1_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(245, 'GSH1NC55A00MUX5', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-25 06:04:14', 0, 'Shein', 1, 0, 0, 1),
(246, '250224335AE6CE', 'UrsoFend-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(247, '25022430EFCAYJ', 'raio-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(248, '2502242YX0YN64', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(249, '2502242YKK8305', 'GraySky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-25 06:04:14', 0, 'Shopee', 1, 0, 0, 1),
(250, 'GSH1NW438000HEY', 'emoji-red-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-02-25 08:28:36', 0, 'Shein', 1, 0, 0, 1),
(251, 'GSH1NW438000HEY', 'emoji-red-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-02-25 17:25:19', 0, 'Shein', 1, 0, 0, 1),
(252, '2502242PCKPU3U', 'GringVerde', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088ejv7a1_tn', '2025-02-26 06:07:31', 0, 'Shopee', 1, 0, 0, 1),
(253, '2502266T28U64Y', 'Emoji-X-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(254, '2502266SRY9H4R', 'GringVerde', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088ejv7a1_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(255, '2502266R83BBAH', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(256, '2502266A6H3F2P', 'ursochm-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd039661fl2d_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(257, 'GSH1N323M00MC4Q', 'raioazul-38', 'Azul-38', 'http://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-26 06:08:18', 0, 'Shein', 1, 0, 0, 1),
(258, 'GSH1N327M001EC3', 'GraySky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-26 06:08:18', 0, 'Shein', 1, 0, 0, 1),
(259, '25022660NTQXQ4', 'UrsoFend-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(260, 'GSH1N339000ML31', 'emoji-red-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-02-26 06:08:18', 0, 'Shein', 1, 0, 0, 1),
(261, 'GSH1NW21F001XFA', 'stelar-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-26 06:08:18', 0, 'Shein', 1, 0, 0, 1),
(262, '2502255PPVGPXY', 'ursochm-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd039661fl2d_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(263, 'GSH1NW49A00MGX9', 'raioazul-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-26 06:08:18', 0, 'Shein', 1, 0, 0, 1),
(264, '2502255HWGXPG7', 'emoji-azul', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-26 06:08:18', 0, 'Shopee', 1, 0, 0, 1),
(265, '2502267MCJJ4TR', 'gringbear-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-26 08:11:59', 0, 'Shopee', 1, 0, 0, 1),
(266, '2502267RSP88Y9', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-26 08:11:59', 0, 'Shopee', 1, 0, 0, 1),
(267, '2502267XX9MF8D', 'UrsoFend-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-26 10:29:44', 0, 'Shopee', 1, 0, 0, 1),
(268, '2502267XX9MF8D', 'gringbear-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-26 10:29:44', 0, 'Shopee', 1, 0, 0, 1),
(269, '25022680ASDX5C', 'FullBlack-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-26 10:29:44', 0, 'Shopee', 1, 0, 0, 1),
(271, 'GSH1N459500NS2U', 'short-urbanx-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/ab/17200178280a2a765c3706dc2c0cc989843571a47c_thumbnail_220x293.jpg', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(272, 'GSH1N407400M4UB', 'ursofend-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(273, '2502279E62NFV3', 'GringBlackLimpo', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(274, 'GSH1N4513002CHT', 'urbanxadrez-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(275, '25022798GTCBCA', 'Emoji-X-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(276, '25022795D76TJG', 'UrsoFend-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(277, '25022794Y6YS6G', 'GringBlackLimpo', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(278, '25022794Y6YS6G', 'ursochm-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd039661fl2d_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(279, '25022792A64JVT', 'BlacklowSky-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(280, '25022790P42VNC', 'Emoji-X-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(281, '2502278VJ49BB7', 'gringbear-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(282, '2502278TQJ9BXU', 'GraySky-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(283, 'GSH1N445100N0BB', 'raioazul-38', 'Azul-38', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(284, '2502278R6DEECJ', 'UrsoFend-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(285, '2502278N472QBQ', 'emoji-azul', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(286, '2502278FCWXS5Y', 'Emoji-X-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-27 06:18:16', 0, 'Shopee', 1, 0, 0, 1),
(287, 'GSH1N334B000K4N', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(288, 'GSH1N350B0001D9', 'GraySky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(289, 'GSH1N350B0001D9', 'BlacklowSky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/62/1736789305217b1eba933f91bb6f944c00125b1c09_square_thumbnail_220x293.png', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(290, 'GSH1N352R000ALD', 'emoji-azul-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/11/02/6a/17304840356229ee8944cb84b6cdfc8200aed14253_square_thumbnail_220x293.png', '2025-02-27 06:18:16', 0, 'Shein', 1, 0, 0, 1),
(291, '250227A5TA4ANY', 'GraySky-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-27 08:26:14', 0, 'Shopee', 1, 0, 0, 1),
(292, '250227AP3Y7K9B', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-27 12:09:11', 0, 'Shopee', 1, 0, 0, 1),
(293, '2502266Q4MEPT8', 'raio-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(294, 'GSH1NQ12T000EP0', 'GraySky-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/4b/173678922694e21215523b604760141b6341ed9c5f_square_thumbnail_220x293.png', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(295, 'GSH1NQ48T001D7S', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(296, 'GSH1NQ52400NGYX', 'EmojiSky-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(297, '250228BPS5K084', 'BlackList', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgw9xs4b_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(298, '250228BPAUSG82', 'Emoji-X-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(299, '250228BNBTYWDB', 'UrsoFend-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(300, 'GSH1NQ07C00MB3S', 'BlackList-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2025/02/06/b7/173884545770070cb5cfa28bb8337272ea97cbb5e0_square_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(301, '250228BFX8U1E3', 'UrsoFend-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(302, 'GSH1NQ352002QCT', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(303, 'GSH1NQ62200ML3W', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(304, '250228B9J63V01', 'GringVerde', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088ejv7a1_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(305, '250228B9J63V01', 'Emoji-X-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(306, '250228B9J63V01', 'UrsoPink-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd0396h9z5cd_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(307, '250228B9J63V01', 'emoji-red-40', 'Preto,40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(308, '250228B46SG3NA', 'UrsoFend-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(309, '250228B1QV3WN2', 'FullBlack-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(310, 'GSH1NQ25M000HEH', 'ursofend-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(311, '250228AW87EWDG', 'UrsoPink-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd0396h9z5cd_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(312, 'GSH1N454B00N145', 'BlackList-48', 'Preto-48', 'http://img.ltwebstatic.com/images3_spmp/2025/02/06/b7/173884545770070cb5cfa28bb8337272ea97cbb5e0_square_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(313, '250227AQUJSFF5', 'GringBlackLimpo', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(314, '250227AQUJSFF5', 'GraySky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-28 06:02:30', 0, 'Shopee', 1, 0, 0, 1),
(315, 'GSH1N401A00062X', 'stelar-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-02-28 06:02:30', 0, 'Shein', 1, 0, 0, 1),
(316, '250228CJWB8XBS', 'GringBlackLimpo', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-28 06:06:29', 0, 'Shopee', 1, 0, 0, 1),
(317, '250228CRBXU5VW', 'skullsplash-Preto-48', 'Preto,48', 'https://cf.shopee.com.br/file/sg-11134201-7rd5j-lxa98thbd6xy83_tn', '2025-02-28 07:47:47', 0, 'Shopee', 1, 0, 0, 1),
(318, '250228CRBXU5VW', 'EmojiSky-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m5mw2hk4topcb4_tn', '2025-02-28 07:47:47', 0, 'Shopee', 1, 0, 0, 1),
(319, '250228CK3DTUQU', 'raio-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-02-28 07:47:47', 0, 'Shopee', 1, 0, 0, 1),
(320, 'GSH1NQ188000VK7', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-02-28 08:32:34', 0, 'Shein', 1, 0, 0, 1),
(321, '250228CUKPMBRF', 'BlacklowSky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-02-28 08:46:36', 0, 'Shopee', 1, 0, 0, 1),
(322, '250228D76AH76A', 'GringBlackLimpo', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-02-28 15:39:36', 0, 'Shopee', 1, 0, 0, 1),
(323, '250228D8MRAM3W', 'GraySky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-02-28 15:39:36', 0, 'Shopee', 1, 0, 0, 1),
(324, '250301DF9QA3NW', 'emoji-red-40', 'Preto,40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-02-28 15:41:55', 0, 'Shopee', 1, 0, 0, 1),
(325, 'GSH1N622600026T', 'urbanxadrez-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(326, '250303KPFT62Q2', 'emoji-azul', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(327, '250303KP3AN7G3', 'raio-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-03 06:07:00', 0, 'Shopee', 0, 1, 0, 1),
(328, 'GSH1N659Q00NHPR', 'SkyBasic-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/16/1732841141485af202ea4dc4e677eb8bbb6862639f_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 1, 'Shein', 0, 0, 0, 1),
(329, 'GSH1N659Q00NHPR', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(330, 'GSH1N643400047W', 'GringBlackLimpo-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/68/1732839597ebe0e26b8dcadadc6187a247aa1b78e6_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(331, 'GSH1N643400047W', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(332, '250303KAHEH13M', 'GraySky-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(333, 'GSH1N657W00MV3S', 'EmojiSky-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(334, '250303JXSUE31J', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(335, 'GSH1N6251000QT7', 'RaioLaranja-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/cd/17328429616f10efa8120a07810f4308681a9336f0_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(336, 'GSH1N607N00NB3T', 'stelar-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(337, '250303JNB7TRC9', 'raio-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-03 06:07:00', 0, 'Shopee', 0, 1, 0, 1);
INSERT INTO `vendas` (`id`, `pedido_plataforma`, `sku`, `variacao`, `imagem_url`, `data_venda`, `pronto`, `plataforma`, `enviado`, `produzindo`, `acabamento`, `qtd_produto`) VALUES
(338, 'GSH1N633M0017UX', 'BlacklowSky-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2025/01/14/62/1736789305217b1eba933f91bb6f944c00125b1c09_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(339, '250303JJUSB0DT', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(340, 'GSH1N6120001236', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(341, 'GSH1N540B001Y4J', 'stelar-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(342, 'GSH1N557A000BJ5', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(343, 'GSH1N528900M7LK', 'OP:024-46', 'Branco-46', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/d5/1720016078803d74ec4ab94606bc8a3f7a784568e1_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(344, '250302J283QRK1', 'GringVerde', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088ejv7a1_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(345, '250302HUKTQCWD', 'GraySky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(346, '250302HUGGV5QH', 'gringbear-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(347, '250302H87VCTXF', 'raio-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-03 06:07:00', 0, 'Shopee', 0, 1, 0, 1),
(348, 'GSH1N524Q00053S', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(349, 'GSH1N5244002TES', 'ursofend-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(350, 'GSH1N5074001U4G', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(351, 'GSH1N564W00NBSU', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(352, '250302GFCPF7FX', 'FullBlack-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(353, 'GSH1N545200NA4K', 'emoji-red-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(354, '250302GCJEPFHR', 'raio-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-03 06:07:00', 0, 'Shopee', 0, 1, 0, 1),
(355, 'GSH1N507N00NML4', 'UrsoPink-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2025/01/08/43/1736272323a9df5c29d053866306b79a97c8eb7115_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(356, 'GSH1N507N00NML4', 'emoji-red-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(357, 'GSH1N530M0018VA', 'emoji-red-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(358, 'GSH1N541M000HKW', 'stelar-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(359, 'GSH1N541M000HKW', 'urbanxadrez-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(360, 'GSH1NT32F00NTGG', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(361, '250302FV4BHE6K', 'FullBlack-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(362, '250302FUWQSU39', 'GraySky-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(363, 'GSH1NT36A001CSF', 'stelar-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(364, '250301F861QK2J', 'emoji-azul', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(365, 'GSH1NT37T001VV7', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(366, '250301EH906CGY', 'dvdcrespingo42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7nslx43_tn', '2025-03-03 06:07:00', 1, 'Shopee', 0, 0, 0, 1),
(367, 'GSH1NT22W000V18', 'Emoji-X-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2025/02/06/c8/17388456633ec05c67ed6e221dff7b00452d5c1504_square_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(368, 'GSH1NT22W000V18', 'emoji-azul-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/02/6a/17304840356229ee8944cb84b6cdfc8200aed14253_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(369, '250301E3H1434V', 'raio-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-03 06:07:00', 0, 'Shopee', 0, 1, 0, 1),
(370, '250301E36EJ2XM', 'Emoji-X-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzh0hn479_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(371, '250301E1CCSF8M', 'GraySky-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(372, 'GSH1NT10U001UPR', 'GringBlack-42', 'Preto-42', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(373, '250301E0ME22VS', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(374, 'GSH1NT32U00M26E', 'GringBlack-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(375, 'GSH1NT63100N6C1', 'skullsplash-Preto-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/06/28/bc/171954935022f7ff3af92dbb2cbebe7ccdf275d0a1_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(376, 'GSH1NT63100N6C1', 'urbanxadrez-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/8f/1720018278eb24750ac0f4530b287d86d800655d1f_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 1, 'Shein', 0, 0, 0, 1),
(377, '250301DPHQPGWK', 'short-urbanx-46', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lvcpcjwipavlb1_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(378, '250301DPHQPGWK', 'emoji-azul', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7rzmt20_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(379, '250301DK2ENC7N', 'BlackList', '46', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgw9xs4b_tn', '2025-03-03 06:07:00', 0, 'Shopee', 1, 0, 0, 1),
(380, 'GSH1NT47M00N8EU', 'GringBlack-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(381, 'GSH1NQ02F000U77', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(382, 'GSH1NQ51B001C7F', 'stelar-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(383, 'GSH1NQ31A00NBKB', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(384, 'GSH1NQ55900NV0P', 'GringBlack-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/b0/1732838774bb66df697a80b1d68e6b65d929c65b84_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 1, 0, 0, 1),
(385, 'GSH1NQ64900NH6T', 'stelar-40', 'Azul-40', 'https://img.ltwebstatic.com/images3_spmp/2024/07/03/75/17200155856995bc9f6a293ba39a8f73088c599cc8_thumbnail_220x293.jpg', '2025-03-03 06:07:00', 0, 'Shein', 0, 1, 0, 1),
(386, 'GSH1NX57500MWYU', 'EmojiSky-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-03-04 06:02:15', 0, 'Shein', 0, 0, 1, 1),
(387, '250304P235EK46', 'FullBlack-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-03-04 06:02:15', 1, 'Shopee', 0, 0, 0, 1),
(388, '250304P235EK46', 'BlacklowSky-38', '38', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-03-04 06:02:15', 0, 'Shopee', 0, 1, 0, 1),
(389, '250304NYUD2EYM', 'UrsoFend-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lxgy1k2hzvxybf_tn', '2025-03-04 06:02:15', 0, 'Shopee', 1, 0, 0, 1),
(390, 'GSH1NX60U00MKGR', 'ursofend-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/07/22/db/1721612512d147c1d7bc9e9853af6f9a9f92c79de1_square_thumbnail_220x293.png', '2025-03-04 06:02:15', 0, 'Shein', 1, 0, 0, 1),
(391, '250304NC3XHQU5', 'gringbear-42', '42', 'https://cf.shopee.com.br/file/e8547b40c8c68f98ca28ce6a5ec48660_tn', '2025-03-04 06:02:15', 0, 'Shopee', 0, 0, 0, 1),
(392, '250304N7R5TERU', 'GringBlackLimpo', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-03-04 06:02:15', 0, 'Shopee', 1, 0, 0, 1),
(393, '250304N60K7C0B', 'GraySky-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-04 06:02:15', 0, 'Shopee', 1, 0, 0, 1),
(394, 'GSH1N632F001L7C', 'raioazul-42', 'Azul-42', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-03-04 06:02:15', 0, 'Shein', 1, 0, 0, 1),
(395, '250304MVAWKNFU', 'gringbear-42', '42', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-03-04 06:02:15', 0, 'Shopee', 0, 0, 0, 1),
(396, '250303MTRJTFAR', 'GraySky-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3jmo5a3_tn', '2025-03-04 06:02:15', 0, 'Shopee', 1, 0, 0, 1),
(397, '250303MT68CX02', 'raio-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lyr48wc7jku944_tn', '2025-03-04 06:02:15', 0, 'Shopee', 0, 1, 0, 1),
(398, 'GSH1N620A0024S2', 'GringBlackLimpo-38', 'Preto-38', 'https://img.ltwebstatic.com/images3_spmp/2024/11/29/68/1732839597ebe0e26b8dcadadc6187a247aa1b78e6_square_thumbnail_220x293.png', '2025-03-04 06:02:15', 0, 'Shein', 1, 0, 0, 1),
(399, '250303MKXV90XN', 'GringBlackLimpo', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m35ne088hd037d_tn', '2025-03-04 06:02:15', 0, 'Shopee', 1, 0, 0, 1),
(400, 'GSH1NY61600N47X', 'Emoji-X-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2025/02/06/c8/17388456633ec05c67ed6e221dff7b00452d5c1504_square_thumbnail_220x293.jpg', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(401, '250305R6WD75Y0', 'emoji-red-40', 'Preto,40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-lzhzyexy06mtc3_tn', '2025-03-05 06:03:41', 0, 'Shopee', 0, 0, 0, 1),
(402, 'GSH1NY31M00NPS1', 'EmojiSky-48', 'Preto-48', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(403, 'GSH1NY31M00NPS1', 'Gringbear-48', 'Azul-48', 'https://img.ltwebstatic.com/images3_spmp/2025/02/12/2e/1739293495c54e58c0820af183aed2e01e7ff97782_square_thumbnail_220x293.jpg', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(404, 'GSH1NY46M002421', 'emoji-red-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2024/12/12/0a/17340099914747459d55fe3e53b70d065bf73fffa0_square_thumbnail_220x293.png', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(405, 'GSH1NY46M002421', 'UrsoPink-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2025/01/08/43/1736272323a9df5c29d053866306b79a97c8eb7115_square_thumbnail_220x293.png', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(406, 'GSH1NY46M002421', 'raioazul-44', 'Azul-44', 'https://img.ltwebstatic.com/images3_spmp/2024/08/13/e6/172355191635e0af6e3cbccffbd025535291489a3c_thumbnail_220x293.jpg', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(407, 'GSH1NY46M002421', 'EmojiSky-44', 'Preto-44', 'https://img.ltwebstatic.com/images3_spmp/2025/01/09/94/173635860324988c54d717a6253943eea11c851076_square_thumbnail_220x293.jpg', '2025-03-05 06:03:41', 0, 'Shein', 0, 0, 0, 1),
(408, '250305QKTC1EC0', 'gringbear-40', '40', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m6ih19tbroz446_tn', '2025-03-05 06:03:41', 0, 'Shopee', 0, 0, 0, 1),
(409, '250305QF6GX1RD', 'BlacklowSky-48', '48', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yj6xzgz32oa7_tn', '2025-03-05 06:03:41', 0, 'Shopee', 0, 0, 0, 1),
(410, '250304Q3YPN7P6', 'UrsoPink-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4qd0396h9z5cd_tn', '2025-03-05 06:03:41', 0, 'Shopee', 0, 0, 0, 1),
(411, 'GSH1NY18700MFHV', 'BlackList-40', 'Preto-40', 'https://img.ltwebstatic.com/images3_spmp/2025/02/06/b7/173884545770070cb5cfa28bb8337272ea97cbb5e0_square_thumbnail_220x293.jpg', '2025-03-05 08:20:14', 0, 'Shein', 0, 0, 0, 1),
(412, '250305SNVY1DA4', 'FullBlack-44', '44', 'https://cf.shopee.com.br/file/br-11134207-7r98o-m4yjibe3i83p3a_tn', '2025-03-05 11:07:45', 0, 'Shopee', 0, 0, 0, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estoque_materia_prima`
--
ALTER TABLE `estoque_materia_prima`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `materia_prima_secundaria`
--
ALTER TABLE `materia_prima_secundaria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estoque_materia_prima`
--
ALTER TABLE `estoque_materia_prima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `materia_prima_secundaria`
--
ALTER TABLE `materia_prima_secundaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
