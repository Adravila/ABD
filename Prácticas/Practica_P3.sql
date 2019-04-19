-- 1. Cree una vista que permita acceder sólo a los datos de los empleados que se encuentren trabajando en el departamento de “Finance”.

CREATE OR REPLACE VIEW employees_finance AS
	SELECT e.*
	FROM employees e, departments d, dept_emp de
	WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no 
	AND to_date = "99990101" AND d.dept_name = "Finance"; 

SELECT * FROM employees_finance;

-- 2. Cree una vista que permita mostrar sólo a las mujeres que se encuentran trabajando desde el año 1992 en el departamento de “Sales”.

CREATE OR REPLACE VIEW woman_1992_dept_sales AS
	SELECT de.*
	FROM employees e, departments d, dept_emp de
	WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no 
	AND de.from_date LIKE "1992%" AND to_date LIKE "9999%" 
	AND e.gender = 'F' AND d.dept_name = "Sales";

SELECT * FROM woman_1992_dept_sales;

-- 3. Cree una vista que muestre la suma de los salarios de los empleados según el departamento en el que se encuentren.

CREATE OR REPLACE VIEW sum_salaries_dept
	SELECT de.dept_no, SUM(s.salary)
	FROM dept_emp de, salaries s, employees e, dept_manager dm
	WHERE de.emp_no = e.emp_no AND e.emp_no = s.emp_no AND de.dept_no = dm.dept_no
	AND de.to_date >= curdate() AND dm.to_date >= curdate() AND s.to_date >= curdate()
	GROUP BY de.dept_no;

SELECT * FROM sum_salaries_dept;

-- 4. Cree una vista en la cual se muestre el año de contratación del empleado, su nombre, apellido y departamento.

CREATE OR REPLACE VIEW detalles_anno_contratacion AS
	SELECT de.from_date, e.first_name, e.last_name, d.dept_name
	FROM employees e, departments d, dept_emp de
	WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no;

SELECT * FROM detalles_anno_contratacion;

-- 5. Inserte en esta última vista 5 nuevas filas.

INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
	VALUES(500000, curdate(), 'Pepe', 'Navarro', 'M', curdate() + interval 1 month),
	(500001, curdate(), 'Manuel', 'Gutierrez', 'M', curdate() + interval 1 month),
	(500002, curdate(), 'Paloma', 'Varo', 'F', curdate() + interval 3 month),
	(500003, curdate(), 'María', 'Gómez', 'F', curdate() + interval 5 day),
	(500004, curdate(), 'Laura', 'Ávila', 'F', curdate() + interval 1 week);

-- Asignamos departamentos a los nuevos empleados

INSERT INTO dept_emp(emp_no, dept_no, from_date, to_date)
	VALUES(500000, 'd001', curdate(), '99990101'),
 	(500001, 'd002', curdate(), '99990101'),
    (500002, 'd004', curdate(), '99990101'),
    (500003, 'd003', curdate(), '99990101'),
    (500004, 'd005', curdate(), '99990101');

-- 6. Elimine 2 filas a través de la misma vista.

DELETE FROM employees ORDER BY emp_no DESC LIMIT 2;
DELETE FROM dept_emp ORDER BY emp_no DESC LIMIT 2;

-- 7. Usando el esquema de la base de datos de la biblioteca indicada en el ejercicio 4 de la
--práctica anterior, cree una vista en la que se muestre el número total de libros disponible
--que tiene cada biblioteca.

CREATE OR REPLACE VIEW n_total_libros_por_biblioteca AS
	SELECT COUNT(*) AS "Número de libros", l.id_biblioteca, b.nombre 
	FROM libros l, bibliotecas b
	WHERE l.id_biblioteca = b.id_biblioteca
	GROUP BY l.id_biblioteca, b.nombre;

SELECT * FROM n_total_libros_por_biblioteca;

--8. Usando el esquema de la tabla “Empleados” indicada en el ejercicio 5 de la práctica
--anterior, cree una vista en la que únicamente se muestren los empleados con mayor y
--menor sueldo.

CREATE OR REPLACE VIEW empleados_mayor_menor_sueldo AS
	SELECT n_empleado, sueldo
	FROM empleados
	WHERE sueldo = (SELECT max(sueldo) FROM empleados) 
	OR sueldo = (SELECT min(sueldo) FROM empleados);

SELECT * FROM empleados_mayor_menor_sueldo;