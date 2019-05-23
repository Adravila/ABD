
-- Consulta
SELECT num_ss, salario FROM salario WHERE num_ss = 01234567890 OR num_ss = 10792427213 OR num_ss = 44444444444;
--Optimización
SELECT num_ss, salario FROM salario WHERE num_ss = ANY(01234567890, 10792427213 , 44444444444);

-- Consulta
SELECT nombre FROM persona WHERE apellidos LIKE "Gómez" AND apellidos LIKE "Muñoz";
--Optimización
SELECT nombre FROM persona Where apellidos LIKE ALL("Gómez", "Muñoz");

-- Consulta
SELECT nombre FROM proyecto WHERE universidad LIKE "Universidad de Sevilla" OR universidad LIKE "Universidad de Cádiz";
--Optimización
SELECT nombre FROM proyecto WHERE universidad LIKE ANY("Univerisda de Sevilla", "Universidad de Cádiz");
