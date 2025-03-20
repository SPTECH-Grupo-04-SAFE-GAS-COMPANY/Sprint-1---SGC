create database SGC;

use SGC;

create table usuario (
idUsuario int primary key auto_increment,
cnpj char(14) not null,
senha char(8) not null
);

create table condominio (
idCondominio int primary key auto_increment,
nome varchar(30) not null,
logradouro varchar(50) not null,
cep char(8) not null,
numero int not null,
cnpj char(14) unique,
email varchar(40),
senha char(8) not null
);

create table sensor (
idSensor int primary key auto_increment,
nome varchar(25) not null,
statusSensor varchar(30),
constraint chkStatus check (statusSensor in ('Ativo', 'Inativo')),
tipo varchar(30) not null
);

create table medicao (
idMedicao int primary key auto_increment,
dataHora datetime default current_timestamp,
concentracaoGases int not null,
	constraint ckTaxa 
		check (concentracaoGases in (5,10,20)), 
statusAlerta varchar(30),
	constraint ckstatus
		check (statusAlerta in ('Normal', 'Atenção', 'Crítico'))
);

show tables;

insert into condominio values
(default, 'Condomínio Coelho', 'Rua Baronesa de Itu', '1231001', 175, '12345678000195', 'coelho.cond@outlook.com', 'segccl01'),
(default, 'Condomínio Campestre', 'Rua Dona Veridiana', '01238010', 50, '12345678000195', 'campestre.cond@outlook.com', 'segcpt02');

insert into sensor values
(default,'MQ-2', 'Sensor de gás', 15);

INSERT INTO medicao (idMedicao, concentracaoGases, statusAlerta) VALUES
(DEFAULT, 5, 'Normal'),
(DEFAULT, 10, 'Atenção');


select * from usuario;

select * from condominio;

SELECT * FROM condominio WHERE idCondominio = 2;

select * from sensor;

SELECT * FROM sensor WHERE statusSensor LIKE 'Inativo';

SELECT * FROM medicao;

SELECT * FROM medicao WHERE concentracaoGases <= 10;
