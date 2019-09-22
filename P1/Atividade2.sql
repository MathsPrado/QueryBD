USE RecursosHumanos

--Funções

--1. Exiba o maior e o menor salários dos funcionários do estado de SP.
	SELECT MAX(salario) AS 'maior salario', MIN(salario) AS 'Menor salario' FROM Funcionario WHERE estado = 'SP'

--2. Mostre a soma dos salários dos funcionários que têm o sobrenome Cunha.
	SELECT sum(salario) AS 'soma dos salarios' FROM Funcionario WHERE nome LIKE '%Cunha'

--3. Exiba a média dos salários dos funcionários que têm e-mail do "yahoo".
	SELECT AVG(salario) AS 'media dos salarios' FROM Funcionario WHERE email LIKE '%yahoo%'

--4. Apresente a quantidade de funcionários que têm e-mail que não termina com "br".
	SELECT COUNT(*) AS 'quantidadede funcionarios' FROM Funcionario WHERE email NOT LIKE '%br'
	
--5. Exiba a menor data de nascimento dos funcionários.
	SELECT MIN(dataNascto) AS 'menor data de nacimento' FROM Funcionario

--6. Exiba a maior data de nascimento dos funcionários, denominando-a "Maior_Nascimento".
	SELECT MAX(dataNascto) AS 'Maior_Nascimento' FROM Funcionario

--7. Mostre a quantidade de funcionários da cidade de Valinhos, denominando-a "Quantidade_de_Valinhos".
	SELECT COUNT(*) AS 'Quantidade_de_Valinhos' FROM Funcionario WHERE cidade='Valinhos'

--8. Exiba a soma dos salários dos funcionários da cidade de Campinas.
	SELECT sum(salario) AS 'soma_salarios_campinas' FROM Funcionario WHERE cidade='Campinas'
	
--9. Mostre a média dos salários dos funcionários da cidade de São Paulo.
	SELECT AVG(salario) AS 'media_salarios_são_paulo' FROM Funcionario WHERE cidade='São Paulo'
	
--10. Exiba a soma dos salários dos funcionários cujos nomes começam com "Ana".
	SELECT sum(salario) AS 'soma_salarios_anas' FROM Funcionario WHERE nome LIKE 'Ana%'

--11. Exiba a quantidade de funcionários que apresentam "Luis" no nome.
	SELECT COUNT(*) AS 'Quantidade_Luiz' FROM Funcionario WHERE nome LIKE '%Luís%'

--12. Mostre o menor e o maior salários dos funcionários que moram na "Av. São Paulo".
	SELECT MAX(salario) AS 'maior salario', MIN(salario) AS 'Menor salario' FROM Funcionario WHERE endereco LIKE 'Av. São Paulo%'


--GROUP BY

--1. Exiba o cargo e a quantidade de funcionários por cargo em ordem crescente de quantidade.
	SELECT cargo, COUNT(*) AS 'quantidade_por_cargo' FROM Funcionario GROUP BY cargo ORDER BY quantidade_por_cargo
	
--2. Exiba o cargo e a quantidade de funcionários por cargo, eliminando os cargos nulos.
	SELECT cargo, COUNT(*) AS 'quantidade_por_caargo' FROM Funcionario where cargo IS NOT NULL GROUP BY cargo ORDER BY COUNT(cargo)

--3. Apresente o cargo e a média dos salários (denominando de "Media_ Salarios_Cargo") dos funcionários por cargo.
	SELECT cargo, AVG(salario) AS 'media_salario_por_cargo' FROM Funcionario GROUP BY cargo

--4. Exiba o cargo e a soma dos salários dos funcionários por cargo maiores que 3000,00.
	SELECT cargo, SUM(salario) AS 'soma_salario_cargo' FROM Funcionario GROUP BY cargo HAVING SUM(salario) > 3000

--5. Apresente o cargo e a soma dos salários dos funcionários por cargo do estado de SP.
	SELECT cargo, SUM(salario) AS 'soma_salario_cargo' FROM Funcionario WHERE estado='SP' GROUP BY cargo

--6. Altere para verdadeiro (1) o campo ativo dos funcionários das cidades de Jundiaí e São Paulo.
	UPDATE Funcionario SET ativo = 1 where cidade = 'Jundiaí' OR cidade = 'São Paulo'

--7. Altere para falso (0) o campo ativo dos funcionários que não são das cidades de Jundiaí e São Paulo.
	UPDATE Funcionario SET ativo = 0 where cidade != 'Jundiaí' AND cidade != 'São Paulo'

--8. Exiba o campo ativo e a quantidade de funcionários ativos e não ativos.
	SELECT ativo, COUNT(*) AS 'quantidade_ativo' FROM Funcionario GROUP BY ativo

--9. Apresente a cidade e a soma dos salários dos funcionários por cidade.
	SELECT cidade, SUM(salario) AS 'soma_salario_cidade' FROM Funcionario GROUP BY cidade

--10. Exiba a cidade e a média diferente de nula dos salários dos funcionários por cidade.
	SELECT cidade, AVG(salario) AS 'media_salario_cidade' FROM Funcionario where salario IS NOT NULL GROUP BY cidade

--11. Mostre o cargo, a soma e a média dos salários dos funcionários por cargo, cuja soma seja menor que 5000.
	SELECT cargo, SUM(salario) AS soma_salario_cargo, AVG(salario) AS media_salario_cargo FROM Funcionario GROUP BY cargo HAVING SUM(salario) < 5000

--12. Exiba a cidade, o cargo, a soma e a média dos salários dos funcionários por cidade e cargo.
	SELECT cidade, cargo, SUM(salario) AS soma_salario_cidade_cargo, AVG(salario) AS media_salario_cidade_cargo FROM Funcionario GROUP BY cidade, cargo
