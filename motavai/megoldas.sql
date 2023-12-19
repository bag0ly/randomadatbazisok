--1.feladat
    CREATE DATABASE tavak
    DEFAULT CHARACTER SET utf8
    COLLATE utf8_hungarian_ci;

    CREATE TABLE 
    IF NOT EXISTS `tavak`.`telepulesgps` 
    (`id` int(4), `nev` varchar(20), `hosszusag` 
    varchar(7), `szelesseg` varchar(7)) 
    DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;
    ALTER TABLE `telepulesgps` CHANGE `hosszusag` `hosszusag` 
    FLOAT(7) NULL DEFAULT NULL, CHANGE `szelesseg` `szelesseg` 
    FLOAT(7) NULL DEFAULT NULL;


    CREATE TABLE 
    IF NOT EXISTS `tavak`.`helykapcs` 
    (`allovizid` int(3), `gpsid` int(4)) 
    DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;    
    ALTER TABLE `helykapcs` ADD PRIMARY KEY(`allovizid`, `gpsid`);


    CREATE TABLE 
    IF NOT EXISTS `tavak`.`alloviz` 
    (`id` int(3), `nev` varchar(89), `tipus` varchar(11), 
    `terulet` varchar(6), `vizgyujto` varchar(5)) 
    DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;;
    ALTER TABLE `alloviz` ADD PRIMARY KEY(`id`);
    ALTER TABLE `alloviz` CHANGE `terulet` `terulet` 
    FLOAT(6) NULL DEFAULT NULL;
--2.feladat
    SELECT `alloviz`.`nev`, `alloviz`.`terulet`
    FROM `alloviz` WHERE alloviz.tipus LIKE "%morotva%"
    ORDER BY 2 DESC;
--3.feladat
    SELECT 93036/ SUM(`alloviz`.`terulet`) AS "3vizarany"
    FROM `alloviz`;
--4.feladat
    SELECT `alloviz`.`nev`,`alloviz`.`tipus`,`alloviz`.`terulet`
    FROM `alloviz` 
    WHERE alloviz.terulet>=3 AND alloviz.terulet<=10 
    AND (alloviz.terulet*10)<=alloviz.vizgyujto;
--5.feladat
    SELECT `alloviz`.`nev`, `telepulesgps`.`id`
    FROM `telepulesgps`
        INNER JOIN helykapcs ON helykapcs.gpsid=telepulesgps.id
        INNER JOIN alloviz ON helykapcs.allovizid = alloviz.id
    GROUP BY alloviz.nev
    HAVING (COUNT(telepulesgps.id)>=3);
--6.feladat
    SELECT alloviz.nev
    FROM telepulesgps
        INNER JOIN helykapcs ON helykapcs.gpsid = telepulesgps.id
        INNER JOIN alloviz ON helykapcs.allovizid=alloviz.id
    GROUP BY 1
    ORDER BY (MAX(telepulesgps.hosszusag)-MIN(telepulesgps.szelesseg)) DESC
    LIMIT 1 ;