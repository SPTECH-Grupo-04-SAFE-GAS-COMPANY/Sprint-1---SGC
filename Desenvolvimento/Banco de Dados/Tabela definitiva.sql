CREATE DATABASE sgc;
USE sgc;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY auto_increment,
senha VARCHAR(15) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
nome VARCHAR(25) NOT NULL,
tipo VARCHAR(30) NOT NULL,
statusSensor VARCHAR(15) 
	CONSTRAINT ckSensor 
		CHECK (statusSensor in ('Ativo', 'Inativo'))
);
CREATE TABLE condominio (
idCondominio INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(30) not null,
logradouro varchar(50) not null,
cep char(8) not null,
numero int not null,
cnpj char(14) unique,
email varchar(40),
senha char(8) not null
);


CREATE TABLE medicao (
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
concentracaoGases INT NOT NULL,
	CONSTRAINT ckTaxa 
		CHECK (concentracaoGases IN (5,10,20)), 
statusAlerta VARCHAR(30)
	CONSTRAINT ckstatus
		CHECK (statusAlerta IN ('Normal', 'Atenção', 'Crítico'))
);


INSERT INTO usuario (senha, cnpj) VALUES
('aninho2000', '12345678000190'),
('camilinho2000', '98765432000112'),
('carolzinho2000', '56789123000134'),
('guilherminha200', '43210987000156'),
( 'joana2000', '11222333000178'),
('leticinho2000', '77888999000100'),
('rayssinho2000', '34567890000123');

INSERT INTO sensor (nome, tipo, statusSensor) VALUES
('MQ-2', 'Sensor gás', 'Ativo'),
('MQ-3', 'Sensor gás', 'Inativo'),
('MQ-4', 'Sensor gás', 'Ativo');

INSERT INTO condominio (nome, logradouro, cep, numero, cnpj,email,senha) VALUES
 ('Osasco Residencial Life','O Trabuco Jornal', '02723456', 247, '12345678000190','ana.barrocal@sptech.com','aninho2000'),
('Osasco Residencial Death','O Vale da Morte', '66666666', 666, '12345678000191','camila.jodai@sptech.com','camilinho2000'),
('Osasco Residencial Sky','O Vale da Vida', '77777777', 777, '12345678000192','guilherme.mendes@sptech.com','guilherminha2000');
INSERT INTO medicao (dataHora, concentracaoGases, statusAlerta) VALUES
('2025-03-10 08:30:00', 5, 'Normal'),
('2025-03-10 09:00:00', 10, 'Atenção'),
('2025-03-10 09:30:00', 20, 'Crítico'),
('2025-03-10 10:00:00', 30, 'C´ítico');


SELECT * FROM condominio WHERE logradouro LIKE '%l';
SELECT * FROM sensor WHERE statusSensor NOT LIKE 'Inativo';
SELECT * FROM usuario WHERE idUsuario = 2;

SELECT dataHora AS 'Data e Hora',
concentracaoGases AS 'Concentração de Gases',
statusAlerta AS 'Status'
FROM medicao;
SELECT * FROM condominio WHERE logradouro LIKE '%a%';
SELECT * FROM sensor WHERE Sensorstatus NOT LIKE 'Inativo';
SELECT * FROM cadastro WHERE idUsuario = 1;
SELECT * FROM medicao WHERE concentracao <= 25;
SELECT * FROM condominio WHERE logradouro LIKE '%g%' OR logradouro LIKE '%j%';
SELECT nome AS 'Nome', CONCAT(logradouro, ', ', numero) AS 'Endereço Completo', cep AS 'CEP' FROM condominio;