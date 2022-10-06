use master
go
Create database Encuestas
go
use Encuestas
go
create table Preguntas
(
NumeroPregunta int NOT NULL,
Pregunta varchAR(40) NOT NULL,
Puntos int)

go
create table Respuestas(
NumeroRespuesta int not null,
numeroPregunta int not null,
Respuesta varchar(100) null)

go

select * from Preguntas
select * from Respuestas

select p.Pregunta, 
coalesce(r.Respuesta,'no tiene respuestas') [Respuesta] from Preguntas p left join Respuestas r
on p.NumeroPregunta = r.numeroPregunta
