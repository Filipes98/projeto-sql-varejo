-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 02_dql_analise_comercial.sql
-- Objetivo: Consultas de análise comercial para auxiliar na tomada de decisão

-- 1. Curva ABC de produtos (baseada em vendas)
SELECT p.descricao AS produto, p.categoria, SUM(iv.quantidade) AS total_vendido, SUM(iv.quantidade * iv.preco_unitario) AS receita_total
FROM itens_venda AS iv
JOIN produtos AS p ON iv.id_produto = p.id_produto
GROUP BY p.descricao, p.categoria
ORDER BY receita_total DESC;

-- 2. Ticket médio e comportamento do cliente
-- Analisa os melhores clientes em termos de gasto médio por compra
SELECT cl.nome AS cliente, COUNT(v.id_venda) AS total_compras, SUM(v.total) AS gasto_total, ROUND(AVG(v.total), 2) AS ticket_medio
FROM vendas AS v
JOIN clientes AS cl
ON v.id_cliente = cl.id_clientes
GROUP BY cl.nome
HAVING COUNT(v.id_venda) >= 1
ORDER BY ticket_medio DESC;

-- 3. Análise de faturamento acumulado usando WINDOW FUNCTION
WITH faturamento_produto AS (
    SELECT p.categoria, p.descricao, SUM(iv.quantidade * iv.preco_unitario) AS faturamento
    FROM itens_venda AS iv
    JOIN produtos AS p ON iv.id_produto = p.id_produto
    GROUP BY p.categoria, p.descricao
)
SELECT categoria, descricao, faturamento, 
    RANK() OVER (PARTITION BY categoria ORDER BY faturamento DESC) AS rank_categoria,
    ROUND((faturamento / SUM(faturamento) OVER ()) * 100, 2) AS percentual_faturamento
FROM faturamento_produto
