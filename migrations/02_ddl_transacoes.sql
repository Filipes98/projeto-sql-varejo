-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 02_ddl_transacoes.sql
-- Objetivo: Criar tabelas de estoque, vendas e controle financeiro (com relacionamentos)

-- 4. Tabela de Estoque
CREATE TABLE estoque (
    id_produto INT PRIMARY KEY REFERENCES produtos(id_produto),
    quantidade INT NOT NULL DEFAULT 0,
    data_ultima_atualizacao DATE DEFAULT CURRENT_DATE   
);

-- 5. Tabela de Vendas
CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_clientes),
    id_funcionario INT REFERENCES funcionarios(id_funcionario),
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL
);

-- 6. Tabela de Itens da Venda
CREATE TABLE itens_venda (
    id_venda INT REFERENCES vendas(id_venda),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto) -- uma venda pode ter vários produtos, mas cada produto só pode aparecer uma vez por venda
);

-- 7. Tabela de Controle Financeiro
CREATE TABLE controle_financeiro (
    id_despesas SERIAL PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(150),
    local_compra VARCHAR(100),
    valor DECIMAL(10, 2) NOT NULL,
    data_despesa DATE DEFAULT CURRENT_DATE
);