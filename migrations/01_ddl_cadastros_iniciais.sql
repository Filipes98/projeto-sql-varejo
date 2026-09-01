-- Projeto Pratico: Sistema de Gestao para Diana Store / Varejo de Moda
-- Arquivo: 01_ddl_cadastros_iniciais.sql
-- Objetivo: Criar as estruturas iniciais do banco de dados

-- 1. Tabela de clientes
CREATE TABLE clientes (
    id_clientes SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    cpf VARCHAR(11),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- 2. Tabela de Funcionarios
CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE NOT NULL
);

--3. Tabela de produtos 
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    categoria VARCHAR(50),
    preco_custo DECIMAL(10, 2) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL
);