--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.association (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.association OWNER TO postgres;

--
-- Name: association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.association_id_seq OWNER TO postgres;

--
-- Name: association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.association_id_seq OWNED BY public.association.id;


--
-- Name: association_universe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.association_universe (
    id integer NOT NULL,
    association_id integer NOT NULL,
    universe_id integer NOT NULL
);


ALTER TABLE public.association_universe OWNER TO postgres;

--
-- Name: association_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.association_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.association_universe_id_seq OWNER TO postgres;

--
-- Name: association_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.association_universe_id_seq OWNED BY public.association_universe.id;


--
-- Name: era; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.era (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.era OWNER TO postgres;

--
-- Name: era_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.era_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.era_id_seq OWNER TO postgres;

--
-- Name: era_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.era_id_seq OWNED BY public.era.id;


--
-- Name: hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.hero OWNER TO postgres;

--
-- Name: hero_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_association (
    id integer NOT NULL,
    hero_id integer,
    association_id integer
);


ALTER TABLE public.hero_association OWNER TO postgres;

--
-- Name: hero_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_association_id_seq OWNER TO postgres;

--
-- Name: hero_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_association_id_seq OWNED BY public.hero_association.id;


--
-- Name: hero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_id_seq OWNER TO postgres;

--
-- Name: hero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_id_seq OWNED BY public.hero.id;


--
-- Name: hero_power; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_power (
    id integer NOT NULL,
    hero_id integer,
    power_id integer
);


ALTER TABLE public.hero_power OWNER TO postgres;

--
-- Name: hero_power_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_power_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_power_id_seq OWNER TO postgres;

--
-- Name: hero_power_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_power_id_seq OWNED BY public.hero_power.id;


--
-- Name: hero_universe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero_universe (
    id integer NOT NULL,
    hero_id integer NOT NULL,
    universe_id integer NOT NULL
);


ALTER TABLE public.hero_universe OWNER TO postgres;

--
-- Name: hero_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hero_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hero_universe_id_seq OWNER TO postgres;

--
-- Name: hero_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hero_universe_id_seq OWNED BY public.hero_universe.id;


--
-- Name: power; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.power (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.power OWNER TO postgres;

--
-- Name: power_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.power_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.power_id_seq OWNER TO postgres;

--
-- Name: power_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.power_id_seq OWNED BY public.power.id;


--
-- Name: universe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universe (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.universe OWNER TO postgres;

--
-- Name: universe_era; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universe_era (
    id integer NOT NULL,
    era_id integer NOT NULL,
    universe_id integer NOT NULL
);


ALTER TABLE public.universe_era OWNER TO postgres;

--
-- Name: universe_era_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universe_era_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_era_id_seq OWNER TO postgres;

--
-- Name: universe_era_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universe_era_id_seq OWNED BY public.universe_era.id;


--
-- Name: universe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_id_seq OWNER TO postgres;

--
-- Name: universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universe_id_seq OWNED BY public.universe.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    "user" text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association ALTER COLUMN id SET DEFAULT nextval('public.association_id_seq'::regclass);


--
-- Name: association_universe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association_universe ALTER COLUMN id SET DEFAULT nextval('public.association_universe_id_seq'::regclass);


--
-- Name: era id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.era ALTER COLUMN id SET DEFAULT nextval('public.era_id_seq'::regclass);


--
-- Name: hero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero ALTER COLUMN id SET DEFAULT nextval('public.hero_id_seq'::regclass);


--
-- Name: hero_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_association ALTER COLUMN id SET DEFAULT nextval('public.hero_association_id_seq'::regclass);


--
-- Name: hero_power id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_power ALTER COLUMN id SET DEFAULT nextval('public.hero_power_id_seq'::regclass);


--
-- Name: hero_universe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_universe ALTER COLUMN id SET DEFAULT nextval('public.hero_universe_id_seq'::regclass);


--
-- Name: power id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power ALTER COLUMN id SET DEFAULT nextval('public.power_id_seq'::regclass);


--
-- Name: universe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe ALTER COLUMN id SET DEFAULT nextval('public.universe_id_seq'::regclass);


--
-- Name: universe_era id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe_era ALTER COLUMN id SET DEFAULT nextval('public.universe_era_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.association (id, name) FROM stdin;
1	A.C.R.O.S.T.I.C
2	Avengers
3	League of Justice
4	A.R.G.U.S.
\.


--
-- Data for Name: association_universe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.association_universe (id, association_id, universe_id) FROM stdin;
\.


--
-- Data for Name: era; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.era (id, name) FROM stdin;
1	Infinite Crisis
2	Pre-Crisis
3	Crisis on Infinite Earths
4	Post-Crisis
\.


--
-- Data for Name: hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero (id, name) FROM stdin;
1	Batman
2	Superman
3	Ironman
4	Spiderman
5	Greenlantern
6	Solomon Grundy
7	Hulk
\.


--
-- Data for Name: hero_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_association (id, hero_id, association_id) FROM stdin;
\.


--
-- Data for Name: hero_power; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_power (id, hero_id, power_id) FROM stdin;
\.


--
-- Data for Name: hero_universe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hero_universe (id, hero_id, universe_id) FROM stdin;
\.


--
-- Data for Name: power; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power (id, name) FROM stdin;
1	Fly
2	Super Streng
3	Fire Control
4	Lasso of Truth
5	Green Lantern
6	Mjölnir
7	Inmortality
8	Elasticity
9	Cammouflage
\.


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universe (id, name) FROM stdin;
1	Earth-Zero
2	Earth-One
3	Earth-Two
4	Earth-Three
5	Earth-Four
\.


--
-- Data for Name: universe_era; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universe_era (id, era_id, universe_id) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, "user") FROM stdin;
\.


--
-- Name: association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.association_id_seq', 4, true);


--
-- Name: association_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.association_universe_id_seq', 1, false);


--
-- Name: era_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.era_id_seq', 4, true);


--
-- Name: hero_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_association_id_seq', 1, false);


--
-- Name: hero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_id_seq', 7, true);


--
-- Name: hero_power_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_power_id_seq', 1, false);


--
-- Name: hero_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hero_universe_id_seq', 1, false);


--
-- Name: power_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.power_id_seq', 9, true);


--
-- Name: universe_era_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universe_era_id_seq', 1, false);


--
-- Name: universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universe_id_seq', 5, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: association association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association
    ADD CONSTRAINT association_pkey PRIMARY KEY (id);


--
-- Name: association_universe association_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.association_universe
    ADD CONSTRAINT association_universe_pkey PRIMARY KEY (id);


--
-- Name: era era_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.era
    ADD CONSTRAINT era_pkey PRIMARY KEY (id);


--
-- Name: hero_association hero_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_association
    ADD CONSTRAINT hero_association_pkey PRIMARY KEY (id);


--
-- Name: hero hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_pkey PRIMARY KEY (id);


--
-- Name: hero_power hero_power_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_power
    ADD CONSTRAINT hero_power_pkey PRIMARY KEY (id);


--
-- Name: hero_universe hero_universe_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_universe
    ADD CONSTRAINT hero_universe_pk PRIMARY KEY (id);


--
-- Name: power power_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power
    ADD CONSTRAINT power_pkey PRIMARY KEY (id);


--
-- Name: universe_era universe_era_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe_era
    ADD CONSTRAINT universe_era_pkey PRIMARY KEY (id);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: hero_association hero_association_association_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_association
    ADD CONSTRAINT hero_association_association_id_fkey FOREIGN KEY (association_id) REFERENCES public.association(id);


--
-- Name: hero_association hero_association_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_association
    ADD CONSTRAINT hero_association_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.hero(id);


--
-- Name: hero_power hero_power_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_power
    ADD CONSTRAINT hero_power_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.hero(id);


--
-- Name: hero_power hero_power_power_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero_power
    ADD CONSTRAINT hero_power_power_id_fkey FOREIGN KEY (power_id) REFERENCES public.power(id);


--
-- Name: universe_era universe_era_era_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe_era
    ADD CONSTRAINT universe_era_era_id_fkey FOREIGN KEY (era_id) REFERENCES public.era(id);


--
-- Name: universe_era universe_era_universe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universe_era
    ADD CONSTRAINT universe_era_universe_id_fkey FOREIGN KEY (universe_id) REFERENCES public.universe(id);


--
-- PostgreSQL database dump complete
--

