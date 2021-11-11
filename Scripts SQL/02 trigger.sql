/*Realizar un trigger que verifique que al momento de insertar una entrada, no sobrepase la cantidad de entradas vendidas para la capacidad de la sala correspondiente, en ese caso no se debe permitir la operación y se tiene que mostrar la leyenda “Sala Llena”.*/

drop TRIGGER if exists beforeInsertEntrada;

DELIMITER $$

CREATE TRIGGER beforeInsertEntrada BEFORE INSERT ON entrada
FOR EACH ROW
BEGIN	

IF (new.entradaVendida <= 500 ) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'SALA LLENA';
END IF;

END $$


/*Realizar un trigger para que cada vez que se da de alta una película nueva, se crea una proyección por cada sala y para la fecha y hora de creación.*/

drop procedure if exists altaPelicula;
delimiter $$

create procedure altaPelicula (unaProyeccion SMALLINT, unaSala SMALLINT, unafechaHora DATETIME)
begin 

insert into PeliculaNueva (unaProyeccion, unaSala, unafechaHora)
values (unaProyeccion, unaSala, fechaHora);

end $$

drop trigger if exists altaPeliculaNueva;

delimiter $$
create trigger altaPeliculaNueva before insert on proyeccion
for each row
begin 

call PeliculaNueva (new.idProyeccion, new.idSala, new.fechaHora);

end $$