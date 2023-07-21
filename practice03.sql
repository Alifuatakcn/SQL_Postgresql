SELECT * FROM musteri;
DROP TABLE musteri;

CREATE TABLE toptancilar
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203,'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

CREATE TABLE malzemeler --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT FK FOREIGN KEY (ted_vergino) REFERENCES toptancilar (vergi_no) on delete cascade
);

INSERT INTO malzemeler VALUES (201, 1001, 'Laptop', 'Asli Can');
INSERT INTO malzemeler VALUES (202, 1002, 'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES (202, 1003, 'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES (202, 1004, 'Laptop', 'Veli Tan');

SELECT * FROM malzemeler
SELECT * FROM toptancilar

SORU: Malzemeler tablosundaki musteri_isim'i Asli Can olan malzeme_isim'ini, --toptancılar
tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.

UPDATE malzemeler SET malzeme_isim=(SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi='Adem Coş')
WHERE musteri_isim='Asli Can'

SORU: malzeme_ismi Laptop olan musteri_isim'ini, sirket_ismi Apple'in irtibat_isim'i ile güncelleyiniz.

UPDATE malzemeler SET musteri_isim=(SELECT irtibat_ismi FROM toptancilar WHERE sirket_ismi='Apple')
WHERE malzeme_isim='Laptop' 

create table arac (
id int,
marka varchar (30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
)

insert into arac values (100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values (101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values (102, 'Honda', 'Civic', 400000, 15000, 'Manuel' );
insert into arac values (103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values (104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values (105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values (106, 'Bugatti', 'Veyron', 950008, 5000, 'Otomatik' );

--SORU1: arac tablosundaki en yüksek fiyat'ı listele

SELECT *
FROM arac
WHERE fiyat=(SELECT MAX(fiyat)
FROM arac);

--Soru 2:arac tablosundaki araçları toplam fiyatını bulunuz
SELECT SUM(fiyat) FROM arac

--Soru 3:arac tablosundaki fiyat ortalamalarını bulunuz

SELECT AVG(fiyat) FROM arac;


SELECT ROUND(AVG(fiyat),2) FROM arac;

--Soru 4:arac tablosunda kaç tane araç olduğunu bulunuz
SELECT COUNT(marka) FROM arac;


CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisin VARCHAR(50),
meslek CHAR(9),
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008');
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');








