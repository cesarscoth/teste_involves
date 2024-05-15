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
FROM Testes.dataset_teste
order by nome_linha_produto



select *
from PONTO_VENDA_UNIDADE
where sellin > 20000
order by NOME_PDV

select ANO, MES, NOME_PDV, sum(sellin) "valor_total"
from PONTO_VENDA_UNIDADE
group by ANO, MES, NOME_PDV
order by ANO asc, MES asc, NOME_PDV 


SELECT year(`data`)
	 , EXTRACT(MONTH FROM `data`)
	 , perfil_ponto_venda
	 , SUM(ponto_extra) "valor_total"
FROM Testes.dataset_teste
group by year(`data`)
	 , EXTRACT(MONTH FROM `data`)
	 , perfil_ponto_venda
order by year(`data`) asc, EXTRACT(MONTH FROM `data`) asc, perfil_ponto_venda


select PVU.NOME_PDV
	, sum(VPV.FL_VISITADO) "visitas"
from PONTO_VENDA_UNIDADE PVU
inner join VISITAS_PONTO_VENDA VPV
on PVU.ID_PDV = VPV.FK_PDV
where PVU.NOME_PDV = 'INVOLVES'
group by PVU.NOME_PDV

