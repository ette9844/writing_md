--20번 부서의 최대 급여보다 최대 급여가 큰 부서의 번호와 최대 급여를 검색
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > (
    SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 20
);

--급여가 모든 부서들의 평균 급여보다 많은 사원 정보를 검색하라(ALL)
--부등호로 크기 비교할 시에는 ALL이 편함
SELECT *
FROM EMP
WHERE SAL > ALL (
    SELECT ROUND(AVG(SAL))
    FROM EMP
    GROUP BY DEPTNO
);

