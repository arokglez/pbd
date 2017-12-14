create database PBD;

use PBD;

create table Sexo( 
    id_sexo     int primary key auto_increment,
    descripcion varchar(10) unique key );

insert into Sexo(descripcion) values ('Mujer'), ('Hombre');

create table Nivel_Socioeconomico( 
    id_nivel    int primary key auto_increment,
    descripcion varchar(10) unique key );

insert into Nivel_Socioeconomico(descripcion) values ('Bajo'), ('Medio'), ('Alto');

create table Estado_Civil( 
    id_estado   int primary key auto_increment,
    descripcion varchar(11) unique key );

insert into Estado_Civil(descripcion) values ('Soltero'), ('Casado'), ('Viudo'), ('Divorciado');

create table Suministro( 
    id_suministro int primary key auto_increment,
    descripcion   varchar(13) unique key );

insert into Suministro(descripcion) values ('Somnifero'), ('Placebo');

create table Calidad_Sueno( 
    id_calidad  int primary key auto_increment,
    descripcion varchar(12) unique key );

insert into Calidad_Sueno(descripcion) values ('Reparador'), ('No Reparador');

create table Persona( 
    edad          int not null,
    id_sexo       int not null,
    id_nivel      int not null,
    id_estado     int not null,
    id_suministro int not null,
    id_calidad    int not null,
    foreign key(id_sexo) references Sexo(id_sexo),
    foreign key(id_nivel) references Nivel_Socioeconomico(id_nivel),
    foreign key(id_estado) references Estado_Civil(id_estado),
    foreign key(id_suministro) references Suministro(id_suministro),
    foreign key(id_calidad) references Calidad_Sueno(id_calidad)  );

insert into Persona(edad,id_sexo,id_nivel,id_estado,id_suministro,id_calidad) values
(22,2,1,3,2,1),
(19,1,2,4,2,2),
(36,1,3,3,1,2),
(76,1,3,1,2,1),
(68,1,1,2,2,2),
(56,2,1,2,1,1),
(41,1,3,4,1,1),
(80,1,1,3,2,2),
(48,1,3,1,2,1),
(43,1,3,1,2,1),
(64,1,3,1,1,1),
(70,2,2,2,1,2),
(62,2,3,3,1,2),
(63,1,2,2,1,2),
(21,1,2,4,2,1),
(73,2,1,4,2,2),
(76,1,2,2,1,1),
(32,2,2,4,2,2),
(27,2,1,3,1,2),
(60,2,3,1,2,2),
(43,1,1,4,2,1),
(34,2,3,1,1,2),
(35,1,3,1,1,1),
(68,1,3,2,2,2),
(82,2,3,2,1,2),
(23,1,3,1,2,1),
(63,2,3,1,1,1),
(56,2,1,1,1,2),
(25,2,2,1,1,1),
(77,2,1,1,2,2),
(78,1,2,2,2,2),
(65,1,1,3,1,1),
(72,2,1,1,2,2),
(34,1,3,2,2,2),
(30,1,2,1,1,1),
(18,2,2,3,1,2),
(29,2,2,4,2,2),
(30,2,3,4,2,1),
(38,1,1,4,2,2),
(26,2,3,3,2,1),
(49,1,1,4,1,2),
(44,1,3,1,1,2),
(29,1,2,4,1,2),
(47,1,2,1,1,2),
(62,2,2,3,2,2),
(31,2,3,4,1,2),
(25,1,2,2,1,1),
(55,1,1,2,1,2),
(29,2,2,4,2,2),
(44,2,2,4,2,2),
(52,2,3,1,1,1),
(45,2,1,3,1,2),
(52,1,1,3,2,2),
(70,1,3,4,1,1),
(23,2,3,2,2,1),
(19,1,3,1,1,1),
(79,2,3,2,2,1),
(49,1,2,3,1,1),
(44,1,3,3,2,2),
(23,1,2,3,2,2),
(29,2,2,4,2,1),
(81,1,2,4,2,2),
(60,1,3,3,1,1),
(26,1,1,3,2,2),
(37,1,3,4,1,1),
(30,2,1,1,1,2),
(27,2,1,4,2,2),
(42,1,1,1,1,1),
(37,1,1,1,1,1),
(74,1,2,4,2,2),
(26,2,2,3,1,2),
(72,1,2,3,1,2),
(42,1,3,3,1,1),
(50,1,1,2,1,2),
(55,2,1,1,1,1),
(59,1,1,2,2,1),
(48,1,2,2,1,1),
(75,1,1,4,2,2),
(20,2,3,3,2,2),
(47,1,1,3,2,1),
(58,2,3,4,2,1);

/*datos para obener rango cualitativo de edades*/
create view edad_d as
select std(edad) as desviacion, avg(edad) as media
from persona;

select * from edad_d;

/*obteniendo el total de personas sometidas a la prueba
create view total_p as
select count(*)
from persona;

select * from total_p;*/


/*clasifica cualitativamente el total de personas con base en la edad, media y desviacion estandar
select SUM(if(edad<(media-desviacion),1,0)) as joven,
       SUM(if(edad>(media-desviacion)and edad<(media+desviacion),1,0)) as adulto,
       SUM(if(edad>(media+desviacion),1,0)) as adulto_mayor
FROM persona, edad_d
where id_calidad=(select id_calidad
                 from calidad_sueno
                 where descripcion='Reparador')
AND id_suministro=(select id_suministro
                 from suministro
                 where descripcion='Somnifero');
*/

/*contabiliza caracteristica persona*/
/*cambia id, tabla y descripcion 
select count(*) as dato
from persona
where id_sexo=(select id_sexo 
               from Sexo
               where descripcion='Mujer');
AND id_calidad=(select id_calidad
                 from calidad_sueno
                 where descripcion='Reparador')
AND id_suministro=(select id_suministro
                 from suministro
                 where descripcion='Somnifero');
                 
                 o
                 
                 
select SUM(if(s.descripcion="Hombre",1,0)) as HOMBRES,
       SUM(if(s.descripcion="Mujer",1,0)) as MUJERES
from persona p,sexo s
where p.id_sexo=s.id_sexo
AND id_calidad=(select id_calidad
                 from calidad_sueno
                 where descripcion='Reparador')
AND id_suministro=(select id_suministro
                 from suministro
                 where descripcion='Somnifero');                 
*/



