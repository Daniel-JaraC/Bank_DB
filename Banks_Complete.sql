CREATE DATABASE BANCOS;
USE BANCOS;
CREATE TABLE `Prestamo` (
  `NumPrestamo` INTEGER,
  `Fecha` DATE,
  `ImportePrestamo` DECIMAL(10,2),
  `NombreSucursal` VARCHAR(20),
  `NombreCliente` VARCHAR(20),
  KEY `Key` (`NumPrestamo`),
  CONSTRAINT `FK_Sucursal1`
  FOREIGN KEY (NombreSucursal) REFERENCES bancos.Sucursal (NombreSucursal),
  CONSTRAINT `FK_Cliente1`
  FOREIGN KEY (NombreCliente) REFERENCES bancos.cliente (NombreCliente))
  ENGINE = INNODB;

CREATE TABLE `Sucursal` (
  `NombreSucursal` VARCHAR(20),
  `Activa` TINYINT,
  `CiudadSucursal` VARCHAR(50),
  KEY `Key` (`NombreSucursal`)
);

CREATE TABLE `Banquero` (
  `NombreBanquero` VARCHAR(20) NOT NULL,
  `Dirección` VARCHAR(50) DEFAULT 'Avenida 3',
  `CiudadBanquero` VARCHAR(50),
  KEY `Key` (`NombreBanquero`)
);

CREATE TABLE `Cliente` (
  `NombreCliente` VARCHAR(20) NOT NULL,
  `Dirección` VARCHAR(50) DEFAULT 'Avenida 3',
  `CiudadCliente` VARCHAR(50),
  KEY `Key` (`NombreCliente`)
);

CREATE TABLE `Deposito` (
  `NumDeposito` INTEGER,
  `Fecha` DATE,
  `ImporteDeposito` DECIMAL(10,2),
  `NombreSucursal` VARCHAR(20),
  `NombreCliente` VARCHAR(20),
  KEY `Key` (`NumDeposito`),
  CONSTRAINT `FK_Sucursal`
  FOREIGN KEY (NombreSucursal) REFERENCES bancos.Sucursal (NombreSucursal)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT `FK_Cliente`
  FOREIGN KEY (NombreCliente) REFERENCES bancos.Cliente (NombreCliente)
  ON DELETE CASCADE
  ON UPDATE CASCADE)
  ENGINE = INNODB;

CREATE TABLE `Servicio` (
	`NombreCliente` VARCHAR(20),
    `NombreBanquero` VARCHAR(20),
    `Fecha` DATE, 
CONSTRAINT `FK_Banquero` 
FOREIGN KEY (NombreBanquero) REFERENCES BANCOS.Banquero (NombreBanquero), 
CONSTRAINT `FK_Cliente2` 
FOREIGN KEY (NombreCliente) REFERENCES BANCOS.Cliente (NombreCliente))
ENGINE = INNODB; 


