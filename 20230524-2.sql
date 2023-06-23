-- ������ ��ȸ
select * from customer; -- ��ü ��ȸ
select name, id, address from customer; -- Ư�� �÷� ��ȸ(���ϴ� �÷��� �߰�, �����ؼ� ��ȸ ����)

-- ������ ����
select * from customer order by id; -- ��������. ����Ϸ��� asc ���ָ��. ����Ʈ�� ���� ����
select * from customer order by id desc; -- ��������

-- �׷�ȭ: Ư���÷��� �׷�ȭ�Ͽ� ������ ���踦 ���Ѵ�
select * from gift;
select type from gift group by type; -- group by �÷��� �ִ� �͸� select���� �� �� ����
select type, count(name) from gift group by type; -- �׷�ȭ�� �׸��� ��
select type, sum(price) from gift group by type; -- �׷�ȭ�� �׸��� ���� �ջ�

-- ������ ���� �˻�
select * from customer where id > 1;
select * from customer where id <= 4;
select * from customer where id != 1;
select * from customer where address = '��õ' or address =  '����';
select * from customer where not address = '����';
select order_id + (salesman_id * order_id) from orders;

select order_id * salesman_id as hap from orders; -- as�÷��� ��Ī�� �ش�.
select order_id as �ֹ��� from orders;

-- ||: �ռ� ������
select '�̸�:' || name || '�Դϴ�.' as intro from customer; -- ���ڿ� ���ڸ� �����Ҷ� ����Ѵ�

-- ���� ������
select * from customer where id between 2 and 4; -- �� ���� ������ �ش��ϸ� �˻�
select * from customer where id not between 2 and 4; -- �� ���� ������ �����ϰ� �˻�
select * from customer where id in(1,2,3); -- ��ȣ�� ���� ��ġ�ϸ� �˻� 
select * from customer where id not in(1,2,3); -- ��ȣ�� ���� ��ġ���� ������ �˻�

-- ���� ������
select * from customer where name like '��%'; -- '��'�� �����ϴ� ���� �˻�
select * from customer where name like '%��%'; -- �߰����ڰ� '��'�� ���� �˻�
select * from customer where name like '%ġ'; -- 'ġ'�� ������ ���� �˻�

-- �� üũ ������
select * from customer where address is null; -- null�� 
select * from customer where address is not null; -- null�� �ƴ�

-- ������ ��ȸ ����
select * from book where price = 11000 or price = 25000;
select * from book where price > 30000;
select * from book where price >= 10000 and price <= 30000;
select * from book where publisher = '�Ѻ��̵��' or publisher = '��������';
select * from orders where order_date not in ('2022-01-01');
select * from orders where order_date in ('2022-01-01');

select * from book where price between 10000 and 30000;
select * from contacts where first_name in ('��', '��');
select * from gift where name = '��Ʈ��' or name = '������TV' or name = '���ʹ������';
select * from gift where type = '��Ȱ��ǰ' or type = '����';
select * from gift where price between 300000 and 600000;

select * from contacts where phone like '%2341';
select * from contacts where phone like '%3171%';
select * from contacts where phone is null and email like '%gmail%';
select * from gift where type like '%��ǰ';
select * from gift where name like '%��Ʈ' and price < 300000;

-- �Լ�

-- ���� �Լ�
SELECT LOWER('JENNIE') FROM DUAL; -- ��=>�ҹ���
SELECT UPPER('jennie') FROM DUAL; -- ��=>�빮��

select LTRIM('         jennie') from dual; -- ���� ���� ����
select LTRIM('����ũ','��') from dual; -- Ư�� ���ڸ� ���ʿ��� ���� �����ϰ� ������

select RTRIM('jennie         ') from dual; -- ������ ���� ����
select RTRIM('����ũ','��ũ') from dual; -- Ư�� ���ڸ� �����ʿ��� ���� �����ϰ� ������

select TRIM('         jennie        ') from dual; -- ���� ���� ����
select TRIM(leading '��' from '����ũ') from dual; -- ���ʿ��� ���� '��' ����
select TRIM(trailing 'ũ' from '����ũ') from dual; -- ���ʿ��� ���� 'ũ' ����
select TRIM(both '��' from '����ũ��') from dual; -- ���� '��' ����

select SUBSTR ('����ũ����', 3, 2) from dual; -- 3��° ���ں��� 2�� ���
select SUBSTR ('����ũ����', 3, 4) from dual; -- 3��° ���ں��� 4�� ���

select LENGTH ('jennie') from dual;

select LENGTH (name) from emp; -- select������ �÷���ۿ� ���� ����

select REPLACE ('����ũ����', '����', '����') from dual; -- ���� �� ���ڿ��� ã�� ��������
-- ���� �� ���ڿ��� ��������� ������ ���ڿ����� ���� �� ���ڿ� ������
select REPLACE ('����ũ����', '����') from dual;

-- �����Լ�

select abs(-1) from dual;
select sign(-5) from dual; -- ��ȣ

-- ������ �Ҽ� �ڸ��� ���� �ݿø� ��ȯ. �ڸ��� ������ ppt ����
select round(163.76, 1) from dual; -- �Ҽ��� ���ڸ�����
select round(163.76, -2) from dual; -- 100�� �ڸ����� �ݿø��ϱ⶧���� 200�� ����

-- ������ �Ҽ� �ڸ��� ���� �����ؼ� ��ȯ
select trunc(54.29, 1) from dual;
select trunc(54.29 -2) from dual;

select ceil(72.86) from dual; -- �Ҽ��� ������ ���� �ø�
select floor(22.3) from dual; -- �Ҽ��� ������ ���� ����

select mod(15,7) from dual; -- ������ ��ȯ
select mod(15,-4) from dual; -- ������ ��ȯ

-- ��¥�Լ�

-- ��¥ �����Ϳ��� Ư�� �������� ����ؼ� ��ȯ
select extract(year from sysdate) as year, 
       extract(month from sysdate) as month,
       extract(day from sysdate) as day
       from dual;
       
-- ��¥ �����Ϳ��� Ư�� �������� ���� ��¥�� ��ȯ
SELECT add_months(to_date('2021-12-31', 'YYYY-MM-DD'), -1) as pre from dual;
SELECT add_months(to_date('2021-12-31', 'YYYY-MM-DD'), 4) as pre from dual;

-- �߿�

-- ����� ����ȯ: ��ȯ �Լ��� ����Ͽ� ������ ���� ��ȯ�� ��������� ��Ÿ��
-- �Ͻ��� ����ȯ: �����ͺ��̽��� ���������� �˾Ƽ� ������ ������ ��ȯ��

-- ����� ��ȯ �Լ�
select to_number('1234') from dual; -- ���ڸ� ���ڷ� �ٲ���
select to_number('ABC') from dual; -- ����. ABC�� ��� ���ڷ� �ٲ� �� ���⶧����..~

select to_char(1234) from dual;
select to_char(sysdate, 'YYYYMMDD HH24MISS') from dual; -- ��¥ => ���� ���� ������ ����

select to_date('20210602', 'YYYYMMDD') from dual; -- ���� => ��¥

-- NULL ���� �Լ�
select * from customer;
select name, nvl (address, '�ּҾ���') as address from customer; -- ����� �ּ� null�̶� �ּҾ��� ���
select name, nullif (address, '��õ') as address from customer; -- �ּҿ� �ִ� ���� ��õ�̸� null �ƴϸ� �״��

-- DECODE �Լ�

-- id�� 1�̸� ��� 2�� ����...
select id, decode(id, 1, 'blue', 2, 'red', 3, 'yellow', 4, 'black', 5, 'white') from customer;

-- ������ decode�� ���� ���
select id, case 
        when id = 1 then 'blue'
        when id = 2 then 'red'
        when id = 3 then 'yellow' 
        when id = 4 then 'black' 
        else 'white'
    end as test
from customer; 

-- �Լ� ���� 2 1 2 

select name, case
        when name = '�Ѹ�' then 'blue'
        when name = '��ġ' then 'red'
        else 'white'
    end as test
from customer;
        