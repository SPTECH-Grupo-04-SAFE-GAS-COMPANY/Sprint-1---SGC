create database sgc;
use sgc;

create table cadastro (
idUsuario int primary key auto_increment,
senha varchar (8) not null,
cnpj char (15) unique not null,
empresa varchar (30) not null);

create table sensor (
idSensor int primary key auto_increment,
tipo varchar (20) not null,
nome varchar (30) not null,
Sensorstatus varchar (15)
constraint ckSensorStatus
check (Sensorstatus in ('Ativo', 'Inativo')));

create table condominio (
idCond int primary key auto_increment,
nome varchar (30) not null,
numero int not null,
logradouro varchar (50) not null,
bairro varchar (50) not null,
cep char (8) not null,
cnpj char (14) unique not null);

CREATE TABLE medicao (
idMed int primary key auto_increment,
dataHora datetime,
concentracao int not null,
constraint ckGas
check (concentracao in (15,30,50)), 
alerta varchar(30)
constraint ckstatus
check (alerta in ('Normal', 'Alerta', 'Perigo'))
);


insert into cadastro (senha, cnpj, empresa) values
('12345678', '123456789123456', 'dedos de mel'),
('15948736', '789456123789456', 'gemialidades weasley'),
('26262626', '626262626262626', 'olivaras');

insert into sensor (tipo, nome, sensorStatus) values
('dht-11', 'umidade e temperatura','inativo'),
('mq-135', 'gas', 'ativo'),
('dht-22', 'umidade', 'ativo');

insert into condominio (nome, numero, logradouro, bairro, cep, cnpj) values
('quinta do sol', '27', 'rua jardim das margaridas', 'vila buenos aires', '03737000', '1234567891011'),
('livre para voar', '255', 'rua gentil braga', 'vila america', '03838000', '32165498732165'),
('greengables', '789', 'rua galvao da fontoura','vila esperança', '02525000', '85274196374152');

insert into medicao ( dataHora, concentracao, alerta) values
('2025-03-11 11:27:00', 30, 'Alerta'),
('2025-04-14 00:00:54', 15, 'Normal'),
('2025-06-18 14:25:45', 50, 'Perigo');

select * from cadastro;
SELECT * FROM condominio WHERE logradouro LIKE '%a%';
SELECT * FROM sensor WHERE Sensorstatus NOT LIKE 'Inativo';
SELECT * FROM cadastro WHERE idUsuario = 1;
SELECT * FROM medicao WHERE concentracao <= 25;
SELECT * FROM condominio WHERE logradouro LIKE '%g%' OR logradouro LIKE '%j%';
SELECT nome AS 'Nome', CONCAT(logradouro, ', ', numero) AS 'Endereço Completo', cep AS 'CEP' FROM condominio;

