DROP DATABASE IF EXISTS login_roles_db;

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS login_roles_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE login_roles_db;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(100) NOT NULL UNIQUE,
  password  VARCHAR(100) NOT NULL,
  rol ENUM('admin', 'cliente') NOT NULL DEFAULT 'cliente'
);

-- Insertar usuario administrador
INSERT INTO usuarios (nombre, correo, password, rol)
VALUES ('Administrador', 'admin@correo.com', '12345', 'admin');

-- Insertar usuario cliente
INSERT INTO usuarios (nombre, correo, password, rol)
VALUES ('Juan Pérez', 'juan@correo.com', '12345', 'cliente');


CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,3) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Laptop Lenovo IdeaPad 3', '15.6" FHD, Ryzen 5, 16GB RAM, 512GB SSD', 799.999, 10),
('Mouse Logitech M510', 'Mouse inalámbrico ergonómico USB', 29.900, 25),
('Monitor Samsung 24" Curvo', 'Full HD, HDMI, Freesync 75Hz', 189.999, 15),
('Teclado Mecánico Redragon Kumara', 'Switch Red, retroiluminado RGB', 59.900, 30),
('Auriculares Sony WH-CH520', 'Bluetooth, micrófono integrado, batería 50h', 89.999, 20),
('Impresora HP DeskJet 4155e', 'Multifuncional WiFi, compatible con HP+, A4', 129.000, 8),
('Tablet Samsung Galaxy Tab A8', '10.5", 4GB RAM, 64GB almacenamiento', 249.999, 12),
('Silla Gamer Cougar Armor One', 'Ergonómica, ajuste 180°, cuero PU', 249.000, 5),
('Smartwatch Amazfit Bip U Pro', 'GPS integrado, monitor de ritmo cardíaco', 69.999, 18),
('Disco Duro Externo Seagate 2TB', 'USB 3.0, portátil, negro', 79.999, 20);



CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'pendiente',

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);
