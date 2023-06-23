DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE BOARD_SEQ;

CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    TITLE VARCHAR2(255) NOT NULL,
    CONTENT CLOB NOT NULL,
    REG_DATE DATE NOT NULL,
    VIEWS NUMBER NOT NULL,
    IMG VARCHAR2(255)
);

CREATE SEQUENCE BOARD_SEQ 
       increment by 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       
insert into board values(board_seq.nextval, 'user1', '월급날', '어쩌고 쩌저고', sysdate, 0, '/img/루피1.jpg');
insert into board values(board_seq.nextval, 'user1', '버그 없이 한번에 될때 내표정', '어쩌고 쩌저고', sysdate, 0, '/img/루피2.jpg');
insert into board values(board_seq.nextval, 'user2', '주말까지...', '어쩌고 쩌저고', sysdate, 0, '/img/루피3.jpg');

-- date타입 문자로 바꿔줌
SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views from board;

SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views, content, img FROM board WHERE board_no = 1;

-- UPDATE board set views = (views+1) WHERE board_no = 1;

commit;

INSERT INTO board(board_no, user_id, title, content, reg_date, views, img) VALUES (board_seq.nextval, 'user3', '테스트', '내용입니다', sysdate, 0, 'img/test.jpg');

UPDATE board set title = 'd', user_id = 'd', content = 'd', img = 'd' where board_no = 1;

select * from board;

ROLLBACK;
