-- Inserción de los datos de las distintas ciudades de España
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Barbate','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Jerez','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Málaga','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Sevilla','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Madrid','Comunidad de Madrid');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Toledo','Castilla la Mancha');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Mijas','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('País Vasco','Abaltzisketa');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('La Coruña','Galicia');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Losar de la Vera','Extremadura');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Cáceres','Extremadura');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Córdoba','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Badajoz','Extremadura');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Conil de la Frontera','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Chiclana','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('San Fernando','Andalucía');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Logroño','La Rioja');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Valladolid','Castilla y León');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Ceuta','n/a');
INSERT INTO ciudad (nombre, comunidad_auto) VALUES ('Melilla','n/a');

-- Inserción de los datos de las personas (personas que SÍ son empleados)
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('76444759G','Adrián','Dávila','Puerto Real','C/ Tomillo 13', '666888601');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('17127531H','José','Gómez','Cádiz','C/ Real 13', '666888602');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('94912431F','María','Arias','Madrid','C/ Falsa 13', '666888603');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('88543331F','Esther','Pérez','Valencia','C/ Falsa 13', '666888604');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('81000114V','Gema','Benítez','Chicalana','C/ Falsa 13', '666888605');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('41294942F','Anna','Bernal','Córdoba','C/ Falsa 13', '666888606');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('44441134F','David','Guerra','Granada','C/ Falsa 13', '666888607');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('85823411B','Ismael','Broncano','Vejer de la Frontera','C/ Falsa 13', '666888608');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('15122234G','Joaquín','Paniagua','Jerez de la Frontera','C/ Falsa 13', '666888609');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('99947321V','Luis','Hernández','Madrid','C/ Falsa 13', '666888610');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('99177422A','Marisa','López','Puerto Real','C/ Falsa 13', '666888611');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('44488212E','Samantha','Quiros','Cádiz','C/ Falsa 13', '666888612');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('98764832B','Francisco','Álvarez','Málaga','C/ Falsa 13', '666888613');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('76533759Z','Ernesto','Pérez','Barcelona','C/ Falsa 13', '666888614');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('76446532X','Andrés','López','La Coruña','C/ Falsa 13', '666888615');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('63244759G','Miguel','Anillo','Madrid','C/ Falsa 13', '666888616');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('11154759R','Laura','Ramírez','Salamanca','C/ Falsa 13', '666888617');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('78913943O','Catalina','Guerra','Sevilla','C/ Falsa 13', '666888618');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('87774339F','María Isabel','Bernal','Sevilla','C/ Falsa 13', '666888619');

-- Inserción de los datos de las personas (personas que NO son empleados)
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('12312344F','Mario','Gómez','Puerto Real','C/ Tomillo 13', '666888620');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('12415532A','José','Dominguez','Cádiz','C/ Falsa 13', '666888621');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('99812412V','Raquel','Arias','Madrid','C/ Falsa 13', '666888622');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('21413281V','María','Fernández','Valencia','C/ Falsa 13', '666888623');
INSERT INTO persona (DNIe, nombre, apellidos, ciudad, direccion, telefono) VALUES ('12412991A','Alonso','Pérez','Chicalana','C/ Falsa 13', '666888624');

-- Inserción de los datos de los distintos laboratorios que hay por cada ciudad, puede haber algunos en la misma ciudad dando otra dirección
INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ San Pedro 21',4,29001);
INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ Madrid Nº 3',4,29002);
INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ Cruz 13',1,12414);

-- Inserción de los datos de los distintos proyectos existentes
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Alumbrado solar','prueba','03-05-21','03-05-23','Universidad de Sevilla',4,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('IoT en cañerías','prueba','03-05-21','03-05-23','Universidad de Cádiz',1,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('IoT en carreteras','prueba','03-05-21','03-05-23','Universidad de Castilla-La Mancha',6,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Agricultura inteligente basada en IoT','prueba','03-05-21','03-05-23','Universidad de Extremadura',10,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Control de comercios','prueba','03-05-21','03-05-23','Universidad de Cádiz',2,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Detección de terremotos','prueba','03-05-21','03-05-23','Universidad de Cádiz',14,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Energías renovables basadas en IoT','prueba','03-05-21','03-05-23','Universidad de Cádiz',15,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('IoT en cañerías','prueba','03-05-21','03-05-23','Universidad de Málaga',3,1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad, id_laboratorio) VALUES ('Control de tráfico','prueba','03-05-21','03-05-23','Universidad de Sevilla',4,1);

-- Inserción de los datos de los empleados
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('76444759G','01234567890','Desarrollador',1);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('17127531H','18418248141','Desarrollador',2);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('94912431F','53252351321','Desarrollador',3);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('88543331F','91284771442','Desarrollador',4);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('81000114V','19238126533','Técnico superior',5);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('41294942F','08182480081','Desarrollador',4);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('44441134F','12848191292','Desarrollador',2);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('85823411B','10947102701','Desarrollador',1);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('15122234G','18094047510','Tester',5);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('99947321V','10792427213','Tester',5);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('87774339F','12498129844','Tester',4);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('99177422A','12412512123','Desarrollador',3);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('44488212E','11111111111','Desarrollador',2);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('78913943O','22222222222','Técnico superior',5);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('98764832B','33333333333','Técnico superior',2);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('76533759Z','44444444444','Técnico superior',1);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('76446532X','55555555555','Desarrollador',1);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('63244759G','66666666666','Desarrollador',3);
INSERT INTO empleado (DNIe, num_ss, rol, id_proyecto) VALUES ('11154759R','77777777777','Desarrollador',1);

-- Inserción de los datos de los empleados
INSERT INTO no_empleado (DNIe) VALUES ('12312344F');
INSERT INTO no_empleado (DNIe) VALUES ('12415532A');
INSERT INTO no_empleado (DNIe) VALUES ('99812412V');
INSERT INTO no_empleado (DNIe) VALUES ('21413281V');
INSERT INTO no_empleado (DNIe) VALUES ('12412991A');

-- Inserción de los datos del inventario de todos los proyectos existentes
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condensador','Descripción de Condensador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condensador','Descripción de Condensador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condensador','Descripción de Condensador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condensador','Descripción de Condensador','03-05-21','03-05-23',32,1);

-- Inserción de los datos de las fechas de acuerdo y aprobación para la realización del proyecto
INSERT INTO tribunal (fecha_aprobacion, id_ciudad , id_proyecto) VALUES ('03-05-21',3,1);

INSERT INTO feedback (comentario, fecha, id_proyecto, DNIe) VALUES ("Estaría bien añadir Dijkstra en lugar de Floyd, ya que lo que vas a empezar desde un origen para calcular las distintas rutas posibles y no a partir de varios.",'03-05-21',3,'99812412V');
INSERT INTO feedback (comentario, fecha, id_proyecto, DNIe) VALUES ("Sería una mejor opción utilizar un radar que detecte la matrícula y la velocidad del vehículo, de esta manera podrás hacer una media a partir del número de sensores que se esté utilizando de los vehículos que vayan pasando por la ruta. Utilizar varios sensores de movimiento en la carretera sería algo bastante costoso y puede dar muchos problemas.",'03-05-21',3,'99812412V');
INSERT INTO feedback (comentario, fecha, id_proyecto, DNIe) VALUES ("¿Habéis considerado en ubicar el sensor en un lugar más estable en cuanto a la temperatura de la ubicación? De no ser así podría dadr problemas dependiendo del clima del lugar.",'05-05-21',4,'15122234G');
                                                                                                     
