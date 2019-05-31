--부서번호 별로 정렬하여 모든 정보를 출력하는데 
--부서별 급여가 높은 사원부터 출력하시오
SELECT *
FROM EMP
ORDER BY DEPTNO, SAL DESC;

--부서번호, 부서별 평균 임금을 출력. 단, 평균 임금이 2000이하인 부서는 제외
SELECT DEPTNO, ROUND(AVG(SAL), 0)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;

--직무 중 가장 적게 수입을 가지는 직무의 평균 월급을 출력?
SELECT MIN(AVG(SAL))
FROM EMP
GROUP BY JOB;

--기계과 학생들 중 학년별 평균 신장이 160이상인 학년과 평균 신장 출력
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT = '기계'
GROUP BY STU_GRADE
HAVING AVG(STU_HEIGHT) >= 160;

--최대 신장이 175이상인 학과와 학과별 최대 신장 출력
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
HAVING MAX(STU_HEIGHT) >= 175;

--학과별 평균 신장 중 가장 높은 평균 신장을 출력
--HAVING 조건에 집계 함수를 중첩해서 사용하면 오류가 난다
SELECT ROUND(MAX(AVG(STU_HEIGHT)),0)
FROM STUDENT
GROUP BY STU_DEPT;

--STU_DEPT도 출력하고 싶을 때
SELECT STU_DEPT, AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
HAVING AVG(STU_HEIGHT) = (
    SELECT MAX(AVG(STU_HEIGHT))
    FROM STUDENT
    GROUP BY STU_DEPT
);