CREATE TABLE regist (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(20),
    grade VARCHAR2(20),
    phone VARCHAR2(40)
);

CREATE SEQUENCE seq_id
    INCREMENT BY 1
    START WITH 101
    MAXVALUE 9999
    MINVALUE 1
    NOCYCLE
    NOCACHE
    NOORDER;

INSERT INTO regist VALUES (seq_id.nextval, '±èÁö¿ì', '¼­¿ï½Ã', 'silver', '010-1111-1111');
INSERT INTO regist VALUES (seq_id.nextval, 'È«±æµ¿', 'ÀÎÃµ½Ã', 'gold', '010-2222-2222');
INSERT INTO regist VALUES (seq_id.nextval, 'À²°î', '±èÆ÷½Ã', 'vip', '010-3333-3333');

select * from regist;

commit;