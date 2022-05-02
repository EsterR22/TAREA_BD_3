CREATE SCHEMA `tarea3` ;

CREATE TABLE `tarea3`.`clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(60) NOT NULL,
  `apellidos` VARCHAR(60) NOT NULL,
  `nit` VARCHAR(12) NOT NULL,
  `genero` BIT NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `fechaingreso` DATETIME NOT NULL,
  PRIMARY KEY (`idClientes`));
  
  CREATE TABLE `tarea3`.`Puestos` (
  `idPuesto` SMALLINT NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPuesto`));
  
  
  CREATE TABLE `tarea3`.`Empleados` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(60) NOT NULL,
  `apellidos` VARCHAR(60) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `DPI` VARCHAR(15) NOT NULL,
  `genero` BIT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `idPuesto` SMALLINT NOT NULL,
  `fecha_inicio_labores` DATE NOT NULL,
  `fechaingreso` DATETIME NOT NULL,
  PRIMARY KEY (`idEmpleado`));
  
CREATE TABLE `tarea3`.`Ventas` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `nofactura` INT NOT NULL,
  `serie` CHAR(1) NOT NULL,
  `fechafactura` DATE NOT NULL,
  `idClientes` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `fechaingreso` DATETIME NOT NULL,
  PRIMARY KEY (`idVenta`));
  
  CREATE TABLE `tarea3`.`Proveedores` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `Proveedor` VARCHAR(60) NOT NULL,
  `nit` VARCHAR(12) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idProveedor`));
  
  CREATE TABLE `tarea3`.`Compras` (
  `idCompra` INT NOT NULL AUTO_INCREMENT,
  `no_orden_compra` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `fecha_orden`DATE NOT NULL,
  `fechaingreso`DATETIME NOT NULL,
  PRIMARY KEY (`idCompra`));
  
  CREATE TABLE `tarea3`.`Marcas` (
  `idMarca` SMALLINT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idMarca`));
  
  CREATE TABLE `tarea3`.`Productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `Producto` VARCHAR(50) NOT NULL,
  `idMarca` SMALLINT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Imagen` VARCHAR(30) NOT NULL,
  `precio_costo` DECIMAL(8,2) NOT NULL,
  `precio_venta` DECIMAL(8,2) NOT NULL,
  `existencia` INT NOT NULL,
  `fechaingreso`DATETIME NOT NULL,
  PRIMARY KEY (`idProducto`));
  
  CREATE TABLE `tarea3`.`Compras_detalle` (
  `idCompra_detalle` BIGINT NOT NULL AUTO_INCREMENT,
  `idCompra` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cantidad`INT NOT NULL,
  `precio_costo_unitario` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idCompra_detalle`));
  
  CREATE TABLE `tarea3`.`Venta_detalle` (
  `idVenta_detalle` BIGINT NOT NULL AUTO_INCREMENT,
  `idVenta` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cantidad` VARCHAR(45), 
  `precio_unitario` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idVenta_detalle`));
  
  /*llaves foraneas*/
  /*Tabla Empleados*/
ALTER TABLE `tarea3`.`empleados` 
ADD INDEX `idPuesto_Puesto_Empleados_idx` (`idPuesto` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`empleados` 
ADD CONSTRAINT `idPuesto_Puesto_Empleados`
  FOREIGN KEY (`idPuesto`)
  REFERENCES `tarea3`.`puestos` (`idPuesto`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

/*Tabla Ventas*/
ALTER TABLE `tarea3`.`ventas` 
ADD INDEX `idClientes_Clientes_Ventas_idx` (`idClientes` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`ventas` 
ADD CONSTRAINT `idClientes_Clientes_Ventas`
  FOREIGN KEY (`idClientes`)
  REFERENCES `tarea3`.`clientes` (`idClientes`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `tarea3`.`ventas` 
ADD INDEX `idEmpleado_Empleados_Ventas_idx` (`idEmpleado` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`ventas` 
ADD CONSTRAINT `idEmpleado_Empleados_Ventas`
  FOREIGN KEY (`idEmpleado`)
  REFERENCES `tarea3`.`empleados` (`idEmpleado`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
/*Tabla Compras*/
ALTER TABLE `tarea3`.`compras` 
ADD INDEX `idProveedor_proveedores_compras_idx` (`idProveedor` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`compras` 
ADD CONSTRAINT `idProveedor_proveedores_compras`
  FOREIGN KEY (`idProveedor`)
  REFERENCES `tarea3`.`proveedores` (`idProveedor`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
/*Tabla Productos*/
ALTER TABLE `tarea3`.`productos` 
ADD INDEX `idMarca_marcas_productos_idx` (`idMarca` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`productos` 
ADD CONSTRAINT `idMarca_marcas_productos`
  FOREIGN KEY (`idMarca`)
  REFERENCES `tarea3`.`marcas` (`idMarca`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
/*Tabla compras_detalle*/
ALTER TABLE `tarea3`.`compras_detalle` 
ADD INDEX `idCompra_compras_compras_detalle_idx` (`idCompra` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`compras_detalle` 
ADD CONSTRAINT `idCompra_compras_compras_detalle`
  FOREIGN KEY (`idCompra`)
  REFERENCES `tarea3`.`compras` (`idCompra`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
ALTER TABLE `tarea3`.`compras_detalle` 
ADD INDEX `idCompra_compras_productos_idx` (`idProducto` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`compras_detalle` 
ADD CONSTRAINT `idCompra_compras_productos`
  FOREIGN KEY (`idProducto`)
  REFERENCES `tarea3`.`productos` (`idProducto`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
/*Tabla Ventas_detalle*/
ALTER TABLE `tarea3`.`venta_detalle` 
ADD INDEX `idVenta_ventas_Venta_detalle_idx` (`idVenta` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`venta_detalle` 
ADD CONSTRAINT `idVenta_venta_Ventas_detalle`
  FOREIGN KEY (`idVenta`)
  REFERENCES `tarea3`.`ventas` (`idVenta`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
ALTER TABLE `tarea3`.`venta_detalle` 
ADD INDEX `idProducto_productos_veta_detalle_idx` (`idProducto` ASC) VISIBLE;
;
ALTER TABLE `tarea3`.`venta_detalle` 
ADD CONSTRAINT `idProducto_productos_veta_detalle`
  FOREIGN KEY (`idProducto`)
  REFERENCES `tarea3`.`productos` (`idProducto`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
INSERT INTO tarea3.puestos(puesto) values ('contador');
INSERT INTO tarea3.puestos(puesto) values ('programador');
INSERT INTO tarea3.puestos(puesto) values ('vendedor 1');
INSERT INTO tarea3.puestos(puesto) values ('vendedor 2');
INSERT INTO tarea3.puestos(puesto) values ('gerente');

INSERT INTO tarea3.clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) values ('Ester Sarai','Quiroa Cipriano','10699622-3',1,'42679595','teshquiroa@gmail.com','2022-04-03 11:55:06');
INSERT INTO tarea3.clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) values ('Ricardo Antonio','Chiche Caal','10708721-9',0,'54631842','richicaal@gmail.com','2022-05-01 11:55:06');
INSERT INTO tarea3.clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) values ('Claudia','Cipriano Fuentes','2243471-2',1,'46348239','claudia.quiroaa@gmail.com','2022-03-02 13:55:06');
INSERT INTO tarea3.clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) values ('Guillermo Joaquin','Quiroa Fernandez','3138431-1',0,'42689385','guillermoq@gmail.com','2022-02-0 16:56:16');
INSERT INTO tarea3.clientes(nombres,apellidos,nit,genero,telefono,correo_electronico,fechaingreso) values ('Carlos Daniel','Rivera Cipriano','1063122-3',1,'54179595','cdaniel@gmail.com','2021-12-31 17:58:59');

INSERT INTO tarea3.empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)values('Jhoshua Emanuel','Perez Vasquez','25-52 zona 6','258593725','128395255',0,'1999-12-25',2,'2022-04-03','2022-04-03 11:55:06');
INSERT INTO tarea3.empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)values('Angel David','Chamale Ruiz','24-25 zona 3','258253725','121355255',0,'1997-10-15',5,'2021-05-23','2021-10-23 10:28:06');
INSERT INTO tarea3.empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)values('Carlos David','Benitez Guerra','37-54 zona 24','258591255','126395255',0,'1999-11-26',4,'2015-01-04','2015-01-04 11:55:06');
INSERT INTO tarea3.empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)values('Maria Irene','Hoffens Bolaños','37-54 zona 10','2583211255','1263313255',1,'1996-12-31',3,'2015-01-04','2015-01-04 16:54:06');
INSERT INTO tarea3.empleados(nombres,apellidos,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)values('Yackeline Yasmin','Rivera Castillo','71-51 zona 10','258312255','132145255',1,'2000-11-25',5,'2016-12-28','2016-12-18 11:50:06');

INSERT INTO tarea3.proveedores(proveedor,nit,direccion,telefono)values('COMECA','35172-5','Guatemala','22003500');
INSERT INTO tarea3.proveedores(proveedor,nit,direccion,telefono)values('PAIZ','737810-6','Guatemala','32185282');
INSERT INTO tarea3.proveedores(proveedor,nit,direccion,telefono)values('WALMART','2582319-5','Guatemala','32182939');
INSERT INTO tarea3.proveedores(proveedor,nit,direccion,telefono)values('MACHETAZO','228831-5','Guatemala','32138.2');
INSERT INTO tarea3.proveedores(proveedor,nit,direccion,telefono)values('PRISMA COLOR','318282-5','Guatemala','13218221');

INSERT INTO tarea3.compras(no_orden_compra,idProveedor,fecha_orden,fechaingreso)values(1425,3,'2021-12-23','2022-01-24 11:54:25');
INSERT INTO tarea3.compras(no_orden_compra,idProveedor,fecha_orden,fechaingreso)values(1624,2,'2021-12-23','2022-01-24 11:54:25');
INSERT INTO tarea3.compras(no_orden_compra,idProveedor,fecha_orden,fechaingreso)values(1855,1,'2021-12-23','2022-01-24 11:54:25');
INSERT INTO tarea3.compras(no_orden_compra,idProveedor,fecha_orden,fechaingreso)values(1624,4,'2021-12-23','2022-01-24 11:54:25');
INSERT INTO tarea3.compras(no_orden_compra,idProveedor,fecha_orden,fechaingreso)values(1352,5,'2021-12-23','2022-01-24 11:54:25');

INSERT INTO tarea3.marcas(marca)values('ADIDAS');
INSERT INTO tarea3.marcas(marca)values('FOREVER 21');
INSERT INTO tarea3.marcas(marca)values('VERSHCA');
INSERT INTO tarea3.marcas(marca)values('PUMA');
INSERT INTO tarea3.marcas(marca)values('STRADIVARIUS');

INSERT INTO tarea3.productos(Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso)values('BLUSAS',1,'TALLA S','BLANCA','100','125',5,'2022-04-06 14:55:06');
INSERT INTO tarea3.productos(Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso)values('TENIS',2,'TALLA 36','NEGRO','200','250',25,'2022-03-25 16:15:16');
INSERT INTO tarea3.productos(Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso)values('PANTALONES',3,'TALLA S','AZULES','300','325',56,'2022-03-15 11:06:15');
INSERT INTO tarea3.productos(Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso)values('BOTAS',4,'TALLA 36','CAFE','250','300',10,'2022-04-06 16:55:06');
INSERT INTO tarea3.productos(Producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fechaingreso)values('BLUSAS',5,'TALLA S','CREMA','100','125',15,'2022-06-06 14:55:06');

INSERT INTO tarea3.compras_detalle(idCompra,idProducto,cantidad,precio_costo_unitario)values(1,2,25,'100.25');
INSERT INTO tarea3.compras_detalle(idCompra,idProducto,cantidad,precio_costo_unitario)values(2,1,15,'120.25');
INSERT INTO tarea3.compras_detalle(idCompra,idProducto,cantidad,precio_costo_unitario)values(3,5,5,'320.25');
INSERT INTO tarea3.compras_detalle(idCompra,idProducto,cantidad,precio_costo_unitario)values(4,3,21,'250.36');
INSERT INTO tarea3.compras_detalle(idCompra,idProducto,cantidad,precio_costo_unitario)values(5,4,13,'360.25');

INSERT INTO tarea3.ventas(nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso)values(2536,'A','2022-05-03',1,5,'2022-05-03 16:25:06');
INSERT INTO tarea3.ventas(nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso)values(2537,'A','2022-04-03',2,4,'2022-04-03 11:25:15');
INSERT INTO tarea3.ventas(nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso)values(2538,'A','2022-04-06',3,5,'2022-04-06 16:25:06');
INSERT INTO tarea3.ventas(nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso)values(2539,'A','2022-04-11',4,5,'2022-04-11 11:35:25');
INSERT INTO tarea3.ventas(nofactura,serie,fechafactura,idClientes,idEmpleado,fechaingreso)values(2540,'A','2022-04-16',5,4,'2022-04-16 08:25:17');

INSERT INTO tarea3.venta_detalle(idVenta,idProducto,cantidad,precio_unitario)values(1,2,'25','305.15');
INSERT INTO tarea3.venta_detalle(idVenta,idProducto,cantidad,precio_unitario)values(2,1,'28','400.00');
INSERT INTO tarea3.venta_detalle(idVenta,idProducto,cantidad,precio_unitario)values(3,5,'15','150.48');
INSERT INTO tarea3.venta_detalle(idVenta,idProducto,cantidad,precio_unitario)values(4,3,'10','205.54');
INSERT INTO tarea3.venta_detalle(idVenta,idProducto,cantidad,precio_unitario)values(5,4,'20','180.48');


select*from tarea3.venta_DETALLE;