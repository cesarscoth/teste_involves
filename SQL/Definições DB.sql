-- Definições Bancos de Dados "testes"

-- Criação tabelas

CREATE TABLE IF NOT EXISTS `dataset_teste` (
  `id_dataset` int NOT NULL,
  `id_ponto_venda` int NOT NULL,
  `nome_ponto_venda` text NOT NULL,
  `perfil_ponto_venda` text NOT NULL,
  `data` date NOT NULL,
  `id_linha_produto` int NOT NULL,
  `nome_linha_produto` text NOT NULL,
  `marca_linha_produto` text NOT NULL,
  `tipo_coleta` text NOT NULL,
  `valor` text,
  `disponibilidade` text,
  `ponto_extra` int DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `DIM_CALENDARIO` (
	`data` Date Not Null, 
	mes Integer Not Null, 
	ano Integer Not Null
);

CREATE TABLE IF NOT EXISTS `DIM_PDV` (
	id Integer Not Null, 
	nome_ponto_venda Text Not Null, 
	perfil_ponto_venda Text Not Null,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `DIM_LINHA_PRODUTO` (
	id Integer Not Null, 
	nome_linha_produto Text Not Null, 
	perfil_linha_produto Text Not Null,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `FT_DISPONIBILIDADE` (
	id_data Integer Not Null, 
	id_pdv Integer Not Null, 
	id_lp Integer Not Null, 
	disponibilidade Integer Not Null,
	PRIMARY KEY (id_data, id_pdv, id_lp)
);

CREATE TABLE IF NOT EXISTS `FT_DISPONIBILIDADE_AGREGADA` (
	id_data Integer Not Null, 
	id_pdv Integer Not Null, 
	disponibilidade Integer Not Null,
	PRIMARY KEY (id_data, id_pdv)
);

CREATE TABLE IF NOT EXISTS `FT_PONTO_EXTRA` (
	id_data Integer Not Null,
	id_pdv Integer Not Null,
	id_lp Integer Not Null, 
	pontos_extras Integer Not Null,
	PRIMARY KEY (id_data, id_pdv, id_lp)
);

CREATE TABLE IF NOT EXISTS `FT_PONTO_EXTRA_AGREGADA` (
	id_data Integer Not Null, 
	id_pdv Integer Not Null, 
	pontos_extras Integer Not Null,
	PRIMARY KEY (id_data, id_pdv)
);