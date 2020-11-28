--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.0

-- Started on 2020-11-28 10:55:21

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
-- TOC entry 209 (class 1259 OID 54039)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id_class integer NOT NULL,
    id_course integer NOT NULL,
    section character varying(20) DEFAULT NULL::character varying,
    startdate date,
    enddate date
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 54053)
-- Name: classparticipant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classparticipant (
    id_classparticipant integer NOT NULL,
    id_student integer NOT NULL,
    id_class integer NOT NULL,
    startdate date,
    enddate date
);


ALTER TABLE public.classparticipant OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 54030)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id_course integer NOT NULL,
    coursecode character varying(20) NOT NULL,
    coursename character varying(50) NOT NULL,
    credithours integer,
    bootcampcourse bit(1) DEFAULT '0'::"bit"
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 54012)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id_staff integer NOT NULL,
    employeeid character varying(16) NOT NULL,
    lastname character varying(24) NOT NULL,
    firstname character varying(24) NOT NULL,
    middlename character varying(24) DEFAULT NULL::character varying,
    birthdate date
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 54071)
-- Name: staffassignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staffassignment (
    id_staffassignment integer NOT NULL,
    id_staff integer NOT NULL,
    id_class integer NOT NULL,
    role character varying(45) DEFAULT NULL::character varying,
    startdate date,
    enddate date
);


ALTER TABLE public.staffassignment OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 54003)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id_student integer NOT NULL,
    studentid character varying(16) NOT NULL,
    lastname character varying(24) NOT NULL,
    firstname character varying(24) NOT NULL,
    middlename character varying(24) DEFAULT NULL::character varying,
    birthdate date,
    gender "char"
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 54088)
-- Name: all_student_enrollment; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_student_enrollment AS
 SELECT co.coursename,
    c.section,
    concat(st.lastname, ', ', st.firstname) AS instructorname,
    concat(s.lastname, ', ', s.firstname) AS studentfullname,
    cp.startdate AS enrollmentstartdate,
    cp.enddate AS enrollmentenddate
   FROM (((((public.classparticipant cp
     JOIN public.student s ON ((cp.id_student = s.id_student)))
     JOIN public.class c ON ((cp.id_class = c.id_class)))
     JOIN public.course co ON ((c.id_course = co.id_course)))
     JOIN public.staffassignment sa ON (((c.id_class = sa.id_class) AND ((sa.role)::text = 'Instructor'::text))))
     JOIN public.staff st ON ((sa.id_staff = st.id_staff)))
  ORDER BY co.coursename, c.section, (concat(s.lastname, ', ', s.firstname));


ALTER TABLE public.all_student_enrollment OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 54037)
-- Name: class_id_class_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_id_class_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 208
-- Name: class_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_id_class_seq OWNED BY public.class.id_class;


--
-- TOC entry 210 (class 1259 OID 54051)
-- Name: classparticipant_id_classparticipant_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classparticipant_id_classparticipant_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classparticipant_id_classparticipant_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 210
-- Name: classparticipant_id_classparticipant_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classparticipant_id_classparticipant_seq OWNED BY public.classparticipant.id_classparticipant;


--
-- TOC entry 206 (class 1259 OID 54028)
-- Name: course_id_course_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_course_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 206
-- Name: course_id_course_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_course_seq OWNED BY public.course.id_course;


--
-- TOC entry 204 (class 1259 OID 54010)
-- Name: staff_id_staff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_staff_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_staff_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 204
-- Name: staff_id_staff_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_staff_seq OWNED BY public.staff.id_staff;


--
-- TOC entry 212 (class 1259 OID 54069)
-- Name: staffassignment_id_staffassignment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staffassignment_id_staffassignment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffassignment_id_staffassignment_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 212
-- Name: staffassignment_id_staffassignment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staffassignment_id_staffassignment_seq OWNED BY public.staffassignment.id_staffassignment;


--
-- TOC entry 202 (class 1259 OID 54001)
-- Name: student_id_student_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_student_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_student_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 202
-- Name: student_id_student_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_student_seq OWNED BY public.student.id_student;


--
-- TOC entry 2727 (class 2604 OID 54042)
-- Name: class id_class; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN id_class SET DEFAULT nextval('public.class_id_class_seq'::regclass);


--
-- TOC entry 2729 (class 2604 OID 54056)
-- Name: classparticipant id_classparticipant; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classparticipant ALTER COLUMN id_classparticipant SET DEFAULT nextval('public.classparticipant_id_classparticipant_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 54033)
-- Name: course id_course; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id_course SET DEFAULT nextval('public.course_id_course_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 54015)
-- Name: staff id_staff; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id_staff SET DEFAULT nextval('public.staff_id_staff_seq'::regclass);


--
-- TOC entry 2730 (class 2604 OID 54074)
-- Name: staffassignment id_staffassignment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffassignment ALTER COLUMN id_staffassignment SET DEFAULT nextval('public.staffassignment_id_staffassignment_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 54006)
-- Name: student id_student; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id_student SET DEFAULT nextval('public.student_id_student_seq'::regclass);


--
-- TOC entry 2883 (class 0 OID 54039)
-- Dependencies: 209
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (id_class, id_course, section, startdate, enddate) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 54053)
-- Dependencies: 211
-- Data for Name: classparticipant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classparticipant (id_classparticipant, id_student, id_class, startdate, enddate) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 54030)
-- Dependencies: 207
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id_course, coursecode, coursename, credithours, bootcampcourse) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 54012)
-- Dependencies: 205
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id_staff, employeeid, lastname, firstname, middlename, birthdate) FROM stdin;
1	42158561	Williams	Dartanion 	Deangelo	1983-05-21
2	41346980	Rodney	Heather	Barbara	2005-05-13
3	43250775	Luongo	Darick	Carter	2006-04-09
4	40224800	Sanford	Gemini	Genevieve	2003-06-12
\.


--
-- TOC entry 2887 (class 0 OID 54071)
-- Dependencies: 213
-- Data for Name: staffassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staffassignment (id_staffassignment, id_staff, id_class, role, startdate, enddate) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 54003)
-- Dependencies: 203
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id_student, studentid, lastname, firstname, middlename, birthdate, gender) FROM stdin;
1	22474122	Herbas	Alejandra	Olivia	2003-04-10	F
2	22478715	Zhang	Angela	Emma	2003-01-24	F
3	21782186	Williams	Ashley	Ava	2002-12-05	F
4	23469236	Cooper	Brooke	Sophia	2001-01-12	F
5	20886231	Conroy	Cealin	Isabella	2003-09-16	F
6	25071052	Redmond	Christina	Charlotte	2002-04-25	F
7	24282820	Herschberger	Desiree	Amelia	2000-02-24	F
8	25433387	Abebe	Fraol	Mia	2002-11-02	F
9	21572881	Amedome	Jannette	Harper	2000-12-16	F
10	26299987	Kane	Katherine	Evelyn	2001-04-08	F
11	20898545	Tyler	Leslie	Abigail	2004-04-18	F
12	23304818	Francis	Marilou	Emily	2000-06-13	F
13	23639495	Hulsey	Rebekah	Ella	2002-12-11	F
14	21403969	Bekele	Redeat	Elizabeth	2001-08-10	F
15	21342049	Tettey	Regina	Camila	2000-04-05	F
16	25424903	Hall	Sandra	Luna	2000-02-19	F
17	26856100	Kodali	Sree	Sofia	2003-11-14	F
18	25265801	Sharma	Sveena	Avery	2003-11-17	F
19	20733106	Nahar	Taslemun	Mila	2002-04-25	F
20	21715930	Dandar	Valerie	Aria	2004-06-04	F
21	21144242	Song	Vera	Scarlett	2001-07-05	F
22	21162596	Kahn	Adam	Liam	2002-03-18	M
23	26282295	Salas	Adrian	Noah	2003-05-14	M
24	24731220	Hughes	Anthony	Oliver	2003-09-11	M
25	25917291	Chou	Beili	William	2001-12-21	M
26	21210216	Strange	Gene	Elijah	2001-03-20	M
27	22566253	Tran	Henry	James	2001-10-25	M
28	25080906	Enders	Jared	Benjamin	2003-12-11	M
29	21415063	Verghese	Joseph	Lucas	2002-09-09	M
30	20922594	Mohammadi	Mahdi	Mason	2004-12-22	M
31	23945614	Marange	Meakin	Ethan	2001-06-21	M
32	23584450	Lee	Michael	Alexander	2001-07-22	M
33	26987512	Koranteng	Nicholas	Henry	2004-01-02	M
34	24593723	Mendez	Renier	Jacob	2003-01-15	M
35	24938692	Smith	Sam	Michael	2001-10-12	M
36	21214650	Rigby	Steven	Daniel	2002-07-20	M
37	20593444	Keane	Thomas	Logan	2003-03-19	M
38	22306521	Mirach	Tsegaye	Jackson	2000-11-24	M
39	23240493	Pappas	William	Sebastian	2000-09-14	M
\.


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 208
-- Name: class_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_class_seq', 1, false);


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 210
-- Name: classparticipant_id_classparticipant_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classparticipant_id_classparticipant_seq', 1, false);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 206
-- Name: course_id_course_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_course_seq', 1, false);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 204
-- Name: staff_id_staff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_staff_seq', 4, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 212
-- Name: staffassignment_id_staffassignment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staffassignment_id_staffassignment_seq', 1, false);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 202
-- Name: student_id_student_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_student_seq', 39, true);


--
-- TOC entry 2739 (class 2606 OID 54045)
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id_class);


--
-- TOC entry 2741 (class 2606 OID 54058)
-- Name: classparticipant classparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classparticipant
    ADD CONSTRAINT classparticipant_pkey PRIMARY KEY (id_classparticipant);


--
-- TOC entry 2737 (class 2606 OID 54036)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id_course);


--
-- TOC entry 2735 (class 2606 OID 54018)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id_staff);


--
-- TOC entry 2743 (class 2606 OID 54077)
-- Name: staffassignment staffassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffassignment
    ADD CONSTRAINT staffassignment_pkey PRIMARY KEY (id_staffassignment);


--
-- TOC entry 2733 (class 2606 OID 54009)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id_student);


--
-- TOC entry 2744 (class 2606 OID 54046)
-- Name: class fk_class_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT fk_class_course FOREIGN KEY (id_course) REFERENCES public.course(id_course);


--
-- TOC entry 2745 (class 2606 OID 54059)
-- Name: classparticipant fk_class_cp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classparticipant
    ADD CONSTRAINT fk_class_cp FOREIGN KEY (id_class) REFERENCES public.class(id_class);


--
-- TOC entry 2747 (class 2606 OID 54078)
-- Name: staffassignment fk_class_sa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffassignment
    ADD CONSTRAINT fk_class_sa FOREIGN KEY (id_class) REFERENCES public.class(id_class);


--
-- TOC entry 2748 (class 2606 OID 54083)
-- Name: staffassignment fk_staff_sa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffassignment
    ADD CONSTRAINT fk_staff_sa FOREIGN KEY (id_staff) REFERENCES public.staff(id_staff);


--
-- TOC entry 2746 (class 2606 OID 54064)
-- Name: classparticipant fk_student_cp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classparticipant
    ADD CONSTRAINT fk_student_cp FOREIGN KEY (id_student) REFERENCES public.student(id_student);


-- Completed on 2020-11-28 10:55:22

--
-- PostgreSQL database dump complete
--

