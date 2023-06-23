-- CREATE TABLE: ���̺� ����
-- : �ּ�, ��Ʈ��+/, ��ü �ּ� /* */ �ڹٿ� ����.
-- ��Ʈ��+F7: �ڵ�����
-- VARCHAR2: ORACLE���� ����ϴ� ����. ���ڿ��� �����ϴµ� ���.

CREATE TABLE emp (
    no   NUMBER,
    name VARCHAR2(20),
    age  NUMBER
);

CREATE TABLE customer (
    id      NUMBER PRIMARY KEY, -- *�߿�* PRIMARY KEY: ������ ��, �ߺ��� �ȵ�, ������ NOT NULL.
    name    VARCHAR2(20) NOT NULL, -- NOT NULL: NULL�� ��� �ȵ�.
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

-- �߿��� �� �������� �������� �����ϴ� ��. �ѱ��� �� ����Ʈ ���̴��� �˰� �ֱ�.
-- �Ʒ��� ����Ŭ ĳ���ͼ� Ȯ���ϴ� ��. AL32UTF8 �ѱ۹���Ʈ 3����Ʈ.
SELECT
    *
FROM
    nls_database_parameters
WHERE
    parameter = 'NLS_CHARACTERSET';

-- �÷� �߰�: ALTER TABLE ���̺�� Add �߰��� ���̺�� Ÿ��();
-- ���� �÷� �߰�
ALTER TABLE customer ADD gender VARCHAR2(9);

-- �÷��� ����
ALTER TABLE customer RENAME COLUMN gender TO gen;

ALTER TABLE customer RENAME COLUMN gen TO gender; -- ����

-- �÷� �Ӽ� ����
ALTER TABLE customer MODIFY
    gender VARCHAR2(100); -- ũ�� ����
ALTER TABLE customer MODIFY
    gender NUMBER; -- ������ Ÿ�� ����
ALTER TABLE customer MODIFY
    gender NOT NULL; -- �������� ���� 
ALTER TABLE customer MODIFY
    gender VARCHAR2(100) DEFAULT 'NONE'; -- ������ Ÿ��, ����Ʈ ���� �־���.
    
-- �÷��� ���� �ޱ�
COMMENT ON COLUMN customer.gender IS
    '����';
    
-- �÷� ����
ALTER TABLE customer DROP COLUMN name;

ALTER TABLE customer DROP COLUMN address;

ALTER TABLE customer DROP COLUMN gender;

/*
����1. EMP ���̺� NUMBER �ڷ����� ���� SALARY �÷��� �߰��Ͻÿ� 

����2. EMP ���̺��� SALARY �÷��� NOT NULL ���������� �����Ͻÿ�

����3. EMP ���̺��� ��� �÷��� �ڸ�Ʈ�� �ۼ��Ͻÿ�

����4. ORDERS ���̺� VARCHAR2(50) �ڷ����̰� NOT NULL��������� ���� CUSTOMER_NAME �÷��� 
         �߰��Ͻÿ�

����5. ORDERS ���̺��� SALESMAN_ID�� �ڷ����� VARCHAR2(50)�� �����Ͻÿ�

����6. ORDERS ���̺��� SALESMAN_ID �÷��� �̸��� SALESMAN_NAME���� �����Ͻÿ�

����7. ORDERS ���̺��� ORDER_DATE �÷��� NULL ���������� �����Ͻÿ�

����8. ORDERS ���̺��� ��� �÷��� �ڸ�Ʈ�� �ۼ��Ͻÿ�
*/

ALTER TABLE emp ADD salary NUMBER(10);

ALTER TABLE emp MODIFY
    salary NOT NULL;

COMMENT ON COLUMN emp.no IS
    '��ȣ';

COMMENT ON COLUMN emp.name IS
    '�̸�';

COMMENT ON COLUMN emp.age IS
    '����';

COMMENT ON COLUMN emp.salary IS
    '�������� ����';

ALTER TABLE orders ADD customer_name VARCHAR2(50);

ALTER TABLE orders MODIFY
    customer_name NOT NULL;

ALTER TABLE orders MODIFY
    salesman_id VARCHAR2(50);

ALTER TABLE orders RENAME COLUMN salesman_id TO salesman_name;

ALTER TABLE orders MODIFY
    order_date null;

COMMENT ON COLUMN orders.order_id IS
    '���̵�';

COMMENT ON COLUMN orders.salesman_name IS
    '�̸�';

COMMENT ON COLUMN orders.order_date IS
    '��¥';

COMMENT ON COLUMN orders.customer_name IS
    '���̸�';

-- ���̺� ����    
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

-- ������ �߰�
SELECT  * FROM customer; -- ���� ���, select *: ���̺� �ִ� ��� ������ �˻�

INSERT INTO customer (
    id,
    name,
    address
) VALUES (
    1,
    '�Ѹ�',
    '��õ'
);

-- ������ ������ �߰��� �÷��� ���� ����
INSERT INTO customer VALUES (
    2,
    '�Ѹ�',
    '��õ'
); 

-- �ҿ����� ������ �߰�: �÷��� �ݵ�� ���
insert into customer(id, name) values(3, '��ġ');
insert into customer(id, address) values(3, '����'); -- not null ����
insert into customer(name) values('������'); -- not null ����

-- ���ڿ��̳� null�� �̷������� �־���
insert into customer values(4, '�Ѹ�', '');
insert into customer values(5, 'ȫ�浿', null);

insert into customer values(5, '����', '����'); -- pk �������� ����(5�� �̹� �־..)

select * from orders;

insert into orders values(1001, 2002, sysdate); -- sysdate: ���� �ð�
insert into orders values(1002, 2002, '2022-08-27'); -- Ư�� �ð�

insert into orders values(1003, 2002, TO_DATE('2022-08-27','YYYY-MM-DD')); -- ��¥ ���� 
insert into orders values(1004, 2002, TO_DATE('2022-08-27 10:10:10','YYYY-MM-DD HH24:MI:SS')); 

select * from customer;
-- ������ ����
-- where: ������
-- 2 �Ѹ��� address�� ����� �ٲ�
update customer set address ='����' where id = '2';
update customer set name ='����', address = '���ֵ�' where id = '3'; -- ������ �ٲܶ� ,�� ó��

select * from orders;
update orders set order_date = sysdate where order_id = 1002;
update orders set order_date = '2023-05-27 12:12:12' where order_id = 1002; -- Ư�� ��¥ �ð����� �����Ҷ�

-- ������ ����
delete from customer where id = 4; -- id 4 ��ü �� ����
delete from customer where name = '�Ѹ�'; -- �Ѹ� �̸� ���� ��ü �� ����
delete from customer; -- ��� ���ڵ�(������) ����

-- 2�� �̻��� ������ ���� �� 
delete from orders where order_id = 1001 and salesman_id = 2002;

-- ���̺� ���� ����: ������ ��� ���̺� ����
drop table orders;
drop table categories;
drop table customer;
drop table emp;
drop table location;

-- ������ �߰� ���� 1
select * from book;
create table book (
    book_no number primary key,
    name varchar2(100),
    publisher varchar2(100),
    price number
);

-- ������ �߰� ���� 2
insert into book values(1, '����1', '��󸶴�', 30000);
insert into book values(2, '����2', '��󸶴�', 30000);
insert into book values(3, '��������������Ʈ', '�Ѻ��̵��', 50000);
insert into book values(4, '�ڹٰ��ߵ���', '��������', null);

-- ������ �߰� ���� 3
select * from emp;

create table emp(
    no number,
    name varchar2(20),
    age number
);

insert into emp values(null, null, null);
insert into emp values(1, null, null);
insert into emp values(null, '�Ѹ�', 10);
insert into emp values(1, '�Ѹ�', 10);
insert into emp values(1, '�Ѹ�', 10);

-- ������ �߰� ���� 4

 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
  
INSERT INTO CONTACTS VALUES (1,'��','����','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'��','�ÿ�','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'��','��ȣ','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'��','����','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'��','����','fern.head@gmail.com', NULL);

-- ������ �߰� ���� 5
select * from cal;

create table cal (
    month varchar2,
    day_week varchar2,
    day varchar2
);

-- ������ �߰� ����6
select * from gift;

create table gift(
    no number primary key,
    name varchar2(100),
    price number
);

insert into gift values (1, '��ġ��Ʈ', 100000);
insert into gift values (2, '��Ǫ��Ʈ', 200000);
insert into gift values (3, '������ǰ��Ʈ', 300000);
insert into gift values (4, '�ֹ��ǰ��Ʈ', 400000);
insert into gift values (5, '��ǿ�������', 500000);
insert into gift values (6, 'LCD�����', 600000);
insert into gift values (7, '��Ʈ��', 700000);
insert into gift values (8, '������TV', 800000);
insert into gift values (9, '�巳��Ź��', 900000);
insert into gift values (10, '���ʹ������', 1000000);

------------------------- 0524 ���� ���̺� �ʱ�ȭ -------------------------
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100)
);

INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '�Ѹ�', '��õ');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(2, '�Ѹ�', '����');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(3, 'ȫ�浿','����');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(4, '��ġ', '���ֵ�');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(5, '�����', '');

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
    BOOK_NO NUMBER PRIMARY KEY, --������ȣ
    TITLE VARCHAR2(100) NOT NULL, --����
    PUBLISHER VARCHAR2(100), --���ǻ�
    PRICE NUMBER --����
);

INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '����1', '��󸶴�', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '����2', '��󸶴�', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '��������������Ʈ', '�Ѻ��̵��', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (4, '�ڹ����α׷���', '��������', 25000);

DROP TABLE CONTACTS;

 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
  
INSERT INTO CONTACTS VALUES (1,'��','����','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'��','�ÿ�','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'��','��ȣ','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'��','����','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'��','����','fern.head@gmail.com', NULL);

DROP TABLE GIFT;

CREATE TABLE GIFT (
    NO    NUMBER,
    TYPE  VARCHAR2(20),
    NAME  VARCHAR2(20),
    PRICE NUMBER
);

INSERT INTO GIFT VALUES(1,'��ǰ','��ġ��Ʈ',100000);
INSERT INTO GIFT VALUES(2,'��Ȱ��ǰ','��Ǫ��Ʈ',200000);
INSERT INTO GIFT VALUES(3,'��Ȱ��ǰ','������ǰ��Ʈ',300000);
INSERT INTO GIFT VALUES(4,'��Ȱ��ǰ','�ֹ��ǰ��Ʈ',400000);
INSERT INTO GIFT VALUES(5,'����','��ǿ�������',500000);
INSERT INTO GIFT VALUES(6,'������ǰ','LCD�����',600000);
INSERT INTO GIFT VALUES(7,'������ǰ','��Ʈ��',700000);
INSERT INTO GIFT VALUES(8,'������ǰ','������TV',800000);
INSERT INTO GIFT VALUES(9,'������ǰ','�巳��Ź��',900000);
INSERT INTO GIFT VALUES(10,'������ǰ','���ʹ������',1000000);