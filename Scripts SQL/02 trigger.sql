/*Realizar un trigger que verifique que al momento de insertar una entrada, no sobrepase la cantidad de entradas vendidas para la capacidad de la sala correspondiente, en ese caso no se debe permitir la operación y se tiene que mostrar la leyenda “Sala Llena”.*/

DELIMITER $$

CREATE TRIGGER beforeInsertEntrada BEFORE INSERT ON entrada
FOR EACH ROW
BEGIN	

IF (proyeccion.entradaVendida + 1) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'SALA LLENA';
END IF;

END $$

/*Realizar un trigger para que cada vez que se da de alta una película nueva, se crea una proyección por cada sala y para la fecha y hora de creación.*/

delimiter $$
drop user if exists altaPelicula;

create procedure altaPelicula (unaProyeccion SMALLINT, unaSala SMALLINT, unafechaHora DATETIME)
begin 

insert into PeliculaNueva (unaProyeccion, unaSala, unafechaHora)
values (unaProyeccion, unaSala, fechaHora);

end $$

drop user if exists altaPeliculaNueva;

create trigger altaPeliculaNueva before insert on proyeccion
for each row
begin 

 call PeliculaNueva (new.idProyeccion, new.idSala, new.fechaHora);
 
 end $$

    