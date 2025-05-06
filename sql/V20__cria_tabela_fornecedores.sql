-- Criação da tabela de fornecedores
CREATE TABLE public.fornecedores (
    fornecedor_id SERIAL PRIMARY KEY,           -- ID do fornecedor, tipo serial para incremento automático
    nome VARCHAR(255) NOT NULL,                 -- Nome do fornecedor, não pode ser nulo
    cnpj VARCHAR(18) UNIQUE,                    -- CNPJ do fornecedor (único)
    endereco TEXT,                              -- Endereço do fornecedor
    telefone VARCHAR(15),                       -- Telefone de contato do fornecedor
    email VARCHAR(255),                         -- Email de contato do fornecedor
    data_criacao TIMESTAMP DEFAULT NOW()        -- Data e hora de criação do fornecedor
);
