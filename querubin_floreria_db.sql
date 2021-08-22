-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema querubin_floreria_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema querubin_floreria_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `querubin_floreria_db` DEFAULT CHARACTER SET utf8 ;
USE `querubin_floreria_db` ;

-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NULL,
  `numero_int` INT NULL,
  `numero_ext` INT NULL,
  `colonia` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `codigo_postal` INT NULL,
  `telefono` INT NULL,
  `celular` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_direccion` INT NULL,
  `rol` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `id_usuario_direccion_idx` (`id_usuario_direccion` ASC),
  CONSTRAINT `id_usuario_direccion`
    FOREIGN KEY (`id_usuario_direccion`)
    REFERENCES `querubin_floreria_db`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido_usuario` INT NULL,
  `id_pedido_direccion` INT NULL,
  `costo` DECIMAL NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  `mensaje` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_pedido_direccion_idx` (`id_pedido_direccion` ASC) ,
  INDEX `id_pedido_usuario_idx` (`id_pedido_usuario` ASC),
  CONSTRAINT `id_pedido_usuario`
    FOREIGN KEY (`id_pedido_usuario`)
    REFERENCES `querubin_floreria_db`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_pedido_direccion`
    FOREIGN KEY (`id_pedido_direccion`)
    REFERENCES `querubin_floreria_db`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_categoria_producto` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_producto_categoria` INT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `oferta` DECIMAL NULL,
  `imagen` BLOB NOT NULL,
  `unidad` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NULL,
  `tamaño` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `id_producto_categoria_idx` (`id_producto_categoria` ASC),
  CONSTRAINT `id_producto_categoria`
    FOREIGN KEY (`id_producto_categoria`)
    REFERENCES `querubin_floreria_db`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `querubin_floreria_db`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `querubin_floreria_db`.`entrega` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_entrega_pedido` INT NULL,
  `id_entrega_producto` INT NULL,
  `unidades` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_entrega_producto_idx` (`id_entrega_producto` ASC),
  INDEX `id_entrega_pedido_idx` (`id_entrega_pedido` ASC),
  CONSTRAINT `id_entrega_producto`
    FOREIGN KEY (`id_entrega_producto`)
    REFERENCES `querubin_floreria_db`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_entrega_pedido`
    FOREIGN KEY (`id_entrega_pedido`)
    REFERENCES `querubin_floreria_db`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*Debo eliminar los comando INVISIBLE cuando haga conversión del modelo a código SQL
y revisar la correspondencia de las claves foráneas.

Este fichero sólo se utilizó para escribir el código de construcción de la base de datos. 

No tiene funcionalidad en el proyecto.
*/