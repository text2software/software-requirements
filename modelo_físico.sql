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


-- object: public.usuario_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.usuario_id_seq CASCADE;
CREATE SEQUENCE public.usuario_id_seq
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario (
	id integer NOT NULL DEFAULT nextval('public.usuario_id_seq'::regclass),
	name varchar(100) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar NOT NULL,
	"resetPasswordToken" varchar,
	"resetPasswordExpires" date,
	CONSTRAINT usuario_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.usuario OWNER TO postgres;
-- ddl-end --


