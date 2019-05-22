-- Usamos una transaccion para insertar un componente, modificar el stock y mostrar los componentes

BEGIN;
INSERT INTO `componente` (`id_componente`, `nombre`, `descripcion`, `fecha_alta`, `fecha_retirada`, `stock`, `id_proyecto`) VALUES (NULL, 'Tornillo ', 'Tornillo para tuberias', '2019-05-08', '2019-05-31', '50', '1');
UPDATE componente C SET C.stock = C.stock - 1 WHERE C.id_componente = 1;
SELECT * FROM componente;
COMMIT;


-- Usamos una transacción a la hora de crear un proyecto, se le asigna un tribunal "En espera"

BEGIN;
INSERT INTO proyecto (id_proyecto, nombre, descripcion, fecha_ini, fecha_fin, universidad, presupuesto, id_ciudad, id_laboratorio) VALUES (22,'Semaforos UCA','prueba',NULL,NULL,'Universidad de Cadiz',1000000,4,1);
INSERT INTO tribunal (fecha_aprobacion, id_ciudad , id_proyecto, decision) VALUES (NULL,3,22,'En Espera');
COMMIT;


-- Usamos una transacción para insertar un empleado y crearle un registro en la tabla salario.

BEGIN;
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('55849654K','Eduardo','Muñoz','Sevilla','C/ Falsa 13', '888888888');
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('55849654K','888888888','Desarrollador',1);
INSERT INTO salario (num_ss, salario, fecha_inicio, fecha_fin) VALUES ('888888888',1899,'2019-08-12','2021-01-01');
COMMIT;
