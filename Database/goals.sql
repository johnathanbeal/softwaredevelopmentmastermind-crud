--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2018-12-09 13:47:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 24609)
-- Name: epics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.epics (
    id integer NOT NULL,
    epic character varying(80) NOT NULL,
    description character varying,
    category character varying,
    subcategory character varying
);


ALTER TABLE public.epics OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24607)
-- Name: epics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.epics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.epics_id_seq OWNER TO postgres;

--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 200
-- Name: epics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.epics_id_seq OWNED BY public.epics.id;


--
-- TOC entry 196 (class 1259 OID 16400)
-- Name: goalcandidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goalcandidates (
    goalcandidate character varying,
    description character varying,
    importance integer,
    goalid integer,
    epicid integer,
    taskid integer,
    id integer
);


ALTER TABLE public.goalcandidates OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16420)
-- Name: goals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goals (
    id integer NOT NULL,
    epicid integer,
    goalcandidateid integer,
    goal character varying,
    description character varying,
    ranking integer,
    deliverabledate date,
    isspecific boolean,
    ismeasureable boolean,
    isachieveable boolean,
    isrelevant boolean,
    istimebound boolean,
    goaltype character varying
);


ALTER TABLE public.goals OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16418)
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goals_id_seq OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 198
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;


--
-- TOC entry 197 (class 1259 OID 16412)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer,
    task character varying,
    description character varying,
    rank integer,
    deadline date,
    category character varying,
    subcategory character varying,
    goalsid integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 2704 (class 2604 OID 24612)
-- Name: epics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epics ALTER COLUMN id SET DEFAULT nextval('public.epics_id_seq'::regclass);


--
-- TOC entry 2703 (class 2604 OID 16423)
-- Name: goals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);


--
-- TOC entry 2833 (class 0 OID 24609)
-- Dependencies: 201
-- Data for Name: epics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.epics (id, epic, description, category, subcategory) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 16400)
-- Dependencies: 196
-- Data for Name: goalcandidates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goalcandidates (goalcandidate, description, importance, goalid, epicid, taskid, id) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 16420)
-- Dependencies: 199
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goals (id, epicid, goalcandidateid, goal, description, ranking, deliverabledate, isspecific, ismeasureable, isachieveable, isrelevant, istimebound, goaltype) FROM stdin;
5	\N	\N	CRUD App	Create a CRUD Application using Postgresql, ASP.NET, Razor and Dapper	3	2018-12-11	t	t	t	t	t	\N
1	\N	\N	Game App	Create a Dr Mario Application using HTML and JavaScript	2	2018-11-11	t	t	t	t	t	\N
7	\N	\N	Sleep Better	Sleep An Average of 7 Hours A Night for 1 Year	1	2020-08-18	t	t	t	t	t	\N
8	\N	\N	Lose Weight	Weight 190 lbs	6	2019-07-19	t	t	t	t	t	\N
\.


--
-- TOC entry 2829 (class 0 OID 16412)
-- Dependencies: 197
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, task, description, rank, deadline, category, subcategory, goalsid) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 200
-- Name: epics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.epics_id_seq', 1, false);


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 198
-- Name: goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goals_id_seq', 8, true);


--
-- TOC entry 2706 (class 2606 OID 24617)
-- Name: epics epics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epics
    ADD CONSTRAINT epics_pkey PRIMARY KEY (id);


-- Completed on 2018-12-09 13:47:53

--
-- PostgreSQL database dump complete
--

