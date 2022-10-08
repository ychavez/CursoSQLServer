-- reporte de ventas por año por empleado y comparado con objetivo de venta
select e.EmployeeNumber, 
floor(abs(sum(t.Amount))  + (100 * rand()) ) Quota, 
Year(t.DateOfTransaction) Year into tblSalesquota
from tblEmployee E join tblTransaction T on e.EmployeeNumber = t.EmployeeNumber
group by  e.EmployeeNumber, Year(t.DateOfTransaction)


select * from tblSalesquota
select * from tblTransaction

select * from sys.databases;

declare @rowNo int = 1;

with  MiCTE as
(
select @rowNo as NumeroRenglon
union all
select NumeroRenglon +1
from MiCTE where NumeroRenglon < 101


)

select * from MiCTE


---reporte de ventas por año por empleado y comparado con objetivo de venta con recursividad

;with sales (EmpNumber, TotalSales, SalesYear)
as
(

select EmployeeNumber EmpNumber, sum(amount) as TotalSales, Year(dateoftransaction) SalesYear   from tblTransaction group by 
EmployeeNumber, Year(dateoftransaction)
),
Sales_Quota(EmpId, SalesQouta,SalesQoutaYear)
AS
(
select EmployeeNumber as EmpId, Sum(Quota) as SalesQouta, Year  from tblSalesquota group by EmployeeNumber, Year

)

select 
*

from sales s join Sales_Quota sq on s.EmpNumber = sq.EmpId and s.SalesYear = sq.SalesQoutaYear
order by EmpId, SalesYear