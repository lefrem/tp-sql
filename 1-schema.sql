DROP DATABASE tpsql;
CREATE DATABASE tpsql;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `tpsql` ;

-- -----------------------------------------------------
-- Table `tpsql`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpsql`.`year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tpsql`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpsql`.`module` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `year_idx` (`year` ASC))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `tpsql`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpsql`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tpsql`.`enrolment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpsql`.`enrolment` (
  `id_student` INT NOT NULL,
  `id_year` INT NOT NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NULL,
  INDEX `id_student_idx` (`id_student` ASC),
  INDEX `id_year_idx` (`id_year` ASC),
  PRIMARY KEY (`id_student`, `id_year`),
  CONSTRAINT `fk_id_student`
    FOREIGN KEY (`id_student`)
    REFERENCES `tpsql`.`student` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `id_year`
    FOREIGN KEY (`id_year`)
    REFERENCES `tpsql`.`year` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tpsql`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tpsql`.`assessment` (
  `id_student` INT NOT NULL,
  `id_module` INT NOT NULL,
  `attempted` DATETIME NOT NULL,
  `passed` DATETIME NULL,
  `grade` INT NULL,  
  INDEX `id_student_idx` (`id_student` ASC),
  INDEX `id_module_idx` (`id_module` ASC),
  PRIMARY KEY (`attempted`, `id_module`, `id_student`),
  CONSTRAINT `fk_id_student_assessment`
    FOREIGN KEY (`id_student`)
    REFERENCES `tpsql`.`student` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_id_module_assessment`
    FOREIGN KEY (`id_module`)
    REFERENCES `tpsql`.`module` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
  )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





ALTER TABLE `module` ADD FOREIGN KEY (`year`) REFERENCES `year`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
























