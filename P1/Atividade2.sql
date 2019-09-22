USE RecursosHumanos

--Fun��es

--1. Exiba o maior e o menor sal�rios dos funcion�rios do estado de SP.
	SELECT MAX(salario) AS 'maior salario', MIN(salario) AS 'Menor salario' FROM Funcionario WHERE estado = 'SP'

--2. Mostre a soma dos sal�rios dos funcion�rios que t�m o sobrenome Cunha.
	SELECT sum(salario) AS 'soma dos salarios' FROM Funcionario WHERE nome LIKE '%Cunha'

--3. Exiba a m�dia dos sal�rios dos funcion�rios que t�m e-mail do "yahoo".
	SELECT AVG(salario) AS 'media dos salarios' FROM Funcionario WHERE email LIKE '%yahoo%'

--4. Apresente a quantidade de funcion�rios que t�m e-mail que n�o termina com "br".
	SELECT COUNT(*) AS 'quantidadede funcionarios' FROM Funcionario WHERE email NOT LIKE '%br'
	
--5. Exiba a menor data de nascimento dos funcion�rios.
	SELECT MIN(dataNascto) AS 'menor data de nacimento' FROM Funcionario

--6. Exiba a maior data de nascimento dos funcion�rios, denominando-a "Maior_Nascimento".
	SELECT MAX(dataNascto) AS 'Maior_Nascimento' FROM Funcionario

--7. Mostre a quantidade de funcion�rios da cidade de Valinhos, denominando-a "Quantidade_de_Valinhos".
	SELECT COUNT(*) AS 'Quantidade_de_Valinhos' FROM Funcionario WHERE cidade='Valinhos'

--8. Exiba a soma dos sal�rios dos funcion�rios da cidade de Campinas.
	SELECT sum(salario) AS 'soma_salarios_campinas' FROM Funcionario WHERE cidade='Campinas'
	
--9. Mostre a m�dia dos sal�rios dos funcion�rios da cidade de S�o Paulo.
	SELECT AVG(salario) AS 'media_salarios_s�o_paulo' FROM Funcionario WHERE cidade='S�o Paulo'
	
--10. Exiba a soma dos sal�rios dos funcion�rios cujos nomes come�am com "Ana".
	SELECT sum(salario) AS 'soma_salarios_anas' FROM Funcionario WHERE nome LIKE 'Ana%'

--11. Exiba a quantidade de funcion�rios que apresentam "Luis" no nome.
	SELECT COUNT(*) AS 'Quantidade_Luiz' FROM Funcionario WHERE nome LIKE '%Lu�s%'

--12. Mostre o menor e o maior sal�rios dos funcion�rios que moram na "Av. S�o Paulo".
	SELECT MAX(salario) AS 'maior salario', MIN(salario) AS 'Menor salario' FROM Funcionario WHERE endereco LIKE 'Av. S�o Paulo%'


--GROUP BY

--1. Exiba o cargo e a quantidade de funcion�rios por cargo em ordem crescente de quantidade.
	SELECT cargo, COUNT(*) AS 'quantidade_por_cargo' FROM Funcionario GROUP BY cargo ORDER BY quantidade_por_cargo
	
--2. Exiba o cargo e a quantidade de funcion�rios por cargo, eliminando os cargos nulos.
	SELECT cargo, COUNT(*) AS 'quantidade_por_caargo' FROM Funcionario where cargo IS NOT NULL GROUP BY cargo ORDER BY COUNT(cargo)

--3. Apresente o cargo e a m�dia dos sal�rios (denominando de "Media_ Salarios_Cargo") dos funcion�rios por cargo.
	SELECT cargo, AVG(salario) AS 'media_salario_por_cargo' FROM Funcionario GROUP BY cargo

--4. Exiba o cargo e a soma dos sal�rios dos funcion�rios por cargo maiores que 3000,00.
	SELECT cargo, SUM(salario) AS 'soma_salario_cargo' FROM Funcionario GROUP BY cargo HAVING SUM(salario) > 3000

--5. Apresente o cargo e a soma dos sal�rios dos funcion�rios por cargo do estado de SP.
	SELECT cargo, SUM(salario) AS 'soma_salario_cargo' FROM Funcionario WHERE estado='SP' GROUP BY cargo

--6. Altere para verdadeiro (1) o campo ativo dos funcion�rios das cidades de Jundia� e S�o Paulo.
	UPDATE Funcionario SET ativo = 1 where cidade = 'Jundia�' OR cidade = 'S�o Paulo'

--7. Altere para falso (0) o campo ativo dos funcion�rios que n�o s�o das cidades de Jundia� e S�o Paulo.
	UPDATE Funcionario SET ativo = 0 where cidade != 'Jundia�' AND cidade != 'S�o Paulo'

--8. Exiba o campo ativo e a quantidade de funcion�rios ativos e n�o ativos.
	SELECT ativo, COUNT(*) AS 'quantidade_ativo' FROM Funcionario GROUP BY ativo

--9. Apresente a cidade e a soma dos sal�rios dos funcion�rios por cidade.
	SELECT cidade, SUM(salario) AS 'soma_salario_cidade' FROM Funcionario GROUP BY cidade

--10. Exiba a cidade e a m�dia diferente de nula dos sal�rios dos funcion�rios por cidade.
	SELECT cidade, AVG(salario) AS 'media_salario_cidade' FROM Funcionario where salario IS NOT NULL GROUP BY cidade

--11. Mostre o cargo, a soma e a m�dia dos sal�rios dos funcion�rios por cargo, cuja soma seja menor que 5000.
	SELECT cargo, SUM(salario) AS soma_salario_cargo, AVG(salario) AS media_salario_cargo FROM Funcionario GROUP BY cargo HAVING SUM(salario) < 5000

--12. Exiba a cidade, o cargo, a soma e a m�dia dos sal�rios dos funcion�rios por cidade e cargo.
	SELECT cidade, cargo, SUM(salario) AS soma_salario_cidade_cargo, AVG(salario) AS media_salario_cidade_cargo FROM Funcionario GROUP BY cidade, cargo
