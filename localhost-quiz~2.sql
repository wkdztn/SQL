--����1. emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM EMP;

--����2. emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� �����ȣ, ����̸�, ����, �������� ����Ͻÿ�.
SELECT EMPNO AS �����ȣ, ENAME AS ����̸�, SAL ����, SAL*12 ���� FROM EMP;

--����3. employees ���̺��� ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� �̸��� SALARY, SALARY+300�� ��� �մϴ�.
SELECT last_name || first_name, SALARY, SALARY+300 FROM EMPLOYEES;

--����4. EMPLOYEES ���̺��� �̸�(last_name + first_name)�� ������ "KING: 1 Year salary = 60000" �������� ����Ͽ���. 
SELECT last_name || first_name || ' KING: 1Year salary = ' || SALARY*12 FROM EMPLOYEES;

--����5. EMPLOYEES ���̺��� �Ի����ڰ� 1995�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT EMPLOYEE_ID, last_name || first_name, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE >= '95/01/01 00:00:00';

--����6. EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT last_name || ' ' || first_name, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;

--����7. EMPLOYEES ���̺��� �����ȣ�� 144, 176, 200 �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�.
SELECT EMPLOYEE_ID, last_name || ' ' || first_name, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN(144, 176, 200);

--����8.emp ���̺� ���� ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� 1600, 2975, 2850�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�. () ����Ͽ� �켱���� �����
SELECT ENAME, JOB, SAL FROM EMP WHERE (JOB = 'SALESMAN' OR JOB = 'MANAGER') AND SAL NOT IN(1600, 2975, 2850);

--����9.EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ�޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT DEPARTMENT_ID AS �μ���, COUNT(DEPARTMENT_ID), ROUND(AVG(SALARY),3), MIN(SALARY), MAX(SALARY), SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--���� 10. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���(GROUP BY, HAVING) GROUP BY���� ���ǹ� ���� HAVING
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID), SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(DEPARTMENT_ID) > 4;

--���� 11. EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. �� job_id�� 'SA '�� �����ϴ� ������ �����ϰ� �� �޿� �հ�� ����(��������) �϶�. 
SELECT JOB_ID, SUM(SALARY) FROM EMPLOYEES GROUP BY JOB_ID HAVING SUM(SALARY) > 10000 AND JOB_ID NOT LIKE 'SA%' ORDER BY SUM(SALARY) DESC;

--����12. emp���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ���
SELECT SUBSTR(ENAME,1,3) FROM EMP WHERE ENAME LIKE '%A%';

--���⼭ ���� join����

--����13. ��� ����� �̸�, �μ���ȣ, �μ��̸��� ǥ���Ͻÿ�. (emp, dept)
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--����14. ������ MANAGER�� ����� ������ �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�. ( emp, dept)
SELECT E.ENAME, E.JOB, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = 'MANAGER';

--����15. Ŀ�̼�(emp���̺��� comm �÷��̿�)�� �ް� �޿��� 1,600�̻��� ����� ����̸�, �μ���, �ٹ����� ����Ͻÿ�.( emp, dept)
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND (E.COMM IS NOT NULL AND E.COMM != 0)
AND E.SAL >= 1600;

--����16. �ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�. (emp, dept)
SELECT E.ENAME, E.JOB, D.DEPTNO, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'CHICAGO';

-- ����Ŭ ���� ����--- 
-- ���̺� ����, �߰�, ����
-- �� 1. EMPLOYEES ���̺��� �μ����� �ο���, ���, �޿�, �޿��� ��, �ּ� �޿�, �ִ� �޿��� �����ϴ� EMP_DEPTNO ���̺��� �����϶�. ��
CREATE TABLE EMP_DEPTNO( DEPNO, E_COUNT, E_AVG, E_SUM, E_MIN, E_MAX )
AS (
    SELECT DEPARTMENT_ID DEPTNO, COUNT(DEPARTMENT_ID), TRUNC(AVG(SALARY), 3), SUM(SALARY), MIN(SALARY), MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
);

-- �� 2. EMP_DEPTNO ���̺� ETC COLUMN�� �߰��϶�. �� �ڷ����� VARCHAR2(50) ����϶�. ��
ALTER TABLE EMP_DEPTNO ADD ETC VARCHAR2(50);

-- �� 3. EMP_DEPTNO ���̺� ETC COLUMN�� �����϶�. �ڷ����� VARCHAR2(15)�� �϶�. ��
ALTER TABLE EMP_DEPTNO MODIFY ETC VARCHAR2(15);

-- �� 4. EMP_DEPTNO ���̺� �ִ� ETC�� �����ϰ� Ȯ���϶�. ��
ALTER TABLE EMP_DEPTNO DROP COLUMN ETC;

-- �� 5. ������ ������ EMP_DEPTNO ���̺��� �̸��� EMP_DEPT�� �����϶�. ��
ALTER TABLE EMP_DEPTNO RENAME TO EMP_DEPT;

-- �� 6. EMP_DEPT ���̺��� �����϶�. ��
DROP TABLE EMP_DEPT;

-- �� 7. EMPLOYEES ���̺��� EMP ���̺��� �����ϰ� �����ϵ��� �϶�. (������ ����) ��
-- CREATE TABLE ���θ������̺�� AS SELECT * FROM ���������̺�� [WHERE ��]
DROP TABLE EMP;
CREATE TABLE EMP AS (SELECT * FROM EMPLOYEES);

-- �� 8. EMP ���̺� ROW�� �߰��� ���ϴ�. �ٸ�, �ݵ�� �����͸� ������ ���ص� �Ǹ�, NULL�� �����ϵ��� �Ѵ�. ��
INSERT INTO EMP VALUES (207, 'Ab', 'Cde', 'g@gmail.com', NULL, SYSDATE, 'SA_PKN', NULL, NULL, NULL, NULL);

-- �� 9. EMPLOYEES ���̺��� EMPNO, ENAME, SAL, HIREDATE�� COLUMN�� �����Ͽ� EMP_10 ���̺��� ����(������ ������) �� �� 10�� �μ��� �����Ͽ� �̿� ���� EMP_10���̺� �Է��϶�. ��
DROP TABLE EMP_10;
CREATE TABLE EMP_10 AS (SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10);

-- �� 11. EMPLOYEES ���̺��� ��� ��ȣ�� 200�� ����� �޿��� 3500���� �����Ͽ���. ��
UPDATE EMPLOYEES SET SALARY = 3500 WHERE EMPLOYEE_ID = 200;

-- �� 12. EMPLOYEES ���̺��� Gietz�� ������ �޿��� Higgins�� ������ �޿��� ��ġ�ϵ��� �����϶�. ��
UPDATE EMPLOYEES SET (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Higgins') WHERE LAST_NAME = 'Gietz';

-- select ����
-- �� 1. emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�. 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM EMP;

-- �� 2. emp ���̺��� ����̸��� ������ ����ϴµ� �÷����� �� ��, �� ������ �ٲ㼭 ����Ͻÿ�. 
SELECT LAST_NAME AS "�� ��", SALARY AS "�� ��" FROM EMP;

-- �� 3. emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� �����ȣ, ����̸�, ����, �������� ����Ͻÿ�, 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, SALARY*12 FROM EMP;

-- �� 4. emp ���̺�  �� ����(job)�� �ߺ����� �ʰ� ǥ���Ͻÿ�. 
SELECT DISTINCT JOB FROM EMP;

-- �� 5. emp ���̺��� ������ ������ ����(SMITH, CHECK)�ؼ� ǥ���ϰ� �÷����� Employee and job���� ǥ���Ͻÿ�.
SELECT ENAME||'SMITH'||JOB||'CHECK' "Employee and job" FROM EMP;

-- �� 1. EMPLOYEES table�� ��� �ڷḦ ����϶�  
SELECT * FROM EMPLOYEES;

-- �� 2. EMPLOYEES table�� �÷����� ��� ����϶�. 
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID FROM EMPLOYEES;

-- �� 3. EMPLOYEES���� �����ȣ, �̸�, �޿�, �������� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, SALARY, JOB_ID FROM EMPLOYEES;

-- �� 4. ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� SALARY+300 ���÷��� �մϴ�. 
SELECT LAST_NAME||' '||FIRST_NAME, SALARY, SALARY+300 FROM EMPLOYEES;

-- �� 5. EMP ���̺��� �����ȣ, �̸�, �޿�, ���ʽ�, ���ʽ� �ݾ��� ��¿��� (����� ���ʽ��� ���� + (���� * Ŀ�̼�)) 
SELECT EMPNO, ENAME, SAL, COMM, SAL+(SAL*COMM) AS BONUS FROM EMP;

-- �� 6. EMPLOYEES ���̺��� LSAT_NAME�� �̸����� SALARY�� �޿��� ����Ͽ���.
SELECT LAST_NAME AS �̸�, SALARY AS �޿� FROM EMPLOYEES;

-- �� 7. EMPLOYEES ���̺��� LASY_NAME�� Name���� SALARY*12�� Annual Salary(����)�� ����Ͽ���.
SELECT LAST_NAME AS Name, SALARY*12 AS "Annual Salary(����)" FROM EMPLOYEES;

-- �� 8. EMPLOYEES ���̺��� �̸��� ������ �����Ͽ� ����Ͽ���. 
SELECT LAST_NAME||' '||FIRST_NAME || JOB_ID FROM EMPLOYEES;

-- �� 9. EMPLOYEES ���̺��� �̸��� ������ "KING is a PRESIDENT" �������� ����Ͽ���. 
SELECT LAST_NAME||' '||FIRST_NAME||' KING is a PRESIDENT '||JOB_ID FROM EMPLOYEES;

-- �� 10. EMPLOYEES ���̺��� �̸��� ������ "KING: 1 Year salary = 60000" �������� ����Ͽ���. 
SELECT LAST_NAME||' '||FIRST_NAME||' KING: 1 Year salary = '||SALARY*12 FROM EMPLOYEES;

-- �� 11. EMPLOYESS ���̺��� JOB�� ��� ����϶�.
SELECT JOB_ID FROM EMPLOYEES;

-- select ����
-- �� 1. EMPLOYEES ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ, �̸�, ������, �޿��� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY >= 3000;

-- �� 2. EMPLOYEES ���̺��� ��� ������ ST_MAN �� ����� ������ �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN';

-- �� 3. EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE >= '06/01/01';

-- �� 4. EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;

-- �� 5. EMPLOYEES ���̺��� �����ȣ�� 145, 152, 203 �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN (144,174,202);

-- �� 6. EMPLOYEES ���̺��� �Ի����ڰ� 98�⵵�� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE LIKE '98%';

-- �� 7. EMPLOYEES ���̺��� ���ʽ��� NULL�� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, ���ʽ�, �μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, COMMISSION_PCT*SALARY, DEPARTMENT_ID FROM EMPLOYEES;

-- �� 8. EMPLOYEES ���̺��� �޿��� 1100�̻��̰� JOB�� ST_MAN �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 1100 AND JOB_ID = 'ST_MAN';

-- �� 9. EMPLOYEES ���̺��� �޿��� 10000�̻��̰ų� JOB�� Manager �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 10000 OR JOB_ID = 'ST_MAN';

-- �� 10. EMPLOYEES ���̺��� JOB�� ST_MAN, SA_MAN, SA_REP�� �ƴ� ����� ������ �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID NOT IN ('ST_MAN', 'SA_MAN', 'SA_REP');

-- �� 11. ������ PRESIDENT(AD_PRES) �̰� �޿��� 12000�̻��̰ų� ������ SA_MAN�� ����� ������ �����ȣ, �̸�, ����, �޿��� ����϶�.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'AD_PRES' AND SALARY >= 12000 OR JOB_ID = 'SA_MAN'; 

-- �� 12. ������ PRESIDENT(AD_PRES) �Ǵ� SA_MAN �̰� �޿��� 12000�̻��̰ų� ����� ������ �����ȣ, �̸�, ����, �޿��� ����϶�. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'AD_PRES' OR SALARY >= 12000 OR JOB_ID = 'SA_MAN'; 

-- select ����

-- �� 1. emp ���̺��� �����ȣ�� 7698 �� ����� �̸�, ����, �޿��� ����Ͻÿ�. 

SELECT ENAME, JOB, SAL FROM EMP WHERE EMPNO = 7698;

-- �� 2. emp ���̺��� ����̸��� SMITH�� ����� �̸��� ����, �μ���ȣ�� ���Ͻÿ�.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE ENAME = 'SMITH';

-- �� 3. ������ 2500�̻� 3500�̸��� ����� �̸�, �Ի���, ������ ���Ͻÿ�. 

SELECT ENAME, HIREDATE, SAL FROM EMP WHERE SAL BETWEEN 2500 AND 3500;

-- �� 4. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�, ����, �޿��� ����Ͻÿ�. 

SELECT ENAME, JOB , SAL FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

-- �� 5. 81��05��01�ϰ� 81��12��03�� ���̿� �Ի��� ����� �̸�, �޿�, �Ի����� ����Ͻÿ�.

-- ��¥�� �̻���..

-- �� 6. emp���̺��� �����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ,�̸�, ������ ����Ͻÿ�.

SELECT EMPNO, ENAME, SAL FROM EMP WHERE EMPNO NOT IN('7566','7782','7934');

-- �� 7. �μ���ȣ 30(deptno)���� �ٹ��ϸ� ��2,000�޷� ���ϸ� �޴� 81��05��01�� ���Ŀ� �Ի��� ����� �̸�, �޿�, �μ���ȣ, �Ի����� ����Ͻÿ�.

SELECT ENAME, SAL, DEPTNO, HIREDATE FROM EMP WHERE DEPTNO = 30 AND SAL < 2000; -- �Ի��� �̻���

-- �� 8. emp���̺��� �޿��� 2,000�� 5,000 ���̰� �μ���ȣ�� 10 �Ǵ� 30�� ����� �̸��� �޿�,�μ���ȣ�� �����Ͻÿ�.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL BETWEEN 2000 AND 5000 AND DEPTNO IN('10','30');

-- �� 9. ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� 1,600, 2,975 �Ǵ� 2,850�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�. 

-- �� 11. emp���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�. 

-- �� 12. emp���̺��� �����ڰ� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.

-- �� 13. emp���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�, Ŀ�̼��� ���Ͻÿ�. 