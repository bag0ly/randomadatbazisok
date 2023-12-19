--0.feladat--------------------------------------
CREATE DATABASE Szeleromuvek
DEFAULT CHARACTER SET utf8
COLLATE utf8_hungarian_ci;
--1.feladat--------------------------------------
CREATE TABLE `szeleromuvek`.`regimegyenev` (
    `id` INT NOT NULL , 
    `megyeid` INT NOT NULL , 
    `regimegyenev` VARCHAR(30) NOT NULL , 
    `ujmegyenev` VARCHAR(30) NOT NULL 
) ENGINE = InnoDB;

CREATE TRIGGER `onupdate` AFTER UPDATE ON `megye`
 FOR EACH ROW BEGIN
    IF OLD.nev != NEW.nev THEN
        INSERT INTO regimegyenev(megyeid, regimegyenev, ujmegyenev) VALUES (OLD.id, OLD.nev, NEW.nev);
    END IF;
END
--2.feladat--------------------------------------
CREATE TABLE `szeleromuvek`.`valtozas` (
    `id` INT NOT NULL , 
    `toronyid` INT NOT NULL , 
    `regidb` INT NOT NULL , 
    `ujdb` INT NOT NULL 
) ENGINE = InnoDB;

CREATE TRIGGER `onchange` AFTER UPDATE ON `torony`
 FOR EACH ROW BEGIN
    IF OLD.darab != NEW.darab THEN
        INSERT INTO valtozas(toronyid,regidb,ujdb) VALUES (OLD.id, OLD.darab, NEW.darab);
    END IF;
END
--3.feladat--------------------------------------
CREATE TRIGGER `ondelete` BEFORE DELETE ON `megye`
 FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Access denied';
END
--4.feladat--------------------------------------
CREATE TRIGGER `afterdelete` AFTER DELETE ON `torony`
 FOR EACH ROW BEGIN
    DECLARE torony_count INT;
    SELECT COUNT(*) INTO torony_count
    FROM torony
    WHERE helyszinid = OLD.helyszinid;

    IF torony_count = 0 THEN
        DELETE FROM helyszin WHERE helyszinid = OLD.helyszinid;
    END IF;
END