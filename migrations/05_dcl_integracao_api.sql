-- Projeto pratico: Sistema de Gestão para Loja de Roupas
-- Arquivo: 05_dcl_integracao_api.sql
-- Objetivo: Criar usuário de serviço para integração com API externa, garantindo segurança e controle de acesso.

-- 1. Criar um perfil exclusivo para intergrações analíticas (apenas leitura de dados).
CREATE ROLE perfil_api_analitica;

-- 2. Conceder permissões estritas
GRANT USAGE ON SCHEMA public TO perfil_api_analitica;
GRANT SELECT ON produtos, estoque, vendas, itens_venda, clientes TO perfil_api_analitica;

-- 3. Criar o usuário de serviço com limite de conexões
CREATE USER user_api_dashboard WITH PASSWORD 'api_loja_key_998877' CONNECTION LIMIT 10;

-- 4. Atribuir o perfil de integração ao usuário de serviço
GRANT perfil_api_analitica TO user_api_dashboard;