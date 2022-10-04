--- Uso del select y alias
SELECT 1;
SELECT 1 + 1 AS [Sum]; --Alias

SELECT 1 / 1 AS [Division], 
       1 + 1 AS [Suma], 
       1 * 1 AS [Multiplicacion]; 
-- alias y multiples campos
--select 1/0
--- Modulo Variables y tipos de datos numericos

DECLARE @myVar AS INT= 3000000000;
DECLARE @MyVar2 AS TINYINT= 255;

--set @myVar =  @myVar + @myVar2

SELECT @MyVar2 AS Resultado;

--- tipos numericos enteros
--- int hasta 2,000,000,000
--- tinyInt 255
--- smallint hasta 32768
--- bigint el mas grande
-- tipos numericos no enteros

DECLARE @myVarDecimal AS DECIMAL(18, 4);
SET @myVarDecimal = 1234.679904564;
SELECT @myVarDecimal;

--declare @MyVarmoney as money;
DECLARE @MyVarmoney AS SMALLMONEY;
SET @MyVarmoney = 123456.1234567;
SELECT @MyVarmoney;