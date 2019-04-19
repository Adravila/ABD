-- Principal: todos los permisos para la base de datos creada.
CREATE USER 'Principal'@'localhost' IDENTIFIED BY 'passPrincipal';
GRANT ALL PRIVILEGES ON ES_Smartcity.* TO 'Principal'@'localhost';

-- Colaborador: permisos de edición.
CREATE USER 'Colaborador'@'localhost' IDENTIFIED BY 'passColaborador';
GRANT UPDATE ON ES_Smartcity.* TO 'Colaborador'@'localhost';

-- Eventual: permisos de consulta
CREATE USER 'Eventual'@'localhost' IDENTIFIED BY 'passEventual';
GRANT SELECT ON ES_Smartcity.* TO 'Eventual'@'localhost';

-- Junior para el mantenimiento de una de las tablas de la base de datos: el equipo 
-- deberá decidir los permisos adecuados.
CREATE USER 'Junior'@'localhost' IDENTIFIED BY 'passJunior';
GRANT SELECT, UPDATE, DELETE ON ES_Smartcity.inventario TO 'Junior'@'localhost';

-- Decisión: Es necesario tener el máximo control posible sobre la tabla inventario, ya que
-- lo más posible es que los datos que hay en la realidad no están refleados en la propia tabla
-- y se necesita comprobar y actualizar cada momento.

-- Externo que necesita acceso a sólo una parte de la base de datos: el equipo deberá
-- decidir los permisos adecuados
CREATE USER 'Externo'@'localhost' IDENTIFIED BY 'passExterno';
GRANT SELECT, UPDATE, DELETE ON ES_Smartcity.feedback TO 'Externo'@'localhost';

-- Decisión: Es una tabla externa del propósito de la base de datos, ya que sólo es
-- la retroalimentación de las opiniones de los usuarios en la que sugieran los cambios
-- que ven necesarios.
