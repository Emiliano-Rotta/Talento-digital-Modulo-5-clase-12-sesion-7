Generar las tablas

Tabla: Cliente

CREATE TABLE Cliente (
    Rut NUMERIC PRIMARY KEY,
    Nombre VARCHAR,
    Giro VARCHAR,
    Direccion VARCHAR,
    Ciudad VARCHAR,
    Telefono NUMERIC
);

Tabla: Empresa

CREATE TABLE Empresa (
    Rut NUMERIC PRIMARY KEY,
    Nombre VARCHAR
);

Tabla: Proveedor

CREATE TABLE Proveedor (
    Rut VARCHAR PRIMARY KEY,
    Nombre VARCHAR
);

Tabla: Compra

CREATE TABLE Compra (
    NumeroFactura NUMERIC PRIMARY KEY,
    Fecha DATE,
    Total NUMERIC,
    Proveedor_Rut VARCHAR,
    FOREIGN KEY (Proveedor_Rut) REFERENCES Proveedor(Rut)
);

Tabla: Produccion

CREATE TABLE Produccion (
    id NUMERIC PRIMARY KEY,
    FechaInicio DATE,
    FechaTermino DATE,
    PlantaProd_id NUMERIC
);

Tabla: DetalleProduccion

CREATE TABLE DetalleProduccion (
    id NUMERIC PRIMARY KEY,
    CantidadEsperada NUMERIC,
    CantidadObtenida NUMERIC,
    FechaInicio DATE,
    FechaTermino DATE,
    Bodega_id NUMERIC,
    Produccion_id NUMERIC,
    FOREIGN KEY (Bodega_id) REFERENCES Bodega(id),
    FOREIGN KEY (Produccion_id) REFERENCES Produccion(id)
);

Tabla: Bodega

CREATE TABLE Bodega (
    id NUMERIC PRIMARY KEY,
    Nombre VARCHAR
);

Tabla: Receta

CREATE TABLE Receta (
    id NUMERIC PRIMARY KEY,
    Nombre VARCHAR
);

Tabla: DetalleReceta

CREATE TABLE DetalleReceta (
    id NUMERIC PRIMARY KEY,
    idReceta NUMERIC,
    idInventarioProduccion NUMERIC,
    Cantidad NUMERIC,
    FOREIGN KEY (idReceta) REFERENCES Receta(id),
    FOREIGN KEY (idInventarioProduccion) REFERENCES InventarioProduccion(id)
);

Tabla: InventarioProduccion

CREATE TABLE InventarioProduccion (
    id NUMERIC PRIMARY KEY,
    Nombre VARCHAR,
    Stock INTEGER
);

Tabla: Venta

CREATE TABLE Venta (
    NumeroFactura NUMERIC PRIMARY KEY,
    FechaVenta DATE,
    Total NUMERIC,
    Cliente_rut NUMERIC,
    FOREIGN KEY (Cliente_rut) REFERENCES Cliente(Rut)
);

Tabla: DetalleVenta

CREATE TABLE DetalleVenta (
    id NUMERIC PRIMARY KEY,
    Cantidad INTEGER,
    Descripcion VARCHAR,
    Unitario NUMERIC,
    Cecina_id NUMERIC,
    Venta_numeroFactura NUMERIC,
    FOREIGN KEY (Cecina_id) REFERENCES Cecina(id),
    FOREIGN KEY (Venta_numeroFactura) REFERENCES Venta(NumeroFactura)
);

Tabla: Cecina

CREATE TABLE Cecina (
    id NUMERIC PRIMARY KEY,
    Nombre VARCHAR,
    Stock INTEGER,
    Precio NUMERIC,
    TipoCecina_id NUMERIC,
    FOREIGN KEY (TipoCecina_id) REFERENCES TipoCecina(id)
);

Tabla: TipoCecina

CREATE TABLE TipoCecina (
    id NUMERIC PRIMARY KEY,
    Nombre VARCHAR
);

Tabla: DetalleCompra

CREATE TABLE DetalleCompra (
    id NUMERIC PRIMARY KEY,
    Cantidad INTEGER,
    Descripcion VARCHAR,
    Unitario NUMERIC,
    Compra_NumeroFactura NUMERIC,
    Inventario_id NUMERIC,
    FOREIGN KEY (Compra_NumeroFactura) REFERENCES Compra(NumeroFactura),
    FOREIGN KEY (Inventario_id) REFERENCES InventarioProduccion(id)
);

Incorporar datos

Datos para la tabla Cliente

INSERT INTO Cliente (Rut, Nombre, Giro, Direccion, Ciudad, Telefono) VALUES 
(12345678, 'Juan Pérez', 'Venta de Cecinas', 'Av. Libertad 123', 'Santiago', 987654321),
(23456789, 'Ana López', 'Restaurantes', 'Calle 45 #123', 'Valparaíso', 987123456),
(34567890, 'Carlos Martínez', 'Supermercados', 'Av. Providencia 987', 'Concepción', 987654567),
(45678901, 'María González', 'Distribución', 'Av. Colón 456', 'La Serena', 987765432),
(56789012, 'Luis Rodríguez', 'Comercio', 'Calle 32 #987', 'Antofagasta', 987987654);

Datos para la tabla Empresa

INSERT INTO Empresa (Rut, Nombre) VALUES 
(98765432, 'Cecinas del Sur'),
(87654321, 'Fábrica de Cecinas Valpo'),
(76543210, 'Cecinas y Embutidos S.A.'),
(65432109, 'El Artesano de las Cecinas'),
(54321098, 'Cecinas Gourmet Ltda.');

Datos para la tabla Proveedor

INSERT INTO Proveedor (Rut, Nombre) VALUES 
('76543210-0', 'Proveedor Cecinas Ltda.'),
('87654321-1', 'Distribuidor Embutidos Norte'),
('98765432-2', 'Carnes y Cecinas S.A.'),
('10987654-3', 'Productos Gourmet Ltda.'),
('21098765-4', 'Proveedores Nacionales de Cecinas');

Datos para la tabla Cecina

INSERT INTO Cecina (id, Nombre, Stock, Precio, TipoCecina_id) VALUES 
(1, 'Salchicha', 100, 1500, 1),
(2, 'Longaniza', 50, 2500, 1),
(3, 'Mortadela', 200, 1800, 2),
(4, 'Chorizo', 75, 3000, 3),
(5, 'Jamon', 90, 3500, 3);

Datos para la tabla Venta

INSERT INTO Venta (NumeroFactura, FechaVenta, Total, Cliente_rut) VALUES 
(1001, '2024-10-01', 50000, 12345678),
(1002, '2024-10-02', 30000, 23456789),
(1003, '2024-10-03', 20000, 34567890),
(1004, '2024-10-04', 40000, 45678901),
(1005, '2024-10-05', 60000, 56789012);






Obtener toda la tabla de Maquinaria:

SELECT * FROM Maquinaria;


Listar todos los productos con su nombre y precio unitario:

SELECT Nombre, Precio_Unitario FROM Producto;


Mostrar las ventas realizadas en un rango de fechas específico:

SELECT * FROM Venta WHERE Fecha_Venta BETWEEN '2024-01-01' AND '2024-12-31';


Consultar los detalles de venta con la cantidad vendida mayor a 10:

SELECT * FROM DetalleVenta WHERE Cantidad > 10;


Obtener el nombre de los clientes y sus respectivas ventas (INNER JOIN):

SELECT Cliente.Nombre, Venta.NumeroVenta 
FROM Cliente
INNER JOIN Venta ON Cliente.Rut = Venta.Cliente_Rut;


Mostrar todos los productos y sus inventarios, aunque no tengan existencias (LEFT JOIN):

SELECT Producto.Nombre, Inventario.Stock 
FROM Producto
LEFT JOIN Inventario ON Producto.Codigo = Inventario.Producto_Codigo;


Listar todas las ventas y, si existen, sus detalles (RIGHT JOIN):

SELECT Venta.NumeroVenta, DetalleVenta.Cantidad 
FROM Venta
RIGHT JOIN DetalleVenta ON Venta.NumeroVenta = DetalleVenta.Venta_Numero;


Obtener el número de ventas y la suma total de las cantidades vendidas (GROUP BY):

SELECT Venta.NumeroVenta, SUM(DetalleVenta.Cantidad) AS TotalCantidad
FROM Venta
JOIN DetalleVenta ON Venta.NumeroVenta = DetalleVenta.Venta_Numero
GROUP BY Venta.NumeroVenta;


Mostrar los productos que tienen un precio mayor a la media (HAVING):

SELECT Nombre, Precio_Unitario 
FROM Producto
GROUP BY Nombre, Precio_Unitario
HAVING Precio_Unitario > (SELECT AVG(Precio_Unitario) FROM Producto);


Consultar el total de ventas realizadas por cada cliente:

SELECT Cliente.Nombre, COUNT(Venta.NumeroVenta) AS TotalVentas
FROM Cliente
JOIN Venta ON Cliente.Rut = Venta.Cliente_Rut
GROUP BY Cliente.Nombre;


Listar las Maquinarias con sus respectivas órdenes de producción (INNER JOIN):

SELECT Maquinaria.Nombre, Produccion.FechaInicio
FROM Maquinaria
INNER JOIN Produccion ON Maquinaria.Codigo = Produccion.Maquinaria_Codigo;


Buscar todos los productos cuyo nombre contenga la palabra "Aceite":

SELECT * FROM Producto WHERE Nombre LIKE '%Aceite%';


Obtener el inventario de cada bodega, mostrando el total de productos en stock (SUM):

SELECT Bodega.Nombre, SUM(Inventario.Stock) AS TotalStock
FROM Bodega
JOIN Inventario ON Bodega.Codigo = Inventario.Bodega_Codigo
GROUP BY Bodega.Nombre;


Listar los productos sin ventas (LEFT JOIN con condición IS NULL):

SELECT Producto.Nombre 
FROM Producto
LEFT JOIN DetalleVenta ON Producto.Codigo = DetalleVenta.Producto_Codigo
WHERE DetalleVenta.Producto_Codigo IS NULL;


Mostrar los detalles de producción ordenados por fecha (ORDER BY):

SELECT * FROM Produccion ORDER BY FechaInicio DESC;


Consultar la producción de maquinaria en un año específico, junto con el nombre de la maquinaria:

SELECT Maquinaria.Nombre, Produccion.FechaInicio 
FROM Maquinaria
JOIN Produccion ON Maquinaria.Codigo = Produccion.Maquinaria_Codigo
WHERE EXTRACT(YEAR FROM Produccion.FechaInicio) = 2024;


Obtener las ventas en las que el total de la venta (cantidad * valor unitario) supera los $1,000:

SELECT Venta.NumeroVenta, SUM(DetalleVenta.Cantidad * DetalleVenta.ValorUnitario) AS TotalVenta
FROM Venta
JOIN DetalleVenta ON Venta.NumeroVenta = DetalleVenta.Venta_Numero
GROUP BY Venta.NumeroVenta
HAVING SUM(DetalleVenta.Cantidad * DetalleVenta.ValorUnitario) > 1000;


Mostrar las Transacciones y las ventas relacionadas (FULL JOIN):

SELECT Transaccion.*, Venta.NumeroVenta
FROM Transaccion
FULL JOIN Venta ON Transaccion.Codigo = Venta.Transaccion_Codigo;


Realizar un CROSS JOIN entre Producto y Bodega para ver todas las combinaciones posibles:

SELECT Producto.Nombre AS Producto, Bodega.Nombre AS Bodega
FROM Producto
CROSS JOIN Bodega;


Obtener la producción que ha utilizado más de 5 unidades de maquinaria:

SELECT Produccion.*
FROM Produccion
JOIN Maquinaria ON Produccion.Maquinaria_Codigo = Maquinaria.Codigo
WHERE Produccion.CantidadMaquinaria > 5;
