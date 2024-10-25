--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: aircraft_app_aviyonik; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_aviyonik (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    aviyonik_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.aircraft_app_aviyonik OWNER TO hmd;

--
-- Name: aircraft_app_aviyonik_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_aviyonik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_aviyonik_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_aviyonik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_aviyonik_id_seq OWNED BY public.aircraft_app_aviyonik.id;


--
-- Name: aircraft_app_customuser; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150) NOT NULL,
    first_name character varying(150),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    role character varying(10) NOT NULL
);


ALTER TABLE public.aircraft_app_customuser OWNER TO hmd;

--
-- Name: aircraft_app_customuser_groups; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.aircraft_app_customuser_groups OWNER TO hmd;

--
-- Name: aircraft_app_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_customuser_groups_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_customuser_groups_id_seq OWNED BY public.aircraft_app_customuser_groups.id;


--
-- Name: aircraft_app_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_customuser_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_customuser_id_seq OWNED BY public.aircraft_app_customuser.id;


--
-- Name: aircraft_app_customuser_user_permissions; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.aircraft_app_customuser_user_permissions OWNER TO hmd;

--
-- Name: aircraft_app_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq OWNED BY public.aircraft_app_customuser_user_permissions.id;


--
-- Name: aircraft_app_govde; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_govde (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    govde_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.aircraft_app_govde OWNER TO hmd;

--
-- Name: aircraft_app_govde_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_govde_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_govde_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_govde_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_govde_id_seq OWNED BY public.aircraft_app_govde.id;


--
-- Name: aircraft_app_kanat; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_kanat (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    kanat_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.aircraft_app_kanat OWNER TO hmd;

--
-- Name: aircraft_app_kanat_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_kanat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_kanat_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_kanat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_kanat_id_seq OWNED BY public.aircraft_app_kanat.id;


--
-- Name: aircraft_app_kuyruk; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_kuyruk (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    kuyruk_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.aircraft_app_kuyruk OWNER TO hmd;

--
-- Name: aircraft_app_kuyruk_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_kuyruk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_kuyruk_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_kuyruk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_kuyruk_id_seq OWNED BY public.aircraft_app_kuyruk.id;


--
-- Name: aircraft_app_ucak; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.aircraft_app_ucak (
    id bigint NOT NULL,
    ucak_adi character varying(100) NOT NULL,
    seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    aviyonik_serial character varying(100) NOT NULL,
    govde_serial character varying(100) NOT NULL,
    kanat_serial character varying(100) NOT NULL,
    kuyruk_serial character varying(100) NOT NULL
);


ALTER TABLE public.aircraft_app_ucak OWNER TO hmd;

--
-- Name: aircraft_app_ucak_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.aircraft_app_ucak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aircraft_app_ucak_id_seq OWNER TO hmd;

--
-- Name: aircraft_app_ucak_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.aircraft_app_ucak_id_seq OWNED BY public.aircraft_app_ucak.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO hmd;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO hmd;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO hmd;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO hmd;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO hmd;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO hmd;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO hmd;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO hmd;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO hmd;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO hmd;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO hmd;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hmd
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO hmd;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmd
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: hmd
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO hmd;

--
-- Name: aircraft_app_aviyonik id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_aviyonik ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_aviyonik_id_seq'::regclass);


--
-- Name: aircraft_app_customuser id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_id_seq'::regclass);


--
-- Name: aircraft_app_customuser_groups id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_groups_id_seq'::regclass);


--
-- Name: aircraft_app_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_user_permissions_id_seq'::regclass);


--
-- Name: aircraft_app_govde id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_govde ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_govde_id_seq'::regclass);


--
-- Name: aircraft_app_kanat id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_kanat ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_kanat_id_seq'::regclass);


--
-- Name: aircraft_app_kuyruk id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_kuyruk ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_kuyruk_id_seq'::regclass);


--
-- Name: aircraft_app_ucak id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_ucak ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_ucak_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: aircraft_app_aviyonik; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_aviyonik (id, ucak_adi, aviyonik_seri_numarasi, uretim_tarihi, status) FROM stdin;
6	TB2	TB2_Aviyonik_003	2024-10-24 18:04:50.935954+03	uygun
16	TB2	TB2_Aviyonik_004	2024-10-24 18:45:50.741264+03	uygun
17	TB2	TB2_Aviyonik_005	2024-10-24 18:46:17.706297+03	uygun
18	TB2	TB2_Aviyonik_006	2024-10-24 18:48:37.098661+03	uygun
23	TB2	TB2_Aviyonik_011	2024-10-25 00:08:24.281424+03	uygun
24	TB2	TB2_Aviyonik_012	2024-10-25 00:08:25.003529+03	uygun
25	TB3	TB3_Aviyonik_005	2024-10-25 10:27:56.479379+03	uygun
26	TB3	TB3_Aviyonik_006	2024-10-25 10:27:57.2486+03	uygun
27	TB3	TB3_Aviyonik_007	2024-10-25 10:27:57.968171+03	uygun
28	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_005	2024-10-25 10:28:00.538687+03	uygun
29	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_006	2024-10-25 10:28:01.001528+03	uygun
30	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_007	2024-10-25 10:28:01.593887+03	uygun
35	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_008	2024-10-25 11:35:27.779226+03	uygun
22	TB2	TB2_Aviyonik_010	2024-10-24 18:48:51.334793+03	kullanimda
15	TB3	TB3_Aviyonik_004	2024-10-24 18:44:09.33561+03	kullanimda
3	TB3	TB3_Aviyonik_003	2024-10-24 18:03:58.279305+03	kullanimda
21	TB2	TB2_Aviyonik_009	2024-10-24 18:48:50.918455+03	kullanimda
20	TB2	TB2_Aviyonik_008	2024-10-24 18:48:50.475907+03	kullanimda
10	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_004	2024-10-24 18:04:53.252042+03	kullanimda
9	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_003	2024-10-24 18:04:52.918382+03	kullanimda
14	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_004	2024-10-24 18:04:55.11149+03	kullanimda
8	Ak─▒nc─▒	Ak─▒nc─▒_Aviyonik_002	2024-10-24 18:04:52.607575+03	kullanimda
2	TB3	TB3_Aviyonik_002	2024-10-24 18:03:57.663772+03	kullanimda
1	TB3	TB3_Aviyonik_001	2024-10-24 18:03:56.470604+03	kullanimda
13	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_003	2024-10-24 18:04:55.019405+03	kullanimda
12	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_002	2024-10-24 18:04:54.826854+03	kullanimda
19	TB2	TB2_Aviyonik_007	2024-10-24 18:48:50.061708+03	kullanimda
11	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_001	2024-10-24 18:04:54.672975+03	kullanimda
36	K─▒z─▒lelma	K─▒z─▒lelma_Aviyonik_009	2024-10-25 11:35:28.313822+03	kullanimda
34	TB2	TB2_Aviyonik_013	2024-10-25 10:28:12.857752+03	kullanimda
\.


--
-- Data for Name: aircraft_app_customuser; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) FROM stdin;
6	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 10:21:18.189617+03	f	veli			\N	t	t	2024-10-23 15:47:57.950112+03	kuyruk
4	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 11:35:03.795297+03	f	ahmet			\N	t	t	2024-10-23 15:47:57.950112+03	govde
2	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 11:35:14.401145+03	t	ali			\N	t	t	2024-10-23 15:47:57.950112+03	kuyruk
3	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 11:35:24.800653+03	f	mert			\N	t	t	2024-10-23 15:47:57.950112+03	aviyonik
1	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 13:26:08.10414+03	t	hmd			\N	t	t	2024-10-23 15:47:57.950112+03	montaj
5	pbkdf2_sha256$260000$IDo4X2uP7I5vXp7i3vWpI5$2Gupq7GOtwUyCsh45OddrdX2Tzth5qtD0AuCYM4VsXA=	2024-10-25 13:26:23.712886+03	f	hasan			\N	t	t	2024-10-23 15:47:57.950112+03	kanat
\.


--
-- Data for Name: aircraft_app_customuser_groups; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: aircraft_app_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: aircraft_app_govde; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_govde (id, ucak_adi, govde_seri_numarasi, uretim_tarihi, status) FROM stdin;
31	TB3	TB3_Govde_008	2024-10-24 22:59:16.229453+03	uygun
32	TB3	TB3_Govde_009	2024-10-24 22:59:26.964658+03	uygun
33	TB3	TB3_Govde_010	2024-10-24 22:59:27.517937+03	uygun
36	K─▒z─▒lelma	K─▒z─▒lelma_Govde_013	2024-10-24 22:59:45.280637+03	uygun
37	K─▒z─▒lelma	K─▒z─▒lelma_Govde_014	2024-10-24 22:59:46.634209+03	uygun
42	TB2	TB2_Govde_007	2024-10-24 23:33:41.802909+03	uygun
43	TB2	TB2_Govde_008	2024-10-24 23:33:47.670048+03	uygun
44	TB2	TB2_Govde_009	2024-10-24 23:34:01.088709+03	uygun
45	TB2	TB2_Govde_010	2024-10-24 23:35:06.68028+03	uygun
46	TB2	TB2_Govde_011	2024-10-24 23:36:18.155232+03	uygun
47	TB2	TB2_Govde_012	2024-10-24 23:36:19.452302+03	uygun
48	TB2	TB2_Govde_013	2024-10-24 23:36:37.221539+03	uygun
49	TB2	TB2_Govde_014	2024-10-24 23:36:38.245812+03	uygun
50	TB2	TB2_Govde_015	2024-10-24 23:36:39.098367+03	uygun
51	TB2	TB2_Govde_016	2024-10-24 23:36:40.052296+03	uygun
52	TB2	TB2_Govde_017	2024-10-24 23:36:49.877172+03	uygun
53	TB2	TB2_Govde_018	2024-10-24 23:37:58.704428+03	uygun
54	TB2	TB2_Govde_019	2024-10-24 23:38:46.512903+03	uygun
55	TB2	TB2_Govde_020	2024-10-24 23:38:47.43271+03	uygun
56	TB2	TB2_Govde_021	2024-10-24 23:38:48.326536+03	uygun
61	TB2	TB2_Govde_022	2024-10-24 23:39:03.451477+03	uygun
62	TB2	TB2_Govde_023	2024-10-24 23:39:04.096513+03	uygun
64	K─▒z─▒lelma	K─▒z─▒lelma_Govde_018	2024-10-24 23:39:07.409921+03	uygun
65	K─▒z─▒lelma	K─▒z─▒lelma_Govde_019	2024-10-24 23:39:07.753208+03	uygun
66	K─▒z─▒lelma	K─▒z─▒lelma_Govde_020	2024-10-24 23:39:08.037741+03	uygun
67	K─▒z─▒lelma	K─▒z─▒lelma_Govde_021	2024-10-24 23:39:08.366752+03	uygun
71	Ak─▒nc─▒	Ak─▒nc─▒_Govde_006	2024-10-24 23:40:48.854854+03	uygun
72	Ak─▒nc─▒	Ak─▒nc─▒_Govde_007	2024-10-24 23:40:58.673762+03	uygun
73	Ak─▒nc─▒	Ak─▒nc─▒_Govde_008	2024-10-25 11:35:08.26173+03	uygun
12	TB2	TB2_Govde_005	2024-10-24 15:46:05.45369+03	kullanimda
21	TB3	TB3_Govde_007	2024-10-24 15:50:31.265223+03	kullanimda
9	TB2	TB2_Govde_004	2024-10-24 15:41:26.533261+03	kullanimda
8	TB2	TB2_Govde_003	2024-10-24 15:41:23.461106+03	kullanimda
19	Ak─▒nc─▒	Ak─▒nc─▒_Govde_003	2024-10-24 15:46:30.291443+03	kullanimda
18	Ak─▒nc─▒	Ak─▒nc─▒_Govde_002	2024-10-24 15:46:30.004344+03	kullanimda
29	K─▒z─▒lelma	K─▒z─▒lelma_Govde_012	2024-10-24 15:55:26.720045+03	kullanimda
13	Ak─▒nc─▒	Ak─▒nc─▒_Govde_001	2024-10-24 15:46:07.025464+03	kullanimda
35	TB3	TB3_Govde_012	2024-10-24 22:59:28.779044+03	kullanimda
34	TB3	TB3_Govde_011	2024-10-24 22:59:28.058706+03	kullanimda
40	K─▒z─▒lelma	K─▒z─▒lelma_Govde_017	2024-10-24 22:59:48.5781+03	kullanimda
39	K─▒z─▒lelma	K─▒z─▒lelma_Govde_016	2024-10-24 22:59:48.085578+03	kullanimda
41	TB2	TB2_Govde_006	2024-10-24 22:59:55.286388+03	kullanimda
38	K─▒z─▒lelma	K─▒z─▒lelma_Govde_015	2024-10-24 22:59:47.746587+03	kullanimda
68	K─▒z─▒lelma	K─▒z─▒lelma_Govde_022	2024-10-24 23:39:09.849818+03	kullanimda
63	TB2	TB2_Govde_024	2024-10-24 23:39:04.597672+03	kullanimda
\.


--
-- Data for Name: aircraft_app_kanat; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_kanat (id, ucak_adi, kanat_seri_numarasi, uretim_tarihi, status) FROM stdin;
101	TB3	TB3_Kanat_034	2024-10-24 14:48:45.272165+03	uygun
102	TB3	TB3_Kanat_035	2024-10-24 14:48:46.355815+03	uygun
103	TB3	TB3_Kanat_035	2024-10-24 14:48:46.358828+03	uygun
105	TB3	TB3_Kanat_036	2024-10-24 14:48:59.3359+03	uygun
106	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_012	2024-10-24 14:49:01.434706+03	uygun
107	TB3	TB3_Kanat_037	2024-10-24 14:50:25.999198+03	uygun
108	TB3	TB3_Kanat_038	2024-10-24 14:50:33.110241+03	uygun
111	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_011	2024-10-24 14:52:10.512534+03	uygun
126	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_013	2024-10-24 14:56:16.800747+03	uygun
149	TB2	TB2_Kanat_056	2024-10-24 23:50:12.646267+03	uygun
151	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_016	2024-10-25 10:30:15.544432+03	uygun
153	TB2	TB2_Kanat_058	2024-10-25 11:59:24.197181+03	uygun
154	TB2	TB2_Kanat_059	2024-10-25 11:59:24.539196+03	uygun
146	TB2	TB2_Kanat_053	2024-10-24 17:45:58.644578+03	kullanimda
132	TB3	TB3_Kanat_042	2024-10-24 15:00:04.048373+03	kullanimda
125	TB3	TB3_Kanat_041	2024-10-24 14:56:02.157343+03	kullanimda
147	TB2	TB2_Kanat_054	2024-10-24 22:12:28.720221+03	kullanimda
145	TB2	TB2_Kanat_052	2024-10-24 17:45:58.044177+03	kullanimda
144	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_016	2024-10-24 16:46:19.546661+03	kullanimda
141	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_015	2024-10-24 15:13:01.254006+03	kullanimda
131	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_015	2024-10-24 14:59:10.772656+03	kullanimda
130	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_014	2024-10-24 14:59:07.235609+03	kullanimda
113	TB3	TB3_Kanat_040	2024-10-24 14:52:14.270242+03	kullanimda
65	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_009	2024-10-24 11:54:49.945079+03	uygun
68	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_010	2024-10-24 11:57:57.419055+03	uygun
69	Ak─▒nc─▒	Ak─▒nc─▒_Kanat_011	2024-10-24 11:57:58.066727+03	uygun
109	TB3	TB3_Kanat_039	2024-10-24 14:50:35.989561+03	kullanimda
120	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_014	2024-10-24 14:53:16.275605+03	kullanimda
119	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_013	2024-10-24 14:53:14.681149+03	kullanimda
148	TB2	TB2_Kanat_055	2024-10-24 22:58:37.444911+03	kullanimda
112	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_012	2024-10-24 14:52:12.644626+03	kullanimda
152	K─▒z─▒lelma	K─▒z─▒lelma_Kanat_017	2024-10-25 10:30:16.185874+03	kullanimda
150	TB2	TB2_Kanat_057	2024-10-25 10:30:04.350537+03	kullanimda
155	TB2	TB2_Kanat_060	2024-10-25 13:26:38.15383+03	uygun
\.


--
-- Data for Name: aircraft_app_kuyruk; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_kuyruk (id, ucak_adi, kuyruk_seri_numarasi, uretim_tarihi, status) FROM stdin;
92	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_017	2024-10-25 10:47:18.145598+03	uygun
93	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_018	2024-10-25 10:47:18.443918+03	uygun
95	TB2	TB2_Kuyruk_034	2024-10-25 10:49:55.776123+03	uygun
97	TB2	TB2_Kuyruk_036	2024-10-25 10:50:06.716894+03	uygun
100	TB2	TB2_Kuyruk_039	2024-10-25 10:52:40.917442+03	uygun
102	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_012	2024-10-25 10:52:55.482928+03	uygun
103	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_013	2024-10-25 10:52:55.732071+03	uygun
104	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_014	2024-10-25 10:52:56.087927+03	uygun
105	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_015	2024-10-25 10:52:56.241723+03	kullanimda
101	TB2	TB2_Kuyruk_040	2024-10-25 10:52:41.068946+03	kullanimda
55	TB2	TB2_Kuyruk_020	2024-10-24 17:49:16.873837+03	kullanimda
42	TB3	TB3_Kuyruk_014	2024-10-24 17:38:17.457218+03	kullanimda
41	TB3	TB3_Kuyruk_013	2024-10-24 17:38:16.785804+03	kullanimda
54	TB2	TB2_Kuyruk_019	2024-10-24 17:49:16.149805+03	kullanimda
53	TB2	TB2_Kuyruk_018	2024-10-24 17:48:59.627195+03	kullanimda
37	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_012	2024-10-24 17:22:02.856424+03	kullanimda
35	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_011	2024-10-24 17:18:44.427987+03	kullanimda
44	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_008	2024-10-24 17:39:17.276447+03	kullanimda
34	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_010	2024-10-24 17:18:44.005997+03	kullanimda
38	TB3	TB3_Kuyruk_012	2024-10-24 17:36:52.05198+03	kullanimda
36	TB3	TB3_Kuyruk_011	2024-10-24 17:20:30.849033+03	kullanimda
43	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_007	2024-10-24 17:39:14.616199+03	kullanimda
32	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_006	2024-10-24 17:08:32.552346+03	kullanimda
52	TB2	TB2_Kuyruk_017	2024-10-24 17:47:18.738518+03	kullanimda
20	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_005	2024-10-24 17:01:11.4824+03	kullanimda
56	TB3	TB3_Kuyruk_015	2024-10-24 23:58:27.450375+03	uygun
57	TB3	TB3_Kuyruk_016	2024-10-24 23:58:28.70896+03	uygun
58	TB3	TB3_Kuyruk_017	2024-10-24 23:58:29.661201+03	uygun
69	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_010	2024-10-25 10:26:40.442805+03	uygun
70	K─▒z─▒lelma	K─▒z─▒lelma_Kuyruk_011	2024-10-25 10:26:41.861866+03	uygun
83	Ak─▒nc─▒	Ak─▒nc─▒_Kuyruk_016	2024-10-25 10:35:22.360311+03	uygun
87	TB2	TB2_Kuyruk_033	2024-10-25 10:43:28.033507+03	uygun
\.


--
-- Data for Name: aircraft_app_ucak; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.aircraft_app_ucak (id, ucak_adi, seri_numarasi, uretim_tarihi, aviyonik_serial, govde_serial, kanat_serial, kuyruk_serial) FROM stdin;
4	TB2	TB2_003	2024-10-24 21:21:34.508644+03	TB2_Aviyonik_010	TB2_Govde_005	TB2_Kanat_053	TB2_Kuyruk_020
5	TB3	TB3_001	2024-10-24 21:55:37.497844+03	TB3_Aviyonik_004	TB3_Govde_007	TB3_Kanat_042	TB3_Kuyruk_014
7	TB2	TB2_004	2024-10-24 22:26:41.761287+03	TB2_Aviyonik_009	TB2_Govde_004	TB2_Kanat_054	TB2_Kuyruk_019
8	TB2	TB2_005	2024-10-24 22:50:52.836237+03	TB2_Aviyonik_008	TB2_Govde_003	TB2_Kanat_052	TB2_Kuyruk_018
9	Ak─▒nc─▒	Ak─▒nc─▒_001	2024-10-24 22:53:23.408728+03	Ak─▒nc─▒_Aviyonik_004	Ak─▒nc─▒_Govde_003	Ak─▒nc─▒_Kanat_016	Ak─▒nc─▒_Kuyruk_012
10	Ak─▒nc─▒	Ak─▒nc─▒_002	2024-10-24 22:53:44.330065+03	Ak─▒nc─▒_Aviyonik_003	Ak─▒nc─▒_Govde_002	Ak─▒nc─▒_Kanat_015	Ak─▒nc─▒_Kuyruk_011
11	K─▒z─▒lelma	K─▒z─▒lelma_001	2024-10-24 22:54:27.948254+03	K─▒z─▒lelma_Aviyonik_004	K─▒z─▒lelma_Govde_012	K─▒z─▒lelma_Kanat_015	K─▒z─▒lelma_Kuyruk_008
12	Ak─▒nc─▒	Ak─▒nc─▒_003	2024-10-24 22:55:43.026081+03	Ak─▒nc─▒_Aviyonik_002	Ak─▒nc─▒_Govde_001	Ak─▒nc─▒_Kanat_014	Ak─▒nc─▒_Kuyruk_010
13	TB3	TB3_003	2024-10-24 23:00:39.933814+03	TB3_Aviyonik_002	TB3_Govde_012	TB3_Kanat_040	TB3_Kuyruk_012
14	TB3	TB3_004	2024-10-24 23:00:58.336332+03	TB3_Aviyonik_001	TB3_Govde_011	TB3_Kanat_039	TB3_Kuyruk_011
15	K─▒z─▒lelma	K─▒z─▒lelma_002	2024-10-24 23:01:13.666132+03	K─▒z─▒lelma_Aviyonik_003	K─▒z─▒lelma_Govde_017	K─▒z─▒lelma_Kanat_014	K─▒z─▒lelma_Kuyruk_007
16	K─▒z─▒lelma	K─▒z─▒lelma_003	2024-10-24 23:01:17.949282+03	K─▒z─▒lelma_Aviyonik_002	K─▒z─▒lelma_Govde_016	K─▒z─▒lelma_Kanat_013	K─▒z─▒lelma_Kuyruk_006
17	TB2	TB2_006	2024-10-24 23:03:26.327113+03	TB2_Aviyonik_007	TB2_Govde_006	TB2_Kanat_055	TB2_Kuyruk_017
18	K─▒z─▒lelma	K─▒z─▒lelma_004	2024-10-24 23:03:30.992194+03	K─▒z─▒lelma_Aviyonik_001	K─▒z─▒lelma_Govde_015	K─▒z─▒lelma_Kanat_012	K─▒z─▒lelma_Kuyruk_005
19	K─▒z─▒lelma	K─▒z─▒lelma_005	2024-10-25 11:59:05.166525+03	K─▒z─▒lelma_Aviyonik_009	K─▒z─▒lelma_Govde_022	K─▒z─▒lelma_Kanat_017	K─▒z─▒lelma_Kuyruk_015
20	TB2	TB2_007	2024-10-25 11:59:10.620611+03	TB2_Aviyonik_013	TB2_Govde_024	TB2_Kanat_057	TB2_Kuyruk_040
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: hmd
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add kanat	7	add_kanat
26	Can change kanat	7	change_kanat
27	Can delete kanat	7	delete_kanat
28	Can view kanat	7	view_kanat
29	Can add aviyonik	8	add_aviyonik
30	Can change aviyonik	8	change_aviyonik
31	Can delete aviyonik	8	delete_aviyonik
32	Can view aviyonik	8	view_aviyonik
33	Can add govde	9	add_govde
34	Can change govde	9	change_govde
35	Can delete govde	9	delete_govde
36	Can view govde	9	view_govde
37	Can add kuyruk	10	add_kuyruk
38	Can change kuyruk	10	change_kuyruk
39	Can delete kuyruk	10	delete_kuyruk
40	Can view kuyruk	10	view_kuyruk
41	Can add ucak	11	add_ucak
42	Can change ucak	11	change_ucak
43	Can delete ucak	11	delete_ucak
44	Can view ucak	11	view_ucak
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	aircraft_app	customuser
7	aircraft_app	kanat
8	aircraft_app	aviyonik
9	aircraft_app	govde
10	aircraft_app	kuyruk
11	aircraft_app	ucak
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-10-23 15:29:01.182032+03
2	contenttypes	0002_remove_content_type_name	2024-10-23 15:29:01.187116+03
3	auth	0001_initial	2024-10-23 15:29:01.206467+03
4	auth	0002_alter_permission_name_max_length	2024-10-23 15:29:01.210453+03
5	auth	0003_alter_user_email_max_length	2024-10-23 15:29:01.213477+03
6	auth	0004_alter_user_username_opts	2024-10-23 15:29:01.216006+03
7	auth	0005_alter_user_last_login_null	2024-10-23 15:29:01.219018+03
8	auth	0006_require_contenttypes_0002	2024-10-23 15:29:01.220006+03
9	auth	0007_alter_validators_add_error_messages	2024-10-23 15:29:01.223005+03
10	auth	0008_alter_user_username_max_length	2024-10-23 15:29:01.226094+03
11	auth	0009_alter_user_last_name_max_length	2024-10-23 15:29:01.228462+03
12	auth	0010_alter_group_name_max_length	2024-10-23 15:29:01.231973+03
13	auth	0011_update_proxy_permissions	2024-10-23 15:29:01.235102+03
14	auth	0012_alter_user_first_name_max_length	2024-10-23 15:29:01.238064+03
15	aircraft_app	0001_initial	2024-10-23 15:29:01.255972+03
16	admin	0001_initial	2024-10-23 15:29:01.266012+03
17	admin	0002_logentry_remove_auto_add	2024-10-23 15:29:01.270094+03
18	admin	0003_logentry_add_action_flag_choices	2024-10-23 15:29:01.274094+03
19	sessions	0001_initial	2024-10-23 15:29:01.278566+03
20	aircraft_app	0002_kanat	2024-10-23 16:43:01.652726+03
21	aircraft_app	0003_kanat_uretim_tarihi	2024-10-23 17:06:24.779057+03
22	aircraft_app	0004_aviyonik_govde_kuyruk	2024-10-24 08:47:49.067777+03
23	aircraft_app	0005_kanat_status	2024-10-24 16:22:52.563432+03
24	aircraft_app	0006_auto_20241024_1628	2024-10-24 16:28:56.375182+03
25	aircraft_app	0007_ucak	2024-10-24 20:24:24.879243+03
26	aircraft_app	0008_auto_20241024_2113	2024-10-24 21:13:34.959084+03
27	aircraft_app	0009_auto_20241024_2117	2024-10-24 21:17:33.670258+03
28	aircraft_app	0010_auto_20241025_1325	2024-10-25 13:25:59.972717+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: hmd
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
09ojwfvcwy4oiy06oi8mrbjlg6n022qy	.eJxVjEEOwiAQRe_C2hAYCohL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERVpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr-1GVwolDShtWjAEmtPwVkFSjtmKIDGpKEYUsYxDABJB1bJew_KnZV4fwDWvDb5:1t4454:eaoNm6aTsuNS76ke_y0be9Uly9iVR-0xheWBjV7oUho	2024-11-07 23:05:14.919629+03
\.


--
-- Name: aircraft_app_aviyonik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_aviyonik_id_seq', 36, true);


--
-- Name: aircraft_app_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_customuser_groups_id_seq', 1, false);


--
-- Name: aircraft_app_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_customuser_id_seq', 6, true);


--
-- Name: aircraft_app_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_customuser_user_permissions_id_seq', 1, false);


--
-- Name: aircraft_app_govde_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_govde_id_seq', 73, true);


--
-- Name: aircraft_app_kanat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_kanat_id_seq', 155, true);


--
-- Name: aircraft_app_kuyruk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_kuyruk_id_seq', 105, true);


--
-- Name: aircraft_app_ucak_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.aircraft_app_ucak_id_seq', 20, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmd
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: aircraft_app_aviyonik aircraft_app_aviyonik_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_aviyonik
    ADD CONSTRAINT aircraft_app_aviyonik_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_customuser_groups aircraft_app_customuser__customuser_id_group_id_d4d5a26f_uniq; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customuser__customuser_id_group_id_d4d5a26f_uniq UNIQUE (customuser_id, group_id);


--
-- Name: aircraft_app_customuser_user_permissions aircraft_app_customuser__customuser_id_permission_bdf42642_uniq; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customuser__customuser_id_permission_bdf42642_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: aircraft_app_customuser_groups aircraft_app_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_customuser aircraft_app_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser
    ADD CONSTRAINT aircraft_app_customuser_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_customuser_user_permissions aircraft_app_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_customuser aircraft_app_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser
    ADD CONSTRAINT aircraft_app_customuser_username_key UNIQUE (username);


--
-- Name: aircraft_app_govde aircraft_app_govde_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_govde
    ADD CONSTRAINT aircraft_app_govde_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_kanat aircraft_app_kanat_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_kanat
    ADD CONSTRAINT aircraft_app_kanat_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_kuyruk aircraft_app_kuyruk_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_kuyruk
    ADD CONSTRAINT aircraft_app_kuyruk_pkey PRIMARY KEY (id);


--
-- Name: aircraft_app_ucak aircraft_app_ucak_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_ucak
    ADD CONSTRAINT aircraft_app_ucak_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: aircraft_app_customuser_groups_customuser_id_44119884; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX aircraft_app_customuser_groups_customuser_id_44119884 ON public.aircraft_app_customuser_groups USING btree (customuser_id);


--
-- Name: aircraft_app_customuser_groups_group_id_b3a41cbc; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX aircraft_app_customuser_groups_group_id_b3a41cbc ON public.aircraft_app_customuser_groups USING btree (group_id);


--
-- Name: aircraft_app_customuser_user_permissions_customuser_id_bb118ea3; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX aircraft_app_customuser_user_permissions_customuser_id_bb118ea3 ON public.aircraft_app_customuser_user_permissions USING btree (customuser_id);


--
-- Name: aircraft_app_customuser_user_permissions_permission_id_c4dcbfa5; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX aircraft_app_customuser_user_permissions_permission_id_c4dcbfa5 ON public.aircraft_app_customuser_user_permissions USING btree (permission_id);


--
-- Name: aircraft_app_customuser_username_b93f2915_like; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX aircraft_app_customuser_username_b93f2915_like ON public.aircraft_app_customuser USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: hmd
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: aircraft_app_customuser_groups aircraft_app_customu_customuser_id_44119884_fk_aircraft_; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customu_customuser_id_44119884_fk_aircraft_ FOREIGN KEY (customuser_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aircraft_app_customuser_user_permissions aircraft_app_customu_customuser_id_bb118ea3_fk_aircraft_; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customu_customuser_id_bb118ea3_fk_aircraft_ FOREIGN KEY (customuser_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aircraft_app_customuser_groups aircraft_app_customu_group_id_b3a41cbc_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customu_group_id_b3a41cbc_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aircraft_app_customuser_user_permissions aircraft_app_customu_permission_id_c4dcbfa5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customu_permission_id_c4dcbfa5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_aircraft_app_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: hmd
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_aircraft_app_customuser_id FOREIGN KEY (user_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

