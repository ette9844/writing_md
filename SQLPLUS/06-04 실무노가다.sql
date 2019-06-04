--STUDENTS 테이블
CREATE TABLE students (
    student_no NUMBER(8) CONSTRAINT pk_student_no PRIMARY KEY,
    surname    VARCHAR2(10),
    forename   VARCHAR2(10)
);

INSERT INTO students
VALUES (20060101, 'Dickens', 'Charles');
INSERT INTO students
VALUES (20060102, 'ApGwilym', 'Dafydd');
INSERT INTO students
VALUES (20060103, 'Zola', 'Emile');
INSERT INTO students
VALUES (20060104, 'Mann', 'Thomas');
INSERT INTO students
VALUES (20060105, 'Stevenson', 'Robert');

--MODULES 테이블
CREATE TABLE modules (
    module_code CHAR(6)     CONSTRAINT pk_module_code PRIMARY KEY,
    module_name VARCHAR2(20)
);

INSERT INTO modules
VALUES ('CM0001', 'Databases');
INSERT INTO modules
VALUES ('CM0002', 'Middle Ware');
INSERT INTO modules
VALUES ('CM0003', 'Operating Systems');
INSERT INTO modules
VALUES ('CM0004', 'Graphics');

--MARKS 테이블
CREATE TABLE marks (
    student_no  NUMBER(8)   NOT NULL,
    module_code CHAR(6)     NOT NULL,
    mark        NUMBER(2),
    CONSTRAINT  pk_mark     PRIMARY KEY (student_no, module_code)
);

INSERT INTO marks
VALUES (20060101, 'CM0001', 80);
INSERT INTO marks
VALUES (20060101, 'CM0002', 65);
INSERT INTO marks
VALUES (20060101, 'CM0003', 50);
INSERT INTO marks
VALUES (20060102, 'CM0001', 75);
INSERT INTO marks
VALUES (20060102, 'CM0003', 45);
INSERT INTO marks
VALUES (20060102, 'CM0004', 70);
INSERT INTO marks
VALUES (20060103, 'CM0001', 60);
INSERT INTO marks
VALUES (20060103, 'CM0002', 75);
INSERT INTO marks
VALUES (20060103, 'CM0004', 60);
INSERT INTO marks
VALUES (20060104, 'CM0001', 55);
INSERT INTO marks
VALUES (20060104, 'CM0002', 40);
INSERT INTO marks
VALUES (20060104, 'CM0003', 45);
INSERT INTO marks
VALUES (20060105, 'CM0001', 55);
INSERT INTO marks
VALUES (20060105, 'CM0002', 50);

--1. STUDENTS->STUDENT_T 테이블명 변경
RENAME students TO student_t;

--3. FORENAME 생성 (소문자로)
ALTER TABLE student_t
RENAME COLUMN forename TO forename_t;

ALTER TABLE student_t
ADD forename VARCHAR2(10);

UPDATE student_t
SET forename = LOWER(forename_t);

--2. FORENAME 삭제
ALTER TABLE student_t
DROP COLUMN forename_t;

--4. UNIQUE
ALTER TABLE student_t
ADD CONSTRAINT uni_forename UNIQUE (forename);

--5. NOT NULL
ALTER TABLE student_t
MODIFY forename NOT NULL;

--6. STUDENT_T 테이블 PK 삭제
ALTER TABLE student_t
DROP CONSTRAINT pk_student_no;

--7. PK 새로 추가
ALTER TABLE student_t
ADD CONSTRAINT pk_student_no2 PRIMARY KEY (student_no);

--8. STUDENT_NO 에 CHECK(20060001~20069999) 제약 설정
ALTER TABLE student_t
ADD CONSTRAINT ck_student_no CHECK(student_no >= 20060001 AND student_no <= 20069999);

--9. MARKS로 컬럼명 변경
ALTER TABLE marks
RENAME COLUMN mark TO marks;

--10. 컬럼타입 변경
ALTER TABLE marks
MODIFY (marks NUMBER(2,0));

--11. 로우 데이터 추가, marks FK 추가
INSERT INTO modules VALUES('CM0002', 'Middle Ware');

ALTER TABLE marks ADD CONSTRAINT mod_fk
FOREIGN KEY (module_code) REFERENCES modules (module_code);

--12. 새로운 로우 데이터 추가
INSERT INTO marks
VALUES (20060105, 'CM0006', 65);