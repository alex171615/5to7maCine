
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
VALUES (unIdClient, unNombre, unApellido, unEmail, sha2(sha,256));	
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
create procedure top10 (unIdPelicula SMALLINT, unNombre VARCHAR (45), unEntrada SMALLINT , unInicio date, unFin date)

begin 

select idPelicula, nombre,idEntrada
from entrada
where idEntrada = IdEntrada
and count(idEntrada) between unInicio and unFin
order by idEntrada DESC;
end $$

/*Realizar el SF llamado ‘RecaudacionPara’ que reciba por parámetro un identificador de película y 2 fechas, la función tiene que retornar la recaudación de la película entre esas 2 fechas.*/

delimiter $$

create function recaudacionPara (unIdPelicula SMALLINT, unInicio date, unFin date )returns int


begin 

declare retornarRecaudacion int;
select idPelicula into retornarRecaudacion
from entrada
where idEntrada = idEntrada
between unInicio and unFin;
return retornarRecaudacion;
end $$


