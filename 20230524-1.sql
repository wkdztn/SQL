-- CREATE TABLE: 테이블 생성
-- : 주석, 컨트롤+/, 전체 주석 /* */ 자바와 같다.
-- 컨트롤+F7: 자동정렬
-- VARCHAR2: ORACLE에서 사용하는 형식. 문자열을 저장하는데 사용.

CREATE TABLE emp (
    no   NUMBER,
    name VARCHAR2(20),
    age  NUMBER
);

CREATE TABLE customer (
    id      NUMBER PRIMARY KEY, -- *중요* PRIMARY KEY: 유일한 값, 중복이 안됨, 무조건 NOT NULL.
    name    VARCHAR2(20) NOT NULL, -- NOT NULL: NULL이 허용 안됨.
    address VARCHAR2(100)
);

CREATE TABLE orders (
    order_id    NUMBER PRIMARY KEY,
    salesman_id NUMBER,
    order_date  DATE NOT NULL
);

CREATE TABLE categories (
    category_id   NUMBER PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL
);

CREATE TABLE location (
    location_id NUMBER PRIMARY KEY,
    address     VARCHAR2(255) NOT NULL,
    postar_code VARCHAR2(20),
    city        VARCHAR2(50)
);

-- 중요한 것 가변길이 고정길이 구분하는 법. 한글이 몇 바이트 쓰이는지 알고 있기.
-- 아래는 오라클 캐릭터셋 확인하는 법. AL32UTF8 한글바이트 3바이트.
SELECT
    *
FROM
    nls_database_parameters
WHERE
    parameter = 'NLS_CHARACTERSET';

-- 컬럼 추가: ALTER TABLE 테이블명 Add 추가할 테이블명 타입();
-- 성별 컬럼 추가
ALTER TABLE customer ADD gender VARCHAR2(9);

-- 컬럼명 변경
ALTER TABLE customer RENAME COLUMN gender TO gen;

ALTER TABLE customer RENAME COLUMN gen TO gender; -- 원복

-- 컬럼 속성 변경
ALTER TABLE customer MODIFY
    gender VARCHAR2(100); -- 크기 변경
ALTER TABLE customer MODIFY
    gender NUMBER; -- 데이터 타입 변경
ALTER TABLE customer MODIFY
    gender NOT NULL; -- 제약조건 수정 
ALTER TABLE customer MODIFY
    gender VARCHAR2(100) DEFAULT 'NONE'; -- 데이터 타입, 디폴트 값을 넣어줌.
    
-- 컬럼에 설명 달기
COMMENT ON COLUMN customer.gender IS
    '성별';
    
-- 컬럼 삭제
ALTER TABLE customer DROP COLUMN name;

ALTER TABLE customer DROP COLUMN address;

ALTER TABLE customer DROP COLUMN gender;

/*
퀴즈1. EMP 테이블에 NUMBER 자료형을 가진 SALARY 컬럼을 추가하시오 

퀴즈2. EMP 테이블의 SALARY 컬럼에 NOT NULL 제약조건을 적용하시오

퀴즈3. EMP 테이블의 모든 컬럼의 코멘트를 작성하시오

퀴즈4. ORDERS 테이블에 VARCHAR2(50) 자료형이고 NOT NULL제약사항을 가진 CUSTOMER_NAME 컬럼을 
         추가하시오

퀴즈5. ORDERS 테이블의 SALESMAN_ID의 자료형을 VARCHAR2(50)로 변경하시오

퀴즈6. ORDERS 테이블의 SALESMAN_ID 컬럼의 이름을 SALESMAN_NAME으로 변경하시오

퀴즈7. ORDERS 테이블의 ORDER_DATE 컬럼에 NULL 제약조건을 적용하시오

퀴즈8. ORDERS 테이블의 모든 컬럼의 코멘트를 작성하시오
*/

ALTER TABLE emp ADD salary NUMBER(10);

ALTER TABLE emp MODIFY
    salary NOT NULL;

COMMENT ON COLUMN emp.no IS
    '번호';

COMMENT ON COLUMN emp.name IS
    '이름';

COMMENT ON COLUMN emp.age IS
    '나이';

COMMENT ON COLUMN emp.salary IS
    '샐러리가 뭐임';

ALTER TABLE orders ADD customer_name VARCHAR2(50);

ALTER TABLE orders MODIFY
    customer_name NOT NULL;

ALTER TABLE orders MODIFY
    salesman_id VARCHAR2(50);

ALTER TABLE orders RENAME COLUMN salesman_id TO salesman_name;

ALTER TABLE orders MODIFY
    order_date null;

COMMENT ON COLUMN orders.order_id IS
    '아이디';

COMMENT ON COLUMN orders.salesman_name IS
    '이름';

COMMENT ON COLUMN orders.order_date IS
    '날짜';

COMMENT ON COLUMN orders.customer_name IS
    '고객이름';

-- 테이블 삭제    
DROP TABLE emp;

DROP TABLE customer;

DROP TABLE orders;

DROP TABLE categories;

CREATE TABLE emp (
    no   NUMBER,
    name VARCHAR2(20),
    age  NUMBER
);

CREATE TABLE customer (
    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    address VARCHAR2(100)
);

CREATE TABLE orders (
    order_id    NUMBER PRIMARY KEY,
    salesman_id NUMBER,
    order_date  DATE NOT NULL
);

CREATE TABLE categories (
    category_id   NUMBER PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL
);

CREATE TABLE location (
    location_id NUMBER PRIMARY KEY,
    address     VARCHAR2(255) NOT NULL,
    postal_code VARCHAR2(20),
    city        VARCHAR2(50)
);

-- 데이터 추가
SELECT  * FROM customer; -- 질의 결과, select *: 테이블에 있는 모든 데이터 검색

INSERT INTO customer (
    id,
    name,
    address
) VALUES (
    1,
    '둘리',
    '인천'
);

-- 완전한 데이터 추가시 컬럼명 생략 가능
INSERT INTO customer VALUES (
    2,
    '둘리',
    '인천'
); 

-- 불완전한 데이터 추가: 컬럼명 반드시 명시
insert into customer(id, name) values(3, '또치');
insert into customer(id, address) values(3, '서울'); -- not null 에러
insert into customer(name) values('마이콜'); -- not null 에러

-- 빈문자열이나 null은 이런식으로 넣어줌
insert into customer values(4, '둘리', '');
insert into customer values(5, '홍길동', null);

insert into customer values(5, '희동이', '서울'); -- pk 제약조건 에러(5가 이미 있어서..)

select * from orders;

insert into orders values(1001, 2002, sysdate); -- sysdate: 현재 시간
insert into orders values(1002, 2002, '2022-08-27'); -- 특정 시간

insert into orders values(1003, 2002, TO_DATE('2022-08-27','YYYY-MM-DD')); -- 날짜 포맷 
insert into orders values(1004, 2002, TO_DATE('2022-08-27 10:10:10','YYYY-MM-DD HH24:MI:SS')); 

select * from customer;
-- 데이터 수정
-- where: 조건절
-- 2 둘리의 address가 서울로 바뀜
update customer set address ='서울' where id = '2';
update customer set name ='훈이', address = '제주도' where id = '3'; -- 여러개 바꿀땐 ,로 처리

select * from orders;
update orders set order_date = sysdate where order_id = 1002;
update orders set order_date = '2023-05-27 12:12:12' where order_id = 1002; -- 특정 날짜 시간으로 수정할때

-- 데이터 삭제
delete from customer where id = 4; -- id 4 전체 행 삭제
delete from customer where name = '둘리'; -- 둘리 이름 가진 전체 행 삭제
delete from customer; -- 모든 레코드(데이터) 삭제

-- 2개 이상의 조건이 있을 때 
delete from orders where order_id = 1001 and salesman_id = 2002;

-- 테이블 삭제 퀴즈: 생성된 모든 테이블 삭제
drop table orders;
drop table categories;
drop table customer;
drop table emp;
drop table location;

-- 데이터 추가 퀴즈 1
select * from book;
create table book (
    book_no number primary key,
    name varchar2(100),
    publisher varchar2(100),
    price number
);

-- 데이터 추가 퀴즈 2
insert into book values(1, '역사1', '상상마당', 30000);
insert into book values(2, '역사2', '상상마당', 30000);
insert into book values(3, '스프링웹프로젝트', '한빛미디어', 50000);
insert into book values(4, '자바개발도서', '생능출판', null);

-- 데이터 추가 퀴즈 3
select * from emp;

create table emp(
    no number,
    name varchar2(20),
    age number
);

insert into emp values(null, null, null);
insert into emp values(1, null, null);
insert into emp values(null, '둘리', 10);
insert into emp values(1, '둘리', 10);
insert into emp values(1, '둘리', 10);

-- 데이터 추가 퀴즈 4

 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
  
INSERT INTO CONTACTS VALUES (1,'이','서연','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'이','시우','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'김','지호','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'김','윤서','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'최','수아','fern.head@gmail.com', NULL);

-- 데이터 추가 퀴즈 5
select * from cal;

create table cal (
    month varchar2,
    day_week varchar2,
    day varchar2
);

-- 데이터 추가 퀴즈6
select * from gift;

create table gift(
    no number primary key,
    name varchar2(100),
    price number
);

insert into gift values (1, '참치세트', 100000);
insert into gift values (2, '샴푸세트', 200000);
insert into gift values (3, '세차용품세트', 300000);
insert into gift values (4, '주방용품세트', 400000);
insert into gift values (5, '산악용자전거', 500000);
insert into gift values (6, 'LCD모니터', 600000);
insert into gift values (7, '노트북', 700000);
insert into gift values (8, '벽걸이TV', 800000);
insert into gift values (9, '드럼세탁기', 900000);
insert into gift values (10, '양쪽문냉장고', 1000000);

------------------------- 0524 수업 테이블 초기화 -------------------------
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100)
);

INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '둘리', '인천');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(2, '둘리', '서울');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(3, '홍길동','서울');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(4, '또치', '제주도');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(5, '도우너', '');

DROP TABLE ORDERS;

CREATE TABLE ORDERS (
    ORDER_ID    NUMBER PRIMARY KEY,
    SALESMAN_ID NUMBER,
    ORDER_DATE  DATE NOT NULL
);

INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1001, 2002, '2022-01-01');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1002, 2002, '2022-01-02');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1003, 2002, '2022-01-03');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1004, 2002, '2022-01-04');

DROP TABLE BOOK;

CREATE TABLE BOOK (
    BOOK_NO NUMBER PRIMARY KEY, --도서번호
    TITLE VARCHAR2(100) NOT NULL, --제목
    PUBLISHER VARCHAR2(100), --출판사
    PRICE NUMBER --가격
);

INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '역사1', '상상마당', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '역사2', '상상마당', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '스프링웹프로젝트', '한빛미디어', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (4, '자바프로그래밍', '생능출판', 25000);

DROP TABLE CONTACTS;

 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
  
INSERT INTO CONTACTS VALUES (1,'이','서연','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'이','시우','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'김','지호','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'김','윤서','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'최','수아','fern.head@gmail.com', NULL);

DROP TABLE GIFT;

CREATE TABLE GIFT (
    NO    NUMBER,
    TYPE  VARCHAR2(20),
    NAME  VARCHAR2(20),
    PRICE NUMBER
);

INSERT INTO GIFT VALUES(1,'식품','참치세트',100000);
INSERT INTO GIFT VALUES(2,'생활용품','샴푸세트',200000);
INSERT INTO GIFT VALUES(3,'생활용품','세차용품세트',300000);
INSERT INTO GIFT VALUES(4,'생활용품','주방용품세트',400000);
INSERT INTO GIFT VALUES(5,'운동장비','산악용자전거',500000);
INSERT INTO GIFT VALUES(6,'가전제품','LCD모니터',600000);
INSERT INTO GIFT VALUES(7,'가전제품','노트북',700000);
INSERT INTO GIFT VALUES(8,'가전제품','벽걸이TV',800000);
INSERT INTO GIFT VALUES(9,'가전제품','드럼세탁기',900000);
INSERT INTO GIFT VALUES(10,'가전제품','양쪽문냉장고',1000000);