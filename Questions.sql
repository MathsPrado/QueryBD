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
add	Investimento MONEY  DEFAULT 0.0
select * from times
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------4
insert into times( CodFor, Nome, Historia, Data_fundacao, uf, Investimento) values (100,'Perna de pau', 'Amigos que queriam aprender a jogar', '20/05/1997','SP', 111990 );             
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (200,'Bolada','Ganhadores de rifas', '25/03/1996','PR', 1.44520 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (130,'Julieta','Mulheres apaixonada por bola', '31/12/1998','SP', 266612 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (074,'Trave de pau','Jogadores que quebram a trave nos jogos', '03/07/1996','SP', 97144 );
insert into times( CodFor, Nome, Historia, Data_fundacao, uf,Investimento) values (005,'campiam','Acham que sempre serão os vencedores', '05/10/1998','PR', 555799 );


go
-------------------------------------------------------------------------- 5
SELECT CodFor, LOWER(Nome) from times WHERE uf = 'sp'
order by Data_fundacao desc


go

-- -------------------------------------------------------   7
select * from times where Nome like '%pau%'

------------------------------------------------------------6 ERROR
select COUNT(uf) AS QUANTIDADE from times where uf='SP'
UNION
SELECT Nome from Times where uf='SP'


------------------------------------------------------------- 8
SELECT Nome, LEN(Nome), Data_Fundacao from times 
where YEAR(Data_Fundacao)='1996' AND MONTH(Data_fundacao)='07'


--------------------------------------------------------------------------9
SELECT  min(Investimento) as MENOR, MAX(Investimento) AS MAIOR FROM times

-------------------------------------------------------------------------------------- 10
use master
drop database ClubeT

drop table times



------------------------------ exercicios aleatorios

select DAY(Data_fundacao) AS DIA, MONTH(Data_fundacao) AS MES, YEAR(Data_fundacao) AS ANO FROM Times


select Nome from Times where YEAR(Data_fundacao)='1997'