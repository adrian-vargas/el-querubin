SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE IF NOT EXISTS querushop DEFAULT CHARACTER SET utf8;
USE querushop;
CREATE TABLE IF NOT EXISTS usuarios(
id int(255) auto_increment not null,
nombre varchar(100) not null,
apellido varchar(255) not null,
telefono varchar(30) not null,
email varchar(255) not null,
password varchar(255) not null,
rol varchar(20),
imagen varchar(255),
CONSTRAINT pk_usuarios PRIMARY KEY(id),
CONSTRAINT uq_email UNIQUE(email)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS categorias(
id int(255) auto_increment not null,
nombre varchar(100) not null,
CONSTRAINT pk_categorias PRIMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS productos(
id int(255) auto_increment not null,
categoria_id int(255) not null,
nombre varchar(100) not null,
descripcion text,
precio float(100,2) not null,
stock int(255) not null,
oferta varchar(2),
fecha date not null,
imagen varchar(255),
CONSTRAINT pk_productos PRIMARY KEY(id),
CONSTRAINT fk_producto_categoria FOREIGN KEY(categoria_id) REFERENCES categorias(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pedidos(
id int(255) auto_increment not null,
usuario_id int(255) not null,
calle varchar(45) not null,
numero_int varchar(10),
numero_ext varchar(10) not null,
colonia varchar(45) not null,
ciudad varchar(45) not null,
pais varchar(45) not null,
codigo_postal varchar(45) not null,
fecha date not null,
hora time not null,
mensaje text,
CONSTRAINT pk_pedidos PRIMARY KEY(id),
CONSTRAINT fk_pedido_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS lineas_pedidos(
id int(255) auto_increment not null,
pedido_id int(255) not null,
producto_id int(255) not null,
CONSTRAINT pk_lineas_pedidos PRIMARY KEY(id),
CONSTRAINT fk_linea_pedido FOREIGN KEY(pedido_id) REFERENCES pedidos(id),
CONSTRAINT fk_linea_producto FOREIGN KEY(producto_id) REFERENCES productos(id)
)