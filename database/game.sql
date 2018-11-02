--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: course_assists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_assists (
    id integer NOT NULL,
    assistant_id_id integer NOT NULL,
    instance_id_id integer NOT NULL
);


--
-- Name: course_assists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_assists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_assists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_assists_id_seq OWNED BY public.course_assists.id;


--
-- Name: course_course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_course (
    course_id character varying(10) NOT NULL,
    course_title character varying(100) NOT NULL
);


--
-- Name: course_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_instance (
    course_id character varying(10) NOT NULL,
    section_id character varying(10) NOT NULL,
    semester character varying(20) NOT NULL,
    year integer NOT NULL,
    id integer NOT NULL
);


--
-- Name: course_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_instance_id_seq OWNED BY public.course_instance.id;


--
-- Name: course_takes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_takes (
    id integer NOT NULL,
    grade character varying(20) NOT NULL,
    instance_id_id integer NOT NULL,
    student_id_id integer NOT NULL
);


--
-- Name: course_takes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_takes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_takes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_takes_id_seq OWNED BY public.course_takes.id;


--
-- Name: course_teaches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_teaches (
    id integer NOT NULL,
    instance_id_id integer NOT NULL,
    instructor_id_id integer NOT NULL
);


--
-- Name: course_teaches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_teaches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_teaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_teaches_id_seq OWNED BY public.course_teaches.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: course_assists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_assists ALTER COLUMN id SET DEFAULT nextval('public.course_assists_id_seq'::regclass);


--
-- Name: course_instance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_instance ALTER COLUMN id SET DEFAULT nextval('public.course_instance_id_seq'::regclass);


--
-- Name: course_takes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_takes ALTER COLUMN id SET DEFAULT nextval('public.course_takes_id_seq'::regclass);


--
-- Name: course_teaches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_teaches ALTER COLUMN id SET DEFAULT nextval('public.course_teaches_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
1	Instructor
2	Assistant
3	Student
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	40
2	1	37
3	1	38
4	1	39
5	2	33
6	2	34
7	2	35
8	2	36
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
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
25	Can add course	7	add_course
26	Can change course	7	change_course
27	Can delete course	7	delete_course
28	Can view course	7	view_course
29	Can add instance	8	add_instance
30	Can change instance	8	change_instance
31	Can delete instance	8	delete_instance
32	Can view instance	8	view_instance
33	Can add assists	9	add_assists
34	Can change assists	9	change_assists
35	Can delete assists	9	delete_assists
36	Can view assists	9	view_assists
37	Can add teaches	10	add_teaches
38	Can change teaches	10	change_teaches
39	Can delete teaches	10	delete_teaches
40	Can view teaches	10	view_teaches
41	Can add takes	11	add_takes
42	Can change takes	11	change_takes
43	Can delete takes	11	delete_takes
44	Can view takes	11	view_takes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$LVVM7EAGoEa8$eD7kLEKXdhhJjGUlbyx6wd2+YSpQyo1PYeBzvFT9S9Q=	\N	f	prof1				f	t	2018-11-01 13:13:09+05:30
3	pbkdf2_sha256$120000$4ruE78VSzjGz$+VHhvDYc5fI1/2Z4LSG1jllbAEQi2MwBk4kp1ZqMbME=	\N	f	prof2				f	t	2018-11-01 13:13:29+05:30
5	pbkdf2_sha256$120000$0tq0vDpOcWaM$NPIeq7ZGSNFGhVSWBuzd58GpT9lwYgXse0zvomwrLFg=	\N	f	ta2				f	t	2018-11-01 13:14:09+05:30
4	pbkdf2_sha256$120000$iZKIYiNLkl41$XP4r3emJPmkdEj6jtHv9cdviSIKMFmFr3XXgsKgs9DM=	\N	f	ta1				f	t	2018-11-01 13:13:49+05:30
1	pbkdf2_sha256$120000$uwBJbE0pZeGz$wxFpVdKxgI1A++fLW93uCpN/4lwQF58vyKyIaEwZ37k=	2018-11-01 18:37:33.979349+05:30	t	admin				t	t	2018-11-01 13:05:49.483014+05:30
7	pbkdf2_sha256$120000$XKhfAaoMGg86$GYEZJWXlNLKE+WhsOZypxmjcC/2tpJxSnRHyyJXJmco=	2018-11-01 19:14:04.938596+05:30	f	stud2				f	t	2018-11-01 13:15:03+05:30
6	pbkdf2_sha256$120000$pAReoxe9wNBk$WK8nIv54vPHTLaM1jdeCJCE7JNoshG+5VUb+fxkf+qU=	2018-11-01 21:17:25.317047+05:30	f	stud1				f	t	2018-11-01 13:14:42+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	1
4	5	2
5	4	2
6	6	3
7	7	3
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: course_assists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_assists (id, assistant_id_id, instance_id_id) FROM stdin;
\.


--
-- Data for Name: course_course; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_course (course_id, course_title) FROM stdin;
CS101	Introduction to Programming
CS152	Abstraction and Paradigms in Programming
CS207	Discrete Structures
CS213	Data Structures and Algorithms
CS215	Data Analysis and Interpretation
CS226	Digital Logic Design
CS218	Design Analysis and Algorithms
CS224	Computer Networks
CS317	Database and Information Systems
CS305	Computer Architecture
CS347	Operating System
\.


--
-- Data for Name: course_instance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_instance (course_id, section_id, semester, year, id) FROM stdin;
CS101	S1	Autumn	2016	1
CS152	S1	Spring	2017	2
CS207	S1	Autumn	2017	3
\.


--
-- Data for Name: course_takes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_takes (id, grade, instance_id_id, student_id_id) FROM stdin;
4	Not Alloted	1	6
5	Not Alloted	2	6
6	Not Alloted	3	7
\.


--
-- Data for Name: course_teaches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_teaches (id, instance_id_id, instructor_id_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-01 13:11:57.926134+05:30	1	Instructor	1	[{"added": {}}]	3	1
2	2018-11-01 13:12:28.379894+05:30	2	Assistant	1	[{"added": {}}]	3	1
3	2018-11-01 13:12:42.256924+05:30	3	Student	1	[{"added": {}}]	3	1
4	2018-11-01 13:13:09.661191+05:30	2	prof1	1	[{"added": {}}]	4	1
5	2018-11-01 13:13:17.865936+05:30	2	prof1	2	[{"changed": {"fields": ["groups"]}}]	4	1
6	2018-11-01 13:13:29.563712+05:30	3	prof2	1	[{"added": {}}]	4	1
7	2018-11-01 13:13:35.726913+05:30	3	prof2	2	[{"changed": {"fields": ["groups"]}}]	4	1
8	2018-11-01 13:13:50.00524+05:30	4	ta1	1	[{"added": {}}]	4	1
9	2018-11-01 13:13:57.126323+05:30	4	ta1	2	[{"changed": {"fields": ["groups"]}}]	4	1
10	2018-11-01 13:14:09.209544+05:30	5	ta2	1	[{"added": {}}]	4	1
11	2018-11-01 13:14:17.415326+05:30	5	ta2	2	[{"changed": {"fields": ["groups"]}}]	4	1
12	2018-11-01 13:14:28.374643+05:30	4	ta1	2	[{"changed": {"fields": ["groups"]}}]	4	1
13	2018-11-01 13:14:42.897261+05:30	6	stud1	1	[{"added": {}}]	4	1
14	2018-11-01 13:14:48.432189+05:30	6	stud1	2	[{"changed": {"fields": ["groups"]}}]	4	1
15	2018-11-01 13:15:03.760776+05:30	7	stud2	1	[{"added": {}}]	4	1
16	2018-11-01 13:15:09.803903+05:30	7	stud2	2	[{"changed": {"fields": ["groups"]}}]	4	1
17	2018-11-01 13:15:32.197675+05:30	1	CS101	1	[{"added": {}}]	7	1
18	2018-11-01 13:15:41.87642+05:30	2	CS152	1	[{"added": {}}]	7	1
19	2018-11-01 13:15:57.65295+05:30	3	CS207	1	[{"added": {}}]	7	1
20	2018-11-01 13:16:15.452194+05:30	4	CS213	1	[{"added": {}}]	7	1
21	2018-11-01 13:16:38.325348+05:30	5	CS215	1	[{"added": {}}]	7	1
22	2018-11-01 13:17:19.663039+05:30	6	CS226	1	[{"added": {}}]	7	1
23	2018-11-01 13:17:55.05321+05:30	7	CS218	1	[{"added": {}}]	7	1
24	2018-11-01 13:18:26.884521+05:30	8	CS224	1	[{"added": {}}]	7	1
25	2018-11-01 13:18:50.750299+05:30	9	CS317	1	[{"added": {}}]	7	1
26	2018-11-01 13:19:28.230676+05:30	10	CS305	1	[{"added": {}}]	7	1
27	2018-11-01 13:19:44.189165+05:30	11	CS347	1	[{"added": {}}]	7	1
28	2018-11-01 13:22:29.965166+05:30	1	cs101_s1_autumn_2016	1	[{"added": {}}]	8	1
29	2018-11-01 13:22:35.713721+05:30	1	cs101_s1_autumn_2016	2	[]	8	1
30	2018-11-01 13:25:17.102044+05:30	2	cs152_s1_spring_2017	1	[{"added": {}}]	8	1
31	2018-11-01 13:26:07.512723+05:30	3	cs207_s1_autumn_2017	1	[{"added": {}}]	8	1
32	2018-11-01 13:28:08.473359+05:30	2	<django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fd1a37ef320> teaches course <django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fd	1	[{"added": {}}]	10	1
33	2018-11-01 13:28:24.593788+05:30	2	<django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fd1a37ef320> teaches course <django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fd	3		10	1
34	2018-11-01 13:29:07.713171+05:30	3	<django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fcc765e2390> teaches course <django.db.models.fields.related_descriptors.ForwardManyToOneDescriptor object at 0x7fc	1	[{"added": {}}]	10	1
35	2018-11-01 13:33:26.562518+05:30	2	stud1 - cs101_s1_autumn_2016	1	[{"added": {}}]	11	1
36	2018-11-01 13:33:33.496303+05:30	2	stud1 - cs101_s1_autumn_2016	2	[]	11	1
37	2018-11-01 13:33:41.226644+05:30	3	stud2 - cs152_s1_spring_2017	1	[{"added": {}}]	11	1
38	2018-11-01 18:38:09.099003+05:30	1	CS101 - S1 - Autumn - 2016 - 	1	[{"added": {}}]	8	1
39	2018-11-01 18:38:20.897647+05:30	2	CS152 - S1 - Spring - 2017 - 	1	[{"added": {}}]	8	1
40	2018-11-01 19:02:33.723582+05:30	4	stud1 - CS101 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
41	2018-11-01 19:02:47.88562+05:30	5	stud1 - CS152 - S1 - Spring - 2017	1	[{"added": {}}]	11	1
42	2018-11-01 19:13:00.166276+05:30	3	CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	8	1
43	2018-11-01 19:13:33.859875+05:30	6	stud2 - CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	course	course
8	course	instance
9	course	assists
10	course	teaches
11	course	takes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-01 11:21:05.965499+05:30
2	auth	0001_initial	2018-11-01 11:21:06.931536+05:30
3	admin	0001_initial	2018-11-01 11:21:07.152734+05:30
4	admin	0002_logentry_remove_auto_add	2018-11-01 11:21:07.192824+05:30
5	admin	0003_logentry_add_action_flag_choices	2018-11-01 11:21:07.228695+05:30
6	contenttypes	0002_remove_content_type_name	2018-11-01 11:21:07.271625+05:30
7	auth	0002_alter_permission_name_max_length	2018-11-01 11:21:07.293858+05:30
8	auth	0003_alter_user_email_max_length	2018-11-01 11:21:07.318315+05:30
9	auth	0004_alter_user_username_opts	2018-11-01 11:21:07.358446+05:30
10	auth	0005_alter_user_last_login_null	2018-11-01 11:21:07.404905+05:30
11	auth	0006_require_contenttypes_0002	2018-11-01 11:21:07.416187+05:30
12	auth	0007_alter_validators_add_error_messages	2018-11-01 11:21:07.437263+05:30
13	auth	0008_alter_user_username_max_length	2018-11-01 11:21:07.5069+05:30
14	auth	0009_alter_user_last_name_max_length	2018-11-01 11:21:07.549351+05:30
15	sessions	0001_initial	2018-11-01 11:21:07.717589+05:30
16	course	0001_initial	2018-11-01 13:11:11.651975+05:30
17	course	0002_instance_year	2018-11-01 13:21:33.299935+05:30
18	course	0003_auto_20181101_0802	2018-11-01 13:32:41.0661+05:30
19	course	0004_auto_20181101_0812	2018-11-01 13:42:15.923774+05:30
20	course	0005_auto_20181101_1304	2018-11-01 18:34:54.641264+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
auugitqnz9p9ea6fgph3lbh2hy9qc2ly	NzkyZDliNzJhZTAyODYwNzczMjZhODdhZGNjNWY0ZmM2ZTc0ZmNlYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0Y2YyN2MzOWJmZmJiODA3OWQzNzUzZjQ0NzJmZGFkY2Y5ZjA2ODVjIiwidXNlcl9pZCI6N30=	2018-11-15 19:14:05.022397+05:30
vcrgd55kfubso39beepmkmixh880dzsv	ZDllMjBjYTFiYzhjZTI4NTkwNmJiMzk3YWZmNDJmMDMyOGViYmUzZTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmM2ZGM5ZWNmMmEyMmMzZWVmNTFmN2E1Mjk1YTExNTVhZGY4NWVjIiwidXNlcl9pZCI6Nn0=	2018-11-15 21:17:25.36159+05:30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 8, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 7, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: course_assists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_assists_id_seq', 1, false);


--
-- Name: course_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_instance_id_seq', 3, true);


--
-- Name: course_takes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_takes_id_seq', 6, true);


--
-- Name: course_teaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_teaches_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 43, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: course_assists course_assists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_assists
    ADD CONSTRAINT course_assists_pkey PRIMARY KEY (id);


--
-- Name: course_course course_course_course_id_8675ce49_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_course_id_8675ce49_pk PRIMARY KEY (course_id);


--
-- Name: course_course course_course_course_id_8675ce49_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_course_id_8675ce49_uniq UNIQUE (course_id);


--
-- Name: course_instance course_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_instance
    ADD CONSTRAINT course_instance_pkey PRIMARY KEY (id);


--
-- Name: course_takes course_takes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_takes
    ADD CONSTRAINT course_takes_pkey PRIMARY KEY (id);


--
-- Name: course_teaches course_teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_teaches
    ADD CONSTRAINT course_teaches_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: course_assists_assistant_id_id_974e07b6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_assists_assistant_id_id_974e07b6 ON public.course_assists USING btree (assistant_id_id);


--
-- Name: course_assists_instance_id_id_0bc61c3f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_assists_instance_id_id_0bc61c3f ON public.course_assists USING btree (instance_id_id);


--
-- Name: course_course_course_id_8675ce49_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_course_course_id_8675ce49_like ON public.course_course USING btree (course_id varchar_pattern_ops);


--
-- Name: course_takes_instance_id_id_3fc08552; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_takes_instance_id_id_3fc08552 ON public.course_takes USING btree (instance_id_id);


--
-- Name: course_takes_student_id_id_486ee44b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_takes_student_id_id_486ee44b ON public.course_takes USING btree (student_id_id);


--
-- Name: course_teaches_instance_id_id_6f109d2f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_teaches_instance_id_id_6f109d2f ON public.course_teaches USING btree (instance_id_id);


--
-- Name: course_teaches_instructor_id_id_e3f4e59a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX course_teaches_instructor_id_id_e3f4e59a ON public.course_teaches USING btree (instructor_id_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_assists course_assists_assistant_id_id_974e07b6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_assists
    ADD CONSTRAINT course_assists_assistant_id_id_974e07b6_fk_auth_user_id FOREIGN KEY (assistant_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_takes course_takes_student_id_id_486ee44b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_takes
    ADD CONSTRAINT course_takes_student_id_id_486ee44b_fk_auth_user_id FOREIGN KEY (student_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_teaches course_teaches_instructor_id_id_e3f4e59a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_teaches
    ADD CONSTRAINT course_teaches_instructor_id_id_e3f4e59a_fk_auth_user_id FOREIGN KEY (instructor_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

