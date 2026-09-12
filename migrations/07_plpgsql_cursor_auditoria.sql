-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Arquivo: 07_plpgsql_cursor_auditoria.sql
-- Objetivo: Usar cursores PL/pgSQL para gerar um relatório de reposição de estoque

DO $$
DECLARE 
    -- 1. Declaração de Cursor
    -- Busca apenas produtos com estoque abaixo de 10 unidades
    cursor_reposicao CURSOR FOR
        SELECT p.descricao, e.quantidade
        FROM produtos p
        JOIN estoque e ON p.id_produto = e.id_produto
        WHERE e.quantidade < 10;

    -- 2. Variáveis para armazenar os dados do cursor
    v_nome_produto VARCHAR(100);
    v_qtd_atual INT;
BEGIN
    RAISE NOTICE 'Relatório de Reposição de Estoque:';

    -- 3. Abrindo o cursor
    OPEN cursor_reposicao;

    -- 4. Loop para percorrer os registros do cursor
    LOOP
        FETCH cursor_reposicao INTO v_nome_produto, v_qtd_atual;
        EXIT WHEN NOT FOUND; -- Sai do loop quando não houver mais registros

        -- 5. Exibindo os dados do produto e a quantidade atual
        RAISE NOTICE 'Comprar: %, Quantidade Atual: %', v_nome_produto, v_qtd_atual;
    END LOOP;

    -- 6. Fechando o cursor
    CLOSE cursor_reposicao;

    RAISE NOTICE 'Fim do Relatório de Reposição de Estoque.';
END; 
$$;

ROLLBACK;