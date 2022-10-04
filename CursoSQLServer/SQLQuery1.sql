--Funciones matematicas
declare @MYVAR as decimal(7,2) = 3

--Elevarlo a la potencia 3
 select power(@myvar,3) as Potencia

 --Al cuadrado
 seLeCt square(@myvar) as Cuadrado

 -- Raiz cuadrada
 select SQRT(@myvar)as RaizCuadrada


 declare @DulcesVendidos as decimal(7,2) = 15.91

 select @DulcesVendidos as DulcesVendidos

 select FLOOR(@DulcesVendidos) [FLOOR] -- al mas bajo
 select CEILING(@DulcesVendidos) [CEILING] -- al mas alto
 select ROUND(@DulcesVendidos,-1) [ROUND] -- Redondeo normal