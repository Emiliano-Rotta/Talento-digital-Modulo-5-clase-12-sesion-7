-- COMO EL MODELO ESTÀ EN MAYÙSCULA, LO PONGO TODO EN MAYÙSCULA


CREATE TABLE TB_CLIENTE (
    CLI_RUT VARCHAR(20) PRIMARY KEY,
    CLI_NOMBRE VARCHAR(100) NOT NULL,
    CLI_GIRO VARCHAR(100),
    CLI_DIRECCION VARCHAR(200),
    CLI_FONO INT
);


CREATE TABLE TB_PRODUCTO (
    PRO_CODIGO SERIAL PRIMARY KEY,
    PRO_NOMBRE VARCHAR(100) NOT NULL,
    PRO_STOCK INT NOT NULL,
    PRO_VALOR_UNITARIO DECIMAL(10, 2) NOT NULL
);


CREATE TABLE TB_VENTA (
    VEN_NUMERO SERIAL PRIMARY KEY,
    VEN_FECHA DATE NOT NULL,
    TB_CLIENTE_CLI_RUT VARCHAR(20) NOT NULL,
    FOREIGN KEY (TB_CLIENTE_CLI_RUT) REFERENCES TB_CLIENTE(CLI_RUT)
);

CREATE TABLE TB_DETALLE_VENTA (
    DET_ID SERIAL PRIMARY KEY,
    DET_CANTIDAD INT NOT NULL,
    DET_VALOR_UNITARIO DECIMAL(10, 2) NOT NULL,
    TB_VENTA_VEN_NUMERO INT NOT NULL,
    TB_PRODUCTO_PRO_CODIGO INT NOT NULL,
    FOREIGN KEY (TB_VENTA_VEN_NUMERO) REFERENCES TB_VENTA(VEN_NUMERO),
    FOREIGN KEY (TB_PRODUCTO_PRO_CODIGO) REFERENCES TB_PRODUCTO(PRO_CODIGO)
);


-- Insertar datos en TB_CLIENTE
INSERT INTO TB_CLIENTE (CLI_RUT, CLI_NOMBRE, CLI_GIRO, CLI_DIRECCION, CLI_FONO)
VALUES
('11111111-1', 'Cliente Uno', 'Tecnología', 'Av. Siempre Viva 742', '123456789'),
('22222222-2', 'Cliente Dos', 'Comercio', 'Calle Falsa 123', '987654321'),
('33333333-3', 'Cliente Tres', 'Consultoría', 'Av. Libertador 789', '112233445'),
('44444444-4', 'Cliente Cuatro', 'Restauración', 'Paseo Central 321', '556677889'),
('55555555-5', 'Cliente Cinco', 'Transporte', 'Calle Norte 654', '223344556');


-- Insertar datos en TB_PRODUCTO
INSERT INTO TB_PRODUCTO (PRO_NOMBRE, PRO_STOCK, PRO_VALOR_UNITARIO)
VALUES
('Producto A', 100, 25.50),
('Producto B', 200, 30.00),
('Producto C', 50, 10.75),
('Producto D', 150, 45.99),
('Producto E', 75, 60.25);

INSERT INTO TB_VENTA (VEN_FECHA, TB_CLIENTE_CLI_RUT)
VALUES
('2024-10-15', '11111111-1'),
('2024-10-16', '22222222-2'),
('2024-10-17', '33333333-3'),
('2024-10-18', '44444444-4'),
('2024-10-19', '55555555-5');


-- Insertar datos en TB_DETALLE_VENTA
INSERT INTO TB_DETALLE_VENTA (DET_CANTIDAD, DET_VALOR_UNITARIO, TB_VENTA_VEN_NUMERO, TB_PRODUCTO_PRO_CODIGO)
VALUES
(2, 25.50, 1, 1),
(3, 30.00, 2, 2),
(1, 10.75, 3, 3),
(4, 45.99, 4, 4),
(5, 60.25, 5, 5);

