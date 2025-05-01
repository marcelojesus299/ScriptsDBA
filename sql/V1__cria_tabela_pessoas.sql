CREATE TABLE public.pessoas2teste7 (
	id serial4 NOT NULL,
	nome varchar(100) NOT NULL,
	cpf varchar(11) NOT NULL,
	data_nascimento date NULL,
	description varchar(255) NULL,
	description2 varchar(255) NULL,
	description3 varchar(255) NULL,
	CONSTRAINT pessoas2teste_cpf_key UNIQUE (cpf),
	CONSTRAINT pessoas2teste_pkey PRIMARY KEY (id)
);





