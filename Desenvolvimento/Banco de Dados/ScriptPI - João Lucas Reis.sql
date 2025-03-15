CREATE DATABASE sgc;
USE sgc; 

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY auto_increment,
CNPJ CHAR(14) not null unique,
senha CHAR (8) not null unique
);

desc usuario;

CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
nome VARCHAR(25) not null,
tipo VARCHAR(30) not null,
statusSensor VARCHAR(15),
constraint chkSensor check(statusSensor in ('ativo','inativo'))
);

DESC sensor;

CREATE TABLE condominio(
idcondominio INT PRIMARY KEY auto_increment,
nome VARCHAR (30) not null,
logradouro VARCHAR (50) not null, 
cep CHAR (8) not null,
numero int not null,
CNPJ char(14) not null unique,
senha char(8) not null,
email VARCHAR (50)
);

DESC condominio;

CREATE TABLE medicao (
idMedicao int primary key auto_increment,
dataHora datetime,
concentracaoGases INT NOT NULL,
	CONSTRAINT chktaxa
		CHECK (concentracaoGases in (5,10,20)),
statusAlerta VARCHAR (30)
	CONSTRAINT chkstatus
		CHECK (statusAlerta in ('Normal', 'Atenção', 'Crítico'))
);

DESC medicao;

INSERT INTO usuario (CNPJ, senha) VALUES
('12345678000190', 'Xy9@kP1z'),
('98765432000112', '4qLm!tN8'),
('56789123000134', 'R2v#bM7x');

INSERT INTO sensor (nome,tipo, statusSensor) VALUES 
('MQ-2', 'Sensor de gás', 'Ativo'),
('MQ-3', 'Sensor de gás', 'Inativo'),
('MQ-4', 'Sensor de gás', 'Ativo');


INSERT INTO condominio (nome, logradouro, cep, numero, cnpj, senha, email) VALUES
('Osasco Residencial Life','Avenida O Trabuco Jornal', '02723456', 247 , '12345678000190', 'Xy9@kP1z', 'camila.jodai@sptech.com'),
('Osasco Residencial Death','O Vale da Morte','66666666','666','98765432000112', '4qLm!tN8', 'guilherme.mendes@sptech.com' ) ,
('Osasco Residencial Sky','O Vale da Vida','77777777','77','12345678000192', 'R2v#bM7x', 'ana.barrocal@sptech.com');



INSERT INTO medicao (datahora, concentracaoGases, statusAlerta) VALUES
('2024-10-21 14:02:00','5','Normal'),
('2024-11-01 16:06:12','10','Atenção'),
('2024-11-12 21:09:06','20','Crítico');

SELECT * FROM usuario;
SELECT * FROM sensor;
SELECT * FROM condominio;
SELECT * FROM medicao;

SELECT * FROM usuario ORDER BY CNPJ DESC;
SELECT * FROM usuario ORDER BY CNPJ ASC;
SELECT CNPJ FROM usuario WHERE CNPJ like '%0190';

SELECT * FROM sensor WHERE statusSensor = 'Inativo';
SELECT * FROM sensor WHERE statusSensor = 'Ativo';

SELECT email FROM condominio;
SELECT nome FROM condominio ORDER BY nome ASC;

SELECT * FROM medicao WHERE statusAlerta = 'Atenção';
SELECT * FROM medicao WHERE statusAlerta = 'Crítico';

SELECT dataHora AS 'Data e Hora', 
concentracaoGases AS 'Concentação de Gás', statusAlerta AS 'Status Alerta' 
FROM medicao;

SELECT nome AS 'Nome', concat(logradouro, ', ' ,numero, ', ',cep) AS 'Endereço' FROM condominio;
















