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
       
insert into board values(board_seq.nextval, 'user1', '���޳�', '��¼�� ¼����', sysdate, 0, '/img/����1.jpg');
insert into board values(board_seq.nextval, 'user1', '���� ���� �ѹ��� �ɶ� ��ǥ��', '��¼�� ¼����', sysdate, 0, '/img/����2.jpg');
insert into board values(board_seq.nextval, 'user2', '�ָ�����...', '��¼�� ¼����', sysdate, 0, '/img/����3.jpg');

-- dateŸ�� ���ڷ� �ٲ���
SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views from board;

SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views, content, img FROM board WHERE board_no = 1;

-- UPDATE board set views = (views+1) WHERE board_no = 1;

commit;

INSERT INTO board(board_no, user_id, title, content, reg_date, views, img) VALUES (board_seq.nextval, 'user3', '�׽�Ʈ', '�����Դϴ�', sysdate, 0, 'img/test.jpg');

UPDATE board set title = 'd', user_id = 'd', content = 'd', img = 'd' where board_no = 1;

select * from board;

ROLLBACK;
