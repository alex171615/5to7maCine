use cine;
START TRANSACTION;

insert into cliente (idcliente, nombre, apellido, email, contrasena)
values (1,"Alexis", "Noguera", "AlexisNoguera@gmail.com", sha2(contrasena,256));

insert into pelicula (idPelicula, nombre, fecha, genero)
values ( 4, "It2", "2021-07-21", "Terror");  

insert into sala (idSala, piso, capacidad)
values (12, 2, 500);

insert into proyeccion (idProyeccion, fechaHora, idPelicula, idSala, idCliente)
values (9, "2021-07-14 22:30", 4, 12, 1); 

insert into entrada (idEntrada, valor, numeroEntrada, idProyeccion)
values (2, 350, 1234, 9);
