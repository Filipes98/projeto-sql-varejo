-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: queries/01_teste_gatilho_vendas.sql
-- Objetivo: Validar a automação de baixa de estoque e o bloqueio por ruptura

-- TESTE 1: Fluxo Feliz (Venda com estoque disponível)
-- Resultado Esperado: Venda registrada e estoque subtraído automaticamente
INSERT INTO vendas (id_cliente, id_funcionario, total, forma_pagamento) VALUES (1, 1, 59.90, 'PIX');
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES (1, 1, 2, 59.90);

-- TESTE 2: Fluxo de Exceção (Tentativa de venda sem estoque suficiente)
-- Resultado Esperado: Bloqueio imediato da transação via RAISE EXCEPTION.
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES (1, 4, 50, 249.90);