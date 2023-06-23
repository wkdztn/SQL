CREATE TABLE SAMPLE (
    NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    AGE NUMBER
);

INSERT INTO SAMPLE VALUES(1, '������', 10);
INSERT INTO SAMPLE VALUES(2, '�ڿ���', 10);
INSERT INTO SAMPLE VALUES(3, '������', 10);

SELECT * FROM SAMPLE;

COMMIT;

INSERT INTO SAMPLE VALUES(4, '������', 10);

ROLLBACK;

INSERT INTO SAMPLE VALUES(4, '������', 10);

COMMIT; -- �߿�. Ŀ���� ���Ŀ��� �ѹ��� ���� �ʴ´�.

ROLLBACK;

------ �������� ------

ALTER TABLE SAMPLE MODIFY AGE NUMBER CHECK(AGE IN (10,11));
INSERT INTO SAMPLE VALUES (5, '������', 12);

-- constraint violated: �������� ����

------ �ε��� ------
DROP TABLE EMP;

CREATE TABLE EMP (
    NO   NUMBER primary key,
    NAME VARCHAR2(20) not null,
    AGE  NUMBER
);

INSERT INTO EMP (NO, NAME, AGE) VALUES (1, '�Ѹ�', 10);
INSERT INTO EMP (NO, NAME, AGE) VALUES (2, '��ġ', 10);

SELECT * FROM EMP;

CREATE INDEX EMP_IX01 ON EMP(NAME); -- �ε��� ����. �ε����� ������ ��� �˻� �ӵ��� ����.
CREATE INDEX EMP_IX02 ON EMP(NO, NAME);

DROP INDEX EMP_IX01; -- �ε��� ����

CREATE UNIQUE INDEX EMP_IX01 ON EMP(AGE); -- �ε��� ���鶧 �տ� ����ũ ������ �ߺ��� �����Ͱ� ���� ��� ���� �Ұ�
CREATE UNIQUE INDEX EMP_UK ON EMP(NAME); -- �Ӽ����� �ٸ��� ���� ������

------ �����ͻ��� ------

-- DBA ����: �˻� ���� - �����ͺ��̽��� ��� ��ü ��ȸ ����(DBA_�� �ý��� ���� ���� �ǹ�)
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_INDEXES;

-- USER ����: �˻� ���� - ���� �ڽ��� ������ ������ ��ü ��ȸ ����
SELECT * FROM USER_TABLES;
SELECT * FROM USER_INDEXES;

------ ���ν��� ------
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

-- �Լ����� �������� ����. �������� �������� �Ѳ����� �����Ҷ� ���. 

-- 6/12 ������ ���躽 ������ �����ϱ�~