-- V22__create_metas_vendedores.sql

CREATE TABLE metas_vendedores (
    id SERIAL PRIMARY KEY,
    vendedor_id INT NOT NULL,
    ano INT NOT NULL,
    mes INT NOT NULL,
    meta DECIMAL(12,2) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedores(id_vendedor)
);
