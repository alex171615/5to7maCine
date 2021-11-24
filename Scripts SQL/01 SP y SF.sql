/*Se pide hacer los SP para dar de alta todas las entidades (menos Entrada y Cliente) con el prefijo ‘alta’.*/
delimiter $$

CREATE PROCEDURE altaPelicula (unIdPelicula  SMALLINT UNSIGNED, unNombre VARCHAR (45), unafecha DATE, unGenero VARCHAR (45))

begin 
insert into pelicula (idPelicula, nombre, fecha, genero)
values (unIdPelicula, unNombre, unafecha, unGenero);

end$$

CREATE PROCEDURE altaSala (unIdSala SMALLINT UNSIGNED, unPiso SMALLINT UNSIGNED, unaCapacidad TINYINT UNSIGNED)

begin 
insert into sala (idSala, piso, capacidad) 
values (unIdSala, unPiso, unaCapacidad);

end$$

create procedure altaProyeccion (unIdProyeccion SMALLINT UNSIGNED, unaFechaHora DATETIME, unIdPelicula SMALLINT UNSIGNED, unIdSala SMALLINT UNSIGNED,unIdCliente SMALLINT UNSIGNED)
begin 
insert into proyeccion (idProyeccion, fechaHora, idPelicula, idSala, idCliente) 
values (unIdProyeccion, unaFechaHora, unIdPelicula, unIdSala, unIdCliente );

end$$


/*Se pide hacer el SP ‘registrarCliente’ que reciba los datos del cliente. Es importante guardar encriptada la contraseña del cliente usando SHA256.*/

DELIMITER $$

CREATE PROCEDURE registraCliente (unIdCliente SMALLINT UNSIGNED, unNombre VARCHAR(45), unApellido VARCHAR(45), unEmail VARCHAR(65), unaContrasena TINYINT)

BEGIN 

INSERT INTO cliente (idCliente, nombre, apellido, email, contrasena)
VALUES (unIdClient, unNombre, unApellido, unEmail, sha2(/*Se pide hacer los SP para dar de alta todas las entidades (menos Entrada y Cliente) con el prefijo ‘alta’.*/
delimiter $$

CREATE PROCEDURE altaPelicula (unIdPelicula  SMALLINT UNSIGNED, unNombre VARCHAR (45), unafecha DATE, unGenero VARCHAR (45))

begin 
insert into pelicula (idPelicula, nombre, fecha, genero)
values (unIdPelicula, unNombre, unafecha, unGenero);

end$$

CREATE PROCEDURE altaSala (unIdSala SMALLINT UNSIGNED, unPiso SMALLINT UNSIGNED, unaCapacidad TINYINT UNSIGNED)

begin 
insert into sala (idSala, piso, capacidad) 
values (unIdSala, unPiso, unaCapacidad);

end$$

create procedure altaProyeccion (unIdProyeccion SMALLINT UNSIGNED, unaFechaHora DATETIME, unIdPelicula SMALLINT UNSIGNED, unIdSala SMALLINT UNSIGNED,unIdCliente SMALLINT UNSIGNED)
begin 
insert into proyeccion (idProyeccion, fechaHora, idPelicula, idSala, idCliente) 
values (unIdProyeccion, unaFechaHora, unIdPelicula, unIdSala, unIdCliente );

end$$


/*Se pide hacer el SP ‘registrarCliente’ que reciba los datos del cliente. Es importante guardar encriptada la contraseña del cliente usando SHA256.*/

DELIMITER $$

CREATE PROCEDURE registraCliente (unIdCliente SMALLINT UNSIGNED, unNombre VARCHAR(45), unApellido VARCHAR(45), unEmail VARCHAR(65), unaContrasena TINYINT)

BEGIN 

INSERT INTO cliente (idCliente, nombre, apellido, email, contrasena)
VALUES (unIdClient, unNombre, unApellido, unEmail, sha2(unaContrasena,256));	
END$$


/*Se pide hacer el SP ‘venderEntrada’ que reciba por parámetro el id de la función, valor e identificación del cliente. Pensar en cómo hacer para darle valores consecutivos desde 1 al número de entrada por función.*/
DELIMITER $$

CREATE PROCEDURE venderEntrada (unIdProyeccion SMALLINT UNSIGNED, unIdEntrada SMALLINT) 

BEGIN 

update entrada
set entrada = entarada + 1 
where 	idEntrada = idProyeccion;

end $$

/*Realizar el SP ‘top10’ que reciba por parámetro 2 fechas, el SP tiene que devolver identificador y nombre de la película y la cantidad de entradas vendidas para la misma entre las 2 fechas. Ordenar por cantidad de entradas de mayor a menor.*/

delimiter $$
create procedure top10 (unInicio date, unFin date) 

begin 

select idPelicula, nombre,count(numeroEntrada)
from entrada E
join proyeccion on E.proyeccion = P.pelicula
group by idPelicula
and fecha between unInicio and unFin
order by idEntrada DESC;
end $$

/*Realizar el SF llamado ‘RecaudacionPara’ que reciba por parámetro un identificador de película y 2 fechas, la función tiene que retornar la recaudación de la película entre esas 2 fechas.*/

delimiter $$

create function recaudacionPara (unIdPelicula SMALLINT, unInicio date, unFin date )returns DECIMAL(6,2)

begin 

 declare retornarRecaudacion DECIMAL(6,2);
 select sum(valor) into retornarRecaudacion
 from pelicula
 where idPelicula = unIdPelicula
 and fecha between unInicio and unFin;
 return retornarRecaudacion;
 
 end $$
,256));	
END$$


/*Se pide hacer el SP ‘venderEntrada’ que reciba por parámetro el id de la función, valor e identificación del cliente. Pensar en cómo hacer para darle valores consecutivos desde 1 al número de entrada por función.*/
DELIMITER $$

CREATE PROCEDURE venderEntrada (unIdProyeccion SMALLINT UNSIGNED, unIdEntrada SMALLINT) 

BEGIN 

update entrada
set entrada = entarada + 1 
where 	idEntrada = idProyeccion;

end $$

/*Realizar el SP ‘top10’ que reciba por parámetro 2 fechas, el SP tiene que devolver identificador y nombre de la película y la cantidad de entradas vendidas para la misma entre las 2 fechas. Ordenar por cantidad de entradas de mayor a menor.*/

delimiter $$
create procedure top10 (unInicio date, unFin date) 

begin 

select idPelicula, nombre,count(numeroEntrada)
from entrada E
join proyeccion on E.proyeccion = P.pelicula
group by idPelicula
and fecha between unInicio and unFin
order by idEntrada DESC;
end $$

/*Realizar el SF llamado ‘RecaudacionPara’ que reciba por parámetro un identificador de película y 2 fechas, la función tiene que retornar la recaudación de la película entre esas 2 fechas.*/

delimiter $$

create function recaudacionPara (unIdPelicula SMALLINT, unInicio date, unFin date )returns DECIMAL(6,2)

begin 

 declare retornarRecaudacion DECIMAL(6,2);
 select sum(valor) into retornarRecaudacion
 from pelicula
 where idPelicula = unIdPelicula
 and fecha between unInicio and unFin;
 return retornarRecaudacion;
 
 end $$

 