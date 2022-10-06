SELECT *
FROM tblEmployee
WHERE EmployeeNumber = 2000;

-- los constraint nos van a servir entre otras cosas para poner algunas reglas en nuestras tablas

ALTER TABLE tblemployee
ADD CONSTRAINT unqRFCEmployee UNIQUE(employeeRFC);
SELECT *
FROM tblTransaction;
INSERT INTO tblTransaction
VALUES
(1000, 
 '05-10-2022', 
 2000
);
SELECT *
FROM tblTransaction
WHERE EmployeeNumber = 2000;

-- agregar contraint para evitar duplicar mismos registros
ALTER TABLE tblTransaction
ADD CONSTRAINT unqTransaction UNIQUE(amount, dateOfTransaction, EmployeeNumber);

-- quitar constraint
ALTER TABLE tblEmployee DROP CONSTRAINT PK_tblEmployee;

--Agregar llave primaria a tabla employeee
ALTER TABLE tblEmployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY(employeenumber);

--- agregar un constraint para que automaticamente llene el campo con una secuencia
CREATE TABLE tblEmployee2
(EmployeeNumber INT
 PRIMARY KEY IDENTITY(1, 1), 
 Name           VARCHAR(100)
);
DELETE tblEmployee2;
-- borra todos los registros pero queda la secuencia del identity

TRUNCATE TABLE tblemployee2; -- where employeenumber = 1 no nos dejara ponerle Where

INSERT INTO tblemployee2
VALUES('hola');

-- traemos el ID generado automaticamente por el identity
SELECT @@IDENTITY; -- nos trae el ultimo Id generado
SELECT SCOPE_IDENTITY(); -- tambien nos trae el ultimo id generado
SELECT IDENT_CURRENT('dbo.tblemployee2');

-- consultar nuestro spid
SELECT @@SPID;

--- tipos de llave GUID
SELECT NEWID();

-- id unicos y secuenciales
CREATE TABLE tblEmployee3
(EmployeeNumber UNIQUEIDENTIFIER
 PRIMARY KEY
 DEFAULT NEWSEQUENTIALID(), 
 Name           VARCHAR(100)
);

-- llave foranea
ALTER TABLE tbltransaction
ADD CONSTRAINT FK_tbltransaction_tblEmployee FOREIGN KEY(employeenumber) REFERENCES tblemployee(employeenumber);

-- en este caso borramos los registros fantasma
DELETE t
FROM tblTransaction t
     LEFT JOIN tblEmployee e ON e.EmployeeNumber = t.EmployeeNumber
WHERE e.Department IS NULL;

-- en este caso las transacciones fantasma se asigan al usuario 2000

UPDATE t
  SET 
      t.EmployeeNumber = 2000
FROM tblTransaction t
     LEFT JOIN tblEmployee e ON e.EmployeeNumber = t.EmployeeNumber
WHERE e.Department IS NULL;


ALTER TABLE tbltransaction DROP CONSTRAINT FK_tbltransaction_tblEmployee;

SELECT *
FROM tblTransaction
WHERE EmployeeNumber = 2000;