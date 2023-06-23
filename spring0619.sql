select *from board;

rollback;

TRUNCATE table board;

commit;

-- num ÄÃ·³¿¡¼­ °¡Àå Å« °ªÀ» ±¸ÇÏ´Â Äõ¸®¹®
select nvl(max(num), 0 ) from board;

INSERT into board values(1, 'Äá', '1111', 's@ni.com', 'Á¦¸ñ', '³»¿ë', '1111', 10, sysdate);

-- ÀüÃ¼ °Ô½Ã¹°ÀÇ °¹¼ö Ãâ·Â
select nvl(count(*), 0) from board where content like '%°©´Ï´Ù%';

select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created from board where name like '%Ãá½Ä%' order by num desc;

select rownum rnum, data.* from (
select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created 
from board 
where name like '%Ãá½Ä%' 
order by num desc
) data;

select * from (
select rownum rnum, data.* from (
    select num, name, subject, hitCount, to_Char(created, 'YYYY-MM-DD') created 
    from board 
    where name like '%Ãá½Ä%' 
    order by num desc 
  ) data
)
where rnum >= 1 and rnum <= 5;

-- Á¶È¸¼ö ´Ã¸®±â
update board set hitCount = hitCount + 1 where num = 1;

-- Á¶È¸
select * from board where num = 1;

-- ¼öÁ¤
update board set name='Ãá½Ä', pwd='1234', email='cs1@naver.com', subject='Á¦¸ñ', content='³»¿ë' where num = 1;

-- »èÁ¦
delete board where num = 1;

select * from board;