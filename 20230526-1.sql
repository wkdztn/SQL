---------- ��:�⺻ ���̺�κ��� ������ ���� ���̺�. ----------
-- ���������� �������� ������ ���̺�� �ִ� ��ó�� ���ֵȴ�(��� �� ���̺�)

CREATE OR REPLACE VIEW ACADEMY_ALL AS
SELECT * FROM ACADEMY_A;

SELECT * FROM ACADEMY_ALL WHERE STUDENT_NAME = '�迬��';

CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NAME FROM ACADEMY_A;

SELECT * FROM ACADEMY_STUDENT_NAME;

-- ������ ���̺� ���� // (������ ���̺��� ����� ���̹Ƿ� �ߺ��� �÷��� ���õ��� �ʵ��� ����)
CREATE OR REPLACE VIEW ACADEMY_JOIN AS
SELECT T1.STUDENT_NAME, T1.STUDENT_NO
FROM ACADEMY_A T1, ACADEMY_B T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO;

SELECT * FROM ACADEMY_JOIN;

DROP VIEW ACADEMY_JOIN;

SELECT * FROM STUDENT_GRADE; -- 4�忡 �ִ� ���̺� ����

---------- ������ �Լ�: OVER Ű����� ���Ǹ� ���ҿ� ���� ����. ----------
-- OVER()���� GROUP BY�� ���������� ������� �ʰ� ���� �Լ��� ����� �� �ִ�.

-- �����Լ�
-- RANK: ������ �ű�鼭 ���� ������ �����ϸ� �����ϴ� ����ŭ ������ �ǳ� ��.
SELECT STUDENT_NAME, SCORE, RANK() OVER(ORDER BY SCORE DESC) -- ������ ���� ���� ��� ����Ϸ��� ASC
FROM STUDENT_GRADE;

-- DENSE_RANK: ������ �ű�鼭 ���� ������ �����ϴ��� �ǳʶ��� �ʰ� �̾ �ű�.
SELECT STUDENT_NAME, SCORE, DENSE_RANK() OVER(ORDER BY SCORE DESC)
FROM STUDENT_GRADE;

-- ROW_NUMBER: ������ ���������� ������ �ű�
SELECT STUDENT_NAME, SCORE, ROW_NUMBER() OVER(ORDER BY SCORE DESC)
FROM STUDENT_GRADE;

-- �����Լ�
-- �հ� 
SELECT TYPE, SUM(PRICE) AS SUM FROM GIFT GROUP BY TYPE; -- ���ļ� ��µ�
SELECT TYPE, SUM(PRICE) OVER(PARTITION BY TYPE) AS SUM FROM GIFT; -- Ÿ�Կ� �ִ°� �״�� ��µ�

---------- ������ ----------

-- ������ ����
CREATE SEQUENCE EMP_SEQ
        INCREMENT BY 1 -- 1�� ���� ��Ŵ
        START WITH 1 -- ���۰�
        MINVALUE 1 -- �ּҰ�
        MAXVALUE 9999 -- �ִ밪
        NOCYCLE
        NOCACHE
        NOORDER;

-- ������ ���
SELECT EMP_SEQ.NEXTVAL FROM DUAL; -- ����(��ɹ� �����Ҷ����� 1�� ������)
SELECT EMP_SEQ.CURRVAL FROM DUAL; -- ���� �� ��ȸ

-- �������� �̿��� INSERT
INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL, '�Ѹ�', 10);
INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL, '��ġ', 10);
INSERT INTO EMP VALUES (EMP_SEQ.NEXTVAL, '��浿', 10);

SELECT * FROM EMP;
DROP TABLE DEPT CASCADE CONSTRAINTS; -- �������� �����ϰ� ����

-- ������ �Ӽ� ����
ALTER SEQUENCE EMP_SEQ INCREMENT BY 2;
ALTER SEQUENCE EMP_SEQ MAXVALUE 9999999;

-- ������ ����
DROP SEQUENCE EMP_SEQ;

-- ������ ���� �� ���� (���� ���������� 6�ε� �����Ͱ��� 11���� ���� �� ���)
ALTER SEQUENCE EMP_SEQ INCREMENT BY 4; -- ������ 4�� �ǵ��� ����

SELECT EMP_SEQ.NEXTVAL FROM DUAL;

ALTER SEQUENCE EMP_SEQ INCREMENT BY 1; -- ������ 1�� �ǵ��� ����

---------- DDL ----------
TRUNCATE TABLE STUDENT_GRADE; -- ���̺��� ������ ��ü ������
SELECT * FROM STUDENT_GRADE;

