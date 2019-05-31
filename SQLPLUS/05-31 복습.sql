--사원번호, 사원이름, 부서이름을 부하직원 수가 적은 순으로 출력
SELECT A.EMPNO, A.ENAME, D.DNAME, COUNT(B.MGR) AS 부하직원수
FROM EMP A
LEFT OUTER JOIN EMP B ON A.EMPNO = B.MGR
JOIN DEPT D ON A.DEPTNO = D.DEPTNO
GROUP BY A.EMPNO, A.ENAME, D.DNAME
ORDER BY COUNT(B.MGR);
--group by에 나와있는 항목과 집계함수만 select에 넣을 수 있다

--사원 JAMES의 사원번호, 이름, 급여, 부서명과 
--그의 매니저 이름, 매니저 부서명을 출력
SELECT A.EMPNO, A.ENAME, A.SAL, D.DNAME, B.ENAME AS 매니저, F.DNAME AS 매니저부서
FROM EMP A 
JOIN EMP B ON A.MGR = B.EMPNO
JOIN DEPT D ON A.DEPTNO = D.DEPTNO
JOIN DEPT F ON B.DEPTNO = F.DEPTNO
WHERE A.ENAME = 'JAMES';