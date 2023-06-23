-- ��Į�� ��������: select���� ���������� �´�.
SELECT  T1.STUDENT_NO,
    (SELECT T2.STUDENT_NAME
     FROM ACADEMY_B T2
     WHERE T2.STUDENT_NO = T1.STUDENT_NO)
     AS NAME
FROM ACADEMY_A T1;

-- �ζ��κ�: FROM ���� SELECT ������ �´�.
SELECT T1.STUDENT_NO, T2.STUDENT_NAME
FROM ACADEMY_A T1,
    (SELECT STUDENT_NO, STUDENT_NAME FROM ACADEMY_B) T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO;

-- ��ø��������
-- �񿬰� ��������: ���������� ���踦 �ΰ� ���� �ʴ´�.
SELECT * FROM ACADEMY_A
WHERE STUDENT_NAME = (SELECT STUDENT_NAME FROM academy_b WHERE STUDENT_NO = 1003);

-- ���� ��������: ���������� ���踦 �ΰ� �ִ�.
SELECT STUDENT_NO FROM ACADEMY_A T1
WHERE STUDENT_NAME = (SELECT T2.STUDENT_NAME 
                      FROM ACADEMY_B T2 
                      WHERE T2.STUDENT_NO = T1.STUDENT_NO); -- ���εǰ� �ִ� ����. ������ �ΰ� �ֱ� ������ WHERE STUDENT_NAME = () �̷��� ���� ����

-- ������ ��������: �� �ϳ��� ��ȯ
SELECT *
FROM ACADEMY_A
WHERE STUDENT_NAME = (SELECT STUDENT_NAME
                      FROM ACADEMY_B
                      WHERE STUDENT_NO = 1003);
                      
-- ������ ��������: �������� �����͸� ��ȯ 
SELECT * 
FROM ACADEMY_A -- ���� ���������� �ƴѵ� ���� ���� ��ȯ�� ��� IN�� ����
WHERE STUDENT_NAME IN (SELECT STUDENT_NAME 
                       FROM ACADEMY_B
                       WHERE STUDENT_NO = 1003 OR STUDENT_NO = 1004);
                      
-- ���� �÷� ��������: ���������� �������� �÷� ��ȯ
SELECT * FROM ACADEMY_A
WHERE (STUDENT_NAME, STUDENT_NO) IN (SELECT STUDENT_NAME, STUDENT_NO
                                     FROM ACADEMY_B
                                     WHERE STUDENT_NO = 1003 OR STUDENT_NO = 1004);