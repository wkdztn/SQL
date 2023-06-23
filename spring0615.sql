drop table dept;

create table dept(
deptno varchar2(100) primary key,
dept varchar2(100),
loc varchar2(100)
);

insert into dept values('101', '개발부', '인천');
insert into dept values('102', '홍보부', '서울');
insert into dept values('103', '연구부', '부산');

commit;

select * from dept;

drop table student;

create table student (
name varchar2(50),
age number,
java varchar2(20),
oracle varchar2(20)
);

insert into student values('이유나', 20, 'A+', 'C');
insert into student values('김현우', 23, 'B+', 'A');
insert into student values('이지원', 21, 'F', 'A+');

select name, age, java,oracle from student;
select * from student;

commit;