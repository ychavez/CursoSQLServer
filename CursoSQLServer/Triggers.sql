SELECT *
FROM tblTransaction;
GO
CREATE OR ALTER TRIGGER TR_tblTransaction ON tbltransaction AFTER INSERT, UPDATE, DELETE AS
BEGIN
    SELECT *, 
           'Inserted'
    FROM inserted;
    SELECT *, 
           'Deleted'
    FROM deleted;
    SELECT 'Select desde el trigger';
END;
GO
INSERT INTO tblTransaction
(Amount, 
 DateOfTransaction, 
 EmployeeNumber
)
VALUES
(10, 
 GETDATE(), 
 123
);
GO 
UPDATE tblTransaction
  SET 
      Amount = 22
WHERE EmployeeNumber = 123;
DELETE tblTransaction
WHERE EmployeeNumber = 123;

--- deshabilitar el trigger

GO
DISABLE TRIGGER TR_tblTransaction ON tblTransaction;
GO
INSERT INTO tblTransaction
(Amount, 
 DateOfTransaction, 
 EmployeeNumber
)
VALUES
(10, 
 GETDATE(), 
 123
);
GO
ENABLE TRIGGER TR_tblTransaction ON tblTransaction;
GO
DROP TRIGGER TR_tblTransaction;
GO

CREATE OR ALTER TRIGGER TR_tblTransaction ON tbltransaction 
Instead of INSERT, UPDATE, DELETE AS
BEGIN
   declare @Employeenumber as int, @DateOfTransaction as smalldatetime, @Amount as smallmoney, @originalAmount as smallmoney;

   select @Employeenumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = Amount from inserted

   select @originalAmount = amount from deleted
   select @Employeenumber,@DateOfTransaction, @Amount

   update tblTransaction set Amount = @Amount where Amount = @originalAmount and EmployeeNumber = @Employeenumber
END;


update tblTransaction set Amount = 700 where Amount = 636.16 and EmployeeNumber = 284

select * from tblTransaction  where EmployeeNumber = 284