
-- Select tabela teste (origem)

SELECT id_dataset
	 , id_ponto_venda
	 , nome_ponto_venda
	 , perfil_ponto_venda
	 , `data`
	 , id_linha_produto
	 , nome_linha_produto
	 , marca_linha_produto
	 , tipo_coleta
	 , valor
	 , disponibilidade
	 , ponto_extra
FROM testes.dataset_teste;


-- QUERY DIM CALENDARIO

insert into testes.dim_calendario (
SELECT DISTINCT ds.`data`
	 , EXTRACT(MONTH FROM ds.`data`) "mes"
	 , year(ds.`data`) "ano"
FROM testes.dataset_teste ds left join testes.dim_calendario cld
on ds.data = cld.data 
where cld.data is null)


-- Query DIM PDV

insert into testes.dim_pdv (
SELECT DISTINCT ds.id_ponto_venda
	 , ds.nome_ponto_venda
	 , ds.perfil_ponto_venda
FROM testes.dataset_teste ds left join testes.dim_pdv pdv 
on ds.id_ponto_venda = pdv.id 
where pdv.id is null);

-- Query Dim Linha Produto

SELECT DISTINCT ds.id_linha_produto
	 , ds.nome_linha_produto
	 , ds.marca_linha_produto
FROM testes.dataset_teste ds left join testes.dim_linha_produto dlp
on ds.id_linha_produto = dlp.id 

-- ft_disponibilidade 

SELECT DATE_FORMAT(`data`, '%Y%m') "Mes"
	 , id_ponto_venda
	 , id_linha_produto
	 , COUNT(*) "disponibilidade"
FROM testes.dataset_teste
where tipo_coleta = 'DISPONIBILIDADE'
and VALOR = 'SIM'
group by DATE_FORMAT(`data`, '%Y%m')
	 , id_ponto_venda
	 , id_linha_produto
	 
-- fato disponibilidade agg 
	 
SELECT DATE_FORMAT(`data`, '%Y%m') "Mes"
	 , id_ponto_venda
	 , COUNT(*) "disponibilidade"
FROM testes.dataset_teste
where tipo_coleta = 'DISPONIBILIDADE'
and VALOR = 'SIM'
group by DATE_FORMAT(`data`, '%Y%m')
	 , id_ponto_venda
	 
	 
-- fato ponto extra 

SELECT DATE_FORMAT(`data`, '%Y%m') "Mes"
	 , id_ponto_venda
	 , id_linha_produto
	 , SUM(VALOR) "pontos_extras"
FROM testes.dataset_teste
where tipo_coleta = 'PONTO EXTRA'
group by DATE_FORMAT(`data`, '%Y%m')
	 , id_ponto_venda
	 , id_linha_produto
	 

-- fato ponto extra agregada 

SELECT DATE_FORMAT(`data`, '%Y%m') "Mes"
	 , id_ponto_venda
	 , SUM(VALOR) "pontos_extras"
FROM testes.dataset_teste
where tipo_coleta = 'PONTO EXTRA'
group by DATE_FORMAT(`data`, '%Y%m')
	 , id_ponto_venda