-- V25__create_tabela_pagamentos_fornecedores.sql

CREATE TABLE pagamentos_fornecedores (
    id SERIAL PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    observacao TEXT,

    CONSTRAINT fk_pagamentos_fornecedores_fornecedor
        FOREIGN KEY (fornecedor_id)
        REFERENCES fornecedores(fornecedor_id)
        ON DELETE CASCADE
);
