-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 03_dcl_controle_acesso.sql
-- Objetivo: Criar a tabela de controle de acesso para gerenciar permissões de usuários no sistema

-- 1. Criação dos Perfis de Acesso
CREATE ROLE perfil_gerente;
CREATE ROLE perfil_caixa;

-- 2. Concedendo privilégios aos Perfis de Acesso
-- Perfil Gerente: Acesso completo ao sistema
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO perfil_gerente;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO perfil_gerente;

-- Perfil Caixa: Acesso limitado ao sistema
-- Caixa pode consulta produtos/estoque e registra vendas/clientes.
GRANT USAGE ON SCHEMA public TO perfil_caixa;
GRANT SELECT ON produtos, estoque, clientes TO perfil_caixa;
GRANT SELECT, INSERT ON clientes, vendas, itens_venda TO perfil_caixa;

-- Permissão no PostgreSQL para que o Caixa consigar usar as colunas SERIAL (IDs automáticos):
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO perfil_caixa;

-- 3. Criação dos Usuário com Senhas
CREATE USER user_mariana WITH PASSWORD 'senha_gerente_123';
CREATE USER user_carlos WITH PASSWORD 'senha_caixa_123';

-- 4. assciação dos Usuários aos Perfis de Acesso
GRANT perfil_gerente TO user_mariana;
GRANT perfil_caixa TO user_carlos;