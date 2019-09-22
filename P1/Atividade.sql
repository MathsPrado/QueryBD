USE RecursosHumanos
GO

--Data e Hora

--1. Exiba nome e data de nascimento dos funcionários, separando dia, mês e ano em colunas.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento', MONTH(dataNascto) AS 'Mês de Nascimento', YEAR(dataNascto) AS 'Ano de Nascimento' FROM Funcionario

--2. Exiba o nome dos meses da data de nascimento dos funcionários sem repeti-los e ordenados.
SELECT DISTINCT DATENAME(MONTH, dataNascto) AS 'Mês de nacimento' FROM Funcionario ORDER BY DATENAME(MONTH, dataNascto) ASC

--3. Exiba idFuncionario e nome de todos os funcionários que nasceram em 1987.
SELECT idFuncionario, nome FROM Funcionario WHERE YEAR(dataNascto) = 1987

--4. Exiba nome e dia de nascimento dos funcionários que nasceram em abril de 1988.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento' FROM Funcionario WHERE YEAR(dataNascto) = 1987

--5. Exiba o nome e a data de nascimento dos funcionários acrescida de dois meses
SELECT nome, DATEADD(MONTH, 2, dataNascto) AS 'Data de Nascimento acrecidade dois meses' FROM Funcionario

--6. Exiba o nome e a idade dos funcionários, calculando a idade em relação à data denascimento e à data de hoje.
SELECT nome, DATEDIFF(MONTH, dataNascto, GETDATE()) / 12 AS 'Idade' FROM Funcionario

--7. Exiba o idFuncionario, nome e ano de nascimento dos funcionários que nasceram entre março e maio de 1990.
SELECT idFuncionario, nome, YEAR(dataNascto) AS 'Ano de Nacimento' FROM Funcionario WHERE MONTH(dataNascto) BETWEEN 3 AND 5 AND YEAR(dataNascto) = 1990

--8. Exiba nome e ano de nascimento dos funcionários do estado de SP.
SELECT nome, YEAR(dataNascto) AS 'Ano de Nacimento' FROM Funcionario WHERE estado = 'SP'

--9. Exiba nome e data de nascimento dos funcionários que nasceram antes de 1990
SELECT nome, dataNascto FROM Funcionario WHERE YEAR(dataNascto) < 1990

--10. Exiba cidade e estado dos funcionários que nasceram após 1989, sem repetir os dados.
SELECT DISTINCT cidade, estado FROM Funcionario WHERE YEAR(dataNascto) > 1989

--11. Exiba todos os dados dos funcionários que nasceram nos anos de 1988 e 1990.
SELECT * FROM Funcionario WHERE YEAR(dataNascto) = 1988 OR YEAR(dataNascto) = 1990 

--12. Exiba nome dos funcionários que nasceram no dia 30.
SELECT nome FROM Funcionario WHERE DAY(dataNascto) = 30

--Matemática

--1. Exiba o nome e o salário dos funcionários, acrescentando o valor do "Pi" aos salários
SELECT nome, salario + PI() AS 'salario + PI' FROM Funcionario

--2. Mostre a raiz quadrada do dia de nascimento dos funcionários de Valinhos.
SELECT SQRT(DAY(dataNascto)) AS 'Raiz quadrada do mês de nascimento' FROM Funcionario WHERE cidade = 'Valinhos'

--3. Exiba o logaritmo do mês de nascimento dos funcionários que nasceram em 1990.
SELECT LOG(MONTH(dataNascto)) AS 'Logaritimo do mes de nascimento' FROM Funcionario WHERE YEAR(dataNascto) = 1990

--4. Exiba nome e dia de nascimento dos funcionários para os quais a potência do dia de nascimento elevado a 3 seja maior ou igual a 1000.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento' FROM Funcionario WHERE POWER(DAY(dataNascto), 3) >= 1000

--5. Exiba o salário dos funcionários acrescido de 15,5%, arredondando para sem casa decimal e maiores que 1000.
SELECT ROUND(salario + (salario/100 * 15.5), 0) AS 'Salario + 15,5%' FROM Funcionario WHERE ROUND(salario + (salario/100 * 15.5), 0) > 1000

--6. Mostre o valor absoluto de 1500 menos o salário dos funcionários
SELECT ABS(1500) - salario AS '1500 - salario' FROM Funcionario

--7. Exiba o idFuncionario e a raiz quadrada do idFuncionario dos funcionários que nasceram antes de abril de 1989.
SELECT idFuncionario, SQRT(idFuncionario) AS 'raiz do id' FROM Funcionario WHERE YEAR(dataNascto) <= 1989 AND MONTH(dataNascto) < 4 OR YEAR(dataNascto) < 1989

--8. Exiba o nome e o salário dos funcionários com desconto de 35%, arredondando para uma casa decimal.
SELECT ROUND(salario - (salario/100 * 35), 1) AS '1500 - salario' FROM Funcionario

--9. Apresente o logaritmo do idFuncionario dos funcionários.
SELECT LOG(idFuncionario) AS 'Logaritimo de idFuncionario'FROM Funcionario

--10. Exiba a raiz quadrada do idFuncionario dos funcionários.
SELECT SQRT(idFuncionario) AS 'raiz quadrada de idFuncionario' FROM Funcionario

--11. Apresente o cálculo da potência do idFuncionario dos funcionários elevado a 2.
SELECT POWER(idFuncionario, 2) AS 'idFuncionario elevado a 2' FROM Funcionario

--12. Exiba o valor absoluto do cálculo do idFuncionario dos funcionários menos 10 emordem decrescente.
SELECT ABS(idFuncionario-10) AS 'absoluto idFuncionario-10', NOME FROM Funcionario ORDER BY ABS(idFuncionario-10) DESC

--String

--1. Exiba o nome dos funcionários em letras maiúsculas.
SELECT UPPER(nome) AS 'NOME MAIUSCULO' FROM Funcionario

--2. Exiba o nome do mês da data de nascimento dos funcionários, bem como a quantidade de caracteres de cada um desses meses sem repeti-los
SELECT DISTINCT DATENAME(MONTH, dataNascto) AS 'Mês de nascimento', LEN(DATENAME(MONTH, dataNascto)) AS 'comprimento do mês de nascimento' FROM Funcionario

--3. Apresente o nome dos funcionários, substituindo os espaços existentes entre nome e sobrenome por – (traço).
SELECT REPLACE(nome, ' ', '-') AS 'nome com traço' FROM Funcionario

--4. Exiba as três primeiras e as três últimas letras dos nomes dos funcionários.
SELECT LEFT(nome, 3) AS '3 primeiras', RIGHT(nome, 3) AS '3 ultimas' FROM Funcionario

--5. Mostre a raiz quadrada do tamanho dos nomes dos funcionários.
SELECT SQRT(LEN(nome)) AS 'Raiz quadrada do tamanho do nome' FROM Funcionario

--6. Exiba as cidades dos funcionários a partir da terceira posição com cinco posições, sem repeti-las.
SELECT DISTINCT SUBSTRING(cidade, 3, 5) AS 'cidades dos funcionários a partir da terceira posição com cinco posições' FROM Funcionario

--7. Exiba os nomes dos funcionários, retirando os espaços existentes entre nomes e sobrenomes
SELECT REPLACE(nome, ' ', '') AS 'nome com traço' FROM Funcionario

--8. Exiba o caractere padrão ASCII do idFuncionario dos funcionários de Campinas.
SELECT CHAR(idFuncionario) AS 'caracter ASCII' FROM Funcionario WHERE cidade = 'Campinas' 

--9. Mostre o valor do caractere da tabela ASCII referente aos nomes dos funcionários que nasceram após o dia 20.
SELECT ASCII(nome) AS 'valor ASCII do nome' FROM Funcionario WHERE DAY(dataNascto) > 20

--10. Exiba os quatro primeiros caracteres das cidades dos funcionários sem espaço em branco no final.
SELECT RTRIM(LEFT(cidade, 4)) AS 'quatro primeiros caracteres das cidades dos funcionários sem espaço em branco no final' FROM Funcionario

--11. Exiba os seis últimos caracteres das cidades dos funcionários sem espaço em branco no início.
SELECT lTRIM(RIGHT(cidade, 6)) AS 'seis últimos caracteres das cidades dos funcionários sem espaço em branco no início.' FROM Funcionario

--12. Apresente o nome das cidades dos funcionários em letras minúsculas sem repeti-las.
SELECT DISTINCT UPPER(cidade) AS 'cidade maiuscula' FROM Funcionario
