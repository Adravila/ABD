CREATE DATABASE ES_Smartcity;
use ES_Smartcity;

DROP TABLE IF EXISTS Ciudad;
CREATE TABLE Ciudad (
	id_ciudad BIGINT AUTO_INCREMENT,
	nombre VARCHAR(50),
	comunidad_auto VARCHAR(50),
	constraint pk_ciudad PRIMARY KEY (id_ciudad)
);

ALTER TABLE Ciudad AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Laboratorio;
CREATE TABLE Laboratorio (
	id_laboratorio BIGINT AUTO_INCREMENT,
	direccion VARCHAR(100),
	cod_postal INTEGER(6),
	id_ciudad BIGINT,
	constraint pk_laboratorio PRIMARY KEY (id_laboratorio),
	constraint fk_laboratorio_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

ALTER TABLE Laboratorio AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Proyecto;
CREATE TABLE Proyecto (
	id_proyecto BIGINT AUTO_INCREMENT,
	nombre VARCHAR(100),
	descripcion VARCHAR(240),
	fecha_ini DATE,
	fecha_fin DATE,
	universidad VARCHAR(50),
	id_ciudad BIGINT,
	id_laboratorio BIGINT,
	constraint pk_proyecto PRIMARY KEY (id_proyecto),
	constraint fk_proyecto_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
	constraint fk_proyecto_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio)	
);

ALTER TABLE Proyecto AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
	id_inventario BIGINT AUTO_INCREMENT,
	nombre VARCHAR(100),
	descripcion VARCHAR(240),
	fecha_alta DATE,
	fecha_retirada DATE,
	stock INTEGER,
	id_proyecto BIGINT,
	constraint pk_inventario PRIMARY KEY (id_inventario),
	constraint fk_inventario_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

ALTER TABLE Inventario AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Tribunal;
CREATE TABLE Tribunal (
	fecha_aprobacion DATE,
	id_ciudad BIGINT,
	id_proyecto BIGINT,
	constraint pk_fecha_aprobacion PRIMARY KEY (fecha_aprobacion),
	constraint fk_tribunal_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
	constraint fk_tribunal_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

ALTER TABLE Tribunal AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Persona;
CREATE TABLE Persona (
	DNIe VARCHAR(9),
	nombre VARCHAR(50),
	apellidos VARCHAR(50),
	direccion VARCHAR(100),
	telefono VARCHAR(20),
	ciudad VARCHAR(50),
	constraint pk_DNIe PRIMARY KEY (DNIe)
);

ALTER TABLE Persona AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
	DNIe VARCHAR(9) REFERENCES Persona,
	num_ss VARCHAR(20),
	rol VARCHAR(50),
	id_proyecto BIGINT,
	constraint pk_empleado PRIMARY KEY (DNIe,id_proyecto),
	constraint fk_empleado_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

ALTER TABLE Empleado AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS No_Empleado;
CREATE TABLE No_Empleado (
	DNIe VARCHAR(9) REFERENCES Persona,
	constraint pk_no_empleado PRIMARY KEY (DNIe)
);

ALTER TABLE No_Empleado AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS Feedback;
CREATE TABLE Feedback (
	id_feedback BIGINT AUTO_INCREMENT,
	comentario VARCHAR(500),
	fecha DATE,
	id_proyecto BIGINT, 
	DNIe VARCHAR(9),
	constraint pk_feedback PRIMARY KEY (id_feedback),
	constraint fk_feedback_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto),	
	constraint fk_feedback_persona FOREIGN KEY (DNIe) REFERENCES Persona(DNIe)	
);

ALTER TABLE Feedback AUTO_INCREMENT = 1;

