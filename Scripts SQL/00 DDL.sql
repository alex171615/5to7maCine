drop database if exists cine;

create database cine;
use cine;



create table pelicula
 (
	  idPelicula  SMALLINT UNSIGNED,
	  nombre VARCHAR (45) NOT NULL,
	  fecha DATE NOT NULL, 
	  genero VARCHAR (45) NOT NULL,
	  PRIMARY KEY (idPelicula),
	  CONSTRAINT UQ_pelicula_nombre UNIQUE(nombre)
  ); 
  
 
  create table sala 
  ( 
	   idSala SMALLINT UNSIGNED,
	   piso SMALLINT UNSIGNED NOT NULL,
	   capacidad SMALLINT UNSIGNED NOT NULL,
	   PRIMARY KEY (idSala) 
       
   );
   
    create table cliente
    (
		idCliente SMALLINT UNSIGNED,
		nombre VARCHAR(45) NOT NULL,
		apellido VARCHAR(45) NOT NULL,
		email VARCHAR(65) NOT NULL,
		contrasena TINYINT NOT NULL,
		PRIMARY KEY (idCliente), 
        CONSTRAINT UQ_cliente_email UNIQUE(email)
    );
    
    create table proyeccion
  (
	  idProyeccion SMALLINT UNSIGNED NOT NULL,
	  fechaHora DATETIME NOT NULL,
	  idPelicula SMALLINT UNSIGNED NOT NULL,
	  idSala SMALLINT UNSIGNED NOT NULL,
	  idCliente SMALLINT UNSIGNED NOT NULL,
	  PRIMARY KEY (idProyeccion),
      CONSTRAINT FK_proyeccion_pelicula FOREIGN KEY (idPelicula)
	            REFERENCES cine.pelicula (idPelicula),
	  CONSTRAINT FK_proyeccion_sala FOREIGN KEY (idSala)
	            REFERENCES cine.sala (idSala),
		CONSTRAINT FK_proyeccion_Cliente FOREIGN KEY (idCliente)
	            REFERENCES cine.Cliente (idCliente)
                
      
  );

create table entrada
   ( 
		idEntrada SMALLINT NOT NULL,
		 valor decimal (6,2) NOT NULL,
		 email VARCHAR (65) NOT NULL,
		 butaca smallint NOT NULL,
		 idProyeccion SMALLINT UNSIGNED NOT NULL,
         idCliente SMALLINT UNSIGNED NOT NULL,
		 PRIMARY KEY (idEntrada), 
         CONSTRAINT FK_entrada_proyeccion FOREIGN KEY (idProyeccion)
                 REFERENCES cine.proyeccion (idProyeccion),
	     CONSTRAINT FK_entrada_cliente FOREIGN KEY (idCliente)
				 REFERENCES cine.cliente (idCliente)
		
    );


