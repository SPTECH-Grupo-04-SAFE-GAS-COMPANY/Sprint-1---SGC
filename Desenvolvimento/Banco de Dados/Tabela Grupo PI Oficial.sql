CREATE DATABASE sgc;
USE sgc;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
cnpj CHAR(14) UNIQUE NOT NULL,
senha VARCHAR(8) NOT NULL
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
nome VARCHAR(25) NOT NULL,
tipo VARCHAR(30) NOT NULL,
statusSensor VARCHAR(15),
	CONSTRAINT ckSensor 
		CHECK (statusSensor IN ('Ativo', 'Inativo'))
);

CREATE TABLE condominio (
idCondominio INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
logradouro VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL,
numero INT NOT NULL,
cnpj CHAR(14) UNIQUE,
email VARCHAR(40),
senha CHAR(8) NOT NULL
);

CREATE TABLE medicao (
idMedicao INT PRIMARY KEY AUTO_INCREMENT,
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
concentracaoGases INT NOT NULL,
	CONSTRAINT ckTaxa 
		CHECK (concentracaoGases IN (5,10,20)), 
statusAlerta VARCHAR(30),
	CONSTRAINT ckStatus
		CHECK (statusAlerta IN ('Normal', 'Atenção', 'Crítico'))
);


INSERT INTO usuario VALUES
(DEFAULT, '12435278000193', 'segccl01'),
(DEFAULT, '13629658000194', 'segcpt02'),
(DEFAULT, '12569812000195', 'segamt03'),
(DEFAULT, '14365878000192', 'segclb04'),
(DEFAULT, '14637498000190', 'segfnx05');

INSERT INTO sensor (nome, tipo, statusSensor) VALUES
('MQ-2', 'Sensor gás', 'Ativo'),
('MQ-3', 'Sensor gás', 'Inativo'),
('MQ-4', 'Sensor gás', 'Ativo');

INSERT INTO condominio VALUES
(DEFAULT, 'Condomínio Coelho', 'Rua Baronesa de Itu', '1231001', 175, '12435278000193', 'coelho.cond@outlook.com', 'segccl01'),
(DEFAULT, 'Condomínio Campestre', 'Rua Dona Veridiana', '01238010', 50, '13629658000194', 'campestre.cond@outlook.com', 'segcpt02'),
(DEFAULT, 'Condomínio Ametista', 'Rua Doutor Nicolau de Sousa Queirós', '4105002', 730, '12569812000195', 'ametista.cond@outlook.com', 'segamt03'),
(DEFAULT, 'Condomínio Colibri', 'Rua São Vicente de Paulo', '01229010', 539, '14365878000192', 'colibri.cond@outlook.com', 'segclb04'),
(DEFAULT, 'Condomínio Fenix', 'Rua Lauro de Freitas', '03820270', 365, '14637498000190', 'fenix.cond@outlook.com', 'segfnx05');

INSERT INTO medicao (idMedicao, concentracaoGases, statusAlerta) VALUES
(DEFAULT, 5, 'Normal'),
(DEFAULT, 10, 'Atenção'),
(DEFAULT, 20, 'Crítico'),
(DEFAULT, 20, 'Crítico');

SELECT * FROM condominio WHERE logradouro LIKE '%s';

SELECT * FROM sensor WHERE statusSensor NOT LIKE 'Inativo';

SELECT * FROM usuario WHERE idUsuario = 2;

SELECT dataHora AS 'Data e Hora',
concentracaoGases AS 'Concentração de Gases',
statusAlerta AS 'Status'
FROM medicao;

SELECT * FROM condominio WHERE logradouro LIKE '%L%';

SELECT * FROM sensor WHERE statusSensor NOT LIKE 'Inativo';

SELECT * FROM condominio WHERE idCondominio = 1;

SELECT * FROM medicao WHERE concentracaoGases <= 10;

SELECT * FROM condominio WHERE logradouro LIKE '%T%' OR logradouro LIKE '%M%';

SELECT nome AS 'Nome', CONCAT(logradouro, ', ', numero) AS 'Endereço Completo', cep AS 'CEP' FROM condominio;