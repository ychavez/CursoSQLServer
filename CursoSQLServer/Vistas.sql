
--- creacion de nuestra primera vista

CREATE VIEW miPrimeraVista
AS
     SELECT 1 AS Numero;
GO
ALTER VIEW miPrimeraVista
AS
     SELECT 1 AS numero1, 
            2 AS numero2, 
            3 AS numero3, 
            4 AS numero4, 
            5 AS numero5;
GO
SELECT *
FROM miPrimeraVista;

-- crear una vista que nos muestre las transacciones totales por empleado necesitamos
-- nombre de empleado- numero de empleado y monto sin nullos
go

CREATE VIEW TransaccionesPorEmpleado
AS
     SELECT e.EmployeeFirstName, 
            e.EmployeeNumber, 
            SUM(t.amount) [Total]
     FROM tblEmployee e
          JOIN tblTransaction t ON t.EmployeeNumber = e.EmployeeNumber
     GROUP BY e.EmployeeFirstName, 
              e.EmployeeNumber;
Go

select * from TransaccionesPorEmpleado
