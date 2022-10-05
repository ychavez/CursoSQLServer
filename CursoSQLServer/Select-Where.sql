-- traeme toda la tabla
select * from tblEmployee

-- clausula where filtramos por aquellas que se llamen Mary
select * from tblEmployee
where EmployeeFirstName = 'Mary'

-- filtramos por aquellas que no sean Mary
select * from tblEmployee
where EmployeeFirstName <> 'Mary'

select * from tblEmployee
where EmployeeFirstName != 'Mary'

-- clausula where filtramos por aquellas que se llamen Mary 
--y el departamento sea litigacion
select * from tblEmployee
where EmployeeFirstName = 'Mary' and Department = 'Litigation'


--- traer todos los registros cuando el nombre sea Mary o Michael
select * from tblEmployee
where EmployeeFirstName = 'Mary' or EmployeeFirstName = 'Michael'


-- traer todos los registros cuando el nombre comience con J o con T
select * from tblEmployee where EmployeeFirstName like 'J%' 
	or EmployeeFirstName like 'T%'

-- traeme todos los nombres que no contengan la letra A 
--	y que no comiencen con la letra J
select * from tblEmployee where EmployeeFirstName not like '%an%' and 
EmployeeFirstName not like 'J%'

-- traeme todos los nombres que la segunda letra de su nombre sea la letra E
select * from tblEmployee where EmployeeFirstName like '_e%'

-- traeme todos los nombres que esten en el rango de A - C
select * from tblEmployee where EmployeeFirstName like '[A-C]%' 

-- treme todos los nombres que esten entre A J Z
select * from tblEmployee where EmployeeFirstName like '[AJZ]%' 
  order by EmployeeFirstName desc


-- treme todos los nombres que no esten entre A J Z
select * from tblEmployee where EmployeeFirstName not like '[AJZ]%'

-- treme todos los nombres que no esten entre A J Z
select * from tblEmployee where EmployeeFirstName  like '[^AJZ]%' 


-- trame todos los empleados que su numero sea mayor que 200

select * from tblEmployee where EmployeeNumber > 200


--traeme todos los empleados que su numero sea entre 200 y 299
select * from tblEmployee where EmployeeNumber >= 200 and EmployeeNumber <= 299

--traeme todos los empleados que su numero sea entre 200 y 299 usando between
select * from tblEmployee where EmployeeNumber between 200 and 299

-- treme todos los empleados que sus numeros sean 201, 300, 800
select * from tblEmployee where EmployeeNumber in (201,300,800,510)


select Left(EmployeeFirstName,1) Letra, count(*) Cuenta
from tblEmployee where EmployeeFirstName like '[AL]%'
group by Left(EmployeeFirstName,1)



