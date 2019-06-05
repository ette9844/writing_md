--LOCK이란? (병행처리, 스케쥴링)
--두 개의 터미널을 키고 한쪽 테이블에만 ISNERT 하고 COMMIT을 안 한 상태에서 나머지
--한 터미널에서 해당 기본키나 식별자와 일치하는 데이터를 넣고자 하면 LOCK걸린다
--멈춘다. 나머지 한 터미널 페이지에ㅔ서 커밋해야 다시 작동(오류 띄우고 EXIT 됨)

--VIEW
--내가 원하는 데이터를 모아 테이블처럼 쓰겠다
--매번 JOIN할 필요가 없어짐
--메모리에 저장되지 않음. 물리적인 저장 공간을 필요로 하지 않음

--사용 편의, 실행속도 향상 등의 위해 사용함

--VIEW 생성
CREATE VIEW stu_view (stu_no, stu_name, stu_gender) AS
SELECT stu_no, stu_name, stu_gender
FROM student;

--VIEW 쿼리문 = 테이블 쿼리문
SELECT * FROM stu_view;

--두 개의 테이블로 VIEW 생성
CREATE VIEW emp_view (empno, ename, dname) AS
SELECT emp.empno, emp.ename, dept.dname
FROM emp NATURAL JOIN dept;

--예제1. EMP 테이블로 부터 10,20번 부서의 사원들로 이루어진 뷰를 생성하시오
CREATE VIEW ex1 AS
SELECT *
FROM emp
WHERE deptno IN (10, 20);

--예제2. 사원번호, 사원이름, 부서이름, 상급자이름으로 구성된 뷰를 생성하시오
CREATE VIEW ex2 (empno, ename, dname, mgrname) AS
SELECT A.empno, A.ename, D.dname, B.ename
FROM emp A, emp B, dept D
WHERE B.empno = A.mgr
AND A.deptno = D.deptno;

--예제3. 학과별 평균 몸무게와 평균 키를 가지는 뷰를 생성하시오.
CREATE VIEW ex3 (stu_dept, avg_weight, avg_height) AS
SELECT stu_dept, ROUND(AVG(stu_weight),2), ROUND(AVG(stu_height),2)
FROM student
GROUP BY stu_dept;

--VIEW 생성/수정 = TABLE의 MERGE 
--CREATE OR REPLACE VIEW

--INDEX: 잘 안씀. 특정 경우에 사용하면 좋을 때만 씀


--SEQUENCE
--CACHE/NOCACHE 는 잘 안씀 21개 이상부터 사용해야하는 제약이 있기 때문
CREATE SEQUENCE seq1
INCREMENT BY 1
START WITH 1         --> 안 적으면 1부터 시작
MAXVALUE 100;

SELECT seq1.NEXTVAL FROM DUAL;      --> 실행될 때마다 값이 1씩 증가
SELECT seq1.NEXTVAL, ENAME FROM EMP;

CREATE TABLE emp_vv AS
SELECT seq1.NEXTVAL, ename FROM emp;

seq1.NEXTVAL -- 다음 숫자로 증가
seq1.CURRVAL -- 현재 숫자를 표시

--예제4. 학생이름, 키, 몸무게, BMI 지수를 가지는 뷰를 생성하시오
CREATE VIEW ex4 (stu_name, stu_height, stu_weight, stu_bmi) AS
SELECT stu_name, stu_height, stu_weight, ROUND(stu_weight/POWER((stu_height/100), 2),2)
FROM student
WHERE stu_height IS NOT NULL
AND stu_weight IS NOT NULL;

--예제5. 사원이름, 급여, 커미션, 전체 수입(급여+커미션)을 가지는 뷰를 생성하시오
CREATE VIEW ex5 (ename, sal, comm, total_sal) AS
SELECT ename, sal, comm, NVL(comm, 0) + sal
FROM emp;

--예제6. 초기값 1, 증감값 1, 최대값 1000인 시퀀스를 만들고, 시퀀스를 이용하여
--학생들에게 숫자를 지정하는 새로운 테이블을 만드시오 
--STUDENT_SEQ(SEQ_NO, STU_NO, STU_NAME, STU_GRADE, STU_CLASS, STU_GENDER)
CREATE SEQUENCE seq2
INCREMENT BY 1
START WITH 1
MAXVALUE 1000;

CREATE TABLE student_seq (seq_no, stu_no, stu_name, 
    stu_grade, stu_class, stu_gender) AS
SELECT seq2.NEXTVAL, stu_no, stu_name, stu_grade, stu_class, stu_gender
FROM student;

--ROWID: 행 id 
SELECT ROWID, deptno
FROM emp
WHERE ROWID = 'AAAR9ZAAHAAACWAA';

--ROWNUM: 행 num
--테이블이 생성되며 만들어지는 INDEX
--상위 몇% 하위 몇% 등을 보여줄때 쓰임
SELECT ROWNUM, stu.stu_height
FROM (
    SELECT stu_height
    FROM student
    ORDER BY stu_height
) stu
WHERE ROWNUM < 4;

--예제7. 수입(급여+커미션)이 가장 높은 상위 5명의 사원번호, 사원이름, 부서명을 
--출력하는 뷰를 만드시오
CREATE VIEW ex7 (empno, ename, dname) AS
SELECT empno, ename, dname
FROM (
    SELECT empno, ename, dname
    FROM emp JOIN dept USING(deptno)
    ORDER BY SAL+NVL(COMM, 0) DESC
)
WHERE ROWNUM < 6;

--뷰에 수입 출력
CREATE OR REPLACE VIEW ex7 (empno, ename, dname, total_sal) AS
SELECT empno, ename, dname, total_sal
FROM (
    SELECT empno, ename, dname, SAL+NVL(COMM, 0) AS total_sal
    FROM emp JOIN dept USING(deptno)
    ORDER BY SAL+NVL(COMM, 0) DESC
)
WHERE ROWNUM < 6;

--예제8. 부서별 평균 급여가 작은 부서 2개의 부서 이름을 뷰로 출력하시오
CREATE VIEW ex8 (dname) AS
SELECT dname
FROM (
    SELECT dname
    FROM emp JOIN dept USING(deptno)
    GROUP BY dname
    ORDER BY AVG(sal)
)
WHERE ROWNUM < 3;

--뷰에 평균 급여 출력
CREATE OR REPLACE VIEW ex8 (dname, avg_sal) AS
SELECT dname, avgsal
FROM (
    SELECT dname, ROUND(AVG(sal)) AS avgsal
    FROM emp JOIN dept USING(deptno)
    GROUP BY dname
    ORDER BY AVG(sal)
)
WHERE ROWNUM < 3;