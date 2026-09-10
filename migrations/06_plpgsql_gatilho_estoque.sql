-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 06_plpgsql_gatilho_estoque.sql
-- Objetivo: Criar função e gatilho (Triggers) para atualizar automaticamente o estoque

-- 1 . Contrução do Bloco PL/pgSQL para atualizar o estoque após uma venda ser registrada.
CREATE OR REPLACE FUNCTION atualizar_estoque()
RETURNS TRIGGER AS $$
DECLARE
    estoque_atual INT;
BEGIN
    -- Obter o estoque atual do produto vendido
    SELECT quantidade INTO estoque_atual FROM estoque WHERE id_produto = NEW.id_produto;

    -- Verificar se há estoque suficiente para a venda
    IF estoque_atual < NEW.quantidade THEN
        RAISE EXCEPTION 'Estoque insuficiente! Disponível: %, Tentativa: %', estoque_atual, NEW.quantidade;
    END IF;

    -- Atualizar o estoque subtraindo a quantidade vendida
    UPDATE estoque SET quantidade = estoque_atual - NEW.quantidade WHERE id_produto = NEW.id_produto;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Criar o gatilho (Trigger) que chama a função após uma venda ser inserida na tabela de vendas.
CREATE TRIGGER trigger_atualizar_estoque
BEFORE INSERT ON itens_venda
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque();
