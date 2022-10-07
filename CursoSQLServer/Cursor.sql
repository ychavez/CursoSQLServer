
-- while
declare @Contador int = 0;


while @Contador < 100
begin
  
  select @Contador = @Contador + 1

  select @Contador

end

alter table tblEmployee add FullName varchar(100)
---- Cursor
declare @EmployeeNumber as int, @FirstName varchar(60), @MiddletName varchar(60),  @LastName varchar(60);
declare crfEmployee 
cursor for select Employeenumber , EmployeeFirstName, EmployeeMiddleName, EmployeeLastName from tblEmployee

open crfEmployee

fetch next from crfEmployee into @EmployeeNumber, @FirstName, @MiddletName, @LastName
 while @@FETCH_STATUS = 0
	begin
		 print @employeenumber;
		 update tblEmployee set FullName = @FirstName + ' '+ @MiddletName + ' ' + @LastName where EmployeeNumber = @EmployeeNumber
		 
		 fetch next from crfEmployee into @EmployeeNumber, @FirstName, @MiddletName, @LastName
	end
close crfEmployee
deallocate crfEmployee

select * from tblEmployee