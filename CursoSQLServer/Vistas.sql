
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
GO
CREATE VIEW TransaccionesPorEmpleado
AS
     SELECT e.EmployeeFirstName, 
            e.EmployeeNumber, 
            SUM(t.amount) [Total]
     FROM tblEmployee e
          JOIN tblTransaction t ON t.EmployeeNumber = e.EmployeeNumber
     GROUP BY e.EmployeeFirstName, 
              e.EmployeeNumber;
GO
SELECT *
FROM TransaccionesPorEmpleado;

--- el sistema nos pide las transacciones por cierto usuario
--123
SELECT *
FROM TransaccionesPorEmpleado
WHERE EmployeeNumber = 123;

--- funciones tipo tabla

GO
CREATE FUNCTION fnTransaccionesPorEmpleado
(@employeeNumber INT
)
RETURNS TABLE
AS
     RETURN
     SELECT e.EmployeeFirstName, 
            e.EmployeeNumber, 
            SUM(t.amount) [Total]
     FROM tblEmployee e
          JOIN tblTransaction t ON t.EmployeeNumber = e.EmployeeNumber
     WHERE e.EmployeeNumber = @employeeNumber
     GROUP BY e.EmployeeFirstName, 
              e.EmployeeNumber;
SELECT *
FROM fnTransaccionesPorEmpleado(125);
GO





CREATE FUNCTION fnTransaccionesPorEmpleadoNoInfer
(@employeeNumber INT
)
RETURNS @empleadosTransacciones TABLE
(NombreEmpleado VARCHAR(100), 
 NumeroEmpleado INT, 
 Transacciones  MONEY
)
AS
     BEGIN
         INSERT INTO @empleadosTransacciones
                SELECT e.EmployeeFirstName, 
                       e.EmployeeNumber, 
                       SUM(t.amount) [Total]
                FROM tblEmployee e
                     JOIN tblTransaction t ON t.EmployeeNumber = e.EmployeeNumber
                WHERE e.EmployeeNumber = @employeeNumber
                GROUP BY e.EmployeeFirstName, 
                         e.EmployeeNumber;
         RETURN;
     END;

SELECT *
FROM fnTransaccionesPorEmpleadoNoInfer(123);