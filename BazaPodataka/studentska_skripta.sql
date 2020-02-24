-- MySQL Workbench Forward Engineering
#drop schema studentska_skripta;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema studentska_skripta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema studentska_skripta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `studentska_skripta` DEFAULT CHARACTER SET utf8 ;
USE `studentska_skripta` ;

-- -----------------------------------------------------
-- Table `studentska_skripta`.`mjesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`mjesto` (
  `idmjesto` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(255) NULL DEFAULT NULL,
  `postanski_broj` VARCHAR(255) NULL DEFAULT NULL,
  `drzava` VARCHAR(255) NULL DEFAULT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idmjesto`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`fakultet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`fakultet` (
  `idfakultet` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(255) NULL DEFAULT NULL,
  `telefon` VARCHAR(255) NULL DEFAULT NULL,
  `adresa` VARCHAR(255) NULL DEFAULT NULL,
  `mjesto_idmjesto` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idfakultet`),
  INDEX `fk_fakultet_mjesto1_idx` (`mjesto_idmjesto` ASC) VISIBLE,
  CONSTRAINT `fk_fakultet_mjesto1`
    FOREIGN KEY (`mjesto_idmjesto`)
    REFERENCES `studentska_skripta`.`mjesto` (`idmjesto`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`korisnicka_grupa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`korisnicka_grupa` (
  `idkorisnicka_grupa` INT(11) NOT NULL AUTO_INCREMENT,
  `kljuc` VARCHAR(255) NULL DEFAULT NULL,
  `ime` VARCHAR(255) NULL DEFAULT NULL,
  `aktivan` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idkorisnicka_grupa`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`sistemske_osobine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`sistemske_osobine` (
  `idsistemske_osobine` INT(11) NOT NULL AUTO_INCREMENT,
  `jezik` VARCHAR(255) NULL DEFAULT 'Srpski',
  `tema` VARCHAR(255) NULL DEFAULT 'Standard',
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idsistemske_osobine`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`studijski_program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`studijski_program` (
  `idstudijski_program` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(255) NULL DEFAULT NULL,
  `fakultet_idfakultet` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idstudijski_program`),
  INDEX `fk_studijski_program_fakultet1_idx` (`fakultet_idfakultet` ASC) VISIBLE,
  CONSTRAINT `fk_studijski_program_fakultet1`
    FOREIGN KEY (`fakultet_idfakultet`)
    REFERENCES `studentska_skripta`.`fakultet` (`idfakultet`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`korisnik` (
  `idkorisnik` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(255) NULL DEFAULT NULL,
  `prezime` VARCHAR(255) NULL DEFAULT NULL,
  `korisnicko_ime` VARCHAR(255) NULL DEFAULT NULL,
  `lozinka` VARCHAR(255) NULL DEFAULT NULL,
  `mjesto_idmjesto` INT(11) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `sistemske_osobine_idsistemske_osobine` INT(11) NOT NULL,
  `fakultet_idfakultet` INT(11) NOT NULL,
  `studijski_program_idstudijski_program` INT(11) NOT NULL,
  `aktivan` TINYINT(4) NULL DEFAULT NULL,
  `korisnicka_grupa_idkorisnicka_grupa` INT(11) NOT NULL,
  PRIMARY KEY (`idkorisnik`),
  INDEX `fk_korisnik_mjesto1_idx` (`mjesto_idmjesto` ASC) VISIBLE,
  INDEX `fk_korisnik_sistemske_osobine1_idx` (`sistemske_osobine_idsistemske_osobine` ASC) VISIBLE,
  INDEX `fk_korisnik_fakultet1_idx` (`fakultet_idfakultet` ASC) VISIBLE,
  INDEX `fk_korisnik_studijski_program1_idx` (`studijski_program_idstudijski_program` ASC) VISIBLE,
  INDEX `fk_korisnik_korisnicka_grupa1_idx` (`korisnicka_grupa_idkorisnicka_grupa` ASC) VISIBLE,
  CONSTRAINT `fk_korisnik_fakultet1`
    FOREIGN KEY (`fakultet_idfakultet`)
    REFERENCES `studentska_skripta`.`fakultet` (`idfakultet`),
  CONSTRAINT `fk_korisnik_korisnicka_grupa1`
    FOREIGN KEY (`korisnicka_grupa_idkorisnicka_grupa`)
    REFERENCES `studentska_skripta`.`korisnicka_grupa` (`idkorisnicka_grupa`),
  CONSTRAINT `fk_korisnik_mjesto1`
    FOREIGN KEY (`mjesto_idmjesto`)
    REFERENCES `studentska_skripta`.`mjesto` (`idmjesto`),
  CONSTRAINT `fk_korisnik_sistemske_osobine1`
    FOREIGN KEY (`sistemske_osobine_idsistemske_osobine`)
    REFERENCES `studentska_skripta`.`sistemske_osobine` (`idsistemske_osobine`),
  CONSTRAINT `fk_korisnik_studijski_program1`
    FOREIGN KEY (`studijski_program_idstudijski_program`)
    REFERENCES `studentska_skripta`.`studijski_program` (`idstudijski_program`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`predmet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`predmet` (
  `idpredmet` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(255) NULL DEFAULT NULL,
  `ects` INT(11) NULL DEFAULT NULL,
  `sifra_predmeta` VARCHAR(255) NULL DEFAULT NULL,
  `studijski_program_idstudijski_program` INT(11) NOT NULL,
  `fakultet_idfakultet` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idpredmet`),
  INDEX `fk_predmet_studijski_program1_idx` (`studijski_program_idstudijski_program` ASC) VISIBLE,
  INDEX `fk_predmet_fakultet1_idx` (`fakultet_idfakultet` ASC) VISIBLE,
  CONSTRAINT `fk_predmet_fakultet1`
    FOREIGN KEY (`fakultet_idfakultet`)
    REFERENCES `studentska_skripta`.`fakultet` (`idfakultet`),
  CONSTRAINT `fk_predmet_studijski_program1`
    FOREIGN KEY (`studijski_program_idstudijski_program`)
    REFERENCES `studentska_skripta`.`studijski_program` (`idstudijski_program`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`test` (
  `idtest` INT(11) NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(255) NULL DEFAULT NULL,
  `predmet_idpredmet` INT(11) NOT NULL,
  `broj_pitanja` INT(11) NULL DEFAULT NULL,
  `korisnik_idkorisnik` INT(11) NOT NULL,
  `fakultet_idfakultet` INT(11) NOT NULL,
  `studijski_program_idstudijski_program` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idtest`),
  INDEX `fk_test_predmet1_idx` (`predmet_idpredmet` ASC) VISIBLE,
  INDEX `fk_test_korisnik1_idx` (`korisnik_idkorisnik` ASC) VISIBLE,
  INDEX `fk_test_fakultet1_idx` (`fakultet_idfakultet` ASC) VISIBLE,
  INDEX `fk_test_studijski_program1_idx` (`studijski_program_idstudijski_program` ASC) VISIBLE,
  CONSTRAINT `fk_test_fakultet1`
    FOREIGN KEY (`fakultet_idfakultet`)
    REFERENCES `studentska_skripta`.`fakultet` (`idfakultet`),
  CONSTRAINT `fk_test_korisnik1`
    FOREIGN KEY (`korisnik_idkorisnik`)
    REFERENCES `studentska_skripta`.`korisnik` (`idkorisnik`),
  CONSTRAINT `fk_test_predmet1`
    FOREIGN KEY (`predmet_idpredmet`)
    REFERENCES `studentska_skripta`.`predmet` (`idpredmet`),
  CONSTRAINT `fk_test_studijski_program1`
    FOREIGN KEY (`studijski_program_idstudijski_program`)
    REFERENCES `studentska_skripta`.`studijski_program` (`idstudijski_program`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`pitanje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`pitanje` (
  `idpitanje` INT(11) NOT NULL AUTO_INCREMENT,
  `pitanje` VARCHAR(255) NULL DEFAULT NULL,
  `test_idtest` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idpitanje`),
  INDEX `fk_pitanje_test1_idx` (`test_idtest` ASC) VISIBLE,
  CONSTRAINT `fk_pitanje_test1`
    FOREIGN KEY (`test_idtest`)
    REFERENCES `studentska_skripta`.`test` (`idtest`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`odgovor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`odgovor` (
  `idodgovor` INT(11) NOT NULL AUTO_INCREMENT,
  `tekst_odgovora` VARCHAR(255) NULL DEFAULT NULL,
  `pitanje_idpitanje` INT(11) NOT NULL,
  `tacan_odgovor` TINYINT(4) NULL DEFAULT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idodgovor`),
  INDEX `fk_odgovor_pitanje1_idx` (`pitanje_idpitanje` ASC) VISIBLE,
  CONSTRAINT `fk_odgovor_pitanje1`
    FOREIGN KEY (`pitanje_idpitanje`)
    REFERENCES `studentska_skripta`.`pitanje` (`idpitanje`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `studentska_skripta`.`rezultat_testa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studentska_skripta`.`rezultat_testa` (
  `idrezultat_testa` INT(11) NOT NULL AUTO_INCREMENT,
  `student_korisnik_idkorisnik` INT(11) NOT NULL,
  `test_idtest` INT(11) NOT NULL,
  `predmet_idpredmet` INT(11) NOT NULL,
  `studijski_program_idstudijski_program` INT(11) NOT NULL,
  `fakultet_idfakultet` INT(11) NOT NULL,
  `polozio` TINYINT(4) NULL DEFAULT NULL,
  `korisnik_idkorisnik` INT(11) NOT NULL,
  `aktivan` TINYINT NULL,
  PRIMARY KEY (`idrezultat_testa`),
  INDEX `fk_rezultat_testa_test1_idx` (`test_idtest` ASC) VISIBLE,
  INDEX `fk_rezultat_testa_predmet1_idx` (`predmet_idpredmet` ASC) VISIBLE,
  INDEX `fk_rezultat_testa_studijski_program1_idx` (`studijski_program_idstudijski_program` ASC) VISIBLE,
  INDEX `fk_rezultat_testa_fakultet1_idx` (`fakultet_idfakultet` ASC) VISIBLE,
  INDEX `fk_rezultat_testa_korisnik1_idx` (`korisnik_idkorisnik` ASC) VISIBLE,
  CONSTRAINT `fk_rezultat_testa_fakultet1`
    FOREIGN KEY (`fakultet_idfakultet`)
    REFERENCES `studentska_skripta`.`fakultet` (`idfakultet`),
  CONSTRAINT `fk_rezultat_testa_korisnik1`
    FOREIGN KEY (`korisnik_idkorisnik`)
    REFERENCES `studentska_skripta`.`korisnik` (`idkorisnik`),
  CONSTRAINT `fk_rezultat_testa_predmet1`
    FOREIGN KEY (`predmet_idpredmet`)
    REFERENCES `studentska_skripta`.`predmet` (`idpredmet`),
  CONSTRAINT `fk_rezultat_testa_studijski_program1`
    FOREIGN KEY (`studijski_program_idstudijski_program`)
    REFERENCES `studentska_skripta`.`studijski_program` (`idstudijski_program`),
  CONSTRAINT `fk_rezultat_testa_test1`
    FOREIGN KEY (`test_idtest`)
    REFERENCES `studentska_skripta`.`test` (`idtest`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
