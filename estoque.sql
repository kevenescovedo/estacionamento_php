-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Mar-2022 às 17:12
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `cidade`, `estado`) VALUES
(1, 'Jose da Silva', 'Presidente Prudente', 'SP'),
(2, 'Maria da Silva', 'Presidente Prudente', 'SP'),
(3, 'Roberta Aparecida', 'Presidente Bernardes', 'SP'),
(4, 'Raquel da Silveira', 'Rancharia', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `numero` int(11) NOT NULL,
  `codigo_for` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`numero`, `codigo_for`, `data`, `valor`) VALUES
(1, 1, '2021-07-23', 0),
(2, 2, '2021-07-22', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra_produto`
--

CREATE TABLE `compra_produto` (
  `numero_com` int(11) NOT NULL,
  `codigo_pro` int(11) NOT NULL,
  `qtd_com` int(11) DEFAULT 0,
  `valor_uni` float DEFAULT 0,
  `valor_tot` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `compra_produto`
--

INSERT INTO `compra_produto` (`numero_com`, `codigo_pro`, `qtd_com`, `valor_uni`, `valor_tot`) VALUES
(1, 3, 12, 2200, 26400),
(1, 4, 3, 2800, 8400),
(2, 1, 7, 800, 5600),
(2, 2, 6, 800, 4800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`codigo`, `nome`, `cidade`, `estado`, `telefone`) VALUES
(1, 'Informatica Ltda', 'Presidente Prudente', 'SP', '(18) 3909-2345'),
(2, 'Varejão ME', 'Santo Anastácio', 'SP', '(18) 3222-6589');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `preco_ven` float DEFAULT 0,
  `preco_com` float DEFAULT 0,
  `qtd` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codigo`, `nome`, `preco_ven`, `preco_com`, `qtd`) VALUES
(1, 'Tablet', 1000, 800, 5),
(2, 'Smartphone', 900, 800, 3),
(3, 'Smart TV', 2500, 2200, 6),
(4, 'Notebook', 3000, 2800, 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `produtos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `produtos` (
`NomeProd` varchar(30)
,`QtdEstoque` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `produtosvendidos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `produtosvendidos` (
`nomeProd` varchar(30)
,`qtdVendido` int(11)
,`valorUnitario` float
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_a_comprar`
--

CREATE TABLE `produtos_a_comprar` (
  `codigo_pro` int(11) NOT NULL,
  `preco_com` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos_a_comprar`
--

INSERT INTO `produtos_a_comprar` (`codigo_pro`, `preco_com`) VALUES
(2, 800),
(4, 2800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `numero` int(11) NOT NULL,
  `codigo_cli` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`numero`, `codigo_cli`, `data`, `valor`) VALUES
(1, 1, '2021-08-23', 9700),
(2, 2, '2021-07-22', 6800),
(3, 1, '2021-09-28', 3000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_produto`
--

CREATE TABLE `venda_produto` (
  `numero_ven` int(11) NOT NULL,
  `codigo_pro` int(11) NOT NULL,
  `qtd_ven` int(11) DEFAULT 0,
  `valor_uni` float DEFAULT 0,
  `valor_tot` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda_produto`
--

INSERT INTO `venda_produto` (`numero_ven`, `codigo_pro`, `qtd_ven`, `valor_uni`, `valor_tot`) VALUES
(1, 1, 2, 1000, 2000),
(1, 2, 3, 900, 2700),
(1, 3, 2, 2500, 5000),
(2, 2, 2, 900, 1800),
(2, 3, 2, 2500, 5000),
(3, 4, 1, 3000, 3000);

--
-- Acionadores `venda_produto`
--
DELIMITER $$
CREATE TRIGGER `venda_produto_AFTER_INSERT` AFTER INSERT ON `venda_produto` FOR EACH ROW BEGIN
	declare qtdEst int;
    declare precoCom float;
	#a
    update produto
    set qtd = qtd - new.qtd_ven
    where codigo = new.codigo_pro;
    
    #b
    update venda
    set valor = valor + new.valor_tot
    where numero = new.numero_ven; 
    
    #c
    select qtd, preco_com into qtdEst, precoCom
    from produto
    where codigo = new.codigo_pro;
    if (qtdEst <= 3) then
		insert into produtos_a_comprar
			values (new.codigo_pro, precoCom);
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para vista `produtos`
--
DROP TABLE IF EXISTS `produtos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produtos`  AS SELECT `produto`.`nome` AS `NomeProd`, `produto`.`qtd` AS `QtdEstoque` FROM `produto` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `produtosvendidos`
--
DROP TABLE IF EXISTS `produtosvendidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produtosvendidos`  AS SELECT `p`.`nome` AS `nomeProd`, `vp`.`qtd_ven` AS `qtdVendido`, `vp`.`valor_uni` AS `valorUnitario` FROM (`produto` `p` join `venda_produto` `vp`) WHERE `p`.`codigo` = `vp`.`codigo_pro` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigo_for` (`codigo_for`);

--
-- Índices para tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  ADD PRIMARY KEY (`numero_com`,`codigo_pro`),
  ADD KEY `codigo_pro` (`codigo_pro`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `produtos_a_comprar`
--
ALTER TABLE `produtos_a_comprar`
  ADD PRIMARY KEY (`codigo_pro`),
  ADD KEY `codigo_pro` (`codigo_pro`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigo_cli` (`codigo_cli`);

--
-- Índices para tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD PRIMARY KEY (`numero_ven`,`codigo_pro`),
  ADD KEY `codigo_pro` (`codigo_pro`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`codigo_for`) REFERENCES `fornecedor` (`codigo`);

--
-- Limitadores para a tabela `compra_produto`
--
ALTER TABLE `compra_produto`
  ADD CONSTRAINT `compra_produto_ibfk_1` FOREIGN KEY (`codigo_pro`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `compra_produto_ibfk_2` FOREIGN KEY (`numero_com`) REFERENCES `compra` (`numero`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_a_comprar`
--
ALTER TABLE `produtos_a_comprar`
  ADD CONSTRAINT `produtos_a_comprar_ibfk_1` FOREIGN KEY (`codigo_pro`) REFERENCES `produto` (`codigo`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codigo_cli`) REFERENCES `cliente` (`codigo`);

--
-- Limitadores para a tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `venda_produto_ibfk_1` FOREIGN KEY (`codigo_pro`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `venda_produto_ibfk_2` FOREIGN KEY (`numero_ven`) REFERENCES `venda` (`numero`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
