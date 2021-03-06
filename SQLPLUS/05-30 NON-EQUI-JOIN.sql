--급여 등급 확인(NON-EQUAL)
--ANSI STYLE
SELECT E.ENAME, E.SAL, G.GRADE
FROM EMP E, SALGRADE G
WHERE E.SAL BETWEEN G.LOSAL AND G.HISAL; 

--ORACLE STYLE
SELECT E.ENAME, E.SAL, G.GRADE
FROM EMP E, SALGRADE G
WHERE E.SAL >= G.LOSAL 
AND E.SAL <= G.HISAL; 

--사원번호, 사원이름, 급여, 급여등급을 급여등급별 사원번호 순으로 검색하시오
SELECT E.EMPNO, E.ENAME, E.SAL, G.GRADE
FROM EMP E, SALGRADE G
WHERE E.SAL BETWEEN G.LOSAL AND G.HISAL
ORDER BY G.GRADE, E.EMPNO;

--가독성 높이기
SELECT E.EMPNO, E.ENAME, E.SAL, G.GRADE
FROM EMP E, SALGRADE G
WHERE E.SAL BETWEEN G.LOSAL AND G.HISAL
ORDER BY 4, 1;   --SELECT의 네번째 인자와 첫번째 인자