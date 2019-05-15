-- Creación de una auditoría para tener el control del sistema
CREATE TABLE auditoria_inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_inventario BIGINT NOT NULL,
    fecha DATETIME DEFAULT NULL,
    accion VARCHAR(50) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER before_inventary_update 
    BEFORE UPDATE ON inventario
    FOR EACH ROW 
BEGIN
DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
    INSERT INTO auditoria_inventario SET accion = 'update', id_inventario = OLD.id_inventario, fecha = NOW(), usuario = vUser;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER inventary_after_insert 
    AFTER INSERT ON inventario
    FOR EACH ROW 
BEGIN
	DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
	    INSERT INTO auditoria_inventario SET accion = 'insert', id_inventario = NEW.id_inventario, fecha = NOW(), usuario = vUser; 
END$$

DELIMITER ;
