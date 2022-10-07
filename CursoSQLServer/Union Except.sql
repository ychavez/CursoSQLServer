/*
Union -- unir el resultado de dos tablas ignorando aquellos que son identicos
union all -- une todos los resultados
intersect  -- trae solo los registros que estan en las dos tablas
except -- nos trae los registros que no estan en las dos tablas
*/

select * from tblTransaction
union
select * from tblTransactionNew


select * from tblTransaction
union all
select * from tblTransactionNew
union all
select * from tblTransactionNew
union all
select * from tblTransactionNew
union all
select * from tblTransactionNew


select * from tblTransaction
intersect
select * from tblTransactionNew
intersect
select * from tblTransactionNew
intersect
select * from tblTransactionNew

select * from tblTransaction
except
select * from tblTransactionNew
except
select * from tblTransactionNew
except
select * from tblTransactionNew
except
select * from tblTransactionNew