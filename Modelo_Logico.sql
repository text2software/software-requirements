-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE software_requirements;
-- ddl-end --


-- object: public.cliente_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.cliente_id_seq CASCADE;
CREATE SEQUENCE public.cliente_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.pessoa_fisica_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.pessoa_fisica_id_seq CASCADE;
CREATE SEQUENCE public.pessoa_fisica_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.pessoa_juridica_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.pessoa_juridica_id_seq CASCADE;
CREATE SEQUENCE public.pessoa_juridica_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.descritivo_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.descritivo_id_seq CASCADE;
CREATE SEQUENCE public.descritivo_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente (
	id integer NOT NULL DEFAULT nextval('public.cliente_id_seq'::regclass),
	nome varchar(20) NOT NULL,
	sobrenome varchar(100) NOT NULL,
	CONSTRAINT "User_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO postgres;
-- ddl-end --

-- object: public.pessoa_juridica | type: TABLE --
-- DROP TABLE IF EXISTS public.pessoa_juridica CASCADE;
CREATE TABLE public.pessoa_juridica (
	id integer NOT NULL DEFAULT nextval('public.pessoa_juridica_id_seq'::regclass),
	cnpj numeric(14) NOT NULL,
	id_cliente integer,
	CONSTRAINT "Legal_person_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.pessoa_juridica OWNER TO postgres;
-- ddl-end --

-- object: public.pessoa_fisica | type: TABLE --
-- DROP TABLE IF EXISTS public.pessoa_fisica CASCADE;
CREATE TABLE public.pessoa_fisica (
	id integer NOT NULL DEFAULT nextval('public.pessoa_fisica_id_seq'::regclass),
	cpf numeric(11) NOT NULL,
	id_cliente integer,
	CONSTRAINT "physical person_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.pessoa_fisica OWNER TO postgres;
-- ddl-end --

-- object: public.descritivo | type: TABLE --
-- DROP TABLE IF EXISTS public.descritivo CASCADE;
CREATE TABLE public.descritivo (
	id integer NOT NULL DEFAULT nextval('public.descritivo_id_seq'::regclass),
	texto varchar(5000) NOT NULL,
	id_cliente integer,
	CONSTRAINT "Descriptive_pk" PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.descritivo OWNER TO postgres;
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.pessoa_juridica DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.pessoa_juridica ADD CONSTRAINT cliente_fk FOREIGN KEY (id_cliente)
REFERENCES public.cliente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.pessoa_fisica DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.pessoa_fisica ADD CONSTRAINT cliente_fk FOREIGN KEY (id_cliente)
REFERENCES public.cliente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pessoa_fisica_uq | type: CONSTRAINT --
-- ALTER TABLE public.pessoa_fisica DROP CONSTRAINT IF EXISTS pessoa_fisica_uq CASCADE;
ALTER TABLE public.pessoa_fisica ADD CONSTRAINT pessoa_fisica_uq UNIQUE (id_cliente);
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.descritivo DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.descritivo ADD CONSTRAINT cliente_fk FOREIGN KEY (id_cliente)
REFERENCES public.cliente (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


