use cine;
START TRANSACTION;

insert into cliente (idcliente, nombre, apellido, email, contrasena)
values (0001,"Alexis", "Noguera", "AlexisNoguera@gmail.com", sha2(contrasena,256));

insert into entrada (idEntrada, idCliente, valor, email, numeroEntrada, idProyeccion)
values (0002, 0023, 350, "Alexis@gmail.com", 1234, 0003);

insert into proyeccion (idProyeccion, fechaHora, idPelicula, idSala, idCliente)
values (0008, "2021-07-14 22:30" , 0004, 0005, 0022); 

insert into pelicula (idPelicula, nombre, fecha, genero)
values ( 0004, "It2", "2021-07-21", "Terror"); 

insert into sala (idSala, piso, capacidad)
values (0009, 2, 500); 