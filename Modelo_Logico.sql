CREATE TABLE public.User (
	id numeric(8) NOT NULL,
	nome varchar(20) NOT NULL,
	sobrenome varchar(100) NOT NULL,
	CONSTRAINT User_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.User OWNER TO postgres;
-- ddl-end --

-- object: public.physical person | type: TABLE --
-- DROP TABLE IF EXISTS public.physical person CASCADE;
CREATE TABLE public.physical person (
	id numeric(8) NOT NULL,
	cpf numeric(11) NOT NULL,
	id_User numeric(8),
	CONSTRAINT physical person_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.physical person OWNER TO postgres;
-- ddl-end --

-- object: public.Legal_person | type: TABLE --
-- DROP TABLE IF EXISTS public.Legal_person CASCADE;
CREATE TABLE public.Legal_person (
	id numeric(8) NOT NULL,
	cnpj numeric(14) NOT NULL,
	id_User numeric(8),
	CONSTRAINT Legal_person_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.Legal_person OWNER TO postgres;
-- ddl-end --

-- object: User_fk | type: CONSTRAINT --
-- ALTER TABLE public.physical person DROP CONSTRAINT IF EXISTS User_fk CASCADE;
ALTER TABLE public.physical person ADD CONSTRAINT User_fk FOREIGN KEY (id_User)
REFERENCES public.User (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: physical person_uq | type: CONSTRAINT --
-- ALTER TABLE public.physical person DROP CONSTRAINT IF EXISTS physical person_uq CASCADE;
ALTER TABLE public.physical person ADD CONSTRAINT physical person_uq UNIQUE (id_User);
-- ddl-end --

-- object: User_fk | type: CONSTRAINT --
-- ALTER TABLE public.Legal_person DROP CONSTRAINT IF EXISTS User_fk CASCADE;
ALTER TABLE public.Legal_person ADD CONSTRAINT User_fk FOREIGN KEY (id_User)
REFERENCES public.User (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.Descriptive | type: TABLE --
-- DROP TABLE IF EXISTS public.Descriptive CASCADE;
CREATE TABLE public.Descriptive (
	id numeric(8) NOT NULL,
	id_User numeric(8),
	CONSTRAINT Descriptive_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.Descriptive OWNER TO postgres;
-- ddl-end --

-- object: User_fk | type: CONSTRAINT --
-- ALTER TABLE public.Descriptive DROP CONSTRAINT IF EXISTS User_fk CASCADE;
ALTER TABLE public.Descriptive ADD CONSTRAINT User_fk FOREIGN KEY (id_User)
REFERENCES public.User (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


