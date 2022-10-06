-- sp
-- quiero borrar empleados pero verificar antes si sus ventas son menores a 1
-- opcion de mucho codigo y sujeto a revision humana

SELECT *
FROM [dbo].[TransaccionesPorEmpleado]
WHERE EmployeeNumber = 160;
DELETE tblEmployee
WHERE EmployeeNumber = 160;

--- codigo medianamente optimizado

DECLARE @NumeroEmpleado INT= 133;
SELECT *
FROM [dbo].[TransaccionesPorEmpleado]
WHERE EmployeeNumber = @NumeroEmpleado;
DELETE tblEmployee
WHERE EmployeeNumber = @NumeroEmpleado;

-- codigo aun mas optimizado

GO
DECLARE @NumeroEmpleado INT= 133, 
@TieneSaldoNegativo BIT= 0;

-- consultamos si el empleado tiene ventas negativas y lo ponemos en el bit

SELECT @TieneSaldoNegativo = IIF(total < 0, 1, 0)
FROM TransaccionesPorEmpleado
WHERE EmployeeNumber = @NumeroEmpleado;



IF(@TieneSaldoNegativo = 1)
    BEGIN
        delete tblEmployee where EmployeeNumber = @NumeroEmpleado
		SELECT 'El empleado se elimino';
    END;
    ELSE
    BEGIN
        SELECT 'Atencion el empleado no tiene saldo negativo';
    END;


--- version automoatica full



create proc eliminarEmpleado @NumeroEmpleado INT
as
	DECLARE @TieneSaldoNegativo BIT= 0;

-- consultamos si el empleado tiene ventas negativas y lo ponemos en el bit

SELECT @TieneSaldoNegativo = IIF(total < 0, 1, 0)
FROM TransaccionesPorEmpleado
WHERE EmployeeNumber = @NumeroEmpleado;



IF(@TieneSaldoNegativo = 1)
    BEGIN
        delete tblEmployee where EmployeeNumber = @NumeroEmpleado
		SELECT 'El empleado se elimino';
    END;
    ELSE
    BEGIN
        SELECT 'Atencion el empleado no tiene saldo negativo';
    END;