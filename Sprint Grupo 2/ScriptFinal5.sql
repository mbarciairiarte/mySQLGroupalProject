#Sprint Grupal 5 
Create database TelovendoCorporation;

create table Proveedores(
id_proveedor int auto_increment,
representante_legal varchar (50),
nombre_corporativo varchar (50),
fono1 int,
fono2 int,
nombre_contacto varchar (50),
categoria_producto varchar(30),
correo varchar (50),
primary key (id_proveedor)
);

create table Cliente(
id_cliente int auto_increment,
nombre varchar (30),
apellido varchar (30),
direccion varchar (50),
primary key (id_cliente)
);

create table Producto(
id_producto int,
nombre varchar (30),
precio int,
categoria varchar (30),
id_proveedor int,
color varchar (30),
stock int,
primary key (id_producto),
foreign key (id_proveedor) references Proveedores (id_proveedor)
 );

Insert into Proveedores (representante_legal,nombre_corporativo,fono1,fono2,nombre_contacto,categoria_producto,correo)
values ('Esteban Quito', 'Mudanzas', 95477382, 983565372,'Betty Ugly','Transporte', 'transportestebanquito@gmail.com'),
('Ernesto Gómez Bolaño', 'Electrónica Bolaño', 98476367, 225467873,'Verónica Pinto','Electrónica','electronicabolaño@gmail.com'),
('Roberto Sepeda', 'TopMonitores', 98355431, 224352667,'Freddy Kruger','Tecnología','sepedafuerte@gmail.com'),
('Elsa Capunta', 'Calculatore', 88764537, 227733442,'Felipe Gómez','Electrónica','capucalcu@gmail.com'),
('Elva Lazo', 'Cables Lazo', 77889856, 223542769,'Fabian Becerra','Electricidad','cableazo@gmail.com');

Insert into Cliente (nombre, apellido, direccion)
values ('Manuel','Zapata','Los Pensamientos #344, La Pintana'),
('Carlos','Gonzales','Avenida Pecoso #3452,Macúl'),
('Juana','Picota','El Quijote #987 Maipú'),
('Antonina','Garza','Las Flores #764 Pudahuel'),
('Marcelino','Dentón','Trincaco #123 Cerrillos');

insert into Producto (id_producto,nombre, precio, categoria, id_proveedor, color, stock)
values (133,'Monitor LG', 100000,'Tecnología', 3, 'Negro', 30),
(140,'Escritorio', 350000,'Transporte', 1, 'Blanco', 10),
(155,'Casio LX 100', 10000,'Electrónica', 4, 'Gris Perla',1000),
(5522,'HDMI', 5000,'Electricidad', 5, 'Gris', 55),
(5542,'Huawei', 250000,'Electrónica', 2, 'Plata',20),
(3322,'Texas Instrument', 200000,'Electrónica', 4, 'Gris',15),
(1166,'Cable red', 10000,'Electricidad', 5, 'Negro',7),
(6633,'Monitor Kioto', 150000,'Tecnología', 3, 'Negro',23),
(2266,'Escritorio Lumini', 350000,'Transporte', 1, 'Rosado',15),
(8899,'Xiaomi Reloj LKT', 70000,'Electrónica', 2, 'Negro',40);

-- Cuál es la categoría de productos que más se repite.
select categoria, count(categoria) as Cantidad_mas_repite from Producto group by categoria
order by Cantidad_mas_repite desc limit 1;

-- Cuáles son los productos con mayor stock
select nombre, stock from Producto order by stock desc limit 5;

-- Qué color de producto es más común en nuestra tienda.
select color , count(color) as color_mas_comun from Producto group by color
order by color_mas_comun desc limit 1;

-- Cual o cuales son los proveedores con menor stock de productos.
select P.id_proveedor, Pr.nombre_corporativo , sum(P.stock) as cantidad 
from Producto as P
inner join Proveedores as Pr 
on P.id_proveedor = Pr.id_proveedor 
Group by P.id_proveedor
order by cantidad asc;

-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
Update Producto set categoria = 'Electrónica y computación' where categoria = 'Electrónica';

# Integrantes
-- Marcos Barcia
-- Claudio Azocar
-- María Fernández

-- Repositorio Github
-- https://github.com/JesuFertez/Sprint-Grupal.git











 