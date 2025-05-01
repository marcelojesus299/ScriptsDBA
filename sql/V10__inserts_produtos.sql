-- V10__inserts_produtos.sql

-- Inserções de dados iniciais na tabela produtos
-- Flyway Version 10 Migration: Inserir dados na tabela produtos

-- Inserindo dados de exemplo
INSERT INTO produtos (nome, preco) 
VALUES 
('Produto A', 100.00),
('Produto B', 150.50),
('Produto C', 200.75),
('Produto D', 50.99),
('Produto E', 300.40);

