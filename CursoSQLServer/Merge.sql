
/*insert
update
delete
Merge*/

--select * into tblTransactionNew  from  tblTransaction

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
output deleted.*, inserted.*; -- output nos regresa los insertado y lo modificado

