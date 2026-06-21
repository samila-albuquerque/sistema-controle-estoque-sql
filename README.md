# Sistema de Controle de Estoque com Triggers (SQL)

Este projeto consiste em um script SQL para um sistema de e-commerce simplificado, focado na automação do controle de estoque utilizando **Triggers** (Gatilhos).

## 🚀 Funcionalidades

* **Criação de Banco de Dados:** Estrutura pronta para o gerenciamento de produtos e vendas.
* **Controle de Estoque Automatizado:** Um trigger (`tg_atualiza_estoque_apos_venda`) monitora a tabela de vendas e, a cada novo registro, deduz automaticamente a quantidade vendida do estoque do produto correspondente.
* **Dados de Teste:** Inclusão de dados iniciais para validação do comportamento do banco.

## 🛠️ Tecnologias Utilizadas

* **SGBD:** MySQL / MariaDB
* **Linguagem:** SQL

## 📊 Estrutura do Banco de Dados

O projeto conta com duas tabelas principais:
1.  **`produtos`**: Armazena o ID, nome, preço e a quantidade atual em estoque.
2.  **`vendas`**: Registra as vendas realizadas, conectando-se à tabela de produtos via chave estrangeira (`FOREIGN KEY`).

## 💻 Como Executar

1. Copie o código contido no arquivo `trabalho.sql`.
2. Cole e execute em seu cliente SQL de preferência (como MySQL Workbench, DBeaver, ou via terminal).
3. Para testar o trigger, insira uma nova venda na tabela `vendas` e verifique a atualização na tabela `produtos`.