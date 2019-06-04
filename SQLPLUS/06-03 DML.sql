--DATA MANIPULATION LANGUAGE
--테이블 내의 데이터를 생성, 수정, 삭제할 시에 사용
--INSERT, UPDATE, DELETE

--TEST 테이블 생성
CREATE TABLE EMP_TEST (
	EMPNO NUMBER(4) CONSTRAINT pk_emp_test PRIMARY KEY,
	--PRIMARY KEY 의 이름 설정 -> CONSTRAINT
    --TABLE 이름처럼 중복된 이름으로 생성 불가
);

--INSERT: 모든 데이터 입력
INSERT INTO EMP_TEST
VALUES(7369, 'SMITH', 'CLERK', 7902, TO_DATE('80/12/17'), 
       800, NULL, 20);

--INSERT: 원하는 데이터만 입력
INSERT INTO EMP_TEST (EMPNO, ENAME)
VALUES(0130, 'HYEJIN');

--INSERT + SELECT
--PRIMARY KEY로 해당 정보를 찾아내는 것이 안전함
--동명이인 SMITH가 있을 수 있기 때문에
INSERT INTO EMP_TEST
SELECT *
FROM EMP
WHERE EMPNO != 7369; --ENAME != 'SMITH';

--EMP_TEST 테이블에 아래 정보를 입력하시오
/*월급: 100000 보너스: 1000 이름: SON 사원번호: 1112*/
INSERT INTO EMP_TEST (EMPNO, ENAME, SAL, COMM)
VALUES(1112, 'SON', 100000, 1000);
--COLUMN을 명시적으로 적어두는 것이 오류를 잡기 좋다
--EX. COLUMN 순서가 바뀔 경우

--타입 NUMBER(5, 2) -> 999.99 까지 넣을 수 있다
--소수점 아래 2자리 + 소수점 위 3자리 = 총 5자리
--타입 VARCHAR2(9 BYTE) -> 최대 9BYTE 까지

--UPDATE
UPDATE EMP_TEST
SET ENAME='YEO'
WHERE EMPNO = 1111;

--사원번호가 7900인 사원의 부서 번호를 30으로 수정
UPDATE EMP_TEST
SET DEPTNO = 30
WHERE EMPNO = 7900;

--부서번호 20의 사원들 급여가 10% 인상 됨
UPDATE EMP_TEST
SET SAL = ROUND(1.1 * SAL)
WHERE DEPTNO = 20;

--모든 사원의 입사일을 오늘로 수정 SYSDATE
UPDATE EMP_TEST
SET HIREDATE = SYSDATE;

--EMP_TEST에 사원번호, 9999, 사원이름 KITRI를 입력하시오
--그 후에, 사원번호가 9999인 사원의 이름을 KITRI00으로 변경하시오
INSERT INTO EMP_TEST (EMPNO, ENAME)
VALUES (9999, 'KITRI');

UPDATE EMP_TEST
SET ENAME = 'KITRI00'
WHERE EMPNO = 9999;

--SUBJECT_TEST라는 테이블을 새로 만드시오
--SUBJECT_TEST 테이블에 SUBJECT 테이블 정보를 모두 저장
--SUBJECT_TEST 테이블에 아래 정보 입력
--(112, 오라클DB, 여동빈, 1, 컴퓨터정보)
create table subject_test(
	sub_no char(3),
	sub_name varchar2(30),
	sub_prof varchar2(12),
	sub_grade number(1),
	sub_dept varchar2(20),
	constraint p_sub_no primary key(sub_no)
);

INSERT INTO SUBJECT_TEST
SELECT *
FROM SUBJECT;

INSERT INTO SUBJECT_TEST(SUB_NO, SUB_NAME, SUB_PROF, SUB_GRADE, SUB_DEPT)
VALUES(112, '오라클DB', '여동빈', 1, '컴퓨터정보');
COMMIT;

SELECT * FROM subject_test;

--ENROL_TEST 테이블을 새로 만드시오
--ENROL_TEST 테이블에 ENROL 정보 모두 저장
--ENROL_TEST 테이블에 시스템분석설계 듣는 학생들의 점수 10씩 증가
create table enrol_test(
	sub_no char(3),
	stu_no char(9),
	enr_grade number(3),
	constraint p_course_test primary key(sub_no,stu_no)
);

INSERT INTO ENROL_TEST
SELECT *
FROM ENROL;

UPDATE ENROL_TEST
SET ENR_GRADE = ENR_GRADE + 10
WHERE SUB_NO = (
    SELECT SUB_NO
    FROM SUBJECT_TEST
    WHERE SUB_NAME = '시스템분석설계'
);

--EMP_TEST 테이블에서 월급 등급이 3인 직원의 월급을 15% 인상하여 저장
UPDATE EMP_TEST
SET SAL = ROUND(SAL * 1.15)
WHERE EMPNO IN (
    SELECT E.EMPNO
    FROM EMP_TEST E, SALGRADE G
    WHERE E.SAL BETWEEN G.LOSAL AND G.HISAL
    AND G.GRADE = 3
);

--EMP_TEST 테이블에서 DALLAS에서 일하는 직원들의 COMM을 100씩 추가하시오
UPDATE EMP_TEST
SET COMM = NVL(COMM,0) + 100
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT
    WHERE LOC = 'DALLAS'
);

--EMP_TEST 테이블에서 SCOTT의 상급자를 BLAKE로 변경하시오
UPDATE EMP_TEST
SET MGR = (
    SELECT EMPNO
    FROM EMP_TEST
    WHERE ENAME = 'BLAKE'
)
WHERE EMPNO = (
    SELECT EMPNO
    FROM EMP_TEST
    WHERE ENAME = 'SCOTT'
);

--DELETE
--DELETE FROM [TABLE_NAME]
--WHERE ~ <- WHERE 절을 넣지 않으면 테이블이 통째로 삭제됨
DELETE FROM EMP_TEST;
ROLLBACK;   --> 커밋하기 바로 전의 단계로 돌아감

DELETE FROM EMP_TEST
WHERE EMPNO IN (
    SELECT EMPNO
    FROM EMP_TEST
    WHERE JOB IS NULL
);

--사원번호가 7902번인 사원의 데이터 삭제
DELETE FROM EMP_TEST
WHERE EMPNO = 7902;

--평균급여보다 적게 받는 사원 삭제
DELETE FROM EMP_TEST
WHERE SAL < (
    SELECT AVG(SAL)
    FROM EMP_TEST
);

--모든 행 삭제
DELETE FROM EMP_TEST;