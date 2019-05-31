--부서번호 10번인 사원들의 사원번호, 사원이름, 월급을 출력하시오.
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

--사원번호 7368인 사원의 이름, 입사일, 부서번호를 출력하시오
SELECT ename AS 사원이름, hiredate AS 입사일, deptno AS 부서번호
FROM emp
WHERE empno = 7369;

--사원번호 7300~7600
SELECT empno AS 사원번호, ename AS 사원이름, hiredate AS 입사일, deptno AS 부서번호
FROM emp
WHERE empno > 7300 AND empno < 7600;

--사원이름이 smith인 사원 이름, 입사일, 부서번호
SELECT ename AS 사원이름, hiredate AS 입사일, deptno AS 부서번호
FROM emp
WHERE ename = 'SMITH';

--이름이 ADAMS이고 사원번호가 7800보다 작은 사원의 모든 정보
SELECT * 
FROM emp
WHERE ename = 'ADAMS' AND empno < 7800;
--data문 안에서는 대소문자를 구분해야 함.

--emp의 모든 정보, 정렬해서
SELECT *
FROM emp
ORDER BY empno; --오름차순

SELECT *
FROM emp
ORDER BY empno desc; --내림차순

--사장 빼고 모두 검색하시오
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

--사장만 검색하시오
SELECT *
FROM emp
WHERE mgr IS NULL;

--이름이 S로 시작하는 모든 사람의 사원번호와 이름
SELECT empno, ename
FROM emp
WHERE ename LIKE 'S%';

--이름 중 S가 들어가는 모든 사람의 사원번호와 이름
SELECT empno, ename
FROM emp
WHERE ename LIKE '%S%';


--조인과 서브쿼리로 두 테이블 참조하기--

--부서번호가 20인 부서의 사원들의 사원이름, 사원번호 
--(서브쿼리를 통한 참조)
SELECT ENAME, EMPNO
FROM EMP
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT
    WHERE DNAME = 'RESEARCH');

--부서번호가 20인 부서의 사원들의 사원이름, 사원번호 
--(키를 통한 참조)
SELECT EMP.ENAME, EMP.EMPNO
FROM EMP, DEPT
WHERE DEPT.DNAME = 'RESEARCH' AND DEPT.DEPTNO = EMP.DEPTNO;

--부서가 시카고에 있는 사원의 사원번호, 사원이름을 출력하시오
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM DEPT
    WHERE LOC = 'CHICAGO');

--SINGLE-ROW FUNCTION
SELECT ABS(-10) FROM DUAL; --의미없는 테이블

--숫자1을 숫자2로 나눈 나머지
SELECT MOD(8, 3) FROM DUAL;

--음수인지 양수인지 0인지
SELECT SIGN(-20) FROM DUAL;

SELECT ROUND(12345, -1) FROM DUAL;

SELECT TRUNC(12345, -2) FROM DUAL;

--둘을 붙여서 출력
SELECT CONCAT(ENAME, DEPTNO) FROM EMP;
--SELECT ENAME || DEPTNO FROM EMP; --연결연산자 사용

--첫번째 글자 부터 세번째 글자까지 잘라서 출력
SELECT SUBSTR(ENAME, 1, 3) FROM EMP;

--글자수 제한에서 많이 쓰이는 함수
SELECT ENAME, LENGTH(ENAME) FROM EMP;

--문자열 바꾸기, 데이터베이스가 바뀐게 아님, 보여지는 것만 바뀐 것
SELECT TRANSLATE(ENAME, 'KING', 'QURY') FROM EMP;

--날짜 함수
SELECT SYSDATE FROM DUAL;

--숫자형을 날짜형으로
SELECT TO_DATE('20190528', 'YYYYMMDD') FROM DUAL;

--입사 년도가 1981년 5월 부터 1982년 2월 사이인 사원의 이름, 부서번호
SELECT ENAME, DEPTNO, HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YYYYMM') >= '198105'
AND TO_CHAR(HIREDATE, 'YYYYMM') <= '198202'
ORDER BY HIREDATE;