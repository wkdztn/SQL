select *from board;

rollback;

TRUNCATE table board;

commit;

-- num �÷����� ���� ū ���� ���ϴ� ������
select nvl(max(num), 0 ) from board;

INSERT into board values(1, '��', '1111', 's@ni.com', '����', '����', '1111', 10, sysdate);

-- ��ü �Խù��� ���� ���
select nvl(count(*), 0) from board where content like '%���ϴ�%';

select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created from board where name like '%���%' order by num desc;

select rownum rnum, data.* from (
select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created 
from board 
where name like '%���%' 
order by num desc
) data;

select * from (
select rownum rnum, data.* from (
    select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created 
    from board 
    where name like '%���%' 
    order by num desc 
  ) data
)
where rnum >= 1 and rnum <= 5;

-- ��ȸ�� �ø���
update board set hitCount = hitCount + 1 where num = 1;

-- ��ȸ
select * from board where num = 1;

-- ����
update board set name='���', pwd='1234', email='cs1@naver.com', subject='����', content='����' where num = 1;

-- ����
delete board where num = 1;

select * from board;