create schema inv
go
create table inv.Movimientos(
Id int primary key identity(1,1),
Descripcion varchar(10),
movimiento int)

