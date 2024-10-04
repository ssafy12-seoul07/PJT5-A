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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema pjt_05
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


-- -----------------------------------------------------
-- Table `mydb`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`video` (
  `video_id` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `part` VARCHAR(45) NULL,
  `channel_name` VARCHAR(45) NOT NULL,
  `url` TEXT NOT NULL,
  `thumbnail` TEXT NULL,
  `views` INT NOT NULL DEFAULT 0,
  `status` INT NULL DEFAULT 1,
  PRIMARY KEY (`video_id`),
  UNIQUE INDEX `video_id_UNIQUE` (`video_id` ASC) 
)ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `video_id` VARCHAR(255) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `content` TEXT NOT NULL,
  `parent` INT ZEROFILL NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `modified_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
  `user_user_id` INT NOT NULL,
  `video_video_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`review_id`, `user_user_id`, `video_video_id`),
  UNIQUE INDEX `review_id_UNIQUE` (`review_id` ASC) ,
  INDEX `fk_review_user_idx` (`user_user_id` ASC) ,
  INDEX `fk_review_video1_idx` (`video_video_id` ASC) ,
  CONSTRAINT `fk_review_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `mydb`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`favorite` (
  `user_id` INT NOT NULL,
  `video_id` VARCHAR(45) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `user_user_id` INT NOT NULL,
  `video_video_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `video_id`, `user_user_id`, `video_video_id`),
  INDEX `fk_favorite_user1_idx` (`user_user_id` ASC) ,
  INDEX `fk_favorite_video1_idx` (`video_video_id` ASC) ,
  CONSTRAINT `fk_favorite_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `mydb`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
