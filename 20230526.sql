-- 스칼라 서브쿼리: select절에 서브쿼리가 온다.
SELECT  T1.STUDENT_NO,
    (SELECT T2.STUDENT_NAME
     FROM ACADEMY_B T2
     WHERE T2.STUDENT_NO = T1.STUDENT_NO)
     AS NAME
FROM ACADEMY_A T1;

-- 인라인뷰: FROM 절에 SELECT 구문이 온다.
SELECT T1.STUDENT_NO, T2.STUDENT_NAME
FROM ACADEMY_A T1,
    (SELECT STUDENT_NO, STUDENT_NAME FROM ACADEMY_B) T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO;

-- 중첩서브쿼리
-- 비연관 서브쿼리: 메인쿼리와 관계를 맺고 있지 않는다.
SELECT * FROM ACADEMY_A
WHERE STUDENT_NAME = (SELECT STUDENT_NAME FROM academy_b WHERE STUDENT_NO = 1003);

-- 연관 서브쿼리: 메인쿼리와 관계를 맺고 있다.
SELECT STUDENT_NO FROM ACADEMY_A T1
WHERE STUDENT_NAME = (SELECT T2.STUDENT_NAME 
                      FROM ACADEMY_B T2 
                      WHERE T2.STUDENT_NO = T1.STUDENT_NO); -- 조인되고 있는 상태. 연관을 맺고 있기 때문에 WHERE STUDENT_NAME = () 이렇게 쓸수 있음

-- 단일행 서브쿼리: 행 하나만 반환
SELECT *
FROM ACADEMY_A
WHERE STUDENT_NAME = (SELECT STUDENT_NAME
                      FROM ACADEMY_B
                      WHERE STUDENT_NO = 1003);
                      
-- 다중행 서브쿼리: 여러행의 데이터를 반환 
SELECT * 
FROM ACADEMY_A -- 연관 서브쿼리가 아닌데 여러 행을 반환할 경우 IN을 쓴다
WHERE STUDENT_NAME IN (SELECT STUDENT_NAME 
                       FROM ACADEMY_B
                       WHERE STUDENT_NO = 1003 OR STUDENT_NO = 1004);
                      
-- 다중 컬럼 서브쿼리: 서브쿼리가 여러개의 컬럼 반환
SELECT * FROM ACADEMY_A
WHERE (STUDENT_NAME, STUDENT_NO) IN (SELECT STUDENT_NAME, STUDENT_NO
                                     FROM ACADEMY_B
                                     WHERE STUDENT_NO = 1003 OR STUDENT_NO = 1004);