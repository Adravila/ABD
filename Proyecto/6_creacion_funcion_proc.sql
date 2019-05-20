-- Creación de la funcion duracion_proyecto que calcula el numero de dias trabajados en un proyecto

DELIMITER //
	CREATE FUNCTION duracion_proyecto4(id INT) returns INT
	BEGIN
    DECLARE dias INT;
    DECLARE fecha_inicio DATE;
    DECLARE fecha_final DATE;
	SELECT fecha_ini INTO fecha_inicio FROM Proyecto WHERE id_proyecto = id;
	SELECT fecha_fin INTO @fecha_fin FROM Proyecto WHERE id_proyecto = id;
	SET dias = DATEDIFF(@fecha_fin, fecha_inicio);
	return dias;
	END
//
