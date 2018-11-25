--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-25 17:02:46

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
-- TOC entry 3056 (class 1262 OID 25203)
-- Name: game; Type: DATABASE; Schema: -; Owner: aryan
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE game OWNER TO aryan;

\connect game

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25217)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO aryan;

--
-- TOC entry 197 (class 1259 OID 25220)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO aryan;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 198 (class 1259 OID 25222)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO aryan;

--
-- TOC entry 199 (class 1259 OID 25225)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO aryan;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 200 (class 1259 OID 25227)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO aryan;

--
-- TOC entry 201 (class 1259 OID 25230)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO aryan;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 202 (class 1259 OID 25232)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: aryan
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


ALTER TABLE public.auth_user OWNER TO aryan;

--
-- TOC entry 203 (class 1259 OID 25238)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO aryan;

--
-- TOC entry 204 (class 1259 OID 25241)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO aryan;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 205 (class 1259 OID 25243)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO aryan;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 206 (class 1259 OID 25245)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO aryan;

--
-- TOC entry 207 (class 1259 OID 25248)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO aryan;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 208 (class 1259 OID 25250)
-- Name: course_assists; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_assists (
    id integer NOT NULL,
    assistant_id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.course_assists OWNER TO aryan;

--
-- TOC entry 209 (class 1259 OID 25253)
-- Name: course_assists_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_assists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_assists_id_seq OWNER TO aryan;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 209
-- Name: course_assists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_assists_id_seq OWNED BY public.course_assists.id;


--
-- TOC entry 225 (class 1259 OID 25443)
-- Name: course_attempt; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_attempt (
    id integer NOT NULL,
    "Marks" numeric(5,1) NOT NULL,
    pdf character varying(256) NOT NULL,
    page_number integer NOT NULL,
    student_id integer NOT NULL,
    assistant_id integer NOT NULL,
    attempt_graded boolean NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.course_attempt OWNER TO aryan;

--
-- TOC entry 224 (class 1259 OID 25441)
-- Name: course_attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_attempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_attempt_id_seq OWNER TO aryan;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 224
-- Name: course_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_attempt_id_seq OWNED BY public.course_attempt.id;


--
-- TOC entry 210 (class 1259 OID 25255)
-- Name: course_course; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_course (
    course_id character varying(10) NOT NULL,
    course_title character varying(100) NOT NULL
);


ALTER TABLE public.course_course OWNER TO aryan;

--
-- TOC entry 227 (class 1259 OID 25451)
-- Name: course_exam; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_exam (
    id integer NOT NULL,
    exam_name character varying(20) NOT NULL,
    weightage numeric(5,2) NOT NULL,
    instance_id integer NOT NULL,
    exam_graded boolean NOT NULL
);


ALTER TABLE public.course_exam OWNER TO aryan;

--
-- TOC entry 226 (class 1259 OID 25449)
-- Name: course_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_exam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_exam_id_seq OWNER TO aryan;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 226
-- Name: course_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_exam_id_seq OWNED BY public.course_exam.id;


--
-- TOC entry 211 (class 1259 OID 25258)
-- Name: course_instance; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_instance (
    course_id character varying(10) NOT NULL,
    section_id character varying(10) NOT NULL,
    semester character varying(20) NOT NULL,
    year integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.course_instance OWNER TO aryan;

--
-- TOC entry 212 (class 1259 OID 25261)
-- Name: course_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_instance_id_seq OWNER TO aryan;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 212
-- Name: course_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_instance_id_seq OWNED BY public.course_instance.id;


--
-- TOC entry 229 (class 1259 OID 25570)
-- Name: course_question; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_question (
    id integer NOT NULL,
    qn_number character varying(20) NOT NULL,
    full_marks numeric(5,1) NOT NULL,
    exam_id integer NOT NULL
);


ALTER TABLE public.course_question OWNER TO aryan;

--
-- TOC entry 228 (class 1259 OID 25568)
-- Name: course_question_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_question_id_seq OWNER TO aryan;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 228
-- Name: course_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_question_id_seq OWNED BY public.course_question.id;


--
-- TOC entry 213 (class 1259 OID 25263)
-- Name: course_takes; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_takes (
    id integer NOT NULL,
    grade character varying(20) NOT NULL,
    instance_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.course_takes OWNER TO aryan;

--
-- TOC entry 214 (class 1259 OID 25266)
-- Name: course_takes_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_takes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_takes_id_seq OWNER TO aryan;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 214
-- Name: course_takes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_takes_id_seq OWNED BY public.course_takes.id;


--
-- TOC entry 215 (class 1259 OID 25268)
-- Name: course_teaches; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.course_teaches (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.course_teaches OWNER TO aryan;

--
-- TOC entry 216 (class 1259 OID 25271)
-- Name: course_teaches_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.course_teaches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_teaches_id_seq OWNER TO aryan;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 216
-- Name: course_teaches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.course_teaches_id_seq OWNED BY public.course_teaches.id;


--
-- TOC entry 217 (class 1259 OID 25273)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: aryan
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


ALTER TABLE public.django_admin_log OWNER TO aryan;

--
-- TOC entry 218 (class 1259 OID 25280)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO aryan;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 219 (class 1259 OID 25282)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO aryan;

--
-- TOC entry 220 (class 1259 OID 25285)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO aryan;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 221 (class 1259 OID 25287)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO aryan;

--
-- TOC entry 222 (class 1259 OID 25293)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: aryan
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO aryan;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aryan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 223 (class 1259 OID 25295)
-- Name: django_session; Type: TABLE; Schema: public; Owner: aryan
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO aryan;

--
-- TOC entry 2772 (class 2604 OID 25301)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 25302)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 25303)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 25304)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 25305)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 25306)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 25307)
-- Name: course_assists id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_assists ALTER COLUMN id SET DEFAULT nextval('public.course_assists_id_seq'::regclass);


--
-- TOC entry 2786 (class 2604 OID 25446)
-- Name: course_attempt id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_attempt ALTER COLUMN id SET DEFAULT nextval('public.course_attempt_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 25454)
-- Name: course_exam id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_exam ALTER COLUMN id SET DEFAULT nextval('public.course_exam_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 25308)
-- Name: course_instance id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_instance ALTER COLUMN id SET DEFAULT nextval('public.course_instance_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 25573)
-- Name: course_question id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_question ALTER COLUMN id SET DEFAULT nextval('public.course_question_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 25309)
-- Name: course_takes id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_takes ALTER COLUMN id SET DEFAULT nextval('public.course_takes_id_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 25310)
-- Name: course_teaches id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_teaches ALTER COLUMN id SET DEFAULT nextval('public.course_teaches_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 25311)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 25312)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 25313)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3017 (class 0 OID 25217)
-- Dependencies: 196
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.auth_group (id, name) FROM stdin;
1	Instructor
2	Assistant
3	Student
\.


--
-- TOC entry 3019 (class 0 OID 25222)
-- Dependencies: 198
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: aryan
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
-- TOC entry 3021 (class 0 OID 25227)
-- Dependencies: 200
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: aryan
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
45	Can add attempt	12	add_attempt
46	Can change attempt	12	change_attempt
47	Can delete attempt	12	delete_attempt
48	Can view attempt	12	view_attempt
49	Can add exam	13	add_exam
50	Can change exam	13	change_exam
51	Can delete exam	13	delete_exam
52	Can view exam	13	view_exam
53	Can add question	14	add_question
54	Can change question	14	change_question
55	Can delete question	14	delete_question
56	Can view question	14	view_question
\.


--
-- TOC entry 3023 (class 0 OID 25232)
-- Dependencies: 202
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$120000$4ruE78VSzjGz$+VHhvDYc5fI1/2Z4LSG1jllbAEQi2MwBk4kp1ZqMbME=	\N	f	prof2				f	t	2018-11-01 13:13:29+05:30
7	pbkdf2_sha256$120000$XKhfAaoMGg86$GYEZJWXlNLKE+WhsOZypxmjcC/2tpJxSnRHyyJXJmco=	2018-11-01 19:14:04.938596+05:30	f	stud2				f	t	2018-11-01 13:15:03+05:30
5	pbkdf2_sha256$120000$0tq0vDpOcWaM$NPIeq7ZGSNFGhVSWBuzd58GpT9lwYgXse0zvomwrLFg=	\N	f	ta2				f	t	2018-11-01 13:14:09+05:30
4	pbkdf2_sha256$120000$iZKIYiNLkl41$XP4r3emJPmkdEj6jtHv9cdviSIKMFmFr3XXgsKgs9DM=	2018-11-25 15:05:41.385115+05:30	f	ta1				f	t	2018-11-01 13:13:49+05:30
8	pbkdf2_sha256$120000$FXd7iazxc12X$21+6qktW9/FxjL74xrx6i5wnEYZkUAHISc/XZ8rWfW4=	2018-11-25 15:13:31.254569+05:30	f	stud3				f	t	2018-11-03 15:10:30+05:30
9	pbkdf2_sha256$120000$NDk16AZ3woE4$ZA5NT6+DK6CyTU9Msn+5ZMv5CTrVmadlgoaA219xj64=	\N	f	stud4				f	t	2018-11-03 15:11:47+05:30
10	pbkdf2_sha256$120000$sXedKxP2sZem$48fojxNcTGrjA63FFiJKrbR5/yjFYqTH/bHjTll/Vpw=	2018-11-03 15:45:26.035609+05:30	f	stud5				f	t	2018-11-03 15:12:25+05:30
2	pbkdf2_sha256$120000$LVVM7EAGoEa8$eD7kLEKXdhhJjGUlbyx6wd2+YSpQyo1PYeBzvFT9S9Q=	2018-11-25 16:18:26.720422+05:30	f	prof1				f	t	2018-11-01 13:13:09+05:30
6	pbkdf2_sha256$120000$pAReoxe9wNBk$WK8nIv54vPHTLaM1jdeCJCE7JNoshG+5VUb+fxkf+qU=	2018-11-25 16:43:20.643975+05:30	f	stud1				f	t	2018-11-01 13:14:42+05:30
1	pbkdf2_sha256$120000$uwBJbE0pZeGz$wxFpVdKxgI1A++fLW93uCpN/4lwQF58vyKyIaEwZ37k=	2018-11-25 16:57:30.537355+05:30	t	admin				t	t	2018-11-01 13:05:49.483014+05:30
\.


--
-- TOC entry 3024 (class 0 OID 25238)
-- Dependencies: 203
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	1
4	5	2
5	4	2
6	6	3
7	7	3
8	8	3
9	9	3
10	10	3
11	4	3
12	5	3
\.


--
-- TOC entry 3027 (class 0 OID 25245)
-- Dependencies: 206
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 25250)
-- Dependencies: 208
-- Data for Name: course_assists; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_assists (id, assistant_id, instance_id) FROM stdin;
1	4	1
2	5	1
3	4	2
4	4	7
5	4	6
6	4	5
7	4	4
8	4	3
9	5	5
10	5	6
11	5	7
12	5	8
13	5	9
14	5	10
15	5	11
16	5	12
\.


--
-- TOC entry 3046 (class 0 OID 25443)
-- Dependencies: 225
-- Data for Name: course_attempt; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_attempt (id, "Marks", pdf, page_number, student_id, assistant_id, attempt_graded, question_id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 25255)
-- Dependencies: 210
-- Data for Name: course_course; Type: TABLE DATA; Schema: public; Owner: aryan
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
-- TOC entry 3048 (class 0 OID 25451)
-- Dependencies: 227
-- Data for Name: course_exam; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_exam (id, exam_name, weightage, instance_id, exam_graded) FROM stdin;
20	quiz1	0.75	1	f
21	quiz2	1.00	1	f
\.


--
-- TOC entry 3032 (class 0 OID 25258)
-- Dependencies: 211
-- Data for Name: course_instance; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_instance (course_id, section_id, semester, year, id) FROM stdin;
CS101	S1	Autumn	2016	1
CS152	S1	Spring	2017	2
CS207	S1	Autumn	2017	3
CS152	S1	Autumn	2016	4
CS207	S1	Autumn	2016	5
CS213	S1	Autumn	2016	6
CS215	S1	Autumn	2016	7
CS226	S1	Autumn	2016	8
CS218	S1	Autumn	2016	9
CS224	S1	Autumn	2016	10
CS317	S1	Autumn	2016	11
CS305	S1	Autumn	2016	12
CS347	S1	Autumn	2016	13
\.


--
-- TOC entry 3050 (class 0 OID 25570)
-- Dependencies: 229
-- Data for Name: course_question; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_question (id, qn_number, full_marks, exam_id) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 25263)
-- Dependencies: 213
-- Data for Name: course_takes; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_takes (id, grade, instance_id, student_id) FROM stdin;
4	Not Alloted	1	6
5	Not Alloted	2	6
6	Not Alloted	3	7
8	NA	2	7
9	NA	3	8
10	NA	3	9
11	NA	4	9
12	NA	4	10
13	NA	5	10
14	NA	5	6
15	NA	5	7
16	NA	6	7
17	NA	7	8
18	NA	8	8
19	NA	9	9
20	NA	10	10
21	NA	11	10
22	NA	12	10
23	NA	13	10
24	NA	1	8
25	NA	9	6
26	NA	9	7
27	NA	9	8
28	NA	9	10
29	NA	12	4
\.


--
-- TOC entry 3036 (class 0 OID 25268)
-- Dependencies: 215
-- Data for Name: course_teaches; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.course_teaches (id, instance_id, instructor_id) FROM stdin;
4	1	2
5	2	2
6	3	2
7	4	2
8	5	2
9	6	2
10	7	2
11	8	3
12	9	3
13	10	3
14	11	3
15	12	3
16	13	3
\.


--
-- TOC entry 3038 (class 0 OID 25273)
-- Dependencies: 217
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: aryan
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
44	2018-11-03 00:59:29.608139+05:30	1	Exam object (1)	1	[{"added": {}}]	13	1
45	2018-11-03 00:59:43.515758+05:30	2	Exam object (2)	1	[{"added": {}}]	13	1
46	2018-11-03 01:00:02.720595+05:30	3	Exam object (3)	1	[{"added": {}}]	13	1
47	2018-11-03 01:01:28.193161+05:30	4	Exam object (4)	1	[{"added": {}}]	13	1
48	2018-11-03 01:01:37.903396+05:30	5	Exam object (5)	1	[{"added": {}}]	13	1
49	2018-11-03 01:02:06.769826+05:30	6	Exam object (6)	1	[{"added": {}}]	13	1
50	2018-11-03 01:02:19.004026+05:30	7	Exam object (7)	1	[{"added": {}}]	13	1
51	2018-11-03 01:02:36.149622+05:30	8	Exam object (8)	1	[{"added": {}}]	13	1
52	2018-11-03 01:02:49.241515+05:30	9	Exam object (9)	1	[{"added": {}}]	13	1
53	2018-11-03 01:12:14.939001+05:30	1	6-CS101-quiz1-1	1	[{"added": {}}]	12	1
54	2018-11-03 01:30:43.986407+05:30	1	6-CS101-quiz1-1	2	[{"changed": {"fields": ["attempt_graded"]}}]	12	1
55	2018-11-03 01:31:43.485767+05:30	1	CS101-quiz1	2	[{"changed": {"fields": ["exam_graded"]}}]	13	1
56	2018-11-03 02:01:47.08491+05:30	1	4 - 1	1	[{"added": {}}]	9	1
57	2018-11-03 03:47:22.755131+05:30	4	2 - 1	1	[{"added": {}}]	10	1
58	2018-11-03 03:52:13.873348+05:30	2	stud1-CS101-quiz1-Qn2	1	[{"added": {}}]	12	1
59	2018-11-03 04:16:42.660067+05:30	3	stud2-CS101-quiz1-Qn1	1	[{"added": {}}]	12	1
60	2018-11-03 04:18:06.669093+05:30	3	stud2-CS101-quiz1-Qn1	2	[{"changed": {"fields": ["assistant"]}}]	12	1
61	2018-11-03 04:19:23.302149+05:30	2	ta2 - CS101 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
62	2018-11-03 15:10:30.311379+05:30	8	stud3	1	[{"added": {}}]	4	1
63	2018-11-03 15:11:47.344032+05:30	9	stud4	1	[{"added": {}}]	4	1
64	2018-11-03 15:12:25.871941+05:30	10	stud5	1	[{"added": {}}]	4	1
65	2018-11-03 15:12:59.510033+05:30	8	stud3	2	[{"changed": {"fields": ["groups"]}}]	4	1
66	2018-11-03 15:14:26.668335+05:30	4	CS152 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
67	2018-11-03 15:14:38.678572+05:30	5	CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
68	2018-11-03 15:14:54.165591+05:30	6	CS213 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
69	2018-11-03 15:15:52.61511+05:30	7	CS215 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
70	2018-11-03 15:16:51.039039+05:30	8	CS226 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
71	2018-11-03 15:17:06.486334+05:30	9	CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
72	2018-11-03 15:17:17.123878+05:30	10	CS224 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
73	2018-11-03 15:17:27.391522+05:30	11	CS317 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
74	2018-11-03 15:17:40.239048+05:30	12	CS305 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
75	2018-11-03 15:17:50.000213+05:30	13	CS347 - S1 - Autumn - 2016	1	[{"added": {}}]	8	1
76	2018-11-03 15:18:24.410978+05:30	5	prof1 - CS152 - S1 - Spring - 2017	1	[{"added": {}}]	10	1
77	2018-11-03 15:18:37.204495+05:30	6	prof1 - CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	10	1
78	2018-11-03 15:19:36.654841+05:30	7	prof1 - CS152 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
79	2018-11-03 15:20:02.689918+05:30	8	prof1 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
80	2018-11-03 15:20:11.95859+05:30	9	prof1 - CS213 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
81	2018-11-03 15:20:19.270206+05:30	10	prof1 - CS215 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
82	2018-11-03 15:20:25.781531+05:30	11	prof2 - CS226 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
83	2018-11-03 15:20:34.032056+05:30	12	prof2 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
84	2018-11-03 15:20:42.102253+05:30	13	prof2 - CS224 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
85	2018-11-03 15:20:50.111163+05:30	14	prof2 - CS317 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
86	2018-11-03 15:20:59.273861+05:30	15	prof2 - CS305 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
87	2018-11-03 15:21:09.071982+05:30	16	prof2 - CS347 - S1 - Autumn - 2016	1	[{"added": {}}]	10	1
88	2018-11-03 15:23:20.423297+05:30	3	ta1 - CS152 - S1 - Spring - 2017	1	[{"added": {}}]	9	1
89	2018-11-03 15:23:35.771151+05:30	4	ta1 - CS215 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
90	2018-11-03 15:23:42.389461+05:30	5	ta1 - CS213 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
91	2018-11-03 15:23:49.502644+05:30	6	ta1 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
92	2018-11-03 15:24:03.2839+05:30	7	ta1 - CS152 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
93	2018-11-03 15:24:10.327134+05:30	8	ta1 - CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	9	1
94	2018-11-03 15:25:00.572747+05:30	9	ta2 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
95	2018-11-03 15:25:07.534662+05:30	10	ta2 - CS213 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
96	2018-11-03 15:25:16.550728+05:30	11	ta2 - CS215 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
97	2018-11-03 15:25:23.827669+05:30	12	ta2 - CS226 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
98	2018-11-03 15:25:29.775301+05:30	13	ta2 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
99	2018-11-03 15:25:46.586977+05:30	14	ta2 - CS224 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
100	2018-11-03 15:25:56.136962+05:30	15	ta2 - CS317 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
101	2018-11-03 15:26:03.048421+05:30	16	ta2 - CS305 - S1 - Autumn - 2016	1	[{"added": {}}]	9	1
102	2018-11-03 15:27:12.979312+05:30	7	stud1 - CS101 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
103	2018-11-03 15:28:02.946071+05:30	7	stud1 - CS101 - S1 - Autumn - 2016	3		11	1
104	2018-11-03 15:37:07.599253+05:30	8	stud2 - CS152 - S1 - Spring - 2017	1	[{"added": {}}]	11	1
105	2018-11-03 15:37:21.149402+05:30	9	stud3 - CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	11	1
106	2018-11-03 15:37:39.650134+05:30	10	stud4 - CS207 - S1 - Autumn - 2017	1	[{"added": {}}]	11	1
107	2018-11-03 15:38:02.316792+05:30	11	stud4 - CS152 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
108	2018-11-03 15:38:11.98075+05:30	12	stud5 - CS152 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
109	2018-11-03 15:38:25.063044+05:30	13	stud5 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
110	2018-11-03 15:38:43.7963+05:30	14	stud1 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
111	2018-11-03 15:39:12.014619+05:30	15	stud2 - CS207 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
112	2018-11-03 15:39:20.359848+05:30	16	stud2 - CS213 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
113	2018-11-03 15:39:30.217552+05:30	17	stud3 - CS215 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
114	2018-11-03 15:39:48.615547+05:30	18	stud3 - CS226 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
115	2018-11-03 15:39:58.441976+05:30	19	stud4 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
116	2018-11-03 15:40:29.416965+05:30	20	stud5 - CS224 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
117	2018-11-03 15:40:36.414362+05:30	21	stud5 - CS317 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
118	2018-11-03 15:40:43.199463+05:30	22	stud5 - CS305 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
119	2018-11-03 15:40:52.819181+05:30	23	stud5 - CS347 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
120	2018-11-03 15:41:00.039569+05:30	24	stud3 - CS101 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
121	2018-11-03 15:41:15.333071+05:30	25	stud1 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
122	2018-11-03 15:41:21.956678+05:30	26	stud2 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
123	2018-11-03 15:41:36.659762+05:30	27	stud3 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
124	2018-11-03 15:41:47.119386+05:30	28	stud5 - CS218 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
125	2018-11-03 15:44:37.594534+05:30	9	stud4	2	[{"changed": {"fields": ["groups"]}}]	4	1
126	2018-11-03 15:44:46.332413+05:30	10	stud5	2	[{"changed": {"fields": ["groups"]}}]	4	1
127	2018-11-03 16:15:10.099657+05:30	29	ta1 - CS305 - S1 - Autumn - 2016	1	[{"added": {}}]	11	1
128	2018-11-03 16:17:43.077335+05:30	4	ta1	2	[{"changed": {"fields": ["groups"]}}]	4	1
129	2018-11-03 16:18:16.462216+05:30	5	ta2	2	[{"changed": {"fields": ["groups"]}}]	4	1
130	2018-11-03 16:26:16.016991+05:30	19	CS101-quiz1	2	[{"changed": {"fields": ["exam_graded"]}}]	13	1
131	2018-11-25 16:03:58.914624+05:30	9	stud3-CS101-quiz1-Qn1	3		12	1
132	2018-11-25 16:04:05.602973+05:30	8	stud1-CS101-quiz1-Qn1	3		12	1
133	2018-11-25 16:04:10.696107+05:30	7	stud3-CS101-quiz1-Qn1	3		12	1
134	2018-11-25 16:04:16.239708+05:30	6	stud1-CS101-quiz1-Qn1	3		12	1
135	2018-11-25 16:44:31.543505+05:30	11	stud3-CS101-quiz1-191	3		12	1
136	2018-11-25 16:44:37.064921+05:30	10	stud1-CS101-quiz1-191	3		12	1
137	2018-11-25 16:45:11.924307+05:30	3	CS101-quiz1-191	3		14	1
138	2018-11-25 16:45:16.998732+05:30	4	CS101-quiz2-1	3		14	1
139	2018-11-25 16:45:21.701181+05:30	1	CS101-quiz1-1	3		14	1
\.


--
-- TOC entry 3040 (class 0 OID 25282)
-- Dependencies: 219
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: aryan
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
12	course	attempt
13	course	exam
14	course	question
\.


--
-- TOC entry 3042 (class 0 OID 25287)
-- Dependencies: 221
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: aryan
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
21	course	0006_auto_20181102_2006	2018-11-02 20:09:06.317614+05:30
22	course	0007_auto_20181102_2008	2018-11-02 20:09:07.003737+05:30
23	course	0008_auto_20181102_2029	2018-11-02 20:29:32.192681+05:30
24	course	0006_auto_20181102_1328	2018-11-03 00:58:33.804262+05:30
25	course	0009_merge_20181102_1656	2018-11-03 00:58:33.807248+05:30
26	course	0010_auto_20181102_1728	2018-11-03 00:58:34.660776+05:30
27	course	0009_merge_20181102_1655	2018-11-03 00:58:34.663464+05:30
28	course	0011_merge_20181102_1902	2018-11-03 00:58:34.666643+05:30
29	course	0012_auto_20181103_0147	2018-11-03 01:47:18.800861+05:30
30	course	0013_auto_20181103_1000	2018-11-03 15:35:24.394067+05:30
31	course	0014_auto_20181125_1608	2018-11-25 16:09:14.255202+05:30
\.


--
-- TOC entry 3044 (class 0 OID 25295)
-- Dependencies: 223
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: aryan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
auugitqnz9p9ea6fgph3lbh2hy9qc2ly	NzkyZDliNzJhZTAyODYwNzczMjZhODdhZGNjNWY0ZmM2ZTc0ZmNlYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0Y2YyN2MzOWJmZmJiODA3OWQzNzUzZjQ0NzJmZGFkY2Y5ZjA2ODVjIiwidXNlcl9pZCI6N30=	2018-11-15 19:14:05.022397+05:30
vcrgd55kfubso39beepmkmixh880dzsv	ZDllMjBjYTFiYzhjZTI4NTkwNmJiMzk3YWZmNDJmMDMyOGViYmUzZTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NmM2ZGM5ZWNmMmEyMmMzZWVmNTFmN2E1Mjk1YTExNTVhZGY4NWVjIiwidXNlcl9pZCI6Nn0=	2018-11-15 21:17:25.36159+05:30
79ikj9zehzhij8llt6ilz8ymurkqq78l	MDc2ZTdiYTcxY2RkY2FiMWU5NGMzMzVlZjA3ZjAyYjJkYWU0ZjM1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzY1MWFiNmM4NTRjMWFlY2FmNzBmYzU4MzFkODdkNWU2NjMwZjM4In0=	2018-11-17 16:17:22.27687+05:30
z9sbso8d25iahy539qb7hjqwc0kl5joc	YzdmMGIzNjFlZWVkOTlkODdhZmM5MGNiODM0Y2Q0NGE5YWEyMTYwMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGNkYTVkMjlmOGE3NjRlZjg1N2I3Y2M4MmQ2N2U4ZDQ1NjVhNzE4IiwidXNlcl9pZCI6NH0=	2018-12-09 15:05:41.529686+05:30
hf977l6xqvhtutxs14ic4afsasnd866t	YzEwYTk4M2YzN2RlZGI2NzBhODc5ODJmOWYxNDVkMDk3NzhmNmVmYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzQ2NTkxZWE2YWEzNjg0ZDEwODNiNTI5Nzg3NGNmOGMyZTQ4OGY5IiwidXNlcl9pZCI6Mn0=	2018-12-09 15:14:14.698189+05:30
3f6id8rgcd0meqatc8g20p7bmcjoqp4g	YzEwYTk4M2YzN2RlZGI2NzBhODc5ODJmOWYxNDVkMDk3NzhmNmVmYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzQ2NTkxZWE2YWEzNjg0ZDEwODNiNTI5Nzg3NGNmOGMyZTQ4OGY5IiwidXNlcl9pZCI6Mn0=	2018-12-09 16:12:18.431585+05:30
8wdmu7y32l0r4ecnl47gydile7bsplpl	YzdmMGIzNjFlZWVkOTlkODdhZmM5MGNiODM0Y2Q0NGE5YWEyMTYwMDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGNkYTVkMjlmOGE3NjRlZjg1N2I3Y2M4MmQ2N2U4ZDQ1NjVhNzE4IiwidXNlcl9pZCI6NH0=	2018-11-17 16:26:35.482188+05:30
sptapyn7o82pd2umwv2c3y9axvv4k2f4	MDc2ZTdiYTcxY2RkY2FiMWU5NGMzMzVlZjA3ZjAyYjJkYWU0ZjM1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzY1MWFiNmM4NTRjMWFlY2FmNzBmYzU4MzFkODdkNWU2NjMwZjM4In0=	2018-12-09 14:32:37.323817+05:30
14vxtt23np7066j3yo668encnb32241i	MDc2ZTdiYTcxY2RkY2FiMWU5NGMzMzVlZjA3ZjAyYjJkYWU0ZjM1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzY1MWFiNmM4NTRjMWFlY2FmNzBmYzU4MzFkODdkNWU2NjMwZjM4In0=	2018-12-09 16:44:16.539612+05:30
vxtdxzw2l0g7ro74wlwlqbfgbp8xllz7	MDc2ZTdiYTcxY2RkY2FiMWU5NGMzMzVlZjA3ZjAyYjJkYWU0ZjM1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzY1MWFiNmM4NTRjMWFlY2FmNzBmYzU4MzFkODdkNWU2NjMwZjM4In0=	2018-11-17 01:26:51.402283+05:30
shxldehh67et1jcm3mi75ye6gxay3pft	YzEwYTk4M2YzN2RlZGI2NzBhODc5ODJmOWYxNDVkMDk3NzhmNmVmYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzQ2NTkxZWE2YWEzNjg0ZDEwODNiNTI5Nzg3NGNmOGMyZTQ4OGY5IiwidXNlcl9pZCI6Mn0=	2018-11-17 03:50:40.484894+05:30
\.


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 8, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 12, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 10, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 209
-- Name: course_assists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_assists_id_seq', 16, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 224
-- Name: course_attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_attempt_id_seq', 13, true);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 226
-- Name: course_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_exam_id_seq', 21, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 212
-- Name: course_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_instance_id_seq', 13, true);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 228
-- Name: course_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_question_id_seq', 5, true);


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 214
-- Name: course_takes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_takes_id_seq', 29, true);


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 216
-- Name: course_teaches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.course_teaches_id_seq', 16, true);


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 139, true);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 222
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aryan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- TOC entry 2791 (class 2606 OID 25315)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2796 (class 2606 OID 25317)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2799 (class 2606 OID 25319)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 25321)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 25323)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2804 (class 2606 OID 25325)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 25327)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 25329)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2806 (class 2606 OID 25331)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2818 (class 2606 OID 25333)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 25335)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2809 (class 2606 OID 25337)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2824 (class 2606 OID 25563)
-- Name: course_assists course_assists_assistant_id_instance_id_684128a0_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_assists
    ADD CONSTRAINT course_assists_assistant_id_instance_id_684128a0_uniq UNIQUE (assistant_id, instance_id);


--
-- TOC entry 2827 (class 2606 OID 25339)
-- Name: course_assists course_assists_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_assists
    ADD CONSTRAINT course_assists_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 25448)
-- Name: course_attempt course_attempt_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_attempt
    ADD CONSTRAINT course_attempt_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 25341)
-- Name: course_course course_course_course_id_8675ce49_pk; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_course_id_8675ce49_pk PRIMARY KEY (course_id);


--
-- TOC entry 2832 (class 2606 OID 25344)
-- Name: course_course course_course_course_id_8675ce49_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_course
    ADD CONSTRAINT course_course_course_id_8675ce49_uniq UNIQUE (course_id);


--
-- TOC entry 2870 (class 2606 OID 25458)
-- Name: course_exam course_exam_instance_id_id_exam_id_dbc8c06a_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_exam
    ADD CONSTRAINT course_exam_instance_id_id_exam_id_dbc8c06a_uniq UNIQUE (instance_id, exam_name);


--
-- TOC entry 2872 (class 2606 OID 25456)
-- Name: course_exam course_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_exam
    ADD CONSTRAINT course_exam_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25346)
-- Name: course_instance course_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_instance
    ADD CONSTRAINT course_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 25584)
-- Name: course_question course_question_exam_id_qn_number_8eb96596_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_question
    ADD CONSTRAINT course_question_exam_id_qn_number_8eb96596_uniq UNIQUE (exam_id, qn_number);


--
-- TOC entry 2877 (class 2606 OID 25575)
-- Name: course_question course_question_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_question
    ADD CONSTRAINT course_question_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 25565)
-- Name: course_takes course_takes_instance_id_student_id_f86ebc81_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_takes
    ADD CONSTRAINT course_takes_instance_id_student_id_f86ebc81_uniq UNIQUE (instance_id, student_id);


--
-- TOC entry 2841 (class 2606 OID 25348)
-- Name: course_takes course_takes_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_takes
    ADD CONSTRAINT course_takes_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 25567)
-- Name: course_teaches course_teaches_instructor_id_instance_id_a7906607_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_teaches
    ADD CONSTRAINT course_teaches_instructor_id_instance_id_a7906607_uniq UNIQUE (instructor_id, instance_id);


--
-- TOC entry 2848 (class 2606 OID 25350)
-- Name: course_teaches course_teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_teaches
    ADD CONSTRAINT course_teaches_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 25352)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25354)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2856 (class 2606 OID 25356)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25358)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 25360)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2789 (class 1259 OID 25361)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2794 (class 1259 OID 25362)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2797 (class 1259 OID 25363)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2800 (class 1259 OID 25364)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2810 (class 1259 OID 25365)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2813 (class 1259 OID 25366)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2816 (class 1259 OID 25367)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2819 (class 1259 OID 25368)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2807 (class 1259 OID 25369)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2822 (class 1259 OID 25370)
-- Name: course_assists_assistant_id_id_974e07b6; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_assists_assistant_id_id_974e07b6 ON public.course_assists USING btree (assistant_id);


--
-- TOC entry 2825 (class 1259 OID 25371)
-- Name: course_assists_instance_id_id_0bc61c3f; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_assists_instance_id_id_0bc61c3f ON public.course_assists USING btree (instance_id);


--
-- TOC entry 2865 (class 1259 OID 25591)
-- Name: course_attempt_question_id_686104e4; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_attempt_question_id_686104e4 ON public.course_attempt USING btree (question_id);


--
-- TOC entry 2866 (class 1259 OID 25477)
-- Name: course_attempt_student_id_id_88f9f0a7; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_attempt_student_id_id_88f9f0a7 ON public.course_attempt USING btree (student_id);


--
-- TOC entry 2867 (class 1259 OID 25488)
-- Name: course_attempt_ta_id_id_54653b1b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_attempt_ta_id_id_54653b1b ON public.course_attempt USING btree (assistant_id);


--
-- TOC entry 2828 (class 1259 OID 25372)
-- Name: course_course_course_id_8675ce49_like; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_course_course_id_8675ce49_like ON public.course_course USING btree (course_id varchar_pattern_ops);


--
-- TOC entry 2868 (class 1259 OID 25464)
-- Name: course_exam_instance_id_id_1d9e7315; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_exam_instance_id_id_1d9e7315 ON public.course_exam USING btree (instance_id);


--
-- TOC entry 2833 (class 1259 OID 25510)
-- Name: course_instance_course_id_id_36feb55b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_instance_course_id_id_36feb55b ON public.course_instance USING btree (course_id);


--
-- TOC entry 2834 (class 1259 OID 25516)
-- Name: course_instance_course_id_id_36feb55b_like; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_instance_course_id_id_36feb55b_like ON public.course_instance USING btree (course_id varchar_pattern_ops);


--
-- TOC entry 2873 (class 1259 OID 25590)
-- Name: course_question_exam_id_e2236174; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_question_exam_id_e2236174 ON public.course_question USING btree (exam_id);


--
-- TOC entry 2837 (class 1259 OID 25373)
-- Name: course_takes_instance_id_id_3fc08552; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_takes_instance_id_id_3fc08552 ON public.course_takes USING btree (instance_id);


--
-- TOC entry 2842 (class 1259 OID 25374)
-- Name: course_takes_student_id_id_486ee44b; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_takes_student_id_id_486ee44b ON public.course_takes USING btree (student_id);


--
-- TOC entry 2843 (class 1259 OID 25375)
-- Name: course_teaches_instance_id_id_6f109d2f; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_teaches_instance_id_id_6f109d2f ON public.course_teaches USING btree (instance_id);


--
-- TOC entry 2844 (class 1259 OID 25376)
-- Name: course_teaches_instructor_id_id_e3f4e59a; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX course_teaches_instructor_id_id_e3f4e59a ON public.course_teaches USING btree (instructor_id);


--
-- TOC entry 2849 (class 1259 OID 25377)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2852 (class 1259 OID 25378)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2859 (class 1259 OID 25379)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2862 (class 1259 OID 25380)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: aryan
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2878 (class 2606 OID 25381)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2879 (class 2606 OID 25386)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2880 (class 2606 OID 25391)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2881 (class 2606 OID 25396)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2882 (class 2606 OID 25401)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2883 (class 2606 OID 25406)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2884 (class 2606 OID 25411)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2885 (class 2606 OID 25517)
-- Name: course_assists course_assists_assistant_id_2a00dd07_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_assists
    ADD CONSTRAINT course_assists_assistant_id_2a00dd07_fk_auth_user_id FOREIGN KEY (assistant_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2891 (class 2606 OID 25522)
-- Name: course_attempt course_attempt_assistant_id_e5c81de2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_attempt
    ADD CONSTRAINT course_attempt_assistant_id_e5c81de2_fk_auth_user_id FOREIGN KEY (assistant_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2893 (class 2606 OID 25592)
-- Name: course_attempt course_attempt_question_id_686104e4_fk_course_question_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_attempt
    ADD CONSTRAINT course_attempt_question_id_686104e4_fk_course_question_id FOREIGN KEY (question_id) REFERENCES public.course_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2892 (class 2606 OID 25537)
-- Name: course_attempt course_attempt_student_id_1df517f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_attempt
    ADD CONSTRAINT course_attempt_student_id_1df517f3_fk_auth_user_id FOREIGN KEY (student_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2894 (class 2606 OID 25542)
-- Name: course_exam course_exam_instance_id_33146b56_fk_course_instance_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_exam
    ADD CONSTRAINT course_exam_instance_id_33146b56_fk_course_instance_id FOREIGN KEY (instance_id) REFERENCES public.course_instance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2886 (class 2606 OID 25547)
-- Name: course_instance course_instance_course_id_0a55f167_fk_course_course_course_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_instance
    ADD CONSTRAINT course_instance_course_id_0a55f167_fk_course_course_course_id FOREIGN KEY (course_id) REFERENCES public.course_course(course_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2895 (class 2606 OID 25585)
-- Name: course_question course_question_exam_id_e2236174_fk_course_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_question
    ADD CONSTRAINT course_question_exam_id_e2236174_fk_course_exam_id FOREIGN KEY (exam_id) REFERENCES public.course_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2887 (class 2606 OID 25552)
-- Name: course_takes course_takes_student_id_1ccddaeb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_takes
    ADD CONSTRAINT course_takes_student_id_1ccddaeb_fk_auth_user_id FOREIGN KEY (student_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2888 (class 2606 OID 25557)
-- Name: course_teaches course_teaches_instructor_id_4990f8fb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.course_teaches
    ADD CONSTRAINT course_teaches_instructor_id_4990f8fb_fk_auth_user_id FOREIGN KEY (instructor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2889 (class 2606 OID 25431)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2890 (class 2606 OID 25436)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: aryan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-11-25 17:02:48

--
-- PostgreSQL database dump complete
--

