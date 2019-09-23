-----------------------------------------------------1
create database ClubeT
go

use clubeT

go
------------------------------- 2
create table times
(
	CodFor INT NOT NULL,
	Nome varchar(40) NOT NULL,
	Historia varchar(250) NOT NULL,
	Data_fundacao datetime NOT NULL,
	uf char (2) NOT NULL,
	PRIMARY KEY (CodFor)
)

SET DATEFORMAT DMY
go
------------------------------------------------------------3
alter table times
add	Investimento money
select * from times
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------4
insert into times( CodFor, Nome, Historia, Data_fundacao, uf, Investimento) values (100,'Perna de pau', 'Amigos que queriam aprender a jogar', '20/05/1997','SP', 1119.90 );             
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (200,'Bolada','Ganhadores de rifas', '25/03/1996','PR', 1445.20 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (130,'Julieta','Mulheres apaixonada por bola', '31/12/1998','SP', 2666.12 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (074,'Trave de pau','Jogadores que quebram a trave nos jogos', '03/07/1996','SP', 971.44 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (005,'campiam','Acham que sempre serão os vencedores', '05/10/1998','PR', 5557.99 );


go
-------------------------------------------------------------------------- 5
SELECT CodFor, LOWER(Nome) from times WHERE uf = 'sp'
order by Data_fundacao desc


go
----------------------------------------------------------------------------------6
select uf , COUNT(*) FROM times GROUP BY uf HAVING uf = 'PR' 
UNION
select uf , COUNT(*) AS 'QUANTIDADE DE TIME' FROM times GROUP BY uf HAVING uf = 'SP' 



-- -------------------------------------------------------   7
select * from times where Nome like '%pau%'


------------------------------------------------------------- 8
SELECT Nome, LEN(Nome), Data_Fundacao from times 
where YEAR(Data_Fundacao)='1996' AND MONTH(Data_fundacao)='07'


--------------------------------------------------------------------------9
SELECT  min(Investimento) as MENOR, MAX(Investimento) AS MAIOR FROM times


-------------------------------------------------------------------------------------------10
update times
set Investimento= Investimento *1.20
WHERE Investimento>='2000' AND Investimento <= '5000'


SELECT * FROM times
-------------------------------------------------------------------------------------- 11
use master

drop database ClubeT

drop table times





DECLARE @Vares VARCHAR(100);

SET @Vares='WTP CATION EXCHANGER';

--SET @Var='DRAUGHT- WORKING MODE';

--SET @Var='MCWP-TESTING-MODE PART1';
