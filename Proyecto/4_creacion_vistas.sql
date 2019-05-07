-- Vista de los datos completos que son empleados
-- Motivo: Llevar a cabo el objetivo de conocer con más detalle la información completa de los empleados

CREATE OR REPLACE VIEW datos_empleados AS
  SELECT P.*, num_ss
  FROM Persona P, Empleado E 
  WHERE P.dnie = E.dnie;

SELECT * FROM datos_empleados;

-- Vista de los datos completos que no son empleados
-- Motivo: Llevar a cabo el objetivo de conocer con más detalle la información completa de los que no son empleados

CREATE OR REPLACE VIEW datos_no_empleados AS
  SELECT P.*, E.num_comentarios
  FROM Persona P, No_Empleado E 
  WHERE P.dnie = E.dnie;

SELECT * FROM datos_no_empleados;

