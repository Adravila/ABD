CREATE DATABASE ES_Smartcity;
use ES_Smartcity;

DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Componente;
DROP TABLE IF EXISTS Inventario;
DROP TABLE IF EXISTS No_Empleado;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Salario;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Tribunal;
DROP TABLE IF EXISTS Proyecto;
DROP TABLE IF EXISTS Laboratorio;
DROP TABLE IF EXISTS Ciudad;

CREATE TABLE Ciudad (
	id_ciudad BIGINT AUTO_INCREMENT,
	nombre VARCHAR(50),
	comunidad_auto VARCHAR(50),
	constraint pk_ciudad PRIMARY KEY (id_ciudad)
);

CREATE TABLE Laboratorio (
	id_laboratorio BIGINT AUTO_INCREMENT,
	direccion VARCHAR(100),
	cod_postal INTEGER(6),
	id_ciudad BIGINT,
	constraint pk_laboratorio PRIMARY KEY (id_laboratorio),
	constraint fk_laboratorio_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE Proyecto (
	id_proyecto BIGINT AUTO_INCREMENT,
	nombre VARCHAR(100),
	descripcion VARCHAR(240),
	fecha_ini DATE,
	fecha_fin DATE,
	universidad VARCHAR(50),
	presupuesto DOUBLE,
	id_ciudad BIGINT,
	id_laboratorio BIGINT,
	constraint pk_proyecto PRIMARY KEY (id_proyecto),
	constraint fk_proyecto_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio)	
);

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

CREATE TABLE Tribunal (
	id_tribunal BIGINT AUTO_INCREMENT,
	fecha_publicacion DATE,
	id_ciudad BIGINT,
	id_proyecto BIGINT,
	decision ENUM('Aceptado','Denegado','En espera'), 
	constraint pk_tribunal PRIMARY KEY (id_tribunal),
	constraint fk_tribunal_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad),
	constraint fk_tribunal_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

CREATE TABLE Persona (
	DNIe VARCHAR(9),
	nombre VARCHAR(50),
	apellidos VARCHAR(50),
	direccion VARCHAR(100),
	telefono VARCHAR(20),
	ciudad VARCHAR(50),
	constraint pk_DNIe PRIMARY KEY (DNIe)
);

CREATE TABLE Empleado (
	DNIe VARCHAR(9) REFERENCES Persona,
	num_ss VARCHAR(11) UNIQUE,
	rol VARCHAR(25),
	id_proyecto BIGINT,
	id_laboratorio BIGINT,
	constraint pk_empleado PRIMARY KEY (DNIe,id_proyecto),
	constraint fk_empleado_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio),
	constraint fk_empleado_proyecto FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

CREATE TABLE Salario (
	id_salario BIGINT AUTO_INCREMENT,
	num_ss VARCHAR(11) UNIQUE,
	salario DOUBLE,
	fecha_inicio DATE,
	fecha_fin DATE,
	constraint DNIe PRIMARY KEY (id_salario),
	constraint fk_sueldo_empleado FOREIGN KEY (num_ss) REFERENCES Empleado(num_ss)
);

CREATE TABLE No_Empleado (
	DNIe VARCHAR(9) REFERENCES Persona,
	constraint pk_no_empleado PRIMARY KEY (DNIe)
);

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

ALTER TABLE Tribunal AUTO_INCREMENT = 1;
ALTER TABLE Feedback AUTO_INCREMENT = 1;
ALTER TABLE Inventario AUTO_INCREMENT = 1;
ALTER TABLE No_Empleado AUTO_INCREMENT = 1;
ALTER TABLE Salario AUTO_INCREMENT = 1;
ALTER TABLE Persona AUTO_INCREMENT = 1;
ALTER TABLE Laboratorio AUTO_INCREMENT = 1;
ALTER TABLE Ciudad AUTO_INCREMENT = 1;
ALTER TABLE Proyecto AUTO_INCREMENT = 1;
ALTER TABLE Empleado AUTO_INCREMENT = 1;
