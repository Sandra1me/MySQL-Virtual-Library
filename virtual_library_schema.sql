-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema virtual_library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema virtual_library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `virtual_library` DEFAULT CHARACTER SET utf8 ;
USE `virtual_library` ;

-- -----------------------------------------------------
-- Table `virtual_library`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_library`.`users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NULL,
  `regist_date` DATE NOT NULL DEFAULT (CURRENT_DATE()),
  PRIMARY KEY (`id_users`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `virtual_library`.`writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_library`.`writer` (
  `idwriter` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idwriter`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `virtual_library`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_library`.`books` (
  `idbooks` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `isbn` VARCHAR(20) NOT NULL,
  `public_year` YEAR NULL,
  `amount` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idbooks`),
  UNIQUE INDEX `isbn_UNIQUE` (`isbn` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `virtual_library`.`book_writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_library`.`book_writer` (
  `book_id` INT NOT NULL,
  `writer_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `writer_id`),
  INDEX `writer_id_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `virtual_library`.`books` (`idbooks`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_writer_id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `virtual_library`.`writer` (`idwriter`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `virtual_library`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_library`.`bookings` (
  `id_bookings` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `booking_date` DATE NOT NULL DEFAULT (CURRENT_DATE()),
  `expect_return_date` DATE NOT NULL,
  `real_return_date` DATE NULL DEFAULT NULL,
  `state` ENUM('B', 'R') NOT NULL DEFAULT 'B',
  PRIMARY KEY (`id_bookings`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `book_id_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `virtual_library`.`users` (`id_users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_book_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `virtual_library`.`books` (`idbooks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
