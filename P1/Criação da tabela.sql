CREATE DATABASE RecursosHumanos
GO

USE RecursosHumanos
GO

CREATE TABLE Funcionario(
	idFuncionario INT NOT NULL,
	nome VARCHAR(50) NULL,
	endereco VARCHAR(100) NULL,
	cidade VARCHAR(50) NULL,
	estado CHAR(2) NULL,
	email VARCHAR(50) NULL UNIQUE,
	dataNascto DATE NULL,
	PRIMARY KEY(idFuncionario)
)
GO

ALTER TABLE Funcionario ADD salario DECIMAL(7,2) NULL, cargos VARCHAR(2) NULL
ALTER TABLE Funcionario DROP COlumn cargos
ALTER TABLE Funcionario ADD cargo VARCHAR(2) NULL, ativo BIT
GO

CREATE INDEX FuncionarioNome ON Funcionario (nome)
CREATE INDEX FuncionarioEstado ON Funcionario (estado DESC)
CREATE INDEX FuncionarioEstadoCidade ON Funcionario(estado DESC, cidade ASC)
GO
DROP INDEX FuncionarioEstado ON Funcionario

--DROP TABLE Funcionario

--DROP DATABASE RecursosHumanos

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(1, 'José da Silva', 'Av. São Paulo, 34', 'Itu', 'SP', 'zesilva@yahoo.com.br', '1991-02-24')

INSERT INTO Funcionario
VALUES
(2, 'João de Oliveira', 'Rua da Saúde, 138', 'Jundiaí', 'SP', 'jojo@hotmal.com', '1988-01-11', 750, 'TI', 1)

INSERT INTO Funcionario
VALUES
(3, 'Ana Pimenta', 'Rua da Saúde, 11', 'Jundiaí', 'SP', 'pimentinha@hotmal.com', '1987-01-01', 750, 'TI', 0),
(4, 'Mário Lopes', 'Rua Angélica, 143', 'Jundiaí', 'SP', 'mlopes@hotmal.com', '1985-04-10', 750, 'TI', 0)
GO
-- UPDATE Funcionario SET cidade = 'jundiaí'

select * from Funcionario

--DELETE FROM Funcionario WHERE idFuncionario = 2 

DELETE FROM Funcionario
WHERE idFuncionario = 2
GO
INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(5, 'Carlos Dias', 'Av. Lapa, 121', 'Itu', 'SP', 'carlao@gmail.com', '1990-03-31'),
(6, 'Ana Maria da Cunha', 'AV. São Paulo, 388', 'Itu', 'SP', 'aninhacunha@gmail.com', '1988-04-12'),
(7, 'Cláudia Regina Martins', 'Rua Holanda, 89', 'Campinas', 'SP', 'cregina@gmail.com', '1988-12-04'),
(8, 'Marcela Tatho', 'Rua Bélgica, 43', 'Campinas', 'SP', 'marctatho@hotmail.com', '1987-11-09'),
(9, 'Jorge Luís Rodrigues', 'AV. da saudade, 1989', 'São Paulo', 'SP', 'jorgeluis@yahoo.com.br', '1990-05-05'),
(10, 'Ana Paulo Camargo', 'Rua Costa e Silva, 33', 'Jundiaí', 'SP', 'apcamargo@gmail.com', '1991-06-30'),
(11, 'Ivo Cunha', 'AV. Raio de Luz, 100', 'Campinas', 'SP', 'ivo@bol.com.br', '1987-04-11'),
(12, 'Carlos Luís', 'Rua Nicolau Coelho, 22', 'São Paulo', 'SP', 'cis@bol.com', '1988-04-30')
GO
UPDATE Funcionario SET
cidade = 'Valinhos'
where cidade = 'Itu'
GO
UPDATE Funcionario SET
cargo = 'AI',
salario = 1100.00
where cidade = 'Valinhos'
GO
UPDATE Funcionario SET
cargo = 'PC',
salario = 1700.00
where cidade = 'Campinas'
GO
UPDATE Funcionario SET
cargo = 'TI',
salario = 750.00
where cidade = 'Jundiaí'
GO

SET DATEFORMAT DMY