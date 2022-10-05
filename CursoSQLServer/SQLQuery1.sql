select * from tblEmployee

-- modificacion de datos

-- warning tener cuidado de siempre poner el Where en el update y en el Delete

-- ejemplo basico de actualizacion de un solo registro
update tblEmployee set EmployeeFirstName = 'Pedro' where EmployeeNumber = 123

--ejemplo de actualizacion de registro y consulta de datos modificados

update tblEmployee set EmployeeFirstName = 'Juan'
output inserted.EmployeeFirstName , deleted.EmployeeFirstName
from tblEmployee
where EmployeeNumber = 124



delete tblEmployee where EmployeeNumber = 123