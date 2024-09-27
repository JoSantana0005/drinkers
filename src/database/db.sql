DROP DATABASE IF EXISTS drinkers;
CREATE DATABASE IF NOT EXISTS drinkers;
USE drinkers;
CREATE TABLE INVENTARIO (
  id INT PRIMARY KEY,
  nombre_producto VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  litros INT NOT NULL,
  grados INT NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  paquete INT NOT NULL,
  iva INT NOT NULL,
  precio_detal INT NOT NULL,
  precio_mayorista INT NOT NULL,
  stock INT NOT NULL
);
CREATE TABLE USUARIO (
  id INT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  nacimiento DATE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  status VARCHAR(255) NOT NULL DEFAULT 'active'
);
CREATE TABLE FACTURA (
  id INT PRIMARY KEY,
  fecha DATE NOT NULL,
  id_user INT NOT NULL,
  total INT NOT NULL,
  FOREIGN KEY (id_user) REFERENCES USUARIO(id)
);
CREATE TABLE PRODUCTOS_FACTURADOS (
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_factura, id_producto),
  FOREIGN KEY (id_factura) REFERENCES FACTURA(id),
  FOREIGN KEY (id_producto) REFERENCES INVENTARIO(id)
);
CREATE TABLE ENVIOS (
  id INT PRIMARY KEY,
  id_user INT NOT NULL,
  destino TEXT NOT NULL,
  id_factura INT NOT NULL,
  monto INT NOT NULL,
  entrega DATE NOT NULL,
  FOREIGN KEY (id_user) REFERENCES USUARIO(id),
  FOREIGN KEY (id_factura) REFERENCES FACTURA(id)
);

CREATE TABLE AVISOS (
  id INT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  fecha DATE NOT NULL
);

CREATE TABLE PROVEEDORES (
  id INT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  telefono VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  contacto VARCHAR(255) NOT NULL
);


INSERT INTO AVISOS (id, titulo, descripcion, tipo, fecha) VALUES
(1, 'Aviso 1', 'Descripción del aviso 1', 'Tipo 1', '2023-01-01'),
(2, 'Aviso 2', 'Descripción del aviso 2', 'Tipo 2', '2023-01-02'),
(3, 'Aviso 3', 'Descripción del aviso 3', 'Tipo 3', '2023-01-03');

INSERT INTO PROVEEDORES (id, nombre, direccion, telefono, email, contacto) VALUES
(1, 'Proveedor 1', 'Dirección 1', 'Teléfono 1', 'Email 1', 'Contacto 1'),
(2, 'Proveedor 2', 'Dirección 2', 'Teléfono 2', 'Email 2', 'Contacto 2'),
(3, 'Proveedor 3', 'Dirección 3', 'Teléfono 3', 'Email 3', 'Contacto 3');



-- Insertar datos en la tabla INVENTARIO
INSERT INTO INVENTARIO (id, nombre_producto, tipo, descripcion, litros, grados, imagen, paquete, iva, precio_detal, precio_mayorista, stock) VALUES
(1, 'Whisky Escocés', 'Whisky', 'Whisky de malta premium', 0.75, 40, 'whisky_escoces.jpg', 1, 19, 50000, 45000, 100),
(2, 'Vodka Ruso', 'Vodka', 'Vodka destilado 5 veces', 1, 37, 'vodka_ruso.jpg', 1, 19, 35000, 30000, 150),
(3, 'Ron Añejo', 'Ron', 'Ron añejado 7 años', 0.7, 40, 'ron_anejo.jpg', 1, 19, 40000, 35000, 80),
(4, 'Gin London Dry', 'Gin', 'Gin con botánicos selectos', 0.75, 43, 'gin_london.jpg', 1, 19, 45000, 40000, 120),
(5, 'Tequila Reposado', 'Tequila', 'Tequila reposado 100% agave', 0.75, 38, 'tequila_reposado.jpg', 1, 19, 55000, 50000, 90),
(6, 'Vino Tinto Reserva', 'Vino', 'Vino tinto reserva español', 0.75, 13, 'vino_tinto.jpg', 1, 19, 30000, 25000, 200),
(7, 'Champagne Brut', 'Champagne', 'Champagne francés brut', 0.75, 12, 'champagne_brut.jpg', 1, 19, 60000, 55000, 70),
(8, 'Licor de Café', 'Licor', 'Licor cremoso de café', 0.7, 17, 'licor_cafe.jpg', 1, 19, 25000, 20000, 110),
(9, 'Cognac VSOP', 'Cognac', 'Cognac VSOP francés', 0.7, 40, 'cognac_vsop.jpg', 1, 19, 70000, 65000, 60),
(10, 'Mezcal Artesanal', 'Mezcal', 'Mezcal artesanal de Oaxaca', 0.75, 45, 'mezcal_artesanal.jpg', 1, 19, 65000, 60000, 50);
(11, 'Cerveza Artesanal', 'Cerveza', 'Cerveza artesanal de cebada', 0.5, 5, 'cerveza_artesanal.jpg', 1, 19, 20000, 15000, 200);

INSERT INTO INVENTARIO (id, nombre_producto, tipo, descripcion, litros, grados, imagen, paquete, iva, precio_detal, precio_mayorista, stock) VALUES
(12, 'Sake Premium', 'Sake', 'Sake japonés de arroz pulido', 0.72, 15, 'sake_premium.jpg', 1, 19, 55000, 50000, 80),
(13, 'Absenta Verde', 'Absenta', 'Absenta tradicional francesa', 0.7, 68, 'absenta_verde.jpg', 1, 19, 75000, 70000, 40),
(14, 'Brandy Español', 'Brandy', 'Brandy de Jerez reserva', 0.7, 36, 'brandy_espanol.jpg', 1, 19, 45000, 40000, 100),
(15, 'Pisco Peruano', 'Pisco', 'Pisco puro de uva quebranta', 0.75, 42, 'pisco_peruano.jpg', 1, 19, 50000, 45000, 90),
(16, 'Vermouth Italiano', 'Vermouth', 'Vermouth rojo italiano', 0.75, 16, 'vermouth_italiano.jpg', 1, 19, 35000, 30000, 120),
(17, 'Aguardiente Colombiano', 'Aguardiente', 'Aguardiente sin azúcar', 0.75, 29, 'aguardiente_colombiano.jpg', 1, 19, 30000, 25000, 150),
(18, 'Cachaça Brasileña', 'Cachaça', 'Cachaça artesanal de alambique', 0.7, 40, 'cachaca_brasilena.jpg', 1, 19, 40000, 35000, 80),
(19, 'Grappa Italiana', 'Grappa', 'Grappa de Amarone', 0.5, 45, 'grappa_italiana.jpg', 1, 19, 65000, 60000, 60),
(20, 'Soju Coreano', 'Soju', 'Soju tradicional coreano', 0.36, 20, 'soju_coreano.jpg', 1, 19, 25000, 20000, 200),
(21, 'Ouzo Griego', 'Ouzo', 'Ouzo con sabor a anís', 0.7, 38, 'ouzo_griego.jpg', 1, 19, 45000, 40000, 70),
(22, 'Limoncello Italiano', 'Licor', 'Licor de limón de la costa Amalfitana', 0.7, 30, 'limoncello_italiano.jpg', 1, 19, 40000, 35000, 100),
(23, 'Bourbon Americano', 'Whiskey', 'Bourbon de Kentucky añejado', 0.75, 45, 'bourbon_americano.jpg', 1, 19, 60000, 55000, 85),
(24, 'Sambuca Italiana', 'Licor', 'Licor de anís italiano', 0.7, 38, 'sambuca_italiana.jpg', 1, 19, 45000, 40000, 90),
(25, 'Fernet Argentino', 'Amargo', 'Fernet de hierbas y especias', 0.75, 39, 'fernet_argentino.jpg', 1, 19, 35000, 30000, 110),
(26, 'Amaretto Italiano', 'Licor', 'Licor de almendras italiano', 0.7, 28, 'amaretto_italiano.jpg', 1, 19, 40000, 35000, 95),
(27, 'Pastis Francés', 'Anisado', 'Pastis de Marsella', 0.7, 45, 'pastis_frances.jpg', 1, 19, 50000, 45000, 75),
(28, 'Shochu Japonés', 'Shochu', 'Shochu de batata', 0.72, 25, 'shochu_japones.jpg', 1, 19, 55000, 50000, 65),
(29, 'Rakia Balcánica', 'Rakia', 'Rakia de ciruela', 0.7, 40, 'rakia_balcanica.jpg', 1, 19, 45000, 40000, 70),
(30, 'Genever Holandés', 'Ginebra', 'Genever estilo antiguo', 0.7, 35, 'genever_holandes.jpg', 1, 19, 55000, 50000, 60),
(31, 'Baijiu Chino', 'Baijiu', 'Baijiu de sorgo', 0.5, 53, 'baijiu_chino.jpg', 1, 19, 70000, 65000, 50);


-- Insertar datos en la tabla USUARIO
INSERT INTO USUARIO (id, username, email, nacimiento, password, name, lastname, status) VALUES
(1, 'juan123', 'juan@email.com', '1990-05-15', 'hash_password1', 'Juan', 'Pérez', 'active'),
(2, 'maria_g', 'maria@email.com', '1988-10-20', 'hash_password2', 'María', 'González', 'active'),
(3, 'carlos_r', 'carlos@email.com', '1995-03-08', 'hash_password3', 'Carlos', 'Rodríguez', 'active'),
(4, 'ana_m', 'ana@email.com', '1992-12-01', 'hash_password4', 'Ana', 'Martínez', 'active'),
(5, 'pedro_s', 'pedro@email.com', '1985-07-30', 'hash_password5', 'Pedro', 'Sánchez', 'inactive'),
(6, 'laura_l', 'laura@email.com', '1993-09-18', 'hash_password6', 'Laura', 'López', 'active'),
(7, 'diego_f', 'diego@email.com', '1991-02-25', 'hash_password7', 'Diego', 'Fernández', 'active'),
(8, 'sofia_b', 'sofia@email.com', '1987-11-12', 'hash_password8', 'Sofía', 'Blanco', 'active'),
(9, 'javier_h', 'javier@email.com', '1994-06-05', 'hash_password9', 'Javier', 'Hernández', 'active'),
(10, 'elena_t', 'elena@email.com', '1989-04-22', 'hash_password10', 'Elena', 'Torres', 'active');
-- Insertar datos en la tabla FACTURA
INSERT INTO FACTURA (id, fecha, id_user, total) VALUES
(1, '2023-05-01', 1, 150000),
(2, '2023-05-02', 2, 85000),
(3, '2023-05-03', 3, 120000),
(4, '2023-05-04', 4, 200000),
(5, '2023-05-05', 5, 75000),
(6, '2023-05-06', 6, 180000),
(7, '2023-05-07', 7, 95000),
(8, '2023-05-08', 8, 135000),
(9, '2023-05-09', 9, 110000),
(10, '2023-05-10', 10, 160000);
-- Insertar datos en la tabla PRODUCTOS_FACTURADOS
INSERT INTO PRODUCTOS_FACTURADOS (id_factura, id_producto, cantidad) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 6, 2),
(3, 4, 1),
(3, 5, 1),
(3, 8, 2),
(4, 7, 2),
(4, 9, 1),
(5, 10, 1),
(6, 1, 1),
(6, 2, 1),
(6, 3, 1),
(7, 5, 1),
(7, 6, 1),
(8, 4, 2),
(8, 8, 1),
(9, 3, 2),
(9, 7, 1),
(10, 9, 1),
(10, 10, 1);
-- Insertar datos en la tabla ENVIOS
INSERT INTO ENVIOS (id, id_user, destino, id_factura, monto, entrega) VALUES
(1, 1, 'Calle 123, Ciudad A', 1, 10000, '2023-05-03'),
(2, 2, 'Avenida 456, Ciudad B', 2, 8000, '2023-05-04'),
(3, 3, 'Plaza 789, Ciudad C', 3, 12000, '2023-05-05'),
(4, 4, 'Calle 321, Ciudad D', 4, 15000, '2023-05-06'),
(5, 5, 'Avenida 654, Ciudad E', 5, 9000, '2023-05-07'),
(6, 6, 'Plaza 987, Ciudad F', 6, 11000, '2023-05-08'),
(7, 7, 'Calle 135, Ciudad G', 7, 7000, '2023-05-09'),
(8, 8, 'Avenida 246, Ciudad H', 8, 13000, '2023-05-10'),
(9, 9, 'Plaza 357, Ciudad I', 9, 10000, '2023-05-11'),
(10, 10, 'Calle 468, Ciudad J', 10, 14000, '2023-05-12');