SELECT *
FROM tblTransaction
EXCEPT
SELECT *
FROM tblTransactionNew;
SELECT *
FROM tblTransactionNew
WHERE EmployeeNumber NOT IN
(
    SELECT EmployeeNumber
    FROM tblTransaction
);
SELECT *
FROM tblEmployee E
     JOIN(
     SELECT 'a' AS otraLetra, 
            *
     FROM tblTransaction
     WHERE Amount > 0) AS T ON t.EmployeeNumber = e.EmployeeNumber;
SELECT t.*, 
       t.otraLetra
FROM(
    SELECT 'a' AS otraLetra, 
           *
    FROM tblTransaction
    WHERE Amount > 0) AS t;

--Case

DECLARE @numero1 VARCHAR(20);
SELECT @numero1 = 'sdfgsdfg';
IF(@numero1 = 'uno')
    BEGIN
        SELECT 1;
    END;
    ELSE
    IF(@numero1 IS NULL)
        BEGIN
            SELECT 'es nulo';
        END;
        ELSE
        BEGIN
            SELECT 'otro numero';
        END;

SELECT IIF(@numero1 = 'uno', '1', IIF(@numero1 IS NULL, 'es nulo', 'Otro numero'));


SELECT CASE
           WHEN @numero1 = 'uno'
           THEN '1'
           WHEN @numero1 IS NULL
           THEN 'es nulo'
           ELSE 'es otro numero'
       END;

	   SELECT CASE  @numero1
           WHEN  'uno'
           THEN '1'
           WHEN  NULL
           THEN 'es nulo'
           ELSE 'es otro numero'
       END;


