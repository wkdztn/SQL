-- 데이터 조회
select * from customer; -- 전체 조회
select name, id, address from customer; -- 특정 컬럼 조회(원하는 컬럼만 추가, 삭제해서 조회 가능)

-- 데이터 정렬
select * from customer order by id; -- 오름차순. 명시하려면 asc 써주면됨. 디폴트라 생략 가능
select * from customer order by id desc; -- 내림차순

-- 그룹화: 특정컬럼을 그룹화하여 데이터 집계를 구한다
select * from gift;
select type from gift group by type; -- group by 컬럼에 있는 것만 select에서 쓸 수 있음
select type, count(name) from gift group by type; -- 그룹화된 항목의 수
select type, sum(price) from gift group by type; -- 그룹화된 항목의 가격 합산

-- 데이터 조건 검색
select * from customer where id > 1;
select * from customer where id <= 4;
select * from customer where id != 1;
select * from customer where address = '인천' or address =  '서울';
select * from customer where not address = '서울';
select order_id + (salesman_id * order_id) from orders;

select order_id * salesman_id as hap from orders; -- as컬럼에 별칭을 준다.
select order_id as 주문자 from orders;

-- ||: 합성 연산자
select '이름:' || name || '입니다.' as intro from customer; -- 문자와 문자를 연결할때 사용한다

-- 범위 연산자
select * from customer where id between 2 and 4; -- 두 값의 범위에 해당하면 검색
select * from customer where id not between 2 and 4; -- 두 값의 범위를 제외하고 검색
select * from customer where id in(1,2,3); -- 괄호안 값과 일치하면 검색 
select * from customer where id not in(1,2,3); -- 괄호안 값과 일치하지 않으면 검색

-- 패턴 연산자
select * from customer where name like '둘%'; -- '둘'로 시작하는 글자 검색
select * from customer where name like '%길%'; -- 중간글자가 '길'인 글자 검색
select * from customer where name like '%치'; -- '치'로 끝나는 글자 검색

-- 빈값 체크 연산자
select * from customer where address is null; -- null값 
select * from customer where address is not null; -- null이 아님

-- 데이터 조회 퀴즈
select * from book where price = 11000 or price = 25000;
select * from book where price > 30000;
select * from book where price >= 10000 and price <= 30000;
select * from book where publisher = '한빛미디어' or publisher = '생능출판';
select * from orders where order_date not in ('2022-01-01');
select * from orders where order_date in ('2022-01-01');

select * from book where price between 10000 and 30000;
select * from contacts where first_name in ('김', '최');
select * from gift where name = '노트북' or name = '벽걸이TV' or name = '양쪽문냉장고';
select * from gift where type = '생활용품' or type = '운동장비';
select * from gift where price between 300000 and 600000;

select * from contacts where phone like '%2341';
select * from contacts where phone like '%3171%';
select * from contacts where phone is null and email like '%gmail%';
select * from gift where type like '%용품';
select * from gift where name like '%세트' and price < 300000;

-- 함수

-- 문자 함수
SELECT LOWER('JENNIE') FROM DUAL; -- 대=>소문자
SELECT UPPER('jennie') FROM DUAL; -- 소=>대문자

select LTRIM('         jennie') from dual; -- 왼쪽 공백 제거
select LTRIM('블랙핑크','블랙') from dual; -- 특정 문자를 왼쪽에서 부터 제거하고 싶을때

select RTRIM('jennie         ') from dual; -- 오른쪽 공백 제거
select RTRIM('블랙핑크','핑크') from dual; -- 특정 문자를 오른쪽에서 부터 제거하고 싶을때

select TRIM('         jennie        ') from dual; -- 양쪽 공백 제거
select TRIM(leading '블' from '블랙핑크') from dual; -- 왼쪽에서 부터 '블' 삭제
select TRIM(trailing '크' from '블랙핑크') from dual; -- 왼쪽에서 부터 '크' 삭제
select TRIM(both '블' from '블랙핑크블') from dual; -- 양쪽 '블' 삭제

select SUBSTR ('블랙핑크제니', 3, 2) from dual; -- 3번째 문자부터 2개 출력
select SUBSTR ('블랙핑크제니', 3, 4) from dual; -- 3번째 문자부터 4개 출력

select LENGTH ('jennie') from dual;

select LENGTH (name) from emp; -- select문에는 컬럼명밖에 쓰지 못함

select REPLACE ('블랙핑크제니', '제니', '지수') from dual; -- 변경 전 문자열을 찾아 변경해줌
-- 변경 후 문자열을 명시해주지 않으면 문자열에서 변경 전 문자열 삭제함
select REPLACE ('블랙핑크제니', '제니') from dual;

-- 숫자함수

select abs(-1) from dual;
select sign(-5) from dual; -- 부호

-- 지정된 소수 자리수 까지 반올림 반환. 자리수 구분은 ppt 참고
select round(163.76, 1) from dual; -- 소수점 한자리까지
select round(163.76, -2) from dual; -- 100의 자리까지 반올림하기때문에 200이 나옴

-- 지정된 소수 자리수 까지 버림해서 반환
select trunc(54.29, 1) from dual;
select trunc(54.29 -2) from dual;

select ceil(72.86) from dual; -- 소수점 이하의 수를 올림
select floor(22.3) from dual; -- 소수점 이하의 수를 버림

select mod(15,7) from dual; -- 나머지 반환
select mod(15,-4) from dual; -- 나머지 반환

-- 날짜함수

-- 날짜 데이터에서 특정 단위만을 출력해서 반환
select extract(year from sysdate) as year, 
       extract(month from sysdate) as month,
       extract(day from sysdate) as day
       from dual;
       
-- 날짜 데이터에서 특정 개월수를 더한 날짜를 반환
SELECT add_months(to_date('2021-12-31', 'YYYY-MM-DD'), -1) as pre from dual;
SELECT add_months(to_date('2021-12-31', 'YYYY-MM-DD'), 4) as pre from dual;

-- 중요

-- 명시적 형변환: 변환 함수를 사용하여 데이터 유형 변환을 명시적으로 나타냄
-- 암시적 형변환: 데이터베이스가 내부적으로 알아서 데이터 유형을 변환함

-- 명시적 변환 함수
select to_number('1234') from dual; -- 문자를 숫자로 바꿔줌
select to_number('ABC') from dual; -- 에러. ABC의 경우 숫자로 바꿀 수 없기때문에..~

select to_char(1234) from dual;
select to_char(sysdate, 'YYYYMMDD HH24MISS') from dual; -- 날짜 => 문자 변경 포맷팅 가능

select to_date('20210602', 'YYYYMMDD') from dual; -- 문자 => 날짜

-- NULL 관련 함수
select * from customer;
select name, nvl (address, '주소없음') as address from customer; -- 도우너 주소 null이라 주소없음 출력
select name, nullif (address, '인천') as address from customer; -- 주소에 있는 값이 인천이면 null 아니면 그대로

-- DECODE 함수

-- id가 1이면 블루 2면 레드...
select id, decode(id, 1, 'blue', 2, 'red', 3, 'yellow', 4, 'black', 5, 'white') from customer;

-- 연산자 decode와 같은 결과
select id, case 
        when id = 1 then 'blue'
        when id = 2 then 'red'
        when id = 3 then 'yellow' 
        when id = 4 then 'black' 
        else 'white'
    end as test
from customer; 

-- 함수 퀴즈 2 1 2 

select name, case
        when name = '둘리' then 'blue'
        when name = '또치' then 'red'
        else 'white'
    end as test
from customer;
        