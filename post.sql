drop table post;

create table manager (
mgr_id varchar2(50) primary key,
mgr_pwd varchar2(50) not null
);

create table post (
num number primary key,
category varchar2(50),
tit varchar2(100),
summary varchar2(100),
content clob,
img varchar2(50),
reg_date date,
views number
);

select * from manager;

select * from post;

-- num �÷����� ���� ū �� ���ϱ�
select nvl(max(num), 0 ) from post;

insert into post values (1, '����', '���ø���', '���� ���', '�ƾƾƾƾƾƾƾƾƾ� �ƾƾƾƾƾƾ�', 'img1', sysdate, 0);

insert into manager values ('mgr', '1234');

rollback;

select tit, summary, img from post where num = '1' order by views desc;


select * from manager where mgr_id = 'mgr' and mgr_pwd = '1234';