drop table product;
drop SEQUENCE product_seq;

CREATE TABLE product (
    p_id NUMBER PRIMARY KEY,
    p_category VARCHAR2(255) NOT NULL,
    p_name VARCHAR2(255) NOT NULL,
    p_color VARCHAR2(255) NOT NULL,
    p_size VARCHAR2(255) DEFAULT 'F' NOT NULL,
    p_price NUMBER NOT NULL,
    p_stock NUMBER NOT NULL,
    p_img VARCHAR2(255)
);
CREATE SEQUENCE product_seq 
       increment by 1
       start with 1001
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;

insert into product values (product_seq.nextval, 'OUTER', '�ٶ�����', 'Lilac', default, 169000, 30, '/img/a.jpg');
insert into product values (product_seq.nextval, 'OUTER', '�ٽ�Ƽ ����', 'Orange', default, 327000, 20, '/img/b.jpg');
insert into product values (product_seq.nextval, 'TOP', '���� ���� ������', 'Pink', default, 94000, 40, '/img/c.jpg');
insert into product values (product_seq.nextval, 'TOP', '�ĵ�Ƽ', 'Gray', default, 97000, 20, '/img/d.jpg');
insert into product values (product_seq.nextval, 'TOP', '����', 'White', default, 55000, 20, '/img/e.jpg');
insert into product values (product_seq.nextval, 'BOTTOM', '���Ϸ� ����', 'Blue', default, 169000, 30, '/img/f.jpg');
insert into product values (product_seq.nextval, 'BOTTOM', '���� ����', 'Light Blue', default, 149000, 20, '/img/g.jpg');
insert into product values (product_seq.nextval, 'ACC', '����', 'Khaki', default, 55000, 40, '/img/h.jpg');
insert into product values (product_seq.nextval, 'ACC', 'Ű��', 'Black', default, 45000, 20, '/img/i.jpg');
insert into product values (product_seq.nextval, 'ACC', 'ī������', 'Orange', default, 45000, 10, '/img/j.jpg');

commit;
select p_id, p_category, p_name, p_color, p_size, p_price, p_stock, p_img from product where p_id = 1001;
select * from product;

