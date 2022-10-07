/*
<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>
*/

declare @x xml
set @x = '<Shopping ShopperName="Phillip Burton" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
	<Item Cost="31">Cherries</Item>
	<Item Cost="32">Cherries</Item>
	<Item Cost="33">Cherries</Item>
	<Item Cost="34">Cherries</Item>
	<Item Cost="35">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item Cost="200">Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

--select @x



--/* Lecturas basicas XML CON XQUERY		*/

select @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)') -- leemos un valor de un nodo en especifico

select *, history.value('.','varchar(50)') as item  from tblTransaction --leemos los valores de una columna XML

select 
nodo.col.value('.','varchar(50)') as item, 
nodo.col.value('@Cost','varchar(50)') 

from @x.nodes('/Shopping/ShoppingTrip/Item') as nodo(col)

--/* operaciones con datos en XML */


set @x.modify('insert <Item Cost="5">Nueva comida</Item> 
                into (/Shopping/ShoppingTrip)[2]') -- equivalente al insert
select @x

set @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]
               with "6.0"') -- equivalente al Update

select @x

select @x.query('for $ValueRetrived in /Shopping/ShoppingTrip[1]/Item
                 let $CostVariable := $ValueRetrived/@Cost
				 where $CostVariable >= 4
				 order by $CostVariable
				 return concat(string($CostVariable),";")')



--alter table tblTransaction add History  xml


select  * from tblTransaction

UPDATE tblTransaction SET HISTORY = @X


--- Tablas a XML

select Employee.EmployeeNumber , Employee.EmployeeFirstName, Employee.EmployeeDateOfBirth, t.Amount, t.DateOfTransaction 
from tblEmployee Employee left join tblTransaction T on Employee.EmployeeNumber = t.EmployeeNumber
for xml auto


select Employee.EmployeeNumber as '@Numero', 
Employee.EmployeeFirstName, 
Employee.EmployeeDateOfBirth, 
t.Amount as 'Transaction/Amount', 
t.DateOfTransaction 
from tblEmployee Employee left join tblTransaction T on Employee.EmployeeNumber = t.EmployeeNumber
for xml path('Employees'), root('MyXML')


