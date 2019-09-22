USE RecursosHumanos

SELECT COUNT(*) FROM Funcionario

SELECT COUNT(DISTINCT cidade) FROM Funcionario

SELECT SUM(salario) FROM Funcionario

SELECT AVG(salario) FROM Funcionario

SELECT MAX(salario) FROM Funcionario

SELECT MIN(salario) FROM Funcionario

SELECT cidade, COUNT(*) FROM Funcionario GROUP BY cidade

SELECT cidade, COUNT(*) FROM Funcionario WHERE COUNT(*)>2 GROUP BY cidade --dará erro porque a query esta sendo executada antes da função 

SELECT cidade, COUNT(*) FROM Funcionario GROUP BY cidade HAVING COUNT(*)>2