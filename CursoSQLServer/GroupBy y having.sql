-- traeme todos los empleados con su año de nacimiento
select *, YEAR(employeeDateOfBirth) as YearOfBirth from tblEmployee

--quienes son los del 91
select *, YEAR(employeeDateOfBirth) as YearOfBirth from tblEmployee
where YEAR(employeeDateOfBirth) = 1991

--cuantos hay por año ordenado por año 
select YEAR(employeeDateOfBirth) as YearOfBirth,  count(*) 
       from tblEmployee 
	   group by YEAR(employeeDateOfBirth) -- agrupamos
	   order by YEAR(employeeDateOfBirth)  -- ordenamos
	   

	   --Practica queremos una cuenta de los nombres que hay que comienzan con la letra A
	   -- y los que tambien comienzan con  L
	   -- dentro del mismo result set 
	   -- Ejemplo
	   --Letra - cuenta
	   -- A   |     10
	   -- L   |     40

	 select 'A', count(*) from tblEmployee where EmployeeFirstName like 'A%'
	 union
	 select 'J', count(*) from tblEmployee where EmployeeFirstName like 'J%'

	 --pista
	 select LEFT(EmployeeFirstName,1) as Letra, count(*) as Cuenta from tblEmployee
	 where EmployeeFirstName like '[AJ]%'
	 group by LEFT(EmployeeFirstName,1)



	 --- traeme la cuenta de todas las iniciales de todos
	 --- solamente necesitamos los que sean mayor a 10
	 select LEFT(EmployeeFirstName,1) as Letra, count(*) as Cuenta 
	 from tblEmployee
	where LEFT(EmployeeFirstName,1) <> 'A'
	 group by LEFT(EmployeeFirstName,1)
	 having count(*) > 50 -- having nos permite filtrar por lo agrupado
	 order by LEFT(EmployeeFirstName,1)



	 --traer los primeros 5 registros
	 select top(5) * from tblEmployee