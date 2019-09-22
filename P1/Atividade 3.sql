USE RecursosHumanos

--TOP

--1. Exiba o nome dos quatro primeiros funcionarios
	SELECT TOP 4 * FROM Funcionario

--2. Exiba todos os dados de dois funcionarios da cidade de valinhos
	SELECT TOP 2 * FROM Funcionario WHERE cidade='Valinhos'

--3. Apresente nome e data de nascimento de um funcionario mais velho
	SELECT TOP 1 nome, dataNascto FROM Funcionario ORDER BY dataNascto ASC

--4. Exiba duas cidades e quantidade de funcionarios por cidade
	SELECT TOP 2 cidade, COUNT(*) AS 'funcionarios_por_cidade' FROM Funcionario GROUP BY cidade

--5. Apresente dois cargos e a quantidade de funcionarios por cargo 
	SELECT TOP 2 cargo, COUNT(*) AS 'funcionarios_por_cargo' FROM Funcionario GROUP BY cargo

--6. Exiba todos os dados de 30% dos funcionarios
	SELECT TOP 30 PERCENT * FROM Funcionario

--7. Mostre o nome e email de seis funcionarios
	SELECT TOP 6 nome, email FROM Funcionario

--8. Exiba idFuncionario, cargo e ativo de 70% dos funcionarios
	SELECT TOP 70 PERCENT idFuncionario, cargo, ativo FROM Funcionario

--9. Exiba idFuncionario e salario do menor funcionario não nulo de um funcionario
	SELECT TOP 1 IDFuncionario, salario FROM Funcionario WHERE salario IS NOT NULL ORDER BY salario ASC

--10. Mostre o nome e salario do maior salario de um funcionario
	SELECT TOP 1 nome, salario FROM Funcionario ORDER BY salario DESC

--11. Exiba o nome e endereço do primeiro funcionario
	SELECT TOP 1 nome, endereco FROM Funcionario

--12. Exiba todos os dados de 90% dos funcionarios
	SELECT TOP 90 PERCENT * FROM Funcionario

--13. Apresente todos os dados de um funcionario da cidade de São Paulo
	SELECT TOP 1 * FROM Funcionario WHERE cidade='SãO Paulo'

--14. Mostre nome, endereço, cidade e estado de 20% dos funcionarios
	SELECT TOP 20 PERCENT nome, endereco, cidade, estado FROM Funcionario

--15. Exiba todos os dados de dois funcionarios que nasceram no ano de 1988
	SELECT TOP 2 * FROM Funcionario WHERE YEAR(dataNascto) = 1988


