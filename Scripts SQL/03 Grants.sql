-- Administrador
-- Desde cualquier lado puede ver todas las tablas.

drop user if exists 'administrador'@'%';

create user 'administrador'@'%' identified by 'passAdministrador';
grant select on cine.* to'administrador'@'%';

-- Administrador
-- Desde la terminal donde corre el sistema puede agregar y modificar películas, proyecciones y salas.

drop user if exists 'administrador'@'localhost';

create user 'administrador'@'localhost' identified by'passadministrador';
grant select, insert, update on cine.pelicula to 'administrador'@'localhost';
grant select, insert, update on cine.proyeccion to 'administrador'@'localhost';
grant select, insert, update on cine.sala to 'administrador'@'localhost';

-- Cajero: desde la red 10.3.45.xxx puede ver todas las tablas y puede insertar filas nuevas en Entrada.

drop user if exists 'cajero'@'10.2.45.xxx';

create user 'cajero'@'10.2.45.xxx' identified by 'passcajero';
grant select,insert on cine.entrada to 'cajero'@'10.2.45.xxx';

-- Cliente: desde cualquier lado puede ver su información personal, entrada, proyección y película.

 drop user if exists 'cliente'@'%';
 
 create user 'cliente'@'%' identified by 'passcliente';
 grant select on cine.entrada to 'cliente'@'%';
 grant select on cine.proyeccion to 'cliente'@'%';
 grant select on cine.pelicula to 'cliente'@'%';


