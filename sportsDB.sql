--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23 (Ubuntu 10.23-0ubuntu0.18.04.2)
-- Dumped by pg_dump version 10.23 (Ubuntu 10.23-0ubuntu0.18.04.2)

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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    name character varying(100),
    county character varying(100),
    state character varying(100)
);


ALTER TABLE public.city OWNER TO keegan;

--
-- Name: crew; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.crew (
    crew_id integer NOT NULL,
    person_id integer,
    pay_rate numeric(10,2)
);


ALTER TABLE public.crew OWNER TO keegan;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: equipment; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.equipment (
    equipment_id integer NOT NULL,
    etype character varying(100),
    cost numeric(10,2),
    sport_id integer
);


ALTER TABLE public.equipment OWNER TO keegan;

--
-- Name: location; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    name character varying(100),
    size integer,
    ltype character varying(50)
);


ALTER TABLE public.location OWNER TO keegan;

--
-- Name: location_city; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.location_city (
    location_id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.location_city OWNER TO keegan;

--
-- Name: person; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    name character varying(100),
    city_id integer
);


ALTER TABLE public.person OWNER TO keegan;

--
-- Name: player; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    person_id integer,
    stats character varying(100),
    division character varying(50)
);


ALTER TABLE public.player OWNER TO keegan;

--
-- Name: sport; Type: TABLE; Schema: public; Owner: keegan
--

CREATE TABLE public.sport (
    sport_id integer NOT NULL,
    name character varying(100),
    numplayers integer,
    location_id integer
);


ALTER TABLE public.sport OWNER TO keegan;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add auth group	7	add_authgroup
26	Can change auth group	7	change_authgroup
27	Can delete auth group	7	delete_authgroup
28	Can view auth group	7	view_authgroup
29	Can add auth group permissions	8	add_authgrouppermissions
30	Can change auth group permissions	8	change_authgrouppermissions
31	Can delete auth group permissions	8	delete_authgrouppermissions
32	Can view auth group permissions	8	view_authgrouppermissions
33	Can add auth permission	9	add_authpermission
34	Can change auth permission	9	change_authpermission
35	Can delete auth permission	9	delete_authpermission
36	Can view auth permission	9	view_authpermission
37	Can add auth user	10	add_authuser
38	Can change auth user	10	change_authuser
39	Can delete auth user	10	delete_authuser
40	Can view auth user	10	view_authuser
41	Can add auth user groups	11	add_authusergroups
42	Can change auth user groups	11	change_authusergroups
43	Can delete auth user groups	11	delete_authusergroups
44	Can view auth user groups	11	view_authusergroups
45	Can add auth user user permissions	12	add_authuseruserpermissions
46	Can change auth user user permissions	12	change_authuseruserpermissions
47	Can delete auth user user permissions	12	delete_authuseruserpermissions
48	Can view auth user user permissions	12	view_authuseruserpermissions
49	Can add city	13	add_city
50	Can change city	13	change_city
51	Can delete city	13	delete_city
52	Can view city	13	view_city
53	Can add crew	14	add_crew
54	Can change crew	14	change_crew
55	Can delete crew	14	delete_crew
56	Can view crew	14	view_crew
57	Can add django admin log	15	add_djangoadminlog
58	Can change django admin log	15	change_djangoadminlog
59	Can delete django admin log	15	delete_djangoadminlog
60	Can view django admin log	15	view_djangoadminlog
61	Can add django content type	16	add_djangocontenttype
62	Can change django content type	16	change_djangocontenttype
63	Can delete django content type	16	delete_djangocontenttype
64	Can view django content type	16	view_djangocontenttype
65	Can add django migrations	17	add_djangomigrations
66	Can change django migrations	17	change_djangomigrations
67	Can delete django migrations	17	delete_djangomigrations
68	Can view django migrations	17	view_djangomigrations
69	Can add django session	18	add_djangosession
70	Can change django session	18	change_djangosession
71	Can delete django session	18	delete_djangosession
72	Can view django session	18	view_djangosession
73	Can add equipment	19	add_equipment
74	Can change equipment	19	change_equipment
75	Can delete equipment	19	delete_equipment
76	Can view equipment	19	view_equipment
77	Can add person	20	add_person
78	Can change person	20	change_person
79	Can delete person	20	delete_person
80	Can view person	20	view_person
81	Can add player	21	add_player
82	Can change player	21	change_player
83	Can delete player	21	delete_player
84	Can view player	21	view_player
85	Can add sport	22	add_sport
86	Can change sport	22	change_sport
87	Can delete sport	22	delete_sport
88	Can view sport	22	view_sport
89	Can add location	23	add_location
90	Can change location	23	change_location
91	Can delete location	23	delete_location
92	Can view location	23	view_location
93	Can add location city	24	add_locationcity
94	Can change location city	24	change_locationcity
95	Can delete location city	24	delete_locationcity
96	Can view location city	24	view_locationcity
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.city (city_id, name, county, state) FROM stdin;
2	Chandler	Maricopa	AZ
3	Mesa	Maricopa	AZ
4	Tempe	Maricopa	AZ
5	Queen Creek	Pinal	AZ
6	Phoenix	Maricopa	AZ
7	Scottsdale	Maricopa	AZ
8	Fountain Hills	Maricopa 	AZ
9	Apache Junction	Pinal	AZ
10	Peoria	Yavapai	AZ
1	Gilbert	Maricopa	AZ
\.


--
-- Data for Name: crew; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.crew (crew_id, person_id, pay_rate) FROM stdin;
1	1	0.50
2	7	20.00
3	8	5.50
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sportsApp	authgroup
8	sportsApp	authgrouppermissions
9	sportsApp	authpermission
10	sportsApp	authuser
11	sportsApp	authusergroups
12	sportsApp	authuseruserpermissions
13	sportsApp	city
14	sportsApp	crew
15	sportsApp	djangoadminlog
16	sportsApp	djangocontenttype
17	sportsApp	djangomigrations
18	sportsApp	djangosession
19	sportsApp	equipment
20	sportsApp	person
21	sportsApp	player
22	sportsApp	sport
23	sportsApp	location
24	sportsApp	locationcity
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-11-18 23:31:17.824856-08
2	auth	0001_initial	2024-11-18 23:31:17.970744-08
3	admin	0001_initial	2024-11-18 23:31:18.013121-08
4	admin	0002_logentry_remove_auto_add	2024-11-18 23:31:18.041208-08
5	admin	0003_logentry_add_action_flag_choices	2024-11-18 23:31:18.05492-08
6	contenttypes	0002_remove_content_type_name	2024-11-18 23:31:18.08016-08
7	auth	0002_alter_permission_name_max_length	2024-11-18 23:31:18.128855-08
8	auth	0003_alter_user_email_max_length	2024-11-18 23:31:18.143031-08
9	auth	0004_alter_user_username_opts	2024-11-18 23:31:18.161771-08
10	auth	0005_alter_user_last_login_null	2024-11-18 23:31:18.174162-08
11	auth	0006_require_contenttypes_0002	2024-11-18 23:31:18.178442-08
12	auth	0007_alter_validators_add_error_messages	2024-11-18 23:31:18.188716-08
13	auth	0008_alter_user_username_max_length	2024-11-18 23:31:18.227654-08
14	auth	0009_alter_user_last_name_max_length	2024-11-18 23:31:18.265858-08
15	auth	0010_alter_group_name_max_length	2024-11-18 23:31:18.292026-08
16	auth	0011_update_proxy_permissions	2024-11-18 23:31:18.29995-08
17	auth	0012_alter_user_first_name_max_length	2024-11-18 23:31:18.311876-08
18	sessions	0001_initial	2024-11-18 23:31:18.384282-08
19	sportsApp	0001_initial	2024-11-29 23:42:38.586177-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.equipment (equipment_id, etype, cost, sport_id) FROM stdin;
1	court shoes	150.00	3
2	court shoes	120.00	2
3	paddle	15.00	10
4	cleats	90.00	1
5	clubs	400.00	8
6	glove	70.00	5
7	cleats	120.00	9
8	swim suit	20.00	6
9	cleats	110.00	4
10	beer	7.00	7
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.location (location_id, name, size, ltype) FROM stdin;
1	Arizona Athletic Grounds	1	outside
2	Barney Family Sports Complex	2	outside
3	Rose Mofford Sports Complex	1	inside
4	Bell Bank Park	3	outside
5	Cactus Yards	2	outside
6	Riverview Sports Complex	1	inside
7	Salt River Fields	1	outside
8	Kiwanis Recreation Center	1	outside
9	Ability 360 Sports and Fitness Center	3	inside
10	Snedigar Recreation Center	1	inside
\.


--
-- Data for Name: location_city; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.location_city (location_id, city_id) FROM stdin;
1	2
4	4
7	6
2	8
8	10
5	1
3	3
9	5
6	7
10	9
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.person (person_id, name, city_id) FROM stdin;
1	Grima	10
2	Sam	1
3	Boromir	3
4	Legolas	2
5	Aragorn	3
6	Shag-rat	6
7	Sharky	1
8	Mairon	7
9	Gollum	8
10	Gimli	9
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.player (player_id, person_id, stats, division) FROM stdin;
1	10	good	Junior Varsity
2	8	great	Varsity
3	6	decent 	Junior Varsity
4	3	mediocre	Junior Varsity
5	7	good	Varsity
6	4	poor	Junior Varsity
7	2	great	Varsity
8	9	prodigious	Varsity
9	1	sucks	Varsity
10	5	good	Junior Varsity
\.


--
-- Data for Name: sport; Type: TABLE DATA; Schema: public; Owner: keegan
--

COPY public.sport (sport_id, name, numplayers, location_id) FROM stdin;
1	soccer	22	1
2	volleyball	12	2
3	basketball	10	3
4	football	22	4
5	baseball	18	5
6	swimming	10	6
7	cornhole	4	7
8	golf	4	8
9	rugby	14	9
10	ping pong	12	10
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: crew crew_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (crew_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (equipment_id);


--
-- Name: location_city location_city_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.location_city
    ADD CONSTRAINT location_city_pkey PRIMARY KEY (location_id, city_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: sport sport_pkey; Type: CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.sport
    ADD CONSTRAINT sport_pkey PRIMARY KEY (sport_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crew crew_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipment equipment_sport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_sport_id_fkey FOREIGN KEY (sport_id) REFERENCES public.sport(sport_id);


--
-- Name: location_city location_city_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.location_city
    ADD CONSTRAINT location_city_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: location_city location_city_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.location_city
    ADD CONSTRAINT location_city_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: person person_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: player player_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(person_id);


--
-- Name: sport sport_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: keegan
--

ALTER TABLE ONLY public.sport
    ADD CONSTRAINT sport_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: TABLE city; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.city TO admin;


--
-- Name: TABLE crew; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.crew TO admin;


--
-- Name: TABLE equipment; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.equipment TO admin;


--
-- Name: TABLE location; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.location TO admin;


--
-- Name: TABLE location_city; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.location_city TO admin;


--
-- Name: TABLE person; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.person TO admin;


--
-- Name: TABLE player; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.player TO admin;


--
-- Name: TABLE sport; Type: ACL; Schema: public; Owner: keegan
--

GRANT ALL ON TABLE public.sport TO admin;


--
-- PostgreSQL database dump complete
--

