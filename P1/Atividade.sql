USE RecursosHumanos
GO

--Data e Hora

--1. Exiba nome e data de nascimento dos funcion�rios, separando dia, m�s e ano em colunas.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento', MONTH(dataNascto) AS 'M�s de Nascimento', YEAR(dataNascto) AS 'Ano de Nascimento' FROM Funcionario

--2. Exiba o nome dos meses da data de nascimento dos funcion�rios sem repeti-los e ordenados.
SELECT DISTINCT DATENAME(MONTH, dataNascto) AS 'M�s de nacimento' FROM Funcionario ORDER BY DATENAME(MONTH, dataNascto) ASC

--3. Exiba idFuncionario e nome de todos os funcion�rios que nasceram em 1987.
SELECT idFuncionario, nome FROM Funcionario WHERE YEAR(dataNascto) = 1987

--4. Exiba nome e dia de nascimento dos funcion�rios que nasceram em abril de 1988.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento' FROM Funcionario WHERE YEAR(dataNascto) = 1987

--5. Exiba o nome e a data de nascimento dos funcion�rios acrescida de dois meses
SELECT nome, DATEADD(MONTH, 2, dataNascto) AS 'Data de Nascimento acrecidade dois meses' FROM Funcionario

--6. Exiba o nome e a idade dos funcion�rios, calculando a idade em rela��o � data denascimento e � data de hoje.
SELECT nome, DATEDIFF(MONTH, dataNascto, GETDATE()) / 12 AS 'Idade' FROM Funcionario

--7. Exiba o idFuncionario, nome e ano de nascimento dos funcion�rios que nasceram entre mar�o e maio de 1990.
SELECT idFuncionario, nome, YEAR(dataNascto) AS 'Ano de Nacimento' FROM Funcionario WHERE MONTH(dataNascto) BETWEEN 3 AND 5 AND YEAR(dataNascto) = 1990

--8. Exiba nome e ano de nascimento dos funcion�rios do estado de SP.
SELECT nome, YEAR(dataNascto) AS 'Ano de Nacimento' FROM Funcionario WHERE estado = 'SP'

--9. Exiba nome e data de nascimento dos funcion�rios que nasceram antes de 1990
SELECT nome, dataNascto FROM Funcionario WHERE YEAR(dataNascto) < 1990

--10. Exiba cidade e estado dos funcion�rios que nasceram ap�s 1989, sem repetir os dados.
SELECT DISTINCT cidade, estado FROM Funcionario WHERE YEAR(dataNascto) > 1989

--11. Exiba todos os dados dos funcion�rios que nasceram nos anos de 1988 e 1990.
SELECT * FROM Funcionario WHERE YEAR(dataNascto) = 1988 OR YEAR(dataNascto) = 1990 

--12. Exiba nome dos funcion�rios que nasceram no dia 30.
SELECT nome FROM Funcionario WHERE DAY(dataNascto) = 30

--Matem�tica

--1. Exiba o nome e o sal�rio dos funcion�rios, acrescentando o valor do "Pi" aos sal�rios
SELECT nome, salario + PI() AS 'salario + PI' FROM Funcionario

--2. Mostre a raiz quadrada do dia de nascimento dos funcion�rios de Valinhos.
SELECT SQRT(DAY(dataNascto)) AS 'Raiz quadrada do m�s de nascimento' FROM Funcionario WHERE cidade = 'Valinhos'

--3. Exiba o logaritmo do m�s de nascimento dos funcion�rios que nasceram em 1990.
SELECT LOG(MONTH(dataNascto)) AS 'Logaritimo do mes de nascimento' FROM Funcionario WHERE YEAR(dataNascto) = 1990

--4. Exiba nome e dia de nascimento dos funcion�rios para os quais a pot�ncia do dia de nascimento elevado a 3 seja maior ou igual a 1000.
SELECT nome, DAY(dataNascto) AS 'Dia de Nascimento' FROM Funcionario WHERE POWER(DAY(dataNascto), 3) >= 1000

--5. Exiba o sal�rio dos funcion�rios acrescido de 15,5%, arredondando para sem casa decimal e maiores que 1000.
SELECT ROUND(salario + (salario/100 * 15.5), 0) AS 'Salario + 15,5%' FROM Funcionario WHERE ROUND(salario + (salario/100 * 15.5), 0) > 1000

--6. Mostre o valor absoluto de 1500 menos o sal�rio dos funcion�rios
SELECT ABS(1500) - salario AS '1500 - salario' FROM Funcionario

--7. Exiba o idFuncionario e a raiz quadrada do idFuncionario dos funcion�rios que nasceram antes de abril de 1989.
SELECT idFuncionario, SQRT(idFuncionario) AS 'raiz do id' FROM Funcionario WHERE YEAR(dataNascto) <= 1989 AND MONTH(dataNascto) < 4 OR YEAR(dataNascto) < 1989

--8. Exiba o nome e o sal�rio dos funcion�rios com desconto de 35%, arredondando para uma casa decimal.
SELECT ROUND(salario - (salario/100 * 35), 1) AS '1500 - salario' FROM Funcionario

--9. Apresente o logaritmo do idFuncionario dos funcion�rios.
SELECT LOG(idFuncionario) AS 'Logaritimo de idFuncionario'FROM Funcionario

--10. Exiba a raiz quadrada do idFuncionario dos funcion�rios.
SELECT SQRT(idFuncionario) AS 'raiz quadrada de idFuncionario' FROM Funcionario

--11. Apresente o c�lculo da pot�ncia do idFuncionario dos funcion�rios elevado a 2.
SELECT POWER(idFuncionario, 2) AS 'idFuncionario elevado a 2' FROM Funcionario

--12. Exiba o valor absoluto do c�lculo do idFuncionario dos funcion�rios menos 10 emordem decrescente.
SELECT ABS(idFuncionario-10) AS 'absoluto idFuncionario-10', NOME FROM Funcionario ORDER BY ABS(idFuncionario-10) DESC

--String

--1. Exiba o nome dos funcion�rios em letras mai�sculas.
SELECT UPPER(nome) AS 'NOME MAIUSCULO' FROM Funcionario

--2. Exiba o nome do m�s da data de nascimento dos funcion�rios, bem como a quantidade de caracteres de cada um desses meses sem repeti-los
SELECT DISTINCT DATENAME(MONTH, dataNascto) AS 'M�s de nascimento', LEN(DATENAME(MONTH, dataNascto)) AS 'comprimento do m�s de nascimento' FROM Funcionario

--3. Apresente o nome dos funcion�rios, substituindo os espa�os existentes entre nome e sobrenome por � (tra�o).
SELECT REPLACE(nome, ' ', '-') AS 'nome com tra�o' FROM Funcionario

--4. Exiba as tr�s primeiras e as tr�s �ltimas letras dos nomes dos funcion�rios.
SELECT LEFT(nome, 3) AS '3 primeiras', RIGHT(nome, 3) AS '3 ultimas' FROM Funcionario

--5. Mostre a raiz quadrada do tamanho dos nomes dos funcion�rios.
SELECT SQRT(LEN(nome)) AS 'Raiz quadrada do tamanho do nome' FROM Funcionario

--6. Exiba as cidades dos funcion�rios a partir da terceira posi��o com cinco posi��es, sem repeti-las.
SELECT DISTINCT SUBSTRING(cidade, 3, 5) AS 'cidades dos funcion�rios a partir da terceira posi��o com cinco posi��es' FROM Funcionario

--7. Exiba os nomes dos funcion�rios, retirando os espa�os existentes entre nomes e sobrenomes
SELECT REPLACE(nome, ' ', '') AS 'nome com tra�o' FROM Funcionario

--8. Exiba o caractere padr�o ASCII do idFuncionario dos funcion�rios de Campinas.
SELECT CHAR(idFuncionario) AS 'caracter ASCII' FROM Funcionario WHERE cidade = 'Campinas' 

--9. Mostre o valor do caractere da tabela ASCII referente aos nomes dos funcion�rios que nasceram ap�s o dia 20.
SELECT ASCII(nome) AS 'valor ASCII do nome' FROM Funcionario WHERE DAY(dataNascto) > 20

--10. Exiba os quatro primeiros caracteres das cidades dos funcion�rios sem espa�o em branco no final.
SELECT RTRIM(LEFT(cidade, 4)) AS 'quatro primeiros caracteres das cidades dos funcion�rios sem espa�o em branco no final' FROM Funcionario

--11. Exiba os seis �ltimos caracteres das cidades dos funcion�rios sem espa�o em branco no in�cio.
SELECT lTRIM(RIGHT(cidade, 6)) AS 'seis �ltimos caracteres das cidades dos funcion�rios sem espa�o em branco no in�cio.' FROM Funcionario

--12. Apresente o nome das cidades dos funcion�rios em letras min�sculas sem repeti-las.
SELECT DISTINCT UPPER(cidade) AS 'cidade maiuscula' FROM Funcionario
