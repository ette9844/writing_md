--MERGE
--EMP에 다음 정보 입력
--사원번호 1112, 이름 PARK, 월급 1000
--만약 데이터가 존재하면 UPDATE하고 존재하지 않으면 INSERT 하시오
MERGE INTO EMP E
    USING DUAL T      --테이블: 우리는 DATA만 가지고 있으니까 테이블 대신 DUAL
    ON (E.EMPNO = 1112) --조건:
WHEN MATCHED THEN
    UPDATE SET E.ENAME = 'PARK', E.SAL = 1000
WHEN NOT MATCHED THEN
    INSERT (E.EMPNO, E.ENAME, E.SAL)
    VALUES(1112, 'PARK', 1000);

--컴퓨터 정보 1,2학년이면 몸무게를 10KG씩 증가시키고
--컴퓨터 정보 3학년 학생이면 몸무게를 20KG를 증가시켜
--새로운 STUDENT_TEST 테이블에 데이터를 저장하시오
MERGE INTO STUDENT_TEST A
    USING (
        SELECT *
        FROM STUDENT
        WHERE STU_DEPT = '컴퓨터정보') B
    ON (A.STU_NO = B.STU_NO)
WHEN MATCHED THEN
    UPDATE SET A.STU_WEIGHT = B.STU_WEIGHT + 
    DECODE(B.STU_GRADE, 1, 10, 2, 10, 3, 20)
WHEN NOT MATCHED THEN
    INSERT (A.STU_NO, 
            A.STU_NAME, 
            A.STU_DEPT, 
            A.STU_GRADE,
            A.STU_CLASS, 
            A.STU_GENDER, 
            A.STU_HEIGHT, 
            A.STU_WEIGHT)
    VALUES (B.STU_NO, 
            B.STU_NAME, 
            B.STU_DEPT, 
            B.STU_GRADE, 
            B.STU_CLASS, 
            B.STU_GENDER, 
            B.STU_HEIGHT, 
            B.STU_WEIGHT + 
            DECODE(B.STU_GRADE, 1, 10, 2, 10, 3, 20));

--USING에 컴퓨터정보 학생 테이블로 넣으면 더 깔끔
--UPDATE와 INSERT문 뒤에 WHERE절 붙여도 됨

