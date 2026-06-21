-- 1. CRIANDO O BANCO DE DADOS
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 2. CRIANDO A TABELA DE PRODUTOS (ESTOQUE)
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- 3. CRIANDO A TABELA DE VENDAS
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade_vendida INT NOT NULL,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- 4. CRIANDO O TRIGGER PARA ATUALIZAR O ESTOQUE AUTOMATICAMENTE
DELIMITER $$

CREATE TRIGGER tg_atualiza_estoque_apos_venda
AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
    -- Reduz a quantidade do estoque baseado na quantidade vendida
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade_vendida
    WHERE id_produto = NEW.id_produto;
END$$

DELIMITER ;

-- 5. POPULANDO COM DADOS DE TESTE (OPCIONAL)
INSERT INTO produtos (nome, preco, quantidade_estoque) 
VALUES ('Teclado Mecânico', 250.00, 50),
       ('Mouse Gamer', 120.00, 30);