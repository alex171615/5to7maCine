use cine;
START TRANSACTION;

insert into cliente (idcliente, nombre, apellido, email, contrasena)
values (1,"Alexis", "Noguera", "AlexisNoguera@gmail.com", sha2(contrasena,256));

insert into pelicula (idPelicula, nombre, fecha, genero)
values ( 4, "It2", "2021-07-21", "Terror");  

insert into proyeccion (idProyeccion, fechaHora, idPelicula, idSala, idCliente)
values (9, "2021-07-14 22:30" , 4, 9, 1); 

insert into sala (idSala, piso, capacidad)
values (9, 2, 500);

insert into entrada (idEntrada, valor, email, numeroEntrada, idProyeccion, idCliente)
values (2, 350, "AlexisNoguera@gmail.com", 1234, 9, 1);