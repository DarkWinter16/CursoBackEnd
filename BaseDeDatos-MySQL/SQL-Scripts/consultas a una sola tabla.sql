/* La sentencia u orden siguiente pone en uso la base de datos o esquema 
world, para realizar consultas a sus tablas */
use world;

-- Comentario a nivel de linea.
-- La sintaxis de la sentencia de SQL mas pequeña que se puede ejecutar 
-- por ejemplo, para recuperar todos los registros de la tabla country.
select * from country;

table country;

-- Recuperar solamente el campo Region de la tabla
-- Lo puse bonito con cmd + b
SELECT 
    Region as LaRegion
FROM
    country;
   -- No es necesario la palabra reservada (as) para establecer un alias, actualmente
   select Region LaRegion
    from country;
    
    -- ¿Como hacer para que al alias lleve un espacio en blanco entre medias "La Region"
    -- Rspta. Encerrando el alias entre backticks, que es un tipo de comillas e el teclado 
    -- esta a la derecha de la tecla P
    select Region `La Region` from country;
    
    -- Se pueden recuperar varios campos separados por comas
    select Region, SurfaceArea, Population, IndepYear
    from country;
    
    -- Uso de la clausula distinct, por ejemplo para ver cuantas regiones diferentes existen en al tabla 
    -- country
    select distinct Region
    from country
    order by Region asc;
    
    -- Para limitar la cantidad de registros devueltos por la consulta se utiliza la clausula LIMIT
    select distinct Region
    from country
    order by Region asc limit 3;
    
    -- Si quisieramos pasar por alto los 3 primeros registros y recuperar los 3 restantes
    select distinct Region
    from country
    order by Region asc limit 3,5;
    
    -- Ejercicio: Recuperar el pais (name) que tiene la mayor poblacion (Population)
    -- solucion con las clausulas estudiadas hasta el presente
    select Name, Population
    from country
    order by Population desc limit 1;
    
    -- Solucion correcta optima, Si? Para los principiantes tienen que esperar a ver las clausulas 
    -- WHERE, concepto de Subquery, concepto funcion 
    select Name, Population
    from country
    where Population = (select max(Population) from country);
    
    -- La Clausula WHERE 
    -- Por ejemplo : Recuperar los paises que tienen una poblacion superior a los 10 millones de habitantes.
    select *
    from country
    where Population > 10000000
    order by Population asc;
    
    -- A la consulta anterior agregarle la condicion que el pais haya obtenido su independencia
    select *
    from country
    where Population > 10000000 and IndepYear is not null 
    order by Population asc;
    
    -- La misma consulta anterior pero que todavia no haya obtenido la independencia
    -- El operador AND es llamada como un operador de corte circuito
    select *
    from country
    where Population > 10000000 and IndepYear is null 
    order by Population asc;
    
    -- La misma consulta anterior agregar la condicion de que la region sea del Caribe
    -- && (AND)necesita ambas condiciones para que sea true
    -- || (OR) necesita que solo una sea true para dar true pero si ambas dan false is false
    select *
    from country
    where Population > 10000000 and IndepYear is null or Region = "Caribbean"
    order by Population asc;
    
    /* Uso del operador LIKE
    Para busquedas exactas se utiliza el operador de asignacion (=),
    pero para busquedas mas relajadas se utiliza el operador LIKE 
    A modo de ejemplo: Recuperar todos los paises donde el campo Continent contenga 
    la palabra America */
    -- El caracter %% (al principio y al final) el busca la ocurrencia de la palabra que ponga en cualquier parte que este
    select Name `Pais`, Continent
    from country
    where Continent Like "%America%";
    
    -- Recuperar todos los paises donde la primera letra del Continent sea la letra A
    select NAme `El Pais`, Continent
    from country
    where continent like "A%";
    
    -- El operador (=) es para una busqueda exacta y eso va a Misa
    select NAme `El Pais`, Continent
    from country
    where continent =  "Africa";
    
    