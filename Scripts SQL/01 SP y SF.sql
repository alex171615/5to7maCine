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