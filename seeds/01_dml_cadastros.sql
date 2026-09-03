-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: seeds/01_dml_cadastros.sql
-- Objetivo: Popular as tabelas de cadastros iniciais (Produtos, Funcionários e Clientes)

-- 1. Inserindo Produtos (O Catálogo)
INSERT INTO produtos (descricao, categoria, preco_custo, preco_venda) VALUES
('Camiseta Básica Branca', 'Masculino', 25.00, 59.90),
('Calça Jeans Skinny', 'Feminino', 60.00, 139.90),
('Vestido Estampado Floral', 'Feminino', 45.00, 119.90),
('Jaqueta de Couro Eco', 'Feminino', 120.00, 249.90),
('Cinto de Couro', 'Acessórios', 15.00, 45.00);

-- 2. Inserindo Funcionários (A Equipe)
INSERT INTO funcionarios (nome, cargo, salario, data_admissao) VALUES
('Carlos Silva', 'Estratégia e Caixa', 2500.00, '2026-02-01'),
('Mariana Costa', 'Gerente Geral', 4500.00, '2025-01-10');

-- 3. Inserindo Clientes
INSERT INTO clientes (nome, cpf) VALUES
('Maria Oliveira', '12345678901'),
('João Silva', '98765432100');

INSERT INTO clientes (nome, cpf, data_cadastro) VALUES
('Ana Clara Sousa', '45678912300', '2025-11-20');