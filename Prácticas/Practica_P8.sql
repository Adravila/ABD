use employees;

-- 1. Cree una transacción con la base de datos de “employees” en la que se ponga de
-- manifiesto la necesidad de su aplicación. Haga uso de las propiedades ACID para
-- explicar su utilidad.
-- Explicación:
-- Queremos insertar un nuevo empleado, pero para ello debemos asegurar de que la operación se ha realizado o no, por lo que
-- además de crear el registro de dicho empleado, debemos crear otro registro asignándole a dicho empleado su sueldo y departamento

-- Empezamos a iniciar la transacción
BEGIN;

INSERT INTO employees VALUES (696970,'1990-08-17','Adrián','Dávila','M','2019-01-10');
INSERT INTO salaries VALUES (696970,69268,'2019-01-10','9999-01-01');
INSERT INTO dept_emp VALUES (696970,'d005','2019-01-10','9999-01-01');

COMMIT;
--Se ha aplicado los cambios realizados en la base de datos

-- Como podemos observar se ha insertado en 3 tablas distintas un registro único con los datos de esa persona en concreto.
-- Será ideal utilizar transacciones en este caso dado de que, si surge un problema (humano o informático) podríamos dejar
-- el trabajo a medias

-- 2. Cree dos disparadores con aplicaciones diferentes (INSERT / DELETE /
-- UPDATE) y en momentos de ejecución diferentes (BEFORE / AFTER) para la
-- base de datos de “employees”. Explique su uso y la necesidad de crearlos

-- UPDATE - BEFORE
-- Creamos una tabla llamada employees_audit, en la que se almacenará el registro de los usuarios que realizarán los cambios
-- Para ello, debemos crear un disparador con trigger_time -> BEFORE (porque nos interesa la vieja información de sus datos y actualizarlo
-- en la nueva tabla)

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_no INT NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL,
    user VARCHAR(50) DEFAULT NULL
);

DELIMITER $$

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
	DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
    INSERT INTO employees_audit SET action = 'update', emp_no = OLD.emp_no, last_name = OLD.last_name, changedat = NOW(), user = vUser;
END$$

DELIMITER ;

UPDATE employees SET last_name = 'Perez' WHERE emp_no = 696970;

SELECT * FROM employees_audit;

-- INSERT - AFTER

-- A partir de la tabla anterior, podemos hacer lo mismo pero insertando. En este caso será necesario utilizar trigger_time -> AFTER
-- dado de que nos interesa los datos más reciente, es decir, los insertados.

DELIMITER $$

CREATE TRIGGER employees_after_insert 
    AFTER INSERT ON employees
    FOR EACH ROW 
BEGIN
	DECLARE vUser varchar(50);
    SELECT USER() INTO vUser;
    INSERT INTO employees_audit SET action = 'insert', emp_no = NEW.emp_no, last_name = NEW.last_name, changedat = NOW(), user = vUser; 
END$$

DELIMITER ;

BEGIN;

INSERT INTO employees VALUES (696971,'1990-08-17','Paco','Ramírez','M','2019-01-10');
INSERT INTO salaries VALUES (696971,69268,'2019-01-10','9999-01-01');
INSERT INTO dept_emp VALUES (696971,'d003','2019-01-10','9999-01-01');

COMMIT;

SELECT * FROM employees_audit;
