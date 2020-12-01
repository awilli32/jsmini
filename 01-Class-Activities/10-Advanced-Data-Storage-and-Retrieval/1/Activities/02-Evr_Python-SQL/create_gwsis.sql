DROP VIEW IF EXISTS all_student_enrollment;
DROP TABLE IF EXISTS classparticipant;
DROP TABLE IF EXISTS staffassignment;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS course;

CREATE TABLE class (
    id_class SERIAL PRIMARY KEY,
    id_course integer NOT NULL,
    section character varying(20) DEFAULT NULL::character varying,
    startdate date,
    enddate date
);
ALTER TABLE class OWNER TO postgres;
--
-- TOC entry 211 (class 1259 OID 54053)
-- Name: classparticipant; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE classparticipant (
    id_classparticipant SERIAL PRIMARY KEY,
    id_student integer NOT NULL,
    id_class integer NOT NULL,
    startdate date,
    enddate date
);
ALTER TABLE classparticipant OWNER TO postgres;
--
-- TOC entry 207 (class 1259 OID 54030)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE course (
    id_course SERIAL PRIMARY KEY,
    coursecode character varying(20) NOT NULL,
    coursename character varying(50) NOT NULL,
    credithours integer,
    bootcampcourse integer
);
ALTER TABLE course OWNER TO postgres;
--
-- TOC entry 205 (class 1259 OID 54012)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE staff (
    id_staff SERIAL PRIMARY KEY,
    employeeid character varying(16) NOT NULL,
    lastname character varying(24) NOT NULL,
    firstname character varying(24) NOT NULL,
    middlename character varying(24) DEFAULT NULL::character varying,
    birthdate date
);
ALTER TABLE staff OWNER TO postgres;
--
-- TOC entry 213 (class 1259 OID 54071)
-- Name: staffassignment; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE staffassignment (
    id_staffassignment SERIAL PRIMARY KEY,
    id_staff integer NOT NULL,
    id_class integer NOT NULL,
    role character varying(45) DEFAULT NULL::character varying,
    startdate date,
    enddate date
);
ALTER TABLE staffassignment OWNER TO postgres;
--
-- TOC entry 203 (class 1259 OID 54003)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--
CREATE TABLE student (
    id_student SERIAL PRIMARY KEY,
    studentid character varying(16) NOT NULL,
    lastname character varying(24) NOT NULL,
    firstname character varying(24) NOT NULL,
    middlename character varying(24) DEFAULT NULL::character varying,
    birthdate date,
    gender "char"
);
ALTER TABLE student OWNER TO postgres;
--
-- TOC entry 214 (class 1259 OID 54088)
-- Name: all_student_enrollment; Type: VIEW; Schema: public; Owner: postgres
--
CREATE VIEW all_student_enrollment AS
 SELECT co.coursename,
    c.section,
    concat(st.lastname, ', ', st.firstname) AS instructorname,
    concat(s.lastname, ', ', s.firstname) AS studentfullname,
    cp.startdate AS enrollmentstartdate,
    cp.enddate AS enrollmentenddate
   FROM (((((classparticipant cp
     JOIN student s ON ((cp.id_student = s.id_student)))
     JOIN class c ON ((cp.id_class = c.id_class)))
     JOIN course co ON ((c.id_course = co.id_course)))
     JOIN staffassignment sa ON (((c.id_class = sa.id_class) AND ((sa.role)::text = 'Instructor'::text))))
     JOIN staff st ON ((sa.id_staff = st.id_staff)))
  ORDER BY co.coursename, c.section, (concat(s.lastname, ', ', s.firstname));
--
-- TOC entry 2744 (class 2606 OID 54046)
-- Name: class fk_class_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE class
  ADD CONSTRAINT fk_class_course FOREIGN KEY (id_course) REFERENCES course(id_course);
--
-- TOC entry 2745 (class 2606 OID 54059)
-- Name: classparticipant fk_class_cp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE classparticipant
  ADD CONSTRAINT fk_class_cp FOREIGN KEY (id_class) REFERENCES class(id_class);
--
-- TOC entry 2747 (class 2606 OID 54078)
-- Name: staffassignment fk_class_sa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE staffassignment
  ADD CONSTRAINT fk_class_sa FOREIGN KEY (id_class) REFERENCES class(id_class);
--
-- TOC entry 2748 (class 2606 OID 54083)
-- Name: staffassignment fk_staff_sa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE staffassignment
  ADD CONSTRAINT fk_staff_sa FOREIGN KEY (id_staff) REFERENCES staff(id_staff);
--
-- TOC entry 2746 (class 2606 OID 54064)
-- Name: classparticipant fk_student_cp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--
ALTER TABLE classparticipant
  ADD CONSTRAINT fk_student_cp FOREIGN KEY (id_student) REFERENCES student(id_student);