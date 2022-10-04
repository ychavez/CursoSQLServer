
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