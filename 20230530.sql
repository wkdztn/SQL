CREATE TABLE SAMPLE (
    NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    AGE NUMBER
);

INSERT INTO SAMPLE VALUES(1, '양지은', 10);
INSERT INTO SAMPLE VALUES(2, '박우진', 10);
INSERT INTO SAMPLE VALUES(3, '김태은', 10);

SELECT * FROM SAMPLE;

COMMIT;

INSERT INTO SAMPLE VALUES(4, '정지우', 10);

ROLLBACK;

INSERT INTO SAMPLE VALUES(4, '정지우', 10);

COMMIT; -- 중요. 커밋한 이후에는 롤백이 되지 않는다.

ROLLBACK;

------ 제약조건 ------

ALTER TABLE SAMPLE MODIFY AGE NUMBER CHECK(AGE IN (10,11));
INSERT INTO SAMPLE VALUES (5, '정지우', 12);

-- constraint violated: 제약조건 위반

------ 인덱스 ------
DROP TABLE EMP;

CREATE TABLE EMP (
    NO   NUMBER primary key,
    NAME VARCHAR2(20) not null,
    AGE  NUMBER
);

INSERT INTO EMP (NO, NAME, AGE) VALUES (1, '둘리', 10);
INSERT INTO EMP (NO, NAME, AGE) VALUES (2, '또치', 10);

SELECT * FROM EMP;

CREATE INDEX EMP_IX01 ON EMP(NAME); -- 인덱스 생성. 인덱스를 생성할 경우 검색 속도가 빠름.
CREATE INDEX EMP_IX02 ON EMP(NO, NAME);

DROP INDEX EMP_IX01; -- 인덱스 삭제

CREATE UNIQUE INDEX EMP_IX01 ON EMP(AGE); -- 인덱스 만들때 앞에 유니크 붙으면 중복된 데이터가 있을 경우 생성 불가
CREATE UNIQUE INDEX EMP_UK ON EMP(NAME); -- 속성값이 다르면 생성 가능함

------ 데이터사전 ------

-- DBA 관점: 검색 범위 - 데이터베이스의 모든 객체 조회 가능(DBA_는 시스템 접근 권한 의미)
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_INDEXES;

-- USER 관점: 검색 범위 - 현재 자신의 계정이 소유한 객체 조회 가능
SELECT * FROM USER_TABLES;
SELECT * FROM USER_INDEXES;

------ 프로시저 ------
create or replace PROCEDURE EX_PROC
(
   in_type IN VARCHAR2,
   in_name IN VARCHAR2
)
IS
price NUMBER := 10000;

BEGIN

INSERT INTO GIFT
VALUES (11, in_type, in_name, price);
COMMIT;

END EX_PROC;

-- 함수같은 느낌으로 실행. 여러개의 쿼리문을 한꺼번에 실행할때 사용. 

-- 6/12 세과목 시험봄 쿼리문 공부하기~