A feladatok megoldására elkészített SQL parancsokat illeszd be a feladat sorszáma után!

1. feladat:
CREATE DATABASE mvk
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci

3. feladat:
SELECT `viszonylatok`.`irveg`, `viszonylatok`.`kulsoveg`, `viszonylatok`.`fordtav`
FROM `viszonylatok`
WHERE viszonylatok.viszonylatjelzes LIKE 53

4. feladat:
DELETE FROM `viszonylatadatok` WHERE `viszonylatazon` LIKE 430
DELETE FROM `viszonylatok` WHERE `viszonylatjelzes` LIKE 430

5. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`, `viszonylatok`.`kulsoveg`
FROM `viszonylatok`
WHERE viszonylatok.irveg LIKE "Búza tér"
ORDER BY 1 DESC;


6. feladat:
SELECT `viszonylatadatok`.`viszonylatazon`, `viszonylatok`.`kulsoveg`
FROM `viszonylatadatok` 
	INNER JOIN `viszonylatok` ON `viszonylatadatok`.`viszonylatazon` = `viszonylatok`.`viszonylatjelzes`
    WHERE viszonylatadatok.jszamnyar LIKE 0
    ORDER BY 1 DESC;


7. feladat:
SELECT COUNT(`viszonylatok`.`irveg`) AS "Búza tér"
FROM `viszonylatok`
WHERE viszonylatok.irveg LIKE "Búza tér";


8. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`,`viszonylatok`.`irveg`,`viszonylatok`.`kulsoveg`,`viszonylatok`.`fordtav` 
FROM `viszonylatok` 
ORDER BY 4 DESC
LIMIT 1;


9. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`,
`viszonylatok`.`fordtav` AS hosszú  
FROM `viszonylatok` 
WHERE `viszonylatok`.`fordtav`>=20;


10. feladat:
SELECT SUM(`utasszamok`.`utasszam`) AS összesutasszám FROM `utasszamok`;


11. feladat:
SELECT `viszonylatadatok`.`viszonylatazon`, 
SUM(`viszonylatok`.`fordtav`)*viszonylatadatok.jszamtel AS kocsikm_35
FROM `viszonylatadatok` 
	INNER JOIN `viszonylatok` ON `viszonylatadatok`.`viszonylatazon` = `viszonylatok`.`viszonylatjelzes`
    WHERE viszonylatadatok.viszonylatazon LIKE 35;

12. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`
FROM `viszonylatok` 
	INNER JOIN `utasszamok` ON `utasszamok`.`viszonylatazon` = `viszonylatok`.`viszonylatjelzes`
    WHERE viszonylatok.viszonylatjelzes>AVG( `utasszamok`.`utasszam`)
    ORDER BY 1 DESC;


13. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`, `viszonylatok`.`irveg`, `viszonylatok`.`kulsoveg`, 
(`viszonylatadatok`.`utolsojarat`-`viszonylatadatok`.`elsojarat`) AS üzemidő
FROM `viszonylatok` 
	INNER JOIN `viszonylatadatok` ON `viszonylatadatok`.`viszonylatazon` = `viszonylatok`.`viszonylatjelzes`
    ORDER BY üzemidő DESC
    LIMIT 1;


14. feladat:
SELECT `viszonylatok`.`viszonylatjelzes`,
(`viszonylatadatok`.`jszamnyar`-`viszonylatadatok`.`jszamtel`) AS telnyarkulonbseg
FROM `viszonylatadatok` 
	INNER JOIN `viszonylatok` ON `viszonylatadatok`.`viszonylatazon` = `viszonylatok`.`viszonylatjelzes`
    WHERE 
    (`viszonylatadatok`.`jszamnyar`-`viszonylatadatok`.`jszamtel`) > 0;

15. feladat:
SELECT `viszonylatadatok`.`viszonylatazon`, 
`utasszamok`.`utasszam`/ 
(`viszonylatadatok`.`jszamtel`+`viszonylatadatok`.`jszamnyar`) AS fkhm
FROM `viszonylatadatok`, `utasszamok`
	WHERE viszonylatadatok.viszonylatazon=utasszamok.viszonylatazon
    ORDER BY fkhm DESC;








