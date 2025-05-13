--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_table4_trigger_function(); Type: FUNCTION; Schema: public; Owner: -
--




SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: changelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changelog (
    id integer NOT NULL,
    type smallint,
    version character varying(50),
    description character varying(200) NOT NULL,
    name character varying(300) NOT NULL,
    checksum character varying(32),
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    success boolean NOT NULL
);


--
-- Name: changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.changelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.changelog_id_seq OWNED BY public.changelog.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    idade integer,
    telefone character varying(20),
    endereco character varying(255)
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fornecedores (
    fornecedor_id integer NOT NULL,
    nome character varying(255) NOT NULL,
    cnpj character varying(18),
    endereco text,
    telefone character varying(15),
    email character varying(255),
    data_criacao timestamp without time zone DEFAULT now()
);


--
-- Name: fornecedores_fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fornecedores_fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fornecedores_fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fornecedores_fornecedor_id_seq OWNED BY public.fornecedores.fornecedor_id;


--
-- Name: itens_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.itens_pedido (
    id_item integer NOT NULL,
    id_pedido integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade integer NOT NULL
);


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    data_pedido date NOT NULL,
    data_entrega date
);


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    nome character varying(100) NOT NULL,
    preco numeric(10,2) NOT NULL
);


--
-- Name: changelog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changelog ALTER COLUMN id SET DEFAULT nextval('public.changelog_id_seq'::regclass);


--
-- Name: fornecedores fornecedor_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN fornecedor_id SET DEFAULT nextval('public.fornecedores_fornecedor_id_seq'::regclass);


--
-- Name: changelog changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changelog
    ADD CONSTRAINT changelog_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: fornecedores fornecedores_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_cnpj_key UNIQUE (cnpj);


--
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (fornecedor_id);


--
-- Name: itens_pedido itens_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id_item);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: itens_pedido itens_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido);


--
-- Name: itens_pedido itens_pedido_id_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produtos(id_produto);


--
-- Name: pedidos pedidos_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- PostgreSQL database dump complete
--


