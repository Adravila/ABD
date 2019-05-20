-- Vista de los datos completos que son empleados
-- Motivo: Llevar a cabo el objetivo de conocer con más detalle la información completa de los empleados

CREATE OR REPLACE VIEW datos_empleados AS
  SELECT P.*, num_ss
  FROM Persona P, Empleado E 
  WHERE P.dnie = E.dnie;

SELECT * FROM datos_empleados;

-- Vista de los datos completos de las personas que son empleados o no
-- Motivo: Conocer los usuarios activos del feedback, incluye el número de comentarios 

CREATE OR REPLACE VIEW personas_feedback AS
  SELECT P.*, count(*) as comentarios
  FROM Persona P, Feedback F 
  WHERE P.DNIe = F.DNIe
  GROUP BY DNIe;

SELECT * FROM personas_feedback;

-- Vista de los proyectos realizados en las diferentes ciudades de España junto con la dirección de sus laboratorios.
-- Motivo: Conocer las ciudades queconsideran Smart City

CREATE OR REPLACE VIEW proyectos_laboratorio AS
	SELECT P.nombre as Nombre_Proyecto, L.direccion, C.nombre
	FROM Proyecto P, Laboratorio L, Ciudad C
	WHERE L.id_laboratorio = P.id_laboratorio AND L.id_ciudad = C.id_ciudad;

SELECT * FROM proyectos_laboratorio;
