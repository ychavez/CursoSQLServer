select * from tblEmployee

-- modificacion de datos

-- warning tener cuidado de siempre poner el Where en el update y en el Delete

-- ejemplo basico de actualizacion de un solo registro
update tblEmployee set EmployeeFirstName = 'Juan' where EmployeeNumber = 124

--ejemplo de actualizacion de registro y consulta de datos modificados

update tblEmployee set EmployeeFirstName = 'Juan2'
output inserted.EmployeeFirstName , deleted.EmployeeFirstName
from tblEmployee
where EmployeeNumber = 124



select * from tblEmployee where EmployeeNumber = 2000

select * from tblTransaction where EmployeeNumber = 2000

delete tblEmployee where EmployeeNumber = 2000