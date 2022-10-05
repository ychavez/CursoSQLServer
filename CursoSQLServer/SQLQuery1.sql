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

SELECT e.EmployeeFirstName [Nombre Empleado], 
       T.EmployeeNumber [Numero de Empleado], 
       SUM(Amount) [Suma de transacciones]
FROM tblTransaction T
     JOIN tblEmployee E ON t.EmployeeNumber = e.EmployeeNumber
GROUP BY T.EmployeeNumber, e.EmployeeFirstName
Order by t.EmployeeNumber