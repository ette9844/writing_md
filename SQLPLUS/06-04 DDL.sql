/*
Data Definition Language
객체를 생성하거나 수정, 삭제할 시에 사용함
객체: 테이블/뷰/시퀀스/인덱스
      테이블이 가장 중요, 나머지는 쓸수도 있고 안 쓸수도 있고
뷰: 따로 테이블로 저장되는 게 아님. 테이블에서 필요한 데이터만 따로
    뽑아둔 것, 저장된 데이터가 아님.
DDL: CREATE, ALTER, DROP

--데이터를 TABLESPACE로 쪼개는 이유
--클라우드 데이터들을 쪼개서 여러 군데에 분배시켜놓는다. 
--한곳이 셧다운 되어도 큰 지장이 없게끔하기 위해
--가독성이 좋은 코드를 위해 명령/예약어는 대문자 변수나 객체는 소문자로
*/
--CREATE
--CREATE TABLE / CREATE VIEW... 등등의 데이터베이스 객체를 생성

--통장 잔고
CREATE TABLE account (
    ac_no       NUMBER(4) PRIMARY KEY,
    ac_date     DATE,
    code        VARCHAR2(14),
    withdrawer  NUMBER(8),
    deposit     NUMBER(10),
    balance     NUMBER(12),
    branch_code CHAR(8)
);

CREATE TABLE nike (
    id      CHAR(10) PRIMARY KEY,
    style   VARCHAR2(20),
    color   VARCHAR2(6),
    owner   VARCHAR2(20),
    c_size  CHAR(3),         --1~10의 작은 수는 varchar2가 의미x
    gender  CHAR(1),
    count   NUMBER(10),
    m_date  DATE
);

--DROP
DROP TABLE 테이블명;
--무결성 제약조건까지 삭제
DROP TABLE 테이블명 CASCADE CONSTRAINT;

--테이블 복사(컬럼명, 컬럼타입, 데이터)
CREATE TABLE student_test
AS SELECT * FROM student;

--테이블 이름 변경
RENAME student_test TO students;

--ALTER
--COLUMN명 변경
ALTER TABLE students
RENAME COLUMN stu_no TO stu_number;

--COLUMN 타입 변경 (데이터가 들어가있는 건 함부러 변경 안됨)
ALTER TABLE students
MODIFY (stu_bmi VARCHAR2(20));
ALTER TABLE students
MODIFY stu_bmi VARCHAR2(20);

--COLUMN 추가
ALTER TABLE students
ADD (stu_bmi NUMBER(5,2));
ALTER TABLE students
ADD stu_bmi NUMBER(5,2);

--COLUMN 삭제 (데이터가 들어가있는 COLUMN도 삭제시 문제가 됨)
ALTER TABLE students
DROP COLUMN stu_bmi;

--제약 조건 추가
ALTER TABLE students
ADD CONSTRAINT pk_stu_test PRIMARY KEY (stu_no);

ALTER TABLE students
ADD CONSTRAINT uni_stu_name UNIQUE (stu_name);

--제약 조건 삭제
ALTER TABLE students
DROP CONSTRAINT pk_stu_test;

--제약 조건 이름 찾기 (제약조건명 안 정해서 자동생성된 제약 조건 포함)
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'students';

--NOT NULL 제약 조건 추가
ALTER TABLE emp MODIFY sal NOT NULL;

--CHECK


--제약 조건들
CREATE TABLE emp3(
	empno    NUMBER(4)    CONSTRAINT pk_emp3  PRIMARY KEY,
	ename    VARCHAR2(20) CONSTRAINT nn_ename NOT NULL,
	job      VARCHAR2(20) CONSTRAINT uni_job  UNIQUE,
	mgr      NUMBER(4)    CONSTRAINT ck_mgr   CHECK (mgr BETWEEN 1 AND 9999), 
	hiredate DATE         DEFAULT SYSDATE
);

CREATE TABLE adidas (
    id      VARCHAR2(10) CONSTRAINT pk_adidas PRIMARY KEY,
    style   VARCHAR2(20) CONSTRAINT uni_style UNIQUE,
    color   CHAR(6)      CONSTRAINT nn_color  NOT NULL,
    owner   VARCHAR2(20),
    c_size  CHAR(3)      CONSTRAINT ck_size   CHECK (c_size IN ('XS','S','M','L','XL','XXL')),
    gender  CHAR(1)      CONSTRAINT ck_gender CHECK (gender IN ('M','F')),
    count   NUMBER(10),
    m_date  DATE         DEFAULT SYSDATE
);

ALTER TABLE adidas  --> NOT NULL 추가
MODIFY owner NOT NULL;

ALTER TABLE adidas  --> CHECK 조건 삭제
DROP CONSTRAINT ck_size;

ALTER TABLE adidas  --> CHECK 조건 추가
ADD CONSTRAINT ck_count CHECK(count BETWEEN 0 AND 1000);

ALTER TABLE adidas  --> UNIQUE 조건 추가
ADD CONSTRAINT uni_date UNIQUE (m_date);

--FOREIGN KEY
ALTER TABLE ENROL ADD CONSTRAINT fk_stu_no
FOREIGN KEY (stu_no) REFERENCES student (stu_no);

--FOREIGN KEY에 원래 데이터에 없는 값을 INSERT 하면 에러가 난다
INSERT INTO ENROL
VALUES('101', '1111231', 80);
--> ORA-02291: 무결성 제약조건(HYEJIN.FK_STU_NO)이 위배되었습니다
--> 부모 키가 없습니다
