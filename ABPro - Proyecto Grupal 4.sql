-- Parte 1: Crear entorno de trabajo
CREATE DATABASE ingresos;
CREATE USER 'DanipaBernales'@'localhost' IDENTIFIED BY 'contrasena';
GRANT ALL PRIVILEGES ON ingresos.* TO 'DanipaBernales'@'localhost';

-- Parte 2: Crear dos tablas
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    contrasena VARCHAR(30),
    zona_horaria VARCHAR(10) DEFAULT 'UTC-3', 
    genero ENUM('M', 'F'), 
    telefono VARCHAR(15)
);

CREATE TABLE ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    ultimo_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Parte 3: Modificación de la tabla
ALTER TABLE usuarios
MODIFY COLUMN zona_horaria VARCHAR(10) DEFAULT 'UTC-2';

-- Parte 4: Creación de registros.
INSERT INTO usuarios (nombre, apellido, contrasena, genero, telefono) 
VALUES
('Juan', 'Pérez', '123456', 'M', '12345678'),
('María', 'González', 'abcdef', 'F', '98765432'),
('Pedro', 'López', 'qwerty', 'M', '45678901'),
('Ana', 'Martínez', 'zxcvbn', 'F', '65432109'),
('Luis', 'Sánchez', '098765', 'M', '78901234'),
('Laura', 'Hernández', 'poiuyt', 'F', '23456789'),
('Carlos', 'Ruiz', '987654', 'M', '89012345'),
('Sofía', 'Díaz', 'mnbvcx', 'F', '56789012');

INSERT INTO ingresos (id_usuario) 
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
/* 
Nombre y Apellido: VARCHAR porque la longitud puede variar y no se necesita realizar operaciones aritméticas con ellos.
Contraseña: VARCHAR es adecuado para almacenar contraseñas como cadenas de texto.
Zona Horaria: VARCHAR, ya que son cadenas de texto.
Género: ENUM, ya que se limita a valores específicos.
Teléfono: VARCHAR es adecuado para almacenar números de teléfono ya que pueden contener caracteres especiales y su longitud puede variar.
*/

-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,correo electronico)
CREATE TABLE contactos (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    numero_telefono VARCHAR(15), -- VARCHAR es adecuado para almacenar números de teléfono.
    correo_electronico VARCHAR(50), -- VARCHAR es adecuado para almacenar direcciones de correo electrónico.
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos
ALTER TABLE contactos
ADD CONSTRAINT fk_usuario_contacto FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
