# 🛒 Loja Modelo DB - Gestão Relacional para Varejo de Moda

Este repositório contém a arquitetura completa de um banco de dados relacional desenvolvido em **PostgreSQL** para a operação e análise de uma loja de roupas. O projeto foca em boas práticas de mercado, implementando regras de negócio no próprio servidor, segurança de dados e extração de indicadores comerciais.

## 🗂️ Estrutura do Projeto

A arquitetura foi dividida em três pilares para facilitar a manutenção e escalabilidade:

* **`/migrations`**: Scripts de fundação, infraestrutura e segurança (DDL, DCL, PL/pgSQL).
* **`/seeds`**: Carga de dados fictícios para simulação do ambiente operacional (DML).
* **`/queries`**: Validações de regras de negócio e consultas analíticas (DQL).

## 🚀 Destaques Técnicos

* **Controle de Acesso Granular (DCL):** Implementação do princípio do menor privilégio. Criação de `ROLES` onde o perfil *Caixa* tem permissão restrita de registro, enquanto a *Gerência* possui acesso administrativo. Inclui uma *Service Account* com conexões limitadas exclusiva para consumo seguro de ferramentas de BI e scripts Python.
* **Criptografia de Credenciais:** Proteção de dados sensíveis da equipe utilizando a extensão `pgcrypto` para aplicar funções de Hash (Bcrypt) nas senhas armazenadas.
* **Automação de Estoque (Triggers):** Programação procedural em PL/pgSQL interceptando vendas (`BEFORE INSERT`) para dar baixa automática no estoque. Inclui tratamento de erros (`RAISE EXCEPTION`) que aborta a transação (`ROLLBACK`) caso haja tentativa de venda sem saldo, garantindo a integridade do inventário.
* **Auditoria com Cursores Explícitos:** Rotina de varredura linha por linha para identificar e notificar produtos com estoque crítico, gerando um log de ações para o setor de compras.
* **Inteligência de Mercado (DQL):** Consultas complexas combinando `JOINs`, `CTEs` e `WINDOW FUNCTIONS` para ranqueamento de Curva ABC, cálculo de Ticket Médio de clientes e análise de representatividade no faturamento.

## 🛠️ Tecnologias Utilizadas

* **SGBD:** PostgreSQL
* **Linguagens:** SQL, PL/pgSQL
* **Ferramentas:** VS Code, DBeaver, Git/GitHub

## ⚙️ Como Executar o Projeto

1. Clone este repositório em sua máquina local.
2. Em seu cliente SQL de preferência (DBeaver, pgAdmin), crie um novo banco de dados chamado `loja_modelo_db`.
3. Execute os arquivos da pasta `/migrations` na ordem numérica para erguer a estrutura física, papéis de acesso e funções procedurais.
4. Rode os arquivos da pasta `/seeds` para semear o banco com o catálogo, estoque e transações de teste.
5. Abra a pasta `/queries` para testar as travas do gatilho de ruptura de estoque e consumir os dados comerciais.