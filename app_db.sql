--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: appDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "appDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE "appDB" OWNER TO postgres;

\connect "appDB"

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
-- Name: arrowApp_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."arrowApp_customer" (
    id integer NOT NULL,
    age character varying(20) NOT NULL,
    sex character varying(20) NOT NULL,
    emo character varying(20) NOT NULL,
    od character varying(20) NOT NULL,
    intention character varying(20) NOT NULL,
    personality character varying(20) NOT NULL,
    act character varying(20) NOT NULL,
    word character varying(30) NOT NULL
);


ALTER TABLE public."arrowApp_customer" OWNER TO postgres;

--
-- Name: arrowApp_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."arrowApp_customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."arrowApp_customer_id_seq" OWNER TO postgres;

--
-- Name: arrowApp_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."arrowApp_customer_id_seq" OWNED BY public."arrowApp_customer".id;


--
-- Name: arrowApp_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."arrowApp_data" (
    id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    word character varying(30) NOT NULL,
    c_type character varying(10)
);


ALTER TABLE public."arrowApp_data" OWNER TO postgres;

--
-- Name: arrowApp_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."arrowApp_data_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."arrowApp_data_id_seq" OWNER TO postgres;

--
-- Name: arrowApp_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."arrowApp_data_id_seq" OWNED BY public."arrowApp_data".id;


--
-- Name: arrowApp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."arrowApp_user" (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    password character varying(100) NOT NULL,
    level integer
);


ALTER TABLE public."arrowApp_user" OWNER TO postgres;

--
-- Name: arrowApp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."arrowApp_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."arrowApp_user_id_seq" OWNER TO postgres;

--
-- Name: arrowApp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."arrowApp_user_id_seq" OWNED BY public."arrowApp_user".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: arrowApp_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_customer" ALTER COLUMN id SET DEFAULT nextval('public."arrowApp_customer_id_seq"'::regclass);


--
-- Name: arrowApp_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_data" ALTER COLUMN id SET DEFAULT nextval('public."arrowApp_data_id_seq"'::regclass);


--
-- Name: arrowApp_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_user" ALTER COLUMN id SET DEFAULT nextval('public."arrowApp_user_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: arrowApp_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."arrowApp_customer" (id, age, sex, emo, od, intention, personality, act, word) FROM stdin;
1	30	男	感情的	受け	安定志向	協調的	行動派	次もある
2	30	男	感情的	受け	安定志向	協調的	行動派	満足
3	60	女	理性的	攻め	安定志向	個性的	慎重派	家族
4	60	女	理性的	受け	上昇志向	個性的	行動派	効率
5	50	男	理性的	攻め	上昇志向	協調的	慎重派	失敗
6	20	男	感情的	受け	上昇志向	協調的	行動派	あなただけ
7	40	男	感情的	受け	安定志向	協調的	行動派	家族
8	60	男	感情的	受け	安定志向	協調的	行動派	守る
9	50	男	感情的	攻め	安定志向	協調的	行動派	利益
10	20	女	感情的	攻め	上昇志向	個性的	行動派	コスト
11	50	男	感情的	受け	上昇志向	協調的	慎重派	いまさら
12	40	女	感情的	受け	安定志向	個性的	行動派	相談
13	20	男	理性的	攻め	上昇志向	協調的	慎重派	数字
14	40	女	感情的	攻め	安定志向	協調的	慎重派	あなただけ
15	50	女	理性的	受け	上昇志向	個性的	慎重派	あなただけ
16	40	男	感情的	受け	安定志向	協調的	慎重派	無料
17	30	男	理性的	受け	安定志向	個性的	行動派	攻める
18	30	女	感情的	受け	上昇志向	個性的	慎重派	金銭
19	50	男	感情的	攻め	安定志向	個性的	慎重派	いまさら
20	60	女	理性的	攻め	上昇志向	個性的	行動派	攻める
21	30	女	感情的	攻め	安定志向	協調的	慎重派	対策
22	30	男	感情的	受け	上昇志向	個性的	行動派	せっかく
23	50	男	理性的	攻め	上昇志向	個性的	行動派	次はない
24	40	男	感情的	受け	上昇志向	協調的	行動派	対策
25	40	男	感情的	受け	安定志向	個性的	行動派	相談
26	40	女	感情的	攻め	上昇志向	個性的	慎重派	次はない
27	40	男	感情的	受け	安定志向	協調的	行動派	満足
28	30	男	理性的	受け	安定志向	協調的	行動派	年齢
29	40	女	理性的	受け	上昇志向	協調的	行動派	攻める
30	40	女	理性的	攻め	安定志向	協調的	行動派	利益
31	30	女	感情的	攻め	上昇志向	個性的	慎重派	キャンペーン
32	40	女	理性的	攻め	安定志向	個性的	慎重派	数字
33	50	男	理性的	攻め	上昇志向	個性的	慎重派	サポート
34	40	女	感情的	攻め	安定志向	個性的	行動派	相談
35	60	女	感情的	受け	安定志向	個性的	行動派	効率
36	50	女	理性的	攻め	安定志向	協調的	慎重派	成功
37	20	男	理性的	受け	上昇志向	協調的	行動派	せっかく
38	30	女	感情的	攻め	上昇志向	個性的	慎重派	安心
39	60	女	感情的	攻め	安定志向	協調的	行動派	対策
40	60	男	感情的	攻め	安定志向	個性的	行動派	無料
41	40	女	感情的	受け	安定志向	個性的	行動派	脅迫
42	60	女	理性的	受け	安定志向	協調的	行動派	否定
43	20	女	感情的	受け	上昇志向	協調的	行動派	肯定
44	30	男	感情的	受け	安定志向	協調的	慎重派	無料
45	30	女	理性的	攻め	上昇志向	協調的	慎重派	受賞
46	40	男	感情的	攻め	安定志向	協調的	慎重派	勿体ない
47	20	女	感情的	攻め	安定志向	協調的	慎重派	勿体ない
48	30	男	感情的	受け	上昇志向	個性的	慎重派	満足
49	40	女	感情的	攻め	安定志向	協調的	慎重派	数字
50	60	男	感情的	攻め	安定志向	協調的	行動派	脅迫
51	50	女	理性的	受け	上昇志向	協調的	行動派	安心
52	30	女	感情的	受け	上昇志向	協調的	慎重派	次もある
53	20	男	感情的	受け	安定志向	個性的	行動派	年齢
54	30	女	感情的	受け	上昇志向	個性的	行動派	次もある
55	30	女	感情的	攻め	安定志向	個性的	行動派	次もある
56	50	女	理性的	攻め	上昇志向	個性的	慎重派	脅迫
57	30	女	感情的	攻め	上昇志向	協調的	慎重派	勿体ない
58	40	女	理性的	受け	上昇志向	個性的	行動派	いまさら
59	30	男	理性的	攻め	安定志向	個性的	行動派	成功
60	50	男	感情的	受け	上昇志向	協調的	慎重派	成功
61	30	女	理性的	攻め	上昇志向	個性的	行動派	今だけ
62	40	男	理性的	受け	上昇志向	協調的	慎重派	必要
63	60	女	理性的	攻め	上昇志向	協調的	慎重派	No1
64	50	男	感情的	攻め	上昇志向	個性的	慎重派	安心
65	20	女	感情的	受け	上昇志向	協調的	慎重派	一緒に
66	40	女	理性的	攻め	上昇志向	協調的	慎重派	次はない
67	20	男	感情的	攻め	上昇志向	個性的	慎重派	未来
68	30	男	理性的	攻め	安定志向	協調的	慎重派	対策
69	60	男	感情的	攻め	上昇志向	協調的	行動派	成功
70	40	男	感情的	受け	上昇志向	協調的	慎重派	効率
71	40	女	理性的	攻め	安定志向	個性的	行動派	ここだけの話
72	40	女	理性的	受け	上昇志向	個性的	慎重派	せっかく
73	30	男	感情的	攻め	上昇志向	個性的	行動派	守る
74	50	男	理性的	受け	上昇志向	協調的	慎重派	世界
75	50	男	理性的	受け	安定志向	協調的	行動派	No1
76	60	女	理性的	攻め	上昇志向	協調的	行動派	今だけ
77	50	男	理性的	攻め	安定志向	個性的	慎重派	次はない
78	30	男	理性的	受け	上昇志向	個性的	行動派	安心
79	60	男	理性的	受け	上昇志向	協調的	慎重派	一緒に
80	20	男	理性的	攻め	上昇志向	協調的	行動派	肯定
81	50	女	感情的	攻め	安定志向	協調的	慎重派	コスト
82	20	女	理性的	攻め	安定志向	協調的	慎重派	世界
83	40	女	感情的	受け	安定志向	協調的	行動派	年齢
84	20	女	理性的	攻め	上昇志向	個性的	行動派	効率
85	20	男	感情的	攻め	安定志向	個性的	行動派	受賞
86	50	女	感情的	受け	上昇志向	個性的	慎重派	皆
87	40	女	感情的	攻め	安定志向	協調的	行動派	否定
88	40	男	理性的	攻め	安定志向	協調的	慎重派	成功
89	50	男	感情的	受け	上昇志向	個性的	慎重派	満足
90	30	男	感情的	攻め	安定志向	個性的	行動派	次もある
91	50	男	感情的	攻め	上昇志向	協調的	慎重派	皆
92	20	女	感情的	受け	上昇志向	協調的	慎重派	次もある
93	20	男	感情的	受け	上昇志向	個性的	慎重派	勿体ない
94	20	男	感情的	攻め	上昇志向	個性的	慎重派	満足
95	50	女	理性的	受け	上昇志向	個性的	行動派	ここだけの話
96	60	男	理性的	受け	上昇志向	協調的	慎重派	コスト
97	60	男	感情的	受け	上昇志向	協調的	慎重派	安心
98	20	男	理性的	受け	上昇志向	個性的	行動派	受賞
99	40	女	理性的	受け	安定志向	協調的	行動派	守る
100	30	男	理性的	受け	上昇志向	協調的	慎重派	次もある
\.


--
-- Data for Name: arrowApp_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."arrowApp_data" (id, x, y, word, c_type) FROM stdin;
1	1	11	次もある	am
2	1	11	満足	am
3	3	-21	家族	a
4	-5	-41	効率	d
5	-33	-33	失敗	d
6	-3	21	あなただけ	e
7	-9	-6	家族	d
8	-29	-41	守る	d
9	-41	-9	利益	d
10	7	57	コスト	am
11	-17	-33	いまさら	d
12	23	16	相談	am
13	-3	19	数字	e
14	5	26	あなただけ	am
15	21	-25	あなただけ	a
16	7	-8	無料	a
17	19	0	攻める	am
18	35	23	金銭	am
19	-13	-9	いまさら	d
20	-27	-27	攻める	d
21	15	43	対策	am
22	-1	5	せっかく	e
23	-37	-29	次はない	d
24	-23	-14	対策	d
25	3	-4	相談	a
26	3	20	次はない	am
27	-9	-6	満足	d
28	7	-2	年齢	a
29	3	-8	攻める	a
30	-5	14	利益	e
31	13	37	キャンペーン	am
32	23	14	数字	am
33	-21	-31	サポート	d
34	1	30	相談	am
35	3	-19	効率	a
36	1	-5	成功	a
37	3	7	せっかく	am
38	13	37	安心	am
39	-31	-7	対策	d
40	-39	-25	無料	d
41	23	16	脅迫	am
42	-3	-35	否定	d
43	17	41	肯定	am
44	17	9	無料	am
45	7	21	受賞	am
46	-15	6	勿体ない	e
47	25	61	勿体ない	am
48	15	3	満足	am
49	5	26	数字	am
50	-51	-27	脅迫	d
51	-7	-25	安心	d
52	23	21	次もある	am
53	23	31	年齢	am
54	19	25	次もある	am
55	11	47	次もある	am
56	-1	-11	脅迫	d
57	1	35	勿体ない	am
58	15	-6	いまさら	a
59	-3	13	成功	e
60	-17	-33	成功	d
61	3	25	今だけ	am
62	-1	-30	必要	d
63	-23	-31	No1	d
64	-27	-17	安心	d
65	33	39	一緒に	am
66	-3	4	次はない	e
67	3	35	未来	am
68	1	9	対策	am
69	-65	-35	成功	d
70	-7	-16	効率	d
71	7	16	ここだけの話	am
72	31	-8	せっかく	a
73	-23	19	守る	e
74	-11	-47	世界	d
75	-13	-37	No1	d
76	-39	-29	今だけ	d
77	-7	-23	次はない	d
78	5	-8	安心	a
79	-21	-65	一緒に	d
80	-19	21	肯定	e
81	-5	8	コスト	e
82	31	47	世界	am
83	11	14	年齢	am
84	13	43	効率	am
85	1	45	受賞	am
86	15	-11	皆	a
87	-11	28	否定	e
88	-9	-8	成功	d
89	-5	-31	満足	d
90	-9	27	次もある	e
91	-39	-19	皆	d
92	33	39	次もある	am
93	25	21	勿体ない	am
94	3	35	満足	am
95	5	-23	ここだけの話	a
96	-21	-65	コスト	d
97	-27	-51	安心	d
98	15	9	受賞	am
99	17	0	守る	am
100	9	-12	次もある	a
\.


--
-- Data for Name: arrowApp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."arrowApp_user" (id, name, password, level) FROM stdin;
1	admin	FT2Ey7n2VCncaTaBLWPE7g==	0
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add customer	1	add_customer
2	Can change customer	1	change_customer
3	Can delete customer	1	delete_customer
4	Can view customer	1	view_customer
5	Can add data	2	add_data
6	Can change data	2	change_data
7	Can delete data	2	delete_data
8	Can view data	2	view_data
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	arrowApp	customer
2	arrowApp	data
3	arrowApp	user
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-25 13:30:34.085377+09
2	auth	0001_initial	2020-02-25 13:30:34.237327+09
3	admin	0001_initial	2020-02-25 13:30:34.46747+09
4	admin	0002_logentry_remove_auto_add	2020-02-25 13:30:34.511455+09
5	admin	0003_logentry_add_action_flag_choices	2020-02-25 13:30:34.519452+09
6	arrowApp	0001_initial	2020-02-25 13:30:34.571436+09
7	contenttypes	0002_remove_content_type_name	2020-02-25 13:30:34.587431+09
8	auth	0002_alter_permission_name_max_length	2020-02-25 13:30:34.591429+09
9	auth	0003_alter_user_email_max_length	2020-02-25 13:30:34.599427+09
10	auth	0004_alter_user_username_opts	2020-02-25 13:30:34.607424+09
11	auth	0005_alter_user_last_login_null	2020-02-25 13:30:34.611423+09
12	auth	0006_require_contenttypes_0002	2020-02-25 13:30:34.615422+09
13	auth	0007_alter_validators_add_error_messages	2020-02-25 13:30:34.619421+09
14	auth	0008_alter_user_username_max_length	2020-02-25 13:30:34.647428+09
15	auth	0009_alter_user_last_name_max_length	2020-02-25 13:30:34.659421+09
16	auth	0010_alter_group_name_max_length	2020-02-25 13:30:34.667422+09
17	auth	0011_update_proxy_permissions	2020-02-25 13:30:34.675402+09
18	sessions	0001_initial	2020-02-25 13:30:34.707392+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: arrowApp_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."arrowApp_customer_id_seq"', 100, true);


--
-- Name: arrowApp_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."arrowApp_data_id_seq"', 117, true);


--
-- Name: arrowApp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."arrowApp_user_id_seq"', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: arrowApp_customer arrowApp_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_customer"
    ADD CONSTRAINT "arrowApp_customer_pkey" PRIMARY KEY (id);


--
-- Name: arrowApp_data arrowApp_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_data"
    ADD CONSTRAINT "arrowApp_data_pkey" PRIMARY KEY (id);


--
-- Name: arrowApp_user arrowApp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."arrowApp_user"
    ADD CONSTRAINT "arrowApp_user_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

