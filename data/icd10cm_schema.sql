--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ctds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ctds (
    id bigint NOT NULL,
    diseasename character varying(255),
    diseaseid character varying(255),
    altdiseaseids character varying(255),
    definition text,
    parentids character varying(255),
    treenumbers text,
    parenttreenumbers text,
    synonyms text,
    slimmappings text
);


ALTER TABLE public.ctds OWNER TO postgres;

--
-- Name: ctds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ctds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctds_id_seq OWNER TO postgres;

--
-- Name: ctds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ctds_id_seq OWNED BY public.ctds.id;


--
-- Name: icd10_pcses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10_pcses (
    id bigint NOT NULL,
    order_number integer,
    icd10pcs_code character varying(255),
    icd10pcs_code_2 character varying(255),
    icd10pcs_code_2_ltree character varying(255),
    is_header character varying(255),
    short_description character varying(255),
    long_description character varying(255),
    section character varying(255),
    section_title character varying(255),
    body_system character varying(255),
    body_system_title character varying(255),
    root_operation character varying(255),
    root_operation_title character varying(255),
    body_part character varying(255),
    body_part_title character varying(255),
    approach character varying(255),
    approach_title character varying(255),
    device character varying(255),
    device_title character varying(255),
    qualifier character varying(255),
    qualifier_title character varying(255),
    icd10pcs_code_ltree character varying(255)
);


ALTER TABLE public.icd10_pcses OWNER TO postgres;

--
-- Name: icd10_pcses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icd10_pcses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icd10_pcses_id_seq OWNER TO postgres;

--
-- Name: icd10_pcses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.icd10_pcses_id_seq OWNED BY public.icd10_pcses.id;


--
-- Name: icd10clinicals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10clinicals (
    id bigint NOT NULL,
    order_number integer,
    icd10cm_code character varying(255),
    icd10cm_code_2 character varying(255),
    icd10cm_code_2_ltree character varying(255),
    is_header character varying(255),
    short_description character varying(255),
    long_description character varying(255),
    includes text,
    inclusionterm text,
    excludes1 text,
    excludes2 text,
    codefirst text,
    codealso text,
    useadditionalcode text,
    chapter_name integer,
    chapter_description text,
    section_id character varying(255),
    section_description text,
    is_category character varying(255),
    is_subcategory character varying(255),
    icd10cm_code_ltree character varying(255),
    long_description_tsv tsvector
);


ALTER TABLE public.icd10clinicals OWNER TO postgres;

--
-- Name: icd10clinicals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icd10clinicals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icd10clinicals_id_seq OWNER TO postgres;

--
-- Name: icd10clinicals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.icd10clinicals_id_seq OWNED BY public.icd10clinicals.id;


--
-- Name: icd10cm_dindexes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10cm_dindexes (
    id bigint NOT NULL,
    title character varying(255),
    main_term jsonb,
    title_tsv tsvector
);


ALTER TABLE public.icd10cm_dindexes OWNER TO postgres;

--
-- Name: icd10cm_dindexes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icd10cm_dindexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icd10cm_dindexes_id_seq OWNER TO postgres;

--
-- Name: icd10cm_dindexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.icd10cm_dindexes_id_seq OWNED BY public.icd10cm_dindexes.id;


--
-- Name: icd10cm_eindexes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10cm_eindexes (
    id bigint NOT NULL,
    title character varying(255),
    main_term_text text,
    main_term_jsonb jsonb,
    title_tsv character varying(255)
);


ALTER TABLE public.icd10cm_eindexes OWNER TO postgres;

--
-- Name: icd10cm_neoplasms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10cm_neoplasms (
    id bigint NOT NULL,
    title character varying(255),
    main_term jsonb,
    title_tsv tsvector
);


ALTER TABLE public.icd10cm_neoplasms OWNER TO postgres;

--
-- Name: icd10cm_neoplasms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icd10cm_neoplasms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icd10cm_neoplasms_id_seq OWNER TO postgres;

--
-- Name: icd10cm_neoplasms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.icd10cm_neoplasms_id_seq OWNED BY public.icd10cm_neoplasms.id;


--
-- Name: icd10cm_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10cm_orders (
    id bigint NOT NULL,
    order_number integer,
    icd10cm_code character varying(7),
    is_header character varying(1),
    short_description character varying(60),
    long_description character varying(255),
    icd10cm_code_2 character varying(9),
    long_description_tsv tsvector,
    short_description_tsv tsvector
);


ALTER TABLE public.icd10cm_orders OWNER TO postgres;

--
-- Name: icd10pcs_defs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.icd10pcs_defs (
    id bigint NOT NULL,
    section character varying(1),
    section_title character varying(100),
    axis_code character varying(1),
    axis_title character varying(255),
    title_tsv tsvector,
    term_definition text,
    term_explanation text,
    term_titles text,
    term_includes text,
    terms jsonb
);


ALTER TABLE public.icd10pcs_defs OWNER TO postgres;

--
-- Name: icd10pcs_defs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.icd10pcs_defs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.icd10pcs_defs_id_seq OWNER TO postgres;

--
-- Name: icd10pcs_defs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.icd10pcs_defs_id_seq OWNED BY public.icd10pcs_defs.id;


--
-- Name: iicd10cm_eindexes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iicd10cm_eindexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iicd10cm_eindexes_id_seq OWNER TO postgres;

--
-- Name: iicd10cm_eindexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iicd10cm_eindexes_id_seq OWNED BY public.icd10cm_eindexes.id;


--
-- Name: iicd10cm_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iicd10cm_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iicd10cm_orders_id_seq OWNER TO postgres;

--
-- Name: iicd10cm_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iicd10cm_orders_id_seq OWNED BY public.icd10cm_orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: ctds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctds ALTER COLUMN id SET DEFAULT nextval('public.ctds_id_seq'::regclass);


--
-- Name: icd10_pcses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10_pcses ALTER COLUMN id SET DEFAULT nextval('public.icd10_pcses_id_seq'::regclass);


--
-- Name: icd10clinicals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10clinicals ALTER COLUMN id SET DEFAULT nextval('public.icd10clinicals_id_seq'::regclass);


--
-- Name: icd10cm_dindexes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_dindexes ALTER COLUMN id SET DEFAULT nextval('public.icd10cm_dindexes_id_seq'::regclass);


--
-- Name: icd10cm_eindexes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_eindexes ALTER COLUMN id SET DEFAULT nextval('public.iicd10cm_eindexes_id_seq'::regclass);


--
-- Name: icd10cm_neoplasms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_neoplasms ALTER COLUMN id SET DEFAULT nextval('public.icd10cm_neoplasms_id_seq'::regclass);


--
-- Name: icd10cm_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_orders ALTER COLUMN id SET DEFAULT nextval('public.iicd10cm_orders_id_seq'::regclass);


--
-- Name: icd10pcs_defs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10pcs_defs ALTER COLUMN id SET DEFAULT nextval('public.icd10pcs_defs_id_seq'::regclass);


--
-- Name: ctds ctds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctds
    ADD CONSTRAINT ctds_pkey PRIMARY KEY (id);


--
-- Name: icd10_pcses icd10_pcses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10_pcses
    ADD CONSTRAINT icd10_pcses_pkey PRIMARY KEY (id);


--
-- Name: icd10clinicals icd10clinicals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10clinicals
    ADD CONSTRAINT icd10clinicals_pkey PRIMARY KEY (id);


--
-- Name: icd10cm_dindexes icd10cm_dindexes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_dindexes
    ADD CONSTRAINT icd10cm_dindexes_pkey PRIMARY KEY (id);


--
-- Name: icd10cm_neoplasms icd10cm_neoplasms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_neoplasms
    ADD CONSTRAINT icd10cm_neoplasms_pkey PRIMARY KEY (id);


--
-- Name: icd10pcs_defs icd10pcs_defs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10pcs_defs
    ADD CONSTRAINT icd10pcs_defs_pkey PRIMARY KEY (id);


--
-- Name: icd10cm_eindexes iicd10cm_eindexes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_eindexes
    ADD CONSTRAINT iicd10cm_eindexes_pkey PRIMARY KEY (id);


--
-- Name: icd10cm_orders iicd10cm_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.icd10cm_orders
    ADD CONSTRAINT iicd10cm_orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: icd10cm_long_description_tsv_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icd10cm_long_description_tsv_idx ON public.icd10cm_orders USING gin (to_tsvector('english'::regconfig, (long_description_tsv)::text));


--
-- PostgreSQL database dump complete
--

