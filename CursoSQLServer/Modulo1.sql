--- Uso del select y alias
select 1

select 1+1 as [Sum] --Alias

select 1/1 as [Division], 1+1 as [Suma]
, 1*1 as [Multiplicacion] 
-- alias y multiples campos

--select 1/0


--- Modulo Variables y tipos de datos numericos

declare @myVar as int = 3000000000
declare @MyVar2 as tinyInt = 255

--set @myVar =  @myVar + @myVar2

select @MyVar2 as Resultado

	--- tipos numericos enteros

	--- int hasta 2,000,000,000
	--- tinyInt 255
	--- smallint hasta 32768
	--- bigint el mas grande

   -- tipos numericos no enteros

   declare @myVarDecimal as decimal(18,4)

   set @myVarDecimal = 1234.679904564

   select @myVarDecimal

  --declare @MyVarmoney as money;
  declare @MyVarmoney as smallmoney;

   set @MyVarmoney = 123456.1234567

   select @MyVarmoney



