-- Práctica 1 - Adrián Dávila Guerra

-- 1. Mostrar todas las tablas que dispone la base de datos “employees”.

use employees;
show tables;

-- 2. Contar el número de registros que contiene cada una de las tablas que conforman nuestra base de datos.

SELECT count(*) FROM TABLAS;
	-- Donde 'TABLAS' corresponde a current_dept_emp (300024), departments (9), dept_emp (331603), 
	-- dept_emp_latest_date (300024), dept_manager (24), employees (300024), salaries (2844047) y titles (443308).

-- 3. Indique las características de cada una de las tablas que conforman nuestra base
-- de datos, incluyendo los campos, tipos e índices contenidos en cada una de ellas.

describe current_dept_emp;
describe departments;
describe dept_emp;
describe dept_emp_latest_date;
describe dept_manager;
describe employees;
describe salaries;
describe titles;

-- 4. Muestre los 10 empleados con menor sueldo en la empresa.

SELECT * FROM employees e, salaries s
WHERE e.emp_no = s.emp_no ORDER BY s.salary ASC 
LIMIT 10;

-- 5. Muestre los 10 empleados con mayor sueldo en la empresa.

SELECT * FROM employees e, salaries s
WHERE e.emp_no = s.emp_no ORDER BY s.salary DESC 
LIMIT 10;

-- 6. Calcule el departamento con un mayor número de empleados.

SELECT dept_no, COUNT(emp_no) AS MAYOR_NUM_EMP
FROM dept_emp 
GROUP BY dept_no 
ORDER BY COUNT(emp_no) 
DESC LIMIT 1;

-- 7. Calcule el número de mujeres que se encuentran trabajando en el departamento de “Research”.

SELECT COUNT(*)
FROM employees e, dept_emp d, departments dm
WHERE e.emp_no = d.emp_no AND d.dept_no = dm.dept_no 
AND e.gender LIKE "F" AND dm.dept_name = "Research";

-- 8. Calcule el salario medio de los hombres que se encuentran trabajando en el departamento de “Finance”.

SELECT AVG(s.salary)
FROM salaries s, employees e, dept_emp d, departments dm
WHERE e.emp_no = d.emp_no AND d.dept_no = dm.dept_no AND e.emp_no = s.emp_no 
AND dm.dept_name = "Finance" AND e.gender LIKE "M";

-- 9. Calcule el salario medio de los trabajadores que llevan en la empresa desde el año 1995.

SELECT AVG(s.salary) AS "Salario medio" 
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no AND hire_date BETWEEN'19950101' AND '19951231';

-- 10. Cuente el total de trabajadores que se encuentran trabajando en el mismo departamento desde que entraron en la empresa.

SELECT count(*) AS "Nº empleados en el mismo departamento"
FROM dept_emp_latest_date
WHERE to_date = '9999-01-01';

-- 11. Hemos visto en clase que OUTER JOIN o FULL OUTER JOIN no existen
-- en MySQL, pero gracias a las funcionalidades que ofrece MySQL puede obtenerse el
-- mismo resultado de diferente manera. Proponga al menos una solución para poder
-- solventar esta limitación de MySQL.

-- Por ejemplo, podemos emularlo a partir de este ejemplo con dos tablas t1 y t2:

SELECT * FROM t1
LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id
