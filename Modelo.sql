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
CREATE DATABASE new_database;
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

-- object: public.requisito_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.requisito_id_seq CASCADE;
CREATE SEQUENCE public.requisito_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.requisito | type: TABLE --
-- DROP TABLE IF EXISTS public.requisito CASCADE;
CREATE TABLE public.requisito (
	id integer NOT NULL DEFAULT nextval('public.requisito_id_seq'::regclass),
	id_descritivo integer,
	CONSTRAINT requisito_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.requisito OWNER TO postgres;
-- ddl-end --

-- object: descritivo_fk | type: CONSTRAINT --
-- ALTER TABLE public.requisito DROP CONSTRAINT IF EXISTS descritivo_fk CASCADE;
ALTER TABLE public.requisito ADD CONSTRAINT descritivo_fk FOREIGN KEY (id_descritivo)
REFERENCES public.descritivo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: requisito_uq | type: CONSTRAINT --
-- ALTER TABLE public.requisito DROP CONSTRAINT IF EXISTS requisito_uq CASCADE;
ALTER TABLE public.requisito ADD CONSTRAINT requisito_uq UNIQUE (id_descritivo);
-- ddl-end --

-- object: public.funcional_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.funcional_id_seq CASCADE;
CREATE SEQUENCE public.funcional_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.nao_funcional_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.nao_funcional_id_seq CASCADE;
CREATE SEQUENCE public.nao_funcional_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.funcional | type: TABLE --
-- DROP TABLE IF EXISTS public.funcional CASCADE;
CREATE TABLE public.funcional (
	id integer NOT NULL DEFAULT nextval('public.funcional_id_seq'::regclass),
	codigo varchar(5) NOT NULL,
	descricao varchar(500) NOT NULL,
	"include/extend" varchar(50),
	id_requisito integer,
	CONSTRAINT funcional_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.funcional OWNER TO postgres;
-- ddl-end --

-- object: public.entidade_der_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.entidade_der_id_seq CASCADE;
CREATE SEQUENCE public.entidade_der_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.entidade_der | type: TABLE --
-- DROP TABLE IF EXISTS public.entidade_der CASCADE;
CREATE TABLE public.entidade_der (
	id integer NOT NULL DEFAULT nextval('public.entidade_der_id_seq'::regclass),
	nome_entidade varchar(50) NOT NULL,
	id_funcional integer,
	CONSTRAINT entidade_der_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.entidade_der OWNER TO postgres;
-- ddl-end --

-- object: public.atributos_der_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.atributos_der_id_seq CASCADE;
CREATE SEQUENCE public.atributos_der_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.atributos_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.atributos_id_seq CASCADE;
CREATE SEQUENCE public.atributos_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.atributos | type: TABLE --
-- DROP TABLE IF EXISTS public.atributos CASCADE;
CREATE TABLE public.atributos (
	id integer NOT NULL DEFAULT nextval('public.atributos_id_seq'::regclass),
	atributo varchar(20) NOT NULL,
	id_entidade_der integer,
	CONSTRAINT atributos_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.atributos OWNER TO postgres;
-- ddl-end --

-- object: entidade_der_fk | type: CONSTRAINT --
-- ALTER TABLE public.atributos DROP CONSTRAINT IF EXISTS entidade_der_fk CASCADE;
ALTER TABLE public.atributos ADD CONSTRAINT entidade_der_fk FOREIGN KEY (id_entidade_der)
REFERENCES public.entidade_der (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.caso_de_uso_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.caso_de_uso_id_seq CASCADE;
CREATE SEQUENCE public.caso_de_uso_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.caso_de_uso | type: TABLE --
-- DROP TABLE IF EXISTS public.caso_de_uso CASCADE;
CREATE TABLE public.caso_de_uso (
	id integer NOT NULL DEFAULT nextval('public.caso_de_uso_id_seq'::regclass),
	caso varchar(100) NOT NULL,
	id_entidade_der integer,
	CONSTRAINT caso_de_uso_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.caso_de_uso OWNER TO postgres;
-- ddl-end --

-- object: entidade_der_fk | type: CONSTRAINT --
-- ALTER TABLE public.caso_de_uso DROP CONSTRAINT IF EXISTS entidade_der_fk CASCADE;
ALTER TABLE public.caso_de_uso ADD CONSTRAINT entidade_der_fk FOREIGN KEY (id_entidade_der)
REFERENCES public.entidade_der (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: caso_de_uso_uq | type: CONSTRAINT --
-- ALTER TABLE public.caso_de_uso DROP CONSTRAINT IF EXISTS caso_de_uso_uq CASCADE;
ALTER TABLE public.caso_de_uso ADD CONSTRAINT caso_de_uso_uq UNIQUE (id_entidade_der);
-- ddl-end --

-- object: requisito_fk | type: CONSTRAINT --
-- ALTER TABLE public.funcional DROP CONSTRAINT IF EXISTS requisito_fk CASCADE;
ALTER TABLE public.funcional ADD CONSTRAINT requisito_fk FOREIGN KEY (id_requisito)
REFERENCES public.requisito (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: funcional_fk | type: CONSTRAINT --
-- ALTER TABLE public.entidade_der DROP CONSTRAINT IF EXISTS funcional_fk CASCADE;
ALTER TABLE public.entidade_der ADD CONSTRAINT funcional_fk FOREIGN KEY (id_funcional)
REFERENCES public.funcional (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: entidade_der_uq | type: CONSTRAINT --
-- ALTER TABLE public.entidade_der DROP CONSTRAINT IF EXISTS entidade_der_uq CASCADE;
ALTER TABLE public.entidade_der ADD CONSTRAINT entidade_der_uq UNIQUE (id_funcional);
-- ddl-end --

-- object: public.crud_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.crud_id_seq CASCADE;
CREATE SEQUENCE public.crud_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.crud | type: TABLE --
-- DROP TABLE IF EXISTS public.crud CASCADE;
CREATE TABLE public.crud (
	id integer NOT NULL DEFAULT nextval('public.crud_id_seq'::regclass),
	operacao varchar(10) NOT NULL,
	id_caso_de_uso integer,
	CONSTRAINT crud_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.crud OWNER TO postgres;
-- ddl-end --

-- object: public."get/set_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."get/set_id_seq" CASCADE;
CREATE SEQUENCE public."get/set_id_seq"
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: caso_de_uso_fk | type: CONSTRAINT --
-- ALTER TABLE public.crud DROP CONSTRAINT IF EXISTS caso_de_uso_fk CASCADE;
ALTER TABLE public.crud ADD CONSTRAINT caso_de_uso_fk FOREIGN KEY (id_caso_de_uso)
REFERENCES public.caso_de_uso (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


