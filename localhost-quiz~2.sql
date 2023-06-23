--문제1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP;

--문제2. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오.
SELECT EMPNO AS 사원번호, ENAME AS 사원이름, SAL 월급, SAL*12 연봉 FROM EMP;

--문제3. employees 테이블에서 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 이름과 SALARY, SALARY+300를 출력 합니다.
SELECT last_name || first_name, SALARY, SALARY+300 FROM EMPLOYEES;

--문제4. EMPLOYEES 테이블에서 이름(last_name + first_name)과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. 
SELECT last_name || first_name || ' KING: 1Year salary = ' || SALARY*12 FROM EMPLOYEES;

--문제5. EMPLOYEES 테이블에서 입사일자가 1995년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라
SELECT EMPLOYEE_ID, last_name || first_name, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE >= '95/01/01 00:00:00';

--문제6. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라.
SELECT last_name || ' ' || first_name, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;

--문제7. EMPLOYEES 테이블에서 사원번호가 144, 176, 200 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라.
SELECT EMPLOYEE_ID, last_name || ' ' || first_name, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN(144, 176, 200);

--문제8.emp 테이블 에서 업무가 SALESMAN 또는 MANAGER이면서 급여가 1600, 2975, 2850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오. () 사용하여 우선순위 줘야함
SELECT ENAME, JOB, SAL FROM EMP WHERE (JOB = 'SALESMAN' OR JOB = 'MANAGER') AND SAL NOT IN(1600, 2975, 2850);

--문제9.EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고급여, 급여의 합을 구하여 출력하라.
SELECT DEPARTMENT_ID AS 부서명, COUNT(DEPARTMENT_ID), ROUND(AVG(SALARY),3), MIN(SALARY), MAX(SALARY), SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--문제 10. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라(GROUP BY, HAVING) GROUP BY에서 조건문 쓸때 HAVING
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID), SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(DEPARTMENT_ID) > 4;

--문제 11. EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 단 job_id가 'SA '로 시작하는 직원은 제외하고 월 급여 합계로 정렬(내림차순) 하라. 
SELECT JOB_ID, SUM(SALARY) FROM EMPLOYEES GROUP BY JOB_ID HAVING SUM(SALARY) > 10000 AND JOB_ID NOT LIKE 'SA%' ORDER BY SUM(SALARY) DESC;

--문제12. emp테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력
SELECT SUBSTR(ENAME,1,3) FROM EMP WHERE ENAME LIKE '%A%';

--여기서 부터 join문제

--문제13. 모든 사원의 이름, 부서번호, 부서이름을 표시하시오. (emp, dept)
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--문제14. 업무가 MANAGER인 사원의 정보를 이름, 업무, 부서명, 근무지 순으로 출력하시오. ( emp, dept)
SELECT E.ENAME, E.JOB, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = 'MANAGER';

--문제15. 커미션(emp테이블의 comm 컬럼이용)을 받고 급여가 1,600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오.( emp, dept)
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND (E.COMM IS NOT NULL AND E.COMM != 0)
AND E.SAL >= 1600;

--문제16. 근무지가 CHICAGO인 모든 사원의 이름,업무,부서번호 및 부서이름을 표시하시오. (emp, dept)
SELECT E.ENAME, E.JOB, D.DEPTNO, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'CHICAGO';

-- 오라클 문제 모음--- 
-- 테이블 생성, 추가, 삭제
-- ■ 1. EMPLOYEES 테이블에서 부서별로 인원수, 평균, 급여, 급여의 합, 최소 급여, 최대 급여를 포함하는 EMP_DEPTNO 테이블을 생성하라. ■
CREATE TABLE EMP_DEPTNO( DEPNO, E_COUNT, E_AVG, E_SUM, E_MIN, E_MAX )
AS (
    SELECT DEPARTMENT_ID DEPTNO, COUNT(DEPARTMENT_ID), TRUNC(AVG(SALARY), 3), SUM(SALARY), MIN(SALARY), MAX(SALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
);

-- ■ 2. EMP_DEPTNO 테이블에 ETC COLUMN을 추가하라. 단 자료형은 VARCHAR2(50) 사용하라. ■
ALTER TABLE EMP_DEPTNO ADD ETC VARCHAR2(50);

-- ■ 3. EMP_DEPTNO 테이블에 ETC COLUMN을 수정하라. 자료형은 VARCHAR2(15)로 하라. ■
ALTER TABLE EMP_DEPTNO MODIFY ETC VARCHAR2(15);

-- ■ 4. EMP_DEPTNO 테이블에 있는 ETC을 삭제하고 확인하라. ■
ALTER TABLE EMP_DEPTNO DROP COLUMN ETC;

-- ■ 5. 이전에 생성한 EMP_DEPTNO 테이블의 이름을 EMP_DEPT로 변경하라. ■
ALTER TABLE EMP_DEPTNO RENAME TO EMP_DEPT;

-- ■ 6. EMP_DEPT 테이블을 삭제하라. ■
DROP TABLE EMP_DEPT;

-- ■ 7. EMPLOYEES 테이블을 EMP 테이블을 생성하고 복제하도록 하라. (데이터 포함) ■
-- CREATE TABLE 새로만들테이블명 AS SELECT * FROM 복사할테이블명 [WHERE 절]
DROP TABLE EMP;
CREATE TABLE EMP AS (SELECT * FROM EMPLOYEES);

-- ■ 8. EMP 테이블에 ROW를 추가해 봅니다. 다만, 반드시 데이터를 기입을 안해도 되면, NULL로 설정하도록 한다. ■
INSERT INTO EMP VALUES (207, 'Ab', 'Cde', 'g@gmail.com', NULL, SYSDATE, 'SA_PKN', NULL, NULL, NULL, NULL);

-- ■ 9. EMPLOYEES 테이블에서 EMPNO, ENAME, SAL, HIREDATE의 COLUMN만 선택하여 EMP_10 테이블을 생성(데이터 미포함) 한 후 10번 부서만 선택하여 이에 값을 EMP_10테이블에 입력하라. ■
DROP TABLE EMP_10;
CREATE TABLE EMP_10 AS (SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10);

-- ■ 11. EMPLOYEES 테이블에서 사원 번호가 200인 사원의 급여를 3500으로 변경하여라. ■
UPDATE EMPLOYEES SET SALARY = 3500 WHERE EMPLOYEE_ID = 200;

-- ■ 12. EMPLOYEES 테이블에서 Gietz의 업무와 급여가 Higgins의 업무와 급여와 일치하도록 수정하라. ■
UPDATE EMPLOYEES SET (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Higgins') WHERE LAST_NAME = 'Gietz';

-- select 구문
-- ■ 1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오. 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM EMP;

-- ■ 2. emp 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 이 름, 월 급으로 바꿔서 출력하시오. 
SELECT LAST_NAME AS "이 름", SALARY AS "월 급" FROM EMP;

-- ■ 3. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오, 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, SALARY*12 FROM EMP;

-- ■ 4. emp 테이블  의 업무(job)를 중복되지 않게 표시하시오. 
SELECT DISTINCT JOB FROM EMP;

-- ■ 5. emp 테이블의 사원명과 업무로 연결(SMITH, CHECK)해서 표시하고 컬럼명은 Employee and job으로 표시하시오.
SELECT ENAME||'SMITH'||JOB||'CHECK' "Employee and job" FROM EMP;

-- ■ 1. EMPLOYEES table의 모든 자료를 출력하라  
SELECT * FROM EMPLOYEES;

-- ■ 2. EMPLOYEES table의 컬럼들을 모두 출력하라. 
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID FROM EMPLOYEES;

-- ■ 3. EMPLOYEES에서 사원번호, 이름, 급여, 담당업무를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, SALARY, JOB_ID FROM EMPLOYEES;

-- ■ 4. 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300 디스플레이 합니다. 
SELECT LAST_NAME||' '||FIRST_NAME, SALARY, SALARY+300 FROM EMPLOYEES;

-- ■ 5. EMP 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력여라 (참고로 보너스는 월급 + (월급 * 커미션)) 
SELECT EMPNO, ENAME, SAL, COMM, SAL+(SAL*COMM) AS BONUS FROM EMP;

-- ■ 6. EMPLOYEES 테이블에서 LSAT_NAME을 이름으로 SALARY을 급여로 출력하여라.
SELECT LAST_NAME AS 이름, SALARY AS 급여 FROM EMPLOYEES;

-- ■ 7. EMPLOYEES 테이블에서 LASY_NAME을 Name으로 SALARY*12를 Annual Salary(연봉)로 출력하여라.
SELECT LAST_NAME AS Name, SALARY*12 AS "Annual Salary(연봉)" FROM EMPLOYEES;

-- ■ 8. EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라. 
SELECT LAST_NAME||' '||FIRST_NAME || JOB_ID FROM EMPLOYEES;

-- ■ 9. EMPLOYEES 테이블에서 이름과 업무를 "KING is a PRESIDENT" 형식으로 출력하여라. 
SELECT LAST_NAME||' '||FIRST_NAME||' KING is a PRESIDENT '||JOB_ID FROM EMPLOYEES;

-- ■ 10. EMPLOYEES 테이블에서 이름과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. 
SELECT LAST_NAME||' '||FIRST_NAME||' KING: 1 Year salary = '||SALARY*12 FROM EMPLOYEES;

-- ■ 11. EMPLOYESS 테이블에서 JOB을 모두 출력하라.
SELECT JOB_ID FROM EMPLOYEES;

-- select 구문
-- ■ 1. EMPLOYEES 테이블에서 급여가 3000이상인 사원읜 정보를 사원번호, 이름, 담당업무, 급여를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY >= 3000;

-- ■ 2. EMPLOYEES 테이블에서 담당 업무가 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN';

-- ■ 3. EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE >= '06/01/01';

-- ■ 4. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라.
SELECT LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;

-- ■ 5. EMPLOYEES 테이블에서 사원번호가 145, 152, 203 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN (144,174,202);

-- ■ 6. EMPLOYEES 테이블에서 입사일자가 98년도에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE LIKE '98%';

-- ■ 7. EMPLOYEES 테이블에서 보너스가 NULL인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, COMMISSION_PCT*SALARY, DEPARTMENT_ID FROM EMPLOYEES;

-- ■ 8. EMPLOYEES 테이블에서 급여가 1100이상이고 JOB이 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 1100 AND JOB_ID = 'ST_MAN';

-- ■ 9. EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 Manager 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 10000 OR JOB_ID = 'ST_MAN';

-- ■ 10. EMPLOYEES 테이블에서 JOB이 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 정보를 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID NOT IN ('ST_MAN', 'SA_MAN', 'SA_REP');

-- ■ 11. 업무가 PRESIDENT(AD_PRES) 이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라.
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'AD_PRES' AND SALARY >= 12000 OR JOB_ID = 'SA_MAN'; 

-- ■ 12. 업무가 PRESIDENT(AD_PRES) 또는 SA_MAN 이고 급여가 12000이상이거나 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라. 
SELECT EMPLOYEE_ID, LAST_NAME||' '||FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'AD_PRES' OR SALARY >= 12000 OR JOB_ID = 'SA_MAN'; 

-- select 구문

-- ■ 1. emp 테이블에서 사원번호가 7698 인 사원의 이름, 업무, 급여를 출력하시오. 

SELECT ENAME, JOB, SAL FROM EMP WHERE EMPNO = 7698;

-- ■ 2. emp 테이블에서 사원이름이 SMITH인 사람의 이름과 월급, 부서번호를 구하시오.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE ENAME = 'SMITH';

-- ■ 3. 월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오. 

SELECT ENAME, HIREDATE, SAL FROM EMP WHERE SAL BETWEEN 2500 AND 3500;

-- ■ 4. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오. 

SELECT ENAME, JOB , SAL FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

-- ■ 5. 81년05월01일과 81년12월03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오.

-- 날짜가 이상함..

-- ■ 6. emp테이블에서 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름, 월급을 출력하시오.

SELECT EMPNO, ENAME, SAL FROM EMP WHERE EMPNO NOT IN('7566','7782','7934');

-- ■ 7. 부서번호 30(deptno)에서 근무하며 월2,000달러 이하를 받는 81년05월01일 이후에 입사한 사원의 이름, 급여, 부서번호, 입사일을 출력하시오.

SELECT ENAME, SAL, DEPTNO, HIREDATE FROM EMP WHERE DEPTNO = 30 AND SAL < 2000; -- 입사일 이상함

-- ■ 8. emp테이블에서 급여가 2,000와 5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 나열하시오.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL BETWEEN 2000 AND 5000 AND DEPTNO IN('10','30');

-- ■ 9. 업무가 SALESMAN 또는 MANAGER이면서 급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오. 

-- ■ 11. emp테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오. 

-- ■ 12. emp테이블에서 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.

-- ■ 13. emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오. 