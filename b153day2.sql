-----------DAY'2----------
---------tekrar----------
CREATE TABLE sairler(
id int,
name varchar(50),
email varchar(50)
);
INSERT INTO sairler VALUES(1001,'Cemal Sureya','sair@gmail.com');
INSERT INTO sairler VALUES(1002,'Rasim Özdenören','sair@gmail.com');
INSERT INTO sairler VALUES(1001,'','sair@gmail.com');
INSERT INTO sairler(name,email) VALUES('Cemal Sureya','');

SELECT * FROM sairler;
