CREATE DATABASE Estudos
GO
USE Estudos

GO 

CREATE TABLE CDS(
	CODIGO INTEGER IDENTITY,
	NOME VARCHAR(50),
	DATACOMPRA DATE,
	VALORPAGO DECIMAL(10,2),
	LOCALCOMPRA VARCHAR(100),
	ALBUM VARCHAR(100)

CONSTRAINT PK_CDS PRIMARY KEY(CODIGO)
)

GO
CREATE TABLE MUSICAS(
	CODIGOCD INTEGER,
	NUMERO INTEGER,
	NOME VARCHAR(50),
	ARTISTA VARCHAR(50),
	TEMPO TIME,

	CONSTRAINT PK_MUSICAS PRIMARY KEY(CODIGOCD,NUMERO),
	CONSTRAINT FK_CDS FOREIGN KEY(CODIGOCD) REFERENCES CDS(CODIGO)
)


GO
INSERT INTO CDS VALUES
	('Guns N Roses','2018-04-01','50','JUNDIAÍ','Sounding the Seventh Trumpet'), 
	('GREEN DAY','2018-04-02','35','JUNDIAÍ','Waking the Falle'), 
	('LINK PARK','2018-04-03','45','JUNDIAÍ','City of Evil'), 
	('METALICA','2018-04-04','25','JUNDIAÍ','Nightmare'),
	('BEATTLES','2018-04-05','35','JUNDIAÍ','Hail to the King'),
	('AVENGED SEVENFOLD','2018-04-06','45','JUNDIAÍ','The Stage'),
	('SUM 41','2018-05-01','25','JUNDIAÍ','Appetite for Destruction'),
	('BLINK 182','2018-05-02','35','JUNDIAÍ','Use Your Illusion I'),
	('SCORPIONS','2018-05-03','45','JUNDIAÍ',' Use Your Illusion II'),
	('SIMPLE PLAN','2018-05-04','25','JUNDIAÍ','Chinese Democracy')


GO
INSERT INTO MUSICAS VALUES
	(1,1,'Welcome To The Jungle','Axl Rose','12:00:00'),
	(2,2,'AMERICAN IDIOT','Billie Joe Armstrong','12:00:00'),  
	(3,3,'NUMB','Chester Bennington','12:00:00'), 
	(4,4,'THE DAY THAT NEVER COMES','James Hetfield','12:00:00'), 
	(5,5,'Don t Let Me Down','John Lennon','12:00:00'), 
	(6,6,'a little piece of heaven','M. Shadows','12:00:00'),
	(7,7,'In Too Deep','Deryck Whibley','12:00:00'), 
	(8,8,'First Date','Matt Skiba','12:00:00'),  
	(9,9,'hurricane','Klaus Meine','12:00:00'), 
	(10,10,'i don t wanna go to bed','Pierre Bouvier','12:00:00')
	
	
GO

SELECT * FROM MUSICAS

--1.Mostrar todos os cds---------------------------------------------------------
SELECT * FROM CDS

--2.Mostrar os campos nome e data da compra dos cds ordenados por nome---------------------------------------------------------
SELECT C.NOME, C.DATACOMPRA FROM CDS C ORDER BY C.NOME


--3.Mostrar os campos nome e data da compra dos cds classificados por data de compra em ordem decrescente---------------------------------------------------------
SELECT C.NOME, C.DATACOMPRA FROM CDS C ORDER BY C.NOME DESC


--4.Mostrar o total gasto com a compra dos Cds---------------------------------------------------------
SELECT SUM(VALORPAGO) AS TOTAL FROM CDS C


--5.Mostrar todas as músicas (todos os campos) do cds código 1---------------------------------------------------------
SELECT * FROM MUSICAS M WHERE M.CODIGOCD = 1


--6.Mostrar o nome do Cd e o nome das músicas de todos Cds---------------------------------------------------------
SELECT C.NOME ,M.NOME FROM CDS C
LEFT JOIN MUSICAS M
ON C.CODIGO = M.CODIGOCD


--7.Mostre o nome e o artista de todas músicas cadastradas---------------------------------------------------------
SELECT M.NOME, M.ARTISTA FROM MUSICAS M
INNER JOIN CDS C
ON C.CODIGO = M.CODIGOCD

--8.Mostre o tempo total de músicas cadastradas---------------------------------------------------------

--SELECT DATEADD(MS, SUM(DATEDIFF(MS, 0, TEMPO)), 0) as time FROM MUSICAS

SELECT SUM( DATEPART(SECOND, TEMPO) + 60 * 
              DATEPART(MINUTE, TEMPO) + 3600 * 
              DATEPART(HOUR, TEMPO ) 
            ) as TOTAL FROM MUSICAS

--9.Mostre o número, nome e tempo das músicas do cd 5 em ordem de número
SELECT M.NUMERO,M.NOME, M.TEMPO FROM MUSICAS M WHERE M.CODIGOCD = 5

--10.Mostre o tempo total de músicas por cd

SELECT C.CODIGO,C.NOME, SUM( DATEPART(SECOND, TEMPO) + 60 * 
              DATEPART(MINUTE, TEMPO) + 3600 * 
              DATEPART(HOUR, TEMPO ) 
            ) as TOTAL 
FROM MUSICAS M
INNER JOIN CDS C
ON C.CODIGO = M.CODIGOCD
GROUP BY C.CODIGO,C.NOME 

SELECT C.CODIGO,C.NOME,  DATEADD(MS, SUM(DATEDIFF(MS, 0, TEMPO)), 0) as time
FROM MUSICAS M
INNER JOIN CDS C
ON C.CODIGO = M.CODIGOCD
GROUP BY C.CODIGO,C.NOME 


--11.Mostre a quantidade de músicas cadastradas
SELECT COUNT(*) AS MUSICAS_CADASTRADAS FROM MUSICAS


--12.Mostre a média de duração das músicas cadastradas
SELECT AVG( DATEPART(SECOND, TEMPO) + 60 * DATEPART(MINUTE, TEMPO) + 3600 * DATEPART(HOUR, TEMPO )) as TOTAL  FROM MUSICAS


--13.Mostre a quantidade de Cds
SELECT COUNT(*) AS QUANTIDADE FROM CDS


--14.Mostre o nome das músicas do artista José Pedro
-- USEI O ARTISTA NIRVANA
SELECT M.NOME FROM MUSICAS M WHERE M.ARTISTA = 'NIRVANA'

--15.Mostre a quantidade de músicas por cds
SELECT C.NOME,COUNT(0) AS QUANTIDADE FROM CDS C
INNER JOIN MUSICAS M
ON C.CODIGO = M.CODIGOCD
GROUP BY C.NOME

--16.Mostre o nome de todos cds comprados no Submarino
SELECT C.NOME FROM CDS C WHERE C.LOCALCOMPRA = 'SUBMARINO'

--17.Mostre o nome do cd e o nome da primeira músicas de todos cds

SELECT C.NOME, MIN(M.NOME) AS MUSICA FROM CDS C 
INNER JOIN MUSICAS M
ON M.CODIGOCD = C.CODIGO
GROUP BY C.NOME

--18.Mostre uma listagens de músicas em ordem alfabética
SELECT M.NUMERO,M.NOME, M.ARTISTA FROM MUSICAS M ORDER BY M.NOME ASC

--19.Mostrar todos os cds que são albuns
SELECT * FROM CDS C WHERE C.ALBUM IS NOT NULL

--20.Mostre o cd que custou mais caro
SELECT MAX(C.VALORPAGO) AS MAIS_CARO FROM CDS C