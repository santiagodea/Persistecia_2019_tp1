create database `facturacion` default character set latin1 collate latin1_spanish_ci;
use `facturacion`;

-- TALBA CLIENTES
create table Cliente(
	id_cliente int not null AUTO_INCREMENT,
    codigo varchar (16) not null unique,
    apellido varchar (256) not null,
    nombre varchar (256) not null,
    
    primary key (id_cliente)    
);

-- TABLA FACTURAS
create table Factura(
	id_factura int not null AUTO_INCREMENT,
    id_cliente int not null,
    fecha datetime not null,
    numero int not null unique,
    
    primary key (id_factura),
    foreign key (id_cliente) references Cliente (id_cliente)
);


-- TABLA PRODUCTOS
create table producto(
	id_producto int not null AUTO_INCREMENT,
    codigo varchar(16) not null unique,
    descripcion varchar(256) not null,
    id_precio int,
    
    primary key (id_producto)
    -- foreign key (id_precio) references Precio (id_precio)
);

-- TABLA PRECIOS
create table Precio(
	id_precio int not null AUTO_INCREMENT,
    monto decimal (8,2) not null,
    fecha date not null,
    id_producto int not null,
    
    primary key (id_precio),
    foreign key (id_producto) references Producto (id_producto)
);

-- TABLA RELACION FACTURAS-PRODUCTOS
create table Factura_Producto(
	id_factura int not null,
    id_producto int not null,
    cantidad int not null,
    
    primary key (id_factura, id_producto),
    foreign key (id_factura) references Factura (id_factura),
    foreign key (id_producto) references Producto (id_producto)
);

-- DEBO HACERLO DESPUES YA QUE ANTES NO CONOCE LA TABLA PRECIOS
ALTER TABLE producto ADD foreign key (id_precio) references Precio (id_precio);


-- 2. Generar un conjunto de datos de prueba.


insert into Cliente (codigo, apellido, nombre)
values ('1', 'Armani','Franco'); 
insert into Cliente (codigo, apellido, nombre)
values ('29', 'Montiel','Gonzalo'); 
insert into Cliente (codigo, apellido, nombre)
values ('28', 'Martinez Quarta','Lucas'); 
insert into Cliente (codigo, apellido, nombre)
values ('2', 'Maidana','Jonatan'); 
insert into Cliente (codigo, apellido, nombre)
values ('22', 'Pinola','Javier'); 
insert into Cliente (codigo, apellido, nombre)
values ('20', 'Casco','Milton'); 
insert into Cliente (codigo, apellido, nombre)
values ('23', 'Ponzio','Leonardo'); 
insert into Cliente (codigo, apellido, nombre)
values ('24', 'Perez','Enzo'); 
insert into Cliente (codigo, apellido, nombre)
values ('15', 'Palacios','Exequiel'); 
insert into Cliente (codigo, apellido, nombre)
values ('26', 'Fernandez','Ignacio'); 
insert into Cliente (codigo, apellido, nombre)
values ('10', 'Martinez','Gonzalo'); 
insert into Cliente (codigo, apellido, nombre)
values ('27', 'Pratto','Lucas'); 



insert into Cliente (codigo, apellido, nombre)
values ('14', 'Lux','German'); 
insert into Cliente (codigo, apellido, nombre)
values ('11', 'De La Cruz','Nicolas'); 
insert into Cliente (codigo, apellido, nombre)
values ('5', 'Zuculini','Bruno'); 
insert into Cliente (codigo, apellido, nombre)
values ('8', 'Quintero','Juan Fernando'); 
insert into Cliente (codigo, apellido, nombre)
values ('19', 'Borre','Rafael Santos'); 
insert into Cliente (codigo, apellido, nombre)
values ('30', 'Scocco','Ignacio'); 

select * from Cliente;

insert into Factura (id_cliente, fecha, numero)
values ('3', '2019-04-13 17:15:10',1); 
insert into Factura (id_cliente, fecha, numero)
values ('15', '2019-04-14 17:15:10',2); 
insert into Factura (id_cliente, fecha, numero)
values ('19', '2019-04-10 17:15:10',3); 
insert into Factura (id_cliente, fecha, numero)
values ('7', '2019-04-01 17:15:10',4); 
insert into Factura (id_cliente, fecha, numero)
values ('3', '2019-04-12 17:15:10',5); 
insert into Factura (id_cliente, fecha, numero)
values ('10', '2019-04-13 17:15:10',6); 
insert into Factura (id_cliente, fecha, numero)
values ('9', '2019-04-01 17:15:10',7); 
insert into Factura (id_cliente, fecha, numero)
values ('1', '2019-04-01 17:15:10',8); 

select * from Factura;

insert into Producto (codigo, descripcion)
values ('A', 'pelota'); 
insert into Producto (codigo, descripcion)
values ('B', 'conos'); 
insert into Producto (codigo, descripcion)
values ('C', 'arco'); 
insert into Producto (codigo, descripcion)
values ('D', 'tarjetas'); 
insert into Producto (codigo, descripcion)
values ('E', 'camiseta'); 
insert into Producto (codigo, descripcion)
values ('F', 'short'); 
insert into Producto (codigo, descripcion)
values ('G', 'guantes'); 
insert into Producto (codigo, descripcion)
values ('H', 'botines'); 

select * from Producto;

insert into Factura_Producto (id_factura, id_producto, cantidad)
values (1,5,10); 
insert into Factura_Producto (id_factura, id_producto, cantidad)
values (3,6,9); 
insert into Factura_Producto (id_factura, id_producto, cantidad)
values (6,3,12); 
insert into Factura_Producto (id_factura, id_producto, cantidad)
values (4,2,13); 
insert into Factura_Producto (id_factura, id_producto, cantidad)
values (5,1,7); 
insert into Factura_Producto (id_factura, id_producto, cantidad)
values (8,5,5); 


select * from Factura_Producto;


insert into Precio (monto, fecha, id_producto)
values ('10.50','2019-04-12 17:15:10',5);
insert into Precio (monto, fecha, id_producto)
values ('750','2019-04-12 17:15:10',1);
insert into Precio (monto, fecha, id_producto)
values ('350','2019-04-12 17:15:10',3);
insert into Precio (monto, fecha, id_producto)
values ('12000','2019-04-12 17:15:10',4);
insert into Precio (monto, fecha, id_producto)
values ('2780','2019-04-12 17:15:10',6);
insert into Precio (monto, fecha, id_producto)
values ('1150','2019-04-12 17:15:10',7);
insert into Precio (monto, fecha, id_producto)
values ('1500','2019-04-12 17:15:10',8);
insert into Precio (monto, fecha, id_producto)
values ('5400','2019-04-12 17:15:10',9);

select * from Precio;

UPDATE producto 
    SET id_precio = 2
    WHERE id_producto = 1;
UPDATE producto 
    SET id_precio = 3
    WHERE id_producto = 3;
UPDATE producto 
    SET id_precio = 4
    WHERE id_producto = 4;    
UPDATE producto 
    SET id_precio = 5
    WHERE id_producto = 6;
UPDATE producto 
    SET id_precio =6
    WHERE id_producto = 7;
UPDATE producto 
    SET id_precio = 7
    WHERE id_producto = 8;   
    UPDATE producto 
    SET id_precio = 8
    WHERE id_producto = 9; 
 
 select * from Producto;
 
 
 -- 3. Realizar una consulta que retorne: código, apellido y nombre del cliente, el número y la fecha de sus facturas.
 
SELECT Cliente.apellido, Cliente.nombre, Factura.numero, Factura.fecha
FROM Factura
INNER JOIN Cliente ON Cliente.id_cliente = Factura.id_cliente
ORDER BY Cliente.apellido;

-- 4. Realizar una consulta que detalle el historial de precios de un producto en particular identificado por código.

SELECT Producto.codigo, Precio.monto, Precio.fecha
FROM Precio
INNER JOIN Producto on Producto.id_producto = Precio.id_producto and Producto.codigo = 'B'
ORDER BY Precio.fecha;

-- 5. Realizar una consulta que retorne la cantidad total de ventas de cada producto ordenado de mayor a menor.

SELECT Producto.codigo, Producto.descripcion, sum(factura_producto.cantidad) AS totaVentas
FROM Factura_Producto
INNER JOIN Producto ON Producto.id_producto = Factura_Producto.id_producto
GROUP BY codigo
ORDER BY totaVentas DESC;

-- 6. Realizar una consulta que retorne el monto total de ventas de cada producto ordenado de mayor a menor.

SELECT Producto.codigo, Producto.descripcion, sum(factura_producto.cantidad * Precio.monto) AS totalMontos
FROM Factura_producto
INNER JOIN Producto ON Producto.id_producto = Factura_Producto.id_producto INNER JOIN Precio ON Precio.id_producto = Producto.id_producto
GROUP BY codigo
ORDER BY totalMontos DESC;

-- 7. Realizar una consulta que retorne la cantidad total de facturas por cliente ordenado de mayor a menor incluyendo clientes que no tengan facturas cuya cantidad total será 0.

SELECT Cliente.apellido, Cliente.nombre, COUNT(Factura.numero) AS cantidadFacturas
FROM Cliente
LEFT JOIN Factura ON Cliente.id_cliente = Factura.id_Cliente
GROUP BY codigo
ORDER BY cantidadFacturas DESC;

-- 8. Realizar una vista llamada compras que retorne código, apellido y nombre del cliente, número y fecha de todas las facturas, 
-- código, descripción, precio unitario, cantidad y precio total de los productos incluidos en cada factura.

CREATE VIEW compras AS
SELECT Cliente.codigo, Cliente.apellido, Cliente.nombre, Factura.numero, Factura.fecha, Producto.codigo AS codigoP, 
		Producto.descripcion, Precio.monto, Factura_producto.cantidad, (Factura_producto.cantidad * Precio.monto) AS montoTotalProducto
FROM Cliente
INNER JOIN Factura ON Cliente.id_cliente = factura.id_cliente
INNER JOIN factura_producto ON Factura_Producto.id_factura = factura.id_factura
INNER JOIN producto ON factura_producto.id_producto = producto.id_producto
INNER JOIN precio ON producto.id_producto = precio.id_producto
-- GROUP BY cliente.codigo, factura.numero, factura_producto.cantidad, producto.codigo, precio.id_precio
ORDER BY apellido;

DROP VIEW compras;

SELECT *
FROM compras;

-- 9. Realizar una consulta sobre la vista compras para un cliente en particular identificado por código.

SELECT compras.apellido, compras.nombre, compras.descripcion, compras.cantidad
FROM compras
WHERE codigo = 29;

-- 10. ¿qué índices son necesarios para optimizar las consultas anteriores?
-- se podrian agregar un indice en el apellido del cliente, en el codigo del producto y en el numero de factura.


-- 11. Se quiere consultar sobre la vista compras por el campo apellido (utilizando operador like %), 
-- obtenga el plan de ejecución de la vista realizando una consulta para un apellido, realice el índice que más le convenga 
-- para evitar el full scan y obtenga nuevamente el plan de ejecución, la entrega de este ítem es la creación del índice.

SELECT * 
FROM compras
WHERE apellido like "sco%";

-- tiempo con indice en apellido: 0.015 sec.
-- tiempo con indice en apellido: 0.016 sec.

ALTER TABLE cliente ADD INDEX (apellido); -- doy de alta un indice

ALTER TABLE cliente DROP INDEX apellido; -- doy de baja el indice


-- REALIZADO EN EL ECLIPSE
-- 12. Agregar un cliente a través de Statement.

-- 13. Mediante PreparedStatement cambiar el precio a un producto, esto implica crear un precio nuevo 
-- (sin eliminar el que estaba de manera de dejar un historial) y actualizar el producto para que apunte al nuevo precio.

-- 14. Utilizar un CallableStatement que invoque a un store proceure para dar de alta una factura, los parámetros serán: código de cliente, 
-- fecha de la compra, códigos de producto y cantidad comprada de los mismos. Solo dará de alta la factura si el importe total supera los $100.

-- 15. Modificar el modelo de manera que accediendo solo a la tabla cliente se pueda saber cuantas facturas tiene el mismo, 
-- y mediante un trigger actualizar este valor cada vez que se le genere una factura al mismo.





