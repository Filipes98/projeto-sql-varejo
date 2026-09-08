-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 04_ddl_criptografia.sql
-- Objetivo: Aplicar criptografia Hash para senhas de usuários no sistema, garantindo maior segurança no armazenamento das credenciais.

-- 1. Habilitar a extensão nativa de criptografia do PostgreSQL (pgcrypto)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 2. Adicionar a coluna para armazenar a senha criptografada.
ALTER TABLE funcionarios ADD COLUMN senha_hash TEXT;

-- 3. Atualizar as senhas dos usuários existentes para a versão criptografada.
UPDATE funcionarios SET senha_hash = crypt('senha_caixa_123', gen_salt('bf')) WHERE id_funcionario = 1;
UPDATE funcionarios SET senha_hash = crypt('senha_gerente_123', gen_salt('bf')) WHERE id_funcionario = 2;