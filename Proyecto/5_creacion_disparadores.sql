-- Creación de una auditoría para tener el control del sistema
CREATE TABLE auditoria_inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DNIe INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha DATETIME DEFAULT NULL,
    accion VARCHAR(50) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL
);

DELIMITER $$

CREATE TRIGGER before_inventary_update 
    BEFORE UPDATE ON empleado
    FOR EACH ROW 
BEGIN
	DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
    INSERT INTO auditoria_inventario SET accion = 'update', DNIe = OLD.DNIe, nombre = OLD.nombre, apellidos = OLD.apellidos, fecha = NOW(), usuario = vUser;
END$$

CREATE TRIGGER inventary_after_insert 
    AFTER INSERT ON empleado
    FOR EACH ROW 
BEGIN
	DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
    INSERT INTO auditoria_inventario SET accion = 'insert', DNIe = NEW.emp_no, nombre = NEW.nombre, apellidos = NEW.apellidos, fecha = NOW(), usuario = vUser; 
END$$

DELIMITER ;
