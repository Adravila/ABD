CREATE DATABASE biblioteca;
use biblioteca;
-- Ejercicio 1 *****************************************************

/**
DROP TABLE IF EXISTS Biblioteca;
CREATE TABLE Biblioteca(
	id_biblioteca BIGINT AUTO_INCREMENT,
	tipo ENUM('central', 'facultad', 'escuela'),
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_biblioteca)	
);
**/

DROP TABLE IF EXISTS Biblioteca_Central;
CREATE TABLE Biblioteca_Central(
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Biblioteca_Facultad_1;
CREATE TABLE Biblioteca_Facultad_1(
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Libros;
CREATE TABLE Libros_Facultad_1 (
	cod_libro BIGINT AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	autor VARCHAR(50),
	anno_publicacion SMALLINT,
	asunto VARCHAR(300),
	biblioteca VARCHAR(50),
	PRIMARY KEY (cod_libro)
);

DROP TABLE IF EXISTS Biblioteca_Facultad_2;
CREATE TABLE Biblioteca_Facultad_2(
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Libros;
CREATE TABLE Libros_Facultad_2 (
	cod_libro BIGINT AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	autor VARCHAR(50),
	anno_publicacion SMALLINT,
	asunto VARCHAR(300),
	biblioteca VARCHAR(50),
	PRIMARY KEY (cod_libro)	
);


-- User1 – puede consultar e insertar nuevos libros en todas las bibliotecas.
CREATE USER 'User1'@'localhost' IDENTIFIED BY 'passUser1';
GRANT SELECT, UPDATE ON biblioteca.* TO 'User1'@'localhost';

-- User2 – puede consultar e insertar nuevos libros sólo en su biblioteca.
CREATE USER 'User2'@'localhost' IDENTIFIED BY 'passUser2';
GRANT SELECT, UPDATE ON biblioteca.Biblioteca_Facultad_2 TO 'User2'@'localhost';
GRANT SELECT, UPDATE ON biblioteca.Libros TO 'User2'@'localhost';

-- User3 – puede consultar libros de todo el sistema de bibliotecas.
CREATE USER 'User3'@'localhost' IDENTIFIED BY 'passUser3';
GRANT SELECT ON biblioteca.* TO 'User3'@'localhost';

-- Ejercicio 2 *****************************************************
use practicasabd;

-- a) Conceda permiso al usuario User4 para poder consultar y actualizar el número, nombre y apellidos de los empleados

CREATE USER 'User4'@'localhost' IDENTIFIED BY 'passUser4';
GRANT SELECT (n_empleado, nombre, apellidos),
UPDATE (n_empleado, nombre, apellidos) 
ON practicasabd.empleados TO 'User4'@'localhost';
-- # Creando usuario y asignando permisos desde root

-- b) Conceda permiso al usuario User5 para poder consultar e insertar el número, nombre y apellidos de los empleados.
CREATE USER 'User5'@'localhost' IDENTIFIED BY 'passUser5'; 
GRANT SELECT (n_empleado, nombre, apellidos),
INSERT (n_empleado, nombre, apellidos) 
ON practicasabd.empleados TO 'User5'@'localhost';
-- # Creando usuario y asignando permisos desde root

-- c) Elimine los permisos de actualización para el User4 en todos los campos de “Empleados”.
REVOKE UPDATE ON practicasabd.empleados FROM 'User4'@'localhost'; -- Designando permisos desde root

-- d) Con User5 cree una nueva columna dentro de Empleados que se llame
-- “Departamento”. Si no dispone de los permisos suficientes, concédaselo de la forma adecuada
-- # No dispone de permisos para alterar una tabla

GRANT ALTER ON practicasabd.empleados TO 'User5'@'localhost'; -- # Asignando permisos desde root
ALTER TABLE empleados ADD COLUMN departamento VARCHAR(50); -- # Operando desde User5

-- e) Desde User5, conceda permisos de modificación sobre esa columna al User4.
-- # Damos privilegio de actualización en User5 para que luego pueda conceder dicho permiso al User4 
GRANT UPDATE (departamento) ON practicasabd.empleados TO 'User5'@'localhost' WITH GRANT OPTION;
-- # Desde root
GRANT UPDATE (departamento) ON practicasabd.empleados TO 'User4'@'localhost';
-- # Asignando permisos desde User5

-- f) Con User4 elimine esta nueva columna que ha sido creada
GRANT ALTER ON practicasabd.empleados TO 'User4'@'localhost';
-- # Desde root
ALTER TABLE empleados DROP COLUMN departamento;

-- g) Compruebe que en su base de datos no esté activada la opción de autocommit. En caso de que sí, desactívela.
SHOW VARIABLES LIKE 'autocommit';
-- # Sí, lo está.
SET autocommit = 0;

-- h) Con el usuario User5, introduzca 5 nuevos registros en la tabla “Empleados”
-- # Damos permisos de inserción en User5
-- GRANT INSERT ON practicasabd.empleados TO 'User5'@'localhost';

# Empezar la transacción
START TRANSACTION;
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo) VALUES (11111,"Manuel","Varo",1242);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo) VALUES (22222,"Mónica","Ruíz",1442);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo) VALUES (33333,"Joaquin","Pérez",1241);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo) VALUES (44444,"Marta","Guerra",1243);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo) VALUES (55555,"Alonso","Varo",1244);

-- i) Realice un commit para grabar la información
COMMIT;

-- j) Con el usuario User4, introduzca otros 5 nuevos registros.
# Damos permisos de inserción en User4 desde root
START TRANSACTION;
GRANT INSERT ON practicasabd.empleados TO 'User4'@'localhost';

INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo,departamento) VALUES (1911,"Ismael","Nieto",1242);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo,departamento) VALUES (1922,"José Javier","Tocino",1442);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo,departamento) VALUES (1933,"Carlos","Vélez",1241);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo,departamento) VALUES (1944,"Juan","Sánchez",1243);
INSERT INTO empleados (n_empleado,nombre,apellidos,sueldo,departamento) VALUES (1955,"Patricia","López",1244);

-- k) Con el usuario User5 haga una consulta de todos los registros existentes en la tabla.
GRANT SELECT ON practicasabd.empleados TO 'User5'@'localhost'; -- # Asignar permisos desde root
SELECT * FROM empleados;

-- l) Con el usuario User4 haga una consulta de todos los registros existentes.
GRANT SELECT ON practicasabd.empleados TO 'User4'@'localhost';  -- # Asignar permisos desde root
SELECT * FROM empleados;

-- m) Con el usuario User4 realice un rollback.
ROLLBACK;

-- n) Con el usuario User4 haga una consulta de todos los registros existentes
SELECT * FROM EMPLEADOS;

-- o) Explique el motivo por el cual se han obtenido los resultados de los apartados k, l y n.
-- # Como no se ha hecho el COMMIT y se hizo el ROLLBACK se ha cancelado todo el proceso.
-- # Se puede visualizar la consulta desde User4 antes del rollback dado de que este usuario
-- # podía ver los cambios que se estaba realizando durante su trabajo, mientras que el resto
-- # de usuarios no puede ver estos cambios hasta que User4 haga el COMMIT