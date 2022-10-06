
/*insert
update
delete
Merge*/

SELECT *
INTO tblTransactionNew
FROM tblTransaction;
MERGE INTO tbltransaction AS t --- tabla a hacerle merge
USING tblTransactionNew AS N --- la tabla de la que traeremos la informacion
ON t.employeenumber = N.employeenumber
   AND t.dateoftransaction = N.DateOfTransaction
   AND t.amount = n.amount--estableciendo el criterio de combinacion
    WHEN MATCHED
    THEN UPDATE SET 
                    amount = t.amount + N.amount
    WHEN NOT MATCHED BY TARGET
    THEN
      INSERT(amount, 
             dateoftransaction, 
             employeenumber)
      VALUES
(n.amount, 
 n.dateoftransaction, 
 n.employeenumber
)
OUTPUT deleted.*, 
       inserted.*; -- output nos regresa los insertado y lo modificado

SELECT *
INTO #tmpTransaction
FROM tblTransaction; --trablas fisicas temporales

SELECT *
INTO ##tmpTransaction
FROM tblTransaction; --trablas fisicas temporales globales

SELECT *
FROM ##tmpTransaction;
DECLARE @tmpTransaction AS TABLE --tablas temporales tipo variable
(Amount            SMALLMONEY, 
 DateOfTransaction SMALLDATETIME, 
 EmployeeNumber    INT
);
INSERT INTO @tmpTransaction
       SELECT *
       FROM tblTransaction;
SELECT *
FROM @tmpTransaction
WHERE EmployeeNumber = 123;
GO
CREATE TYPE tblTransactionType AS TABLE
(Amount            SMALLMONEY, 
 DateOfTransaction SMALLDATETIME, 
 EmployeeNumber    INT
);
GO
DECLARE @transacciones AS TBLTRANSACTIONTYPE;
INSERT INTO @transacciones
VALUES
(2001, 
 GETDATE(), 
 1
),
(2002, 
 GETDATE(), 
 2
),
(2003, 
 GETDATE(), 
 3
),
(2004, 
 GETDATE(), 
 4
),
(2005, 
 GETDATE(), 
 5
);

--select * from @transacciones
--mandamos llamar nuestro SP

EXEC MergeTransactions 
     @transacciones;

--- ponerlo en un stored procedure
GO
CREATE PROC MergeTransactions @transacciones AS TBLTRANSACTIONTYPE READONLY
AS
     INSERT INTO tblTransaction
            SELECT *
            FROM @transacciones


