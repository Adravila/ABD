SELECT num_ss, salario FROM salario WHERE num_ss = 01234567890 OR num_ss = 10792427213 OR num_ss = 44444444444;

SELECT num_ss, salario FROM salario WHERE num_ss = ANY(01234567890, 10792427213 , 44444444444);



SELECT nombre FROM persona WHERE apellidos LIKE "Gómez" AND apellidos LIKE "Muñoz";

SELECT nombre FROM persona Where apellidos LIKE ALL("Gómez", "Muñoz");


SELECT nombre FROM proyecto WHERE universidad LIKE "Universidad de Sevilla" OR universidad LIKE "Universidad de Cádiz";

SELECT nombre FROM proyecto WHERE universidad LIKE ANY("Univerisda de Sevilla", "Universidad de Cádiz");
