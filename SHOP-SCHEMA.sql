-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shop_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop_db` DEFAULT CHARACTER SET utf8 ;
USE `shop_db` ;

-- -----------------------------------------------------
-- Table `shop_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_placed` DATETIME NOT NULL,
  `placed_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_placed_by_idx` (`placed_by` ASC) VISIBLE,
  CONSTRAINT `fk_order_placed_by`
    FOREIGN KEY (`placed_by`)
    REFERENCES `shop_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop_db`.`order_line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop_db`.`order_line` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `prod_id` INT NOT NULL,
  `price` FLOAT(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_part_of_order_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_purchased_idx` (`prod_id` ASC) VISIBLE,
  CONSTRAINT `fk_part_of_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `shop_db`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_purchased`
    FOREIGN KEY (`prod_id`)
    REFERENCES `shop_db`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
