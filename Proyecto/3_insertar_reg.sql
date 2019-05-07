-- Inserción de los datos de las distintas ciudades de España
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Barbate','Andalucía',11160);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Jerez','Andalucía',11401);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Málaga','Andalucía',29001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Sevilla','Andalucía',41001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Madrid','Comunidad de Madrid',28001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Toledo','Castilla la Mancha',45001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Mijas','Andalucía',29650);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('País Vasco','Abaltzisketa',20269);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('La Coruña','Galicia',15001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Losar de la Vera','Extremadura',10460);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Cáceres','Extremadura',10001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Córdoba','Andalucía',14001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Badajoz','Extremadura',06001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Conil de la Frontera','Andalucía',11140);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Chiclana','Andalucía',11130);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('San Fernando','Andalucía',11100);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Logroño','La Rioja',26001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Valladolid','Castilla y León',47001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Ceuta','n/a',51001);
INSERT INTO ciudad (nombre, comunidad_auto, cod_postal) VALUES ('Melilla','n/a',52001);

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
INSERT INTO persona (DNIe, nombre, apellidos, direccion, ciudad, telefono) VALUES ('12312344F','Mario','Gómez','Puerto Real','C/ Tomillo 13', '666888620');
INSERT INTO persona (DNIe, nombre, apellidos, direccion, ciudad, telefono) VALUES ('12415532A','José','Dominguez','Cádiz','C/ Falsa 13', '666888621');
INSERT INTO persona (DNIe, nombre, apellidos, direccion, ciudad, telefono) VALUES ('99812412V','Raquel','Arias','Madrid','C/ Falsa 13', '666888622');
INSERT INTO persona (DNIe, nombre, apellidos, direccion, ciudad, telefono) VALUES ('21413281V','María','Fernández','Valencia','C/ Falsa 13', '666888623');
INSERT INTO persona (DNIe, nombre, apellidos, direccion, ciudad, telefono) VALUES ('12412991A','Alonso','Pérez','Chicalana','C/ Falsa 13', '666888624');

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

-- Inserción de los datos de los distintos proyectos existentes
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Alumbrado solar','prueba','03-05-21','03-05-23','Universidad de Sevilla',4);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('IoT en cañerías','prueba','03-05-21','03-05-23','Universidad de Cádiz',1);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('IoT en carreteras','prueba','03-05-21','03-05-23','Universidad de Castilla-La Mancha',6);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Agricultura inteligente basada en IoT','prueba','03-05-21','03-05-23','Universidad de Extremadura',10);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Control de comercios','prueba','03-05-21','03-05-23','Universidad de Cádiz',2);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Detección de terremotos','prueba','03-05-21','03-05-23','Universidad de Cádiz',14);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Energías renovables basadas en IoT','prueba','03-05-21','03-05-23','Universidad de Cádiz',15);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('IoT en cañerías','prueba','03-05-21','03-05-23','Universidad de Málaga',3);
INSERT INTO proyecto (nombre, descripcion, fecha_ini, fecha_fin, universidad, id_ciudad) VALUES ('Control de tráfico','prueba','03-05-21','03-05-23','Universidad de Sevilla',4);

INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condesador','Descripción de Condesador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condesador','Descripción de Condesador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condesador','Descripción de Condesador','03-05-21','03-05-23',32,1);
INSERT INTO inventario (nombre, descripcion, fecha_alta, fecha_retirada, stock, id_proyecto) VALUES ('Condesador','Descripción de Condesador','03-05-21','03-05-23',32,1);

INSERT INTO tribunal (fecha_aprobacion, id_ciudad , id_proyecto) VALUES ('03-05-21',3,1);

INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ San Pedro 21',4,29001);
INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ Madrid Nº 3',4,29002);
INSERT INTO laboratorio (direccion, id_ciudad, cod_postal) VALUES ('C/ Madrid Nº 3',4,29002);


                                                                                                     
