use empresa;

-- Recuperar todos los empleados y sus numeros de telefono
select emp.nombre, emp.primerApellido, emp.segundoApellido, tel.numero
from empleados emp inner join telefonos tel on emp.id = tel.empleado_id ;

-- Recuperar los empleados tengan o no numeros de telefono
select emp.nombre, emp.primerApellido, emp.segundoApellido, tel.numero
from empleados emp left join telefonos tel on emp.id = tel.empleado_id ;

use world;

/* Ejercicio # 2 del Miércoles 18 de Nov : Recuperar los países y el idioma hablado en 
cada país siempre que sea una lengua oficial */

/* Ejercicio # 3 del Miércoles 18 de Nov : Recuperar la ciudad mas poblada y el nombre 
del país donde se encuentra dicha ciudad */

/* Ejercicio # 4 del Miércoles 18 de Nov : Modificar la consulta del Ejercicio # 2 para 
que solamente se muestre resultados para España y todos los idiomas, no solo los oficiales */
