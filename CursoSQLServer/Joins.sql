-- queremos traer la tbl transaction con el nombre del empleado
SELECT *
FROM tbltransaction
     JOIN tblEmployee ON tblEmployee.EmployeeNumber = tbltransaction.EmployeeNumber;

-- queremos solamente ciertos campos de la consulta
SELECT tblTransaction.amount, 
       tblTransaction.DateOfTransaction, 
       tblEmployee.EmployeeFirstName
FROM tbltransaction
     JOIN tblEmployee ON tblEmployee.EmployeeNumber = tbltransaction.EmployeeNumber;

-- queremos solamente ciertos campos de la consulta usando alias de tablas
SELECT T.amount, 
       T.DateOfTransaction, 
       E.EmployeeFirstName
FROM tbltransaction AS T
     JOIN tblEmployee AS E ON E.EmployeeNumber = T.EmployeeNumber;

-- pista
SELECT SUM(Amount), 
       EmployeeNumber
FROM tblTransaction
GROUP BY EmployeeNumber;

-- queremos en una consulta el total de la suma de transacciones por empleado
-- la conuslta debera ser como la siguiente
-- Nombre Empleado|Numero de Empleado|Suma de transacciones
--         Yael   |  256			 |   1258.2
-----------------------------------------------------------
-- a tener en cuenta que el numero de empleado existe en ambas tablas
-- plus si ordenamos por numero de empleado
SELECT *
FROM tblEmployee;
SELECT e.EmployeeFirstName [Nombre Empleado], 
       T.EmployeeNumber [Numero de Empleado], 
       SUM(Amount) [Suma de transacciones]
FROM tblTransaction T
     JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY T.EmployeeNumber, 
         e.EmployeeFirstName
ORDER BY t.EmployeeNumber;

-- traemos el reporte de transacciones por empleado aun que el empleado no tenga transacciones
SELECT e.EmployeeFirstName [Nombre Empleado], 
       E.EmployeeNumber [Numero de Empleado], 
       SUM(Amount) [Suma de transacciones]
FROM tblTransaction T
     RIGHT JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY E.EmployeeNumber;

-- traemos el reporte de transacciones por empleado aun que el empleado no tenga transacciones
SELECT e.EmployeeFirstName [Nombre Empleado], 
       E.EmployeeNumber [Numero de Empleado], 
       SUM(Amount) [Suma de transacciones]
FROM tblTransaction T
     LEFT JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY E.EmployeeNumber;

-- traemos el reporte de transacciones por empleado aun que el empleado no tenga transacciones
SELECT e.EmployeeFirstName [Nombre Empleado], 
       E.EmployeeNumber [Numero de Empleado], 
       SUM(Amount) [Suma de transacciones]
FROM tblTransaction T
     FULL JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY E.EmployeeNumber;

-- traemos todo el reporte de transacciones por empleado y validamos aquellos que sean NULL
SELECT ISNULL(e.EmployeeFirstName, 'No existe') [Nombre Empleado], 
       ISNULL(E.EmployeeNumber, 0) [Numero de Empleado], 
       ISNULL(SUM(Amount), 0) [Suma de transacciones]
FROM tblTransaction T
     FULL JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY SUM(amount) DESC;

--- aquellas transacciones que no tuvieron un empleado se las asignaremos al que vendio mas en este periodo
-- obtenemos el empleado con mayores ventas
DECLARE @EmpleadoMax VARCHAR(40), @EmpleadoNumeroMax INT;
-- asignamos los valores a las variables
SELECT TOP 1 @EmpleadoMax = e.EmployeeFirstName + ' bono', 
             @EmpleadoNumeroMax = E.EmployeeNumber
FROM tblTransaction T
     JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY SUM(amount) DESC;


SELECT ISNULL(e.EmployeeFirstName, @EmpleadoMax) [Nombre Empleado], 
       ISNULL(E.EmployeeNumber, @EmpleadoNumeroMax) [Numero de Empleado], 
       ISNULL(SUM(Amount), 0) [Suma de transacciones]
FROM tblTransaction T
     FULL JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY SUM(amount) DESC;

go
--- las mismas reglas de arriba pero tenemos un constraint de fecha de nacimiento
DECLARE @EmpleadoMax VARCHAR(40), @EmpleadoNumeroMax INT;

SELECT TOP 1 @EmpleadoMax = e.EmployeeFirstName + ' bono', 
             @EmpleadoNumeroMax = E.EmployeeNumber
FROM tblTransaction T
      JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
where YEAR(e.EmployeeDateOfBirth) < 1992 
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName,
		 e.EmployeeDateOfBirth
having SUM(Amount) > 3000
ORDER BY SUM(amount) DESC;

SELECT coalesce(e.EmployeeFirstName,@EmpleadoMax,'Empresa') [Nombre Empleado], 
       coalesce(E.EmployeeNumber, @EmpleadoNumeroMax,0) [Numero de Empleado], 
       ISNULL(SUM(Amount), 0) [Suma de transacciones]
FROM tblTransaction T
     FULL JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY E.EmployeeNumber, 
         E.EmployeeFirstName
ORDER BY SUM(amount) DESC;


/*
-- 1 crear una base de datos llamada encuestas
    debe de contener las siguientes tablas
	 -- preguntas
	    (debe de contener el numero de pregunta)
	 -- respuestas
	    (pista las respuestas deben de tener un NumeroDePregunta)

	2 realizar una consulta en la 
	cual me traiga todas las preguntas con sus respuestas
	   (en caso de que la pregunta no tenga respuestas poner NULL)
   
    3 realizar la misma consulta con
	la diferiencia si no tiene respuestas
	poner la leyenda (no tiene respuestas)


	    puntos extra utilizar el coalesce

*/
      
		