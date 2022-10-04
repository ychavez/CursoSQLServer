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

	--- tipos de datos enteros

	--- int hasta 2,000,000,000
	--- tinyInt 255
	--- smallint hasta 32768
	--- bigint el mas grande

