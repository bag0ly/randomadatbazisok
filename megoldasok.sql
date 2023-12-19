--1.feladat
CREATE DATABASE pizza
DEFAULT CHARACTER SET utf8
COLLATE latin2_hungarian_ci;
--2.feladat
SELECT
    DATE(r.idopont) AS nap,
    SUM(t.db) AS hawaii_pizzak_szama
FROM rendeles r
JOIN tetel t ON r.razon = t.razon
JOIN pizza p ON t.pazon = p.pazon
WHERE p.pnev = 'Hawaii'
GROUP BY DATE(r.idopont)
ORDER BY hawaii_pizzak_szama DESC
LIMIT 1;
--3.feladat
SELECT DATE(r.idopont) AS nap, SUM(t.db) AS osszes_pizza
FROM rendeles r
JOIN tetel t ON r.razon = t.razon
GROUP BY nap
ORDER BY osszes_pizza DESC
LIMIT 1;
--4.feladat
SELECT DATE(r.idopont) AS nap, SUM(p.par) AS koltseg
FROM rendeles r
JOIN pizza p ON r.razon = p.pazon
GROUP BY nap
ORDER BY koltseg DESC
LIMIT 1;
--5.feladat
SELECT v.vnev AS vevo_neve, p.pnev AS legtobb_pizza
FROM vevo v
JOIN rendeles r ON v.vazon = r.vazon
JOIN tetel t ON r.razon = t.razon
JOIN pizza p ON t.pazon = p.pazon
WHERE v.vnev = 'Szundi'
GROUP BY v.vnev, p.pnev
ORDER BY COUNT(*) DESC
LIMIT 1;
--6.feladat 
SELECT MIN(DATE(r.idopont)) as legregebb, v.vnev 
FROM rendeles r
JOIN vevo v ON r.razon=v.vazon
ORDER BY 2 DESC

