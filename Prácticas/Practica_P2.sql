use employees;
-- 
-- Ejercicio 1 **********************************************************

CREATE TABLE empleados AS SELECT * FROM employees;
CREATE TABLE departamentos AS SELECT * FROM departments;
CREATE TABLE gerente_departamento AS SELECT * FROM dept_manager;
CREATE TABLE salarios AS SELECT * FROM salaries;
CREATE TABLE titulos AS SELECT * FROM titles;
CREATE TABLE departamentos_empleados_ultima_fecha AS SELECT * FROM dept_emp_latest_date;
CREATE TABLE departamento_empleados_fecha_actual AS SELECT * FROM dept_emp_latest_date;

-- Si vemos por ejemplo el esquema interno de la tabla 'empleados' podemos ver que utiliza el mismo esquema 
-- que el de la tabla 'employees'

describe empleados;

-- Ejercicio 2 **********************************************************

create database PracticasABD;
use PracticasABD

CREATE TABLE lectores (
	dni varchar(9),
	nombre varchar(30) NOT NULL,
	apellidos varchar(50) NOT NULL,
	domicilio varchar(50),
	poblacion varchar(50),
	constraint pk_lectores PRIMARY KEY (dni)
);

CREATE TABLE libros (
	cod_libro INTEGER AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	autor_principal VARCHAR(50),
	asunto VARCHAR(50),
	anno_publicacion SMALLINT,
	constraint pk_libros PRIMARY KEY (cod_libro)
);

DROP TABLE prestamos;
CREATE TABLE prestamos (
	cod_pedido INTEGER AUTO_INCREMENT,
	fecha_salida date NOT NULL,
	fecha_devolucion date,
	fecha_max_entrega date NOT NULL,
	id_lector varchar(9),
	id_libro integer,
	constraint pk_prestamos PRIMARY KEY (cod_pedido),
	constraint fk_prestamos_lectores FOREIGN KEY (id_lector) REFERENCES lectores(dni),
	constraint fk_prestamos_libros FOREIGN KEY (id_libro) REFERENCES libros(cod_libro)
);

-- Insertar registros en Personas, Libros y Pr�stamo

INSERT INTO lectores (dni, nombre, apellidos, domicilio, poblacion) VALUES ("76444759G", "Adri�n", "D�vila Guerra", "C/ Flor P2", "C�diz");
INSERT INTO lectores (dni, nombre, apellidos, domicilio, poblacion) VALUES ("1241245AF", "Juan", "Gallardo Varo", "C/ Placer P5", "Sevilla");

INSERT INTO  libros (titulo, autor_principal, asunto, anno_publicacion) 
VALUES ("Programaci�n concurrente (Inform�tica)", "JOS� TOM�S PALMA M�NDEZ", "...", 2003);

INSERT INTO libros (titulo, autor_principal, asunto, anno_publicacion) 
VALUES ("Planeta mar (Enciclopedia De La Ciencia)", "Tikal Ediciones S A", "...", 2018);

INSERT INTO prestamos (fecha_salida,fecha_devolucion ,fecha_max_entrega ,id_lector,id_libro) 
VALUES ('2019-03-14','2019-03-23','2019-05-15',"76444759G",1);
INSERT INTO prestamos (fecha_salida, fecha_max_entrega ,id_lector,id_libro) 
VALUES ('2019-03-16','2019-05-17',"1241245AF",2);

-- Mostrar contenido de la tres tablas creadas;
SELECT * FROM lectores;
SELECT * FROM libros;
SELECT * FROM prestamos;

-- Consulta gen�rica que nos diga qu� libros tienen en pr�stamo cada lector en cada fecha
SELECT T.DNI, L.titulo, P.fecha_salida, P.fecha_devolucion, P.fecha_max_entrega
FROM Lectores T, Libros L, Prestamos P
WHERE T.DNI = P.id_lector AND L.cod_libro = P.id_libro AND fecha_devolucion IS NULL;

-- Explicaci�n: Los libros que est�n pr�stamo tienen una fecha de devoluci�n,
-- si la fecha de devoluci�n es nula entonces la persona a�n no ha devuelto
-- dicho libro, por tanto, la consulta mostrar�n los libros a�n siguen en pr�stamo
-- pero no los que ya han concluido dicho plazo.

-- Ejercicio 3 **********************************************************

-- Cree las tablas, defina las claves primarias de dichas tablas e introduzca al menos dos
-- registros en cada una de ellas

-- Explicaci�n: No he incluido la columna 'Nombre' en la tabla 'Hablar' ya que el DNI identifica de manera �nica a su propietario,
-- por lo que he creado los datos de la persona a partir de otra tabla.
-- Tambi�n he creado una nueva tabla para el 'Idioma' dado de que el atributo Idioma ser�a una cadena
-- de caracteres, por lo que podr�a contener caracteres sobrantes y en su lugar he incluido el tipo
-- smallint (que tiene un intervalo de -2^15 (-32.768) a 2^15-1 (32.767), en esta tabla contendr� el nombre que se le identifica

CREATE TABLE hablar (
	dni varchar(9),
	cod_idioma smallint,
	nivel_conocimiento varchar(2) NOT NULL,
	constraint pk_hablar primary key(dni,cod_idioma)
);

CREATE TABLE idiomas (
	cod_idioma smallint,
	nombre varchar(20),
	constraint pk_idiomas PRIMARY KEY (cod_idioma)
);

CREATE TABLE personas (
	dni varchar(9),
	nombre varchar(30) NOT NULL,
	apellidos varchar(50) NOT NULL,
	domicilio varchar(50),
	poblacion varchar(50),
	constraint pk_personas PRIMARY KEY (dni)
);

INSERT INTO hablar (dni, cod_idioma, nivel_conocimiento) values ('76444751H',123,'A1');
INSERT INTO hablar (dni, cod_idioma, nivel_conocimiento) values ('12512533G',234,'B2');

INSERT INTO idiomas (cod_idioma, nombre) VALUES (123,"Ingl�s");
INSERT INTO idiomas (cod_idioma, nombre) VALUES (234,"Franc�s");

INSERT INTO personas (dni, nombre, apellidos, domicilio, poblacion) 
VALUES ("76444751H", "Juan", "Gallardo Varo", "C/ Placer P5", "Sevilla");
INSERT INTO personas (dni, nombre, apellidos, domicilio, poblacion) 
VALUES ("12512533G", "Laura", "Ramirez", "C/ Tomillo 15", "C�diz");

-- Probando consulta: Personas que tengan un nivel de conocimiento A1 en ingl�s
SELECT P.* 
FROM personas P, hablar H, idiomas I 
WHERE P.dni = H.dni AND I.cod_idioma = H.cod_idioma 
AND I.nombre = "Ingles" AND nivel_conocimiento = "A1";

-- Ejercicio 4 **********************************************************

CREATE DATABASE bibliotecas;
use bibliotecas;

CREATE TABLE bibliotecas (
	id_biblioteca INTEGER AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL DEFAULT 'Biblioteca Central',
	ubicacion VARCHAR(50) NOT NULL,
	constraint pk_bibliotecas PRIMARY KEY (id_biblioteca)
);

CREATE TABLE libros (
	cod_libro INTEGER AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	autor_principal VARCHAR(50),
	asunto VARCHAR(50),
	anno_publicacion SMALLINT,
	id_biblioteca INTEGER,
	constraint pk_libros PRIMARY KEY (cod_libro),
	constraint fk_libros_bibliotecas FOREIGN KEY (id_biblioteca) REFERENCES bibliotecas (id_biblioteca)
);

-- Insertar datos de la bibliotecas
INSERT INTO bibliotecas (nombre, ubicacion) VALUES ("Facultada de Filosof�a y Letras","C�diz");
INSERT INTO bibliotecas (nombre, ubicacion) VALUES ("Facultad de Ciencias del Mar","Puerto Real");
INSERT INTO bibliotecas (nombre, ubicacion) VALUES ("Escuela Superior de Ingenier�a","Puerto Real");

-- Insertar datos de los libros
INSERT INTO libros (titulo, autor_principal, asunto, anno_publicacion, id_biblioteca) 
VALUES ("Programaci�n concurrente (Inform�tica)", "JOS� TOM�S PALMA M�NDEZ", "...", 2003,3);

INSERT INTO libros (titulo, autor_principal, asunto, anno_publicacion, id_biblioteca) 
VALUES ("Eug�nesis: I Antolog�a Ciencia Ficci�n Cruce de Caminos", "Carter Damon y Alicia del Rosario", "...", 2019,2);

INSERT INTO libros (titulo, autor_principal, asunto, anno_publicacion, id_biblioteca) 
VALUES ("Planeta mar (Enciclopedia De La Ciencia)", "Tikal Ediciones S A", "...", 2018,2);

-- Ejemplo de consulta:

-- �Qu� libros podremos encontrar en la localidad de Puerto Real?
SELECT L.titulo, L.autor_principal 
FROM libros L, bibliotecas B 
WHERE L.id_biblioteca = B.id_biblioteca AND B.ubicacion = "Puerto Real";

-- Ejercicio 5 **********************************************************

USE practicasABD;

-- Crear tabla con restricciones de integridad (a)
DROP TABLE empleados;
CREATE TABLE empleados (
	n_empleado INTEGER CHECK (n_empleado > 0),
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	sueldo INTEGER CHECK (sueldo > 0),
	PRIMARY KEY (n_empleado)
);

-- Insetar datos de los empleados (b)
INSERT INTO empleados (n_empleado, nombre, apellido, sueldo) VALUES (123, "Maria", "Garc�a", 1200);
INSERT INTO empleados (n_empleado, nombre, apellido, sueldo) VALUES (456, "Luis", "Smith", 900);
INSERT INTO empleados (n_empleado, nombre, apellido, sueldo) VALUES (789, "Jose", "L�pez", 2800);

-- Ver datos
SELECT * FROM empleados;

-- Actualizar los sueldos de todos los empleados aument�ndolos en un 30% (c)
UPDATE empleados SET sueldo = sueldo + sueldo * 0.3;

-- Deseamos cambiar el nombre de la columna �Apellido� por �Apellidos� (d)
ALTER TABLE empleados RENAME COLUMN Apellido TO Apellidos;