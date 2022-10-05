--- crear tabla transacciones
CREATE TABLE tblTransaction
(Amount            SMALLMONEY, 
 DateOfTransaction SMALLDATETIME, 
 [EmployeeNumber]  [INT] NOT NULL
);

go
-- crear tabla de departamentos
CREATE TABLE tblDepartment
(Department     [VARCHAR](19) NULL, 
 DepartmentHead [VARCHAR](19)
);