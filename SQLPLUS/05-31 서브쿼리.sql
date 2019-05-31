--SUB QUERY
/*
SELECT~
FROM~
WHERE 표현식 연산자 (SELECT~
                    FROM~
                    WHERE~ );
()안 SELECT 의 값이 하나 나올때 -> 단일행(SINGLE ROW)
()안 SELECT 의 값이 여러개 나올때 -> 단일행(MULTI ROW)
* 서브쿼리문 내에서는 ORDER BY 사용불가
* WHERE절과 FROM절, HAVING절에만 사용할 수 있다
* 서브쿼리를 3층 이상 사용하지 마라 -> 가독성 안 좋다
*/

--평균 급여보다 높은 사원의 이름, 급여를 구하라
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (
    SELECT AVG(SAL)
    FROM EMP
);

--부서 평균 급여가 전체 직원 평균 급여보다 
--많은 부서의 이름, 부서 평균 급여 출력
SELECT DNAME, AVG(SAL) AS 부서별평균
FROM DEPT JOIN EMP USING(DEPTNO)
GROUP BY DNAME
HAVING AVG(SAL) >= (
    SELECT AVG(SAL)
    FROM EMP
);

--SCOTT 사원보다 많은 급여를 받는 사원 정보를 출력
SELECT * 
FROM EMP
WHERE SAL > (
    SELECT SAL
    FROM EMP
    WHERE ENAME = 'SCOTT'
);

--CHICAGO에서 근무하지 않은 모든 사원의 정보 출력
SELECT *
FROM EMP
WHERE DEPTNO != (
    SELECT DEPTNO
    FROM DEPT
    WHERE LOC = 'CHICAGO'
);

--SALESMAN의 커미션 평균을 출력
SELECT AVG(NVL(COMM, 0))
FROM EMP
WHERE JOB = 'SALESMAN';

--다른 식으로(FROM 서브쿼리)
SELECT AVG(COM)
FROM (
    --SALESMAN의 커미션 목록
    SELECT NVL(COMM, 0) AS COM
    FROM EMP
    WHERE JOB = 'SALESMAN'
);

--FROM에는 박스형태의 테이블 정보가 들어간다
--> SELECT문으로 생성된 테이블 정보가 들어가도 ㅇㅋ!

--옥한빛 학생보다 키가 큰 학생들의 이름, 학과, 키를 출력
--단, 키 정보가 없는 학생은 제외
SELECT STU_NAME, STU_DEPT, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT > (
    SELECT STU_HEIGHT
    FROM STUDENT
    WHERE STU_NAME = '옥한빛'
);
--2:2 비교: 이름이 옥한빛이면서 177센치인 학생 찾기
SELECT STU_NAME, STU_DEPT, STU_HEIGHT
FROM STUDENT
WHERE (STU_NAME, STU_HEIGHT) = (
    SELECT STU_HEIGHT
    FROM STUDENT
    WHERE STU_NAME = '옥한빛'
);

--MULTI ROW SUB QUERY
--IN, >, <, ANY(SOME), ALL 등을 사용한다
--1 != 1,2,3,4 이므로 등호 대신 IN 사용
--각 부서별 최소 급여를 받는 사원의 이름과 급여를 구하라
SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (
    SELECT MIN(SAL)
    FROM EMP
    GROUP BY DEPTNO
);
--다른 부서의 같은 급여를 받는 사람을 복수열을 사용하여 제외하면
SELECT ENAME, SAL
FROM EMP
WHERE (DEPTNO, SAL) IN (
    SELECT DEPTNO, MIN(SAL)
    FROM EMP
    GROUP BY DEPTNO
);

--컴퓨터정보과의 최소신장과 각 학과 최소신장을 가진 학생을 비교하여 
--컴퓨터정보과 최소신장보다 큰 학과의 학과명과 최소신장을 출력하시오.
SELECT STU_DEPT, MINH
FROM (
    SELECT STU_DEPT, MIN(STU_HEIGHT) AS MINH
    FROM STUDENT
    GROUP BY STU_DEPT
)
WHERE MINH > (
    SELECT MIN(STU_HEIGHT)
    FROM STUDENT
    WHERE STU_DEPT = '컴퓨터정보'
);
--더 빠른 풀이
SELECT STU_DEPT, MIN(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
HAVING MIN(STU_HEIGHT) > (
    SELECT MIN(STU_HEIGHT)
    FROM STUDENT
    WHERE STU_DEPT = '컴퓨터정보'
    );

--학번, 학생명, 과명, 키, 학생이 소속된 과의 평균키를 출력하시오
SELECT STU_NO, STU_NAME, STU_DEPT, STU_HEIGHT, MINH
FROM (SELECT STU_DEPT AS ADEPT, AVG(STU_HEIGHT) AS MINH
      FROM STUDENT 
      GROUP BY STU_DEPT) 
RIGHT OUTER JOIN STUDENT ON STU_DEPT = ADEPT;

--20번 부서 사원의 사원 직무와 같은 사원 직무인 
--다른 부서의 사원 정보를 검색하라 (IN, ANY, SOME)
SELECT *
FROM EMP
WHERE DEPTNO != 20;
AND JOB IN (
    SELECT DISTINCT JOB
    FROM EMP
    WHERE DEPTNO = 20
);