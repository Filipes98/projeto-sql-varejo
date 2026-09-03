-- Projeto Prático: Sistema de Gestão para Loja de Roupas
-- Objetivo: Povoar o saldo inicial do estoque e as despesas operacionais do negócio

-- 1. Inserindo o saldo inicial do estoque
INSERT INTO estoque (id_produto, quantidade) VALUES
(1, 30), -- Camiseta Básica Branca
(2, 18),  -- Calça Jeans Skinny
(3, 12),  -- Vestido Estampado Floral
(4, 8),  -- Jaqueta de Couro Eco
(5, 25); -- Cinto de Couro

-- 2. Despesas administrativas e operacionais da loja
INSERT INTO controle_financeiro (categoria, descricao, local_compra, valor, data_despesa) VALUES
('Expediente', 'Bobinas térmicas para impressora de etiquetas', 'Papelaria Central', 150.00, '2026-02-05'),
('Expediente', 'Cartuchos de tinta para impressora', 'Loja de Informática XYZ', 200.00, '2026-02-10'),
('Marketing', 'Campanha de mídia social para promoção de inverno', 'Agência Digital ABC', 500.00, '2026-02-15'),
('Marketing', 'Produção de material gráfico (cartazes e flyers)', 'Gráfica Rápida', 300.00, '2026-02-20'),
('Manutenção', 'Serviço de manutenção preventiva do sistema de ar-condicionado', 'ClimaTech Serviços', 250.00, '2026-02-25');