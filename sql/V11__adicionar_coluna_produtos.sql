-- Flyway Versão 11: Adicionar coluna 'descricao' à tabela 'produtos' e inserir novos dados

-- Adicionando a coluna 'descricao'
ALTER TABLE produtos 
ADD COLUMN descricao TEXT;

-- Inserindo novos produtos
INSERT INTO produtos (nome, preco, descricao)
VALUES
('Produto F', 120.00, 'Descrição do Produto F'),
('Produto G', 250.00, 'Descrição do Produto G');
