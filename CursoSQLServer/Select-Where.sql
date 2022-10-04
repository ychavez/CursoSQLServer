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