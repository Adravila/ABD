-- Creación de la funcion duracion_proyecto que calcula el numero de dias trabajados en un proyecto

DELIMITER //
	CREATE FUNCTION duracion_proyecto(id INT) returns INT
	BEGIN
    	DECLARE dias INT;
    	DECLARE fecha_inicio DATE;
    	DECLARE fecha_final DATE;
	SELECT fecha_ini INTO fecha_inicio FROM Proyecto WHERE id_proyecto = id;
	SELECT fecha_fin INTO fecha_final FROM Proyecto WHERE id_proyecto = id;
	SET dias = DATEDIFF(fecha_final, fecha_inicio);
	return dias;
	END
//

-- Procedimiento que devuelve los comentarios que tiene un proyecto indicado

DELIMITER //
	CREATE PROCEDURE comentarios (IN id INTEGER)
	BEGIN
	SELECT comentario FROM feedback WHERE id_proyecto = id;
	END
//
