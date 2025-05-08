CREATE TABLE public.vendedores (
    id_vendedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_admissao DATE NOT NULL DEFAULT CURRENT_DATE
);
