-- Esquema: public
CREATE SCHEMA IF NOT EXISTS public;

-- Tabela: public.produtos
CREATE TABLE IF NOT EXISTS public.produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco NUMERIC(10,2) NOT NULL
);

-- Tabela: public.clientes
CREATE TABLE IF NOT EXISTS public.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(30),
    email VARCHAR(100),
    endereco TEXT
);

-- Tabela: public.pedidos
CREATE TABLE IF NOT EXISTS public.pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES public.clientes(id)
);

-- Tabela: public.itens_pedidos
CREATE TABLE IF NOT EXISTS public.itens_pedidos (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES public.produtos(id)
);
