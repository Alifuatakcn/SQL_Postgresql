--------------DAY'6---------------------
--28-GROUP BY clause:sonuçları bir veya daha fazla sütuna göre gruplamak için kullanılır.

CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;

--Manav tablosundaki tüm isimleri her bir isim için toplam ürün miktarını görüntüleyiniz.

SELECT isim,SUM(urun_miktar)  FROM manav GROUP BY isim ORDER BY SUM(urun_miktar)  DESC;

--Manav tablosundaki tüm isimleri her bir isim için toplam ürün miktarını görüntüleyiniz.
--toplam ürün miktarına göre azalan sıralayın.

SELECT isim,SUM(urun_miktar) toplam_urun_mik
FROM manav
GROUP BY isim
ORDER BY SUM(urun_miktar) DESC;

--Her bir ismin aldığı her bir ürünün toplam miktarını isme göre sıralı görüntüleyiniz.

SELECT isim,urun_adi, SUM(urun_miktar)
FROM manav
GROUP BY isim,urun_adi
ORDER BY isim;

--!!! NOT: Group By komutu kullanıldığında Selectten sonra sadece Group By daki field
-- yada aggregate fonk. kullanılabilir

SELECT isim,urun_adi
FROM manav
GROUP BY isim,urun_adi
ORDER BY isim;

SELECT isim,SUM(urun_miktar)
FROM manav
GROUP BY isim
ORDER BY isim;

--ürün ismine göre her bir ürünü alan toplam kişi sayısı gösteriniz.


SELECT urun_adi, COUNT(DISTINCT isim) kisi_sayisi
FROM manav
GROUP BY urun_adi

--Isme göre alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz

SELECT isim ,SUM(urun_miktar) toplam_urun_miktari,COUNT(DISTINCT urun_adi) cesit_sayisi FROM manav 
GROUP BY isim;

--Alinan ürün miktarina gore musteri sayisinı görüntüleyiniz.
--musteri sayisina göre artan sıralayınız.

SELECT urun_miktar, COUNT(DISTINCT isim) musteri_sayisi
FROM manav
GROUP BY urun_miktar
ORDER BY COUNT(DISTINCT isim);