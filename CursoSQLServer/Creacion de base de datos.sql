
-- se recomienda al crear una base de datos siempre estar en master
use master
--comentario de una linea 

/* 
comentario multilinea
*/

GO

Create database CursoSQLServer

GO

--cambiamos a la base de datos que acabamos de crear
use CursoSQLServer

--crear una tabla

Create table tblEmployee
(
	EmployeeNumber int not null,
	EmployeeFirstName varchar(50) not null,
	EmployeeMiddleName varchar(50) null,
	EmployeeLastName varchar(50) not null,
	EmployeeRFC varchar(16) not null,
	EmployeeDateOfBirth Date
)

-- Modificar tabla existente

 -- agregar columna de departamento

 alter table tblEmployee Add
 Department varchar(10)

 -- mostrar el contenido de un campo
 select EmployeeNumber from tblEmployee

  -- mostrar el contenido de todos los campos
 select * from tblEmployee

  -- mostrar el contenido de todos los campos combinado
  select EmployeeNumber, * , * from tblEmployee

  -- agregamos datos a nuestra tabla

  insert into tblEmployee values
  (1234,'Juan','Jose','Gomez','ASDASD123123','01/01/1992','RH')

  -- este insert no cabe por que department solo tiene 10 caracteres
  
  -- modificamos la columna department para poder soportar hasta 40 caracteres

  alter table tblEmployee 
  alter column department varchar(40)
  
  insert into tblEmployee values
  (1235,'Jaime','Alfredo','Ruiz','ASDASDs43123','01/01/1982',
  'Gerente de administracion y finanzas')


  -- obtenemos el largo de la cadena de texto
  select LEN('Gerente de administracion y finanzas')

   select * from tblEmployee