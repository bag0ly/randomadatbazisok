--1.feladat
SELECT bank.vezeteknev,bank.keresztnev
FROM bank WHERE
bank.egyenleg<(SELECT AVG(bank.egyenleg) FROM bank);
--2.feladat
SELECT bank.vezeteknev,bank.keresztnev
FROM bank 
WHERE bank.egyenleg>(SELECT MAX(bank.egyenleg) 
FROM bank 
WHERE bank.varos LIKE "Veszprém");
--3.feladat
SELECT bank.vezeteknev,bank.keresztnev
FROM bank 
WHERE NOT EXISTS(SELECT auto.utalo_fel_szamlaszama 
FROM auto 
WHERE bank.szamlaszam=auto.utalo_fel_szamlaszama);
--4.feladat
SELECT * FROM `bank`
WHERE bank.szamlaszam  IN(SELECT auto.utalo_fel_szamlaszama
FROM auto 
WHERE auto.ajtok_szama NOT LIKE 2);
--5.feladat
--Listázza ki a Zoltá a nevű emberek az autó adatait.
SELECT * FROM `auto`
WHERE auto.utalo_fel_szamlaszama  IN(SELECT bank.szamlaszam
FROM bank
WHERE bank.keresztnev LIKE "%Z%");