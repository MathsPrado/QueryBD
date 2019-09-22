USE RecursosHumanos

--DATA
SELECT GETDATE()

SELECT nome, DAY(dataNascto) FROM Funcionario

SELECT nome, MONTH(dataNascto) FROM Funcionario

SELECT nome, YEAR(dataNascto) FROM Funcionario

SELECT dataNascto, DATEADD(DAY, 5, dataNascto) FROM Funcionario

SELECT dataNascto, DATEADD(MONTH, 2, dataNascto) FROM Funcionario

SELECT dataNascto, DATEADD(YEAR, 3, dataNascto) FROM Funcionario

SELECT DATEDIFF(DAY, dataNascto, GETDATE()) FROM Funcionario

SELECT DATEDIFF(MONTH, dataNascto, GETDATE()) FROM Funcionario

SELECT DATEDIFF(YEAR, dataNascto, GETDATE()) FROM Funcionario

SELECT DATEDIFF(SECOND, '12-10-2000', GETDATE())

SELECT DATENAME(MONTH, dataNascto) FROM Funcionario

SELECT DATENAME(WEEKDAY, dataNascto) FROM Funcionario


--NUMERO
SELECT ABS(-10)

SELECT POWER(2,3)

SELECT SQRT(25)

SELECT ROUND(7.56,1)

SELECT LOG(4)

SELECT PI()

SELECT ROUND(LOG(SQRT(9)),3)

SELECT PI()/3

SELECT ROUND(PI(),2)

SELECT ROUND(salario,0) FROM Funcionario


--STRING
SELECT ASCII('A')

SELECT ASCII('a')

SELECT CHAR(90)

SELECT LEN('amor')0

SELECT LEFT('Prédio',3)

SELECT RIGHT('Prédio',5)

SELECT LOWER('CARRO')

SELECT UPPER('cachorro')

SELECT SUBSTRING('PANELA',2,4)

SELECT REPLACE('guarda_chuva','_','-')

SELECT LTRIM(' faca')

SELECT RTRIM('uva ')