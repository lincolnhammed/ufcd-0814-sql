################################### criando uma base de dados ###########################################################################
create database if not exists ufcd0814 default character set utf8mb4 default collate utf8mb4_bin;
#########################################################################################################################################

################################## perminte usar a base de dados ########################################################################
use ufcd0814;
#########################################################################################################################################

##################################################criando uma tabela ####################################################################

create table tabela_ufcd0814(
id int primary key,
nome varchar(50),
localidade varchar(50)
);
#########################################################################################################################################

############################################3 inserindo dados na tabela #################################################################

insert into tabela_ufcd0814 (id,nome,localidade) values (1,"lincoln","setubal");

#########################################################################################################################################

################ ###########################################descricao da tabela #########################################################
describe tabela_ufcd0814;
select *from tabela_ufcd0814;
#########################################################################################################################################

################## ####################################tabela tipo de dados #############################################################
drop table if exists tipoDados;
create table tiposDados (
id int auto_increment primary key,
nome varchar(50), -- campo com tipo de dados alfanumérico
idade int,
altura float(3,2), -- tipo de dados com casas decimais. 3 nºs sendo 2 casas decimais
dataNascimento date,  -- tipo de dados de DATA
inscricao datetime, -- tipo de dados com DATA e HORA
genero enum("M","F"), -- tipo de dados que limita a inserção do registo ao que for definido
horaSaida time, -- tipo de dados para HORAS ex: 15:30
observacoes text, -- permite 65535 bytes de tamanho
codigoPostal char(8), -- tipo de dados FIXO. Útil para 1900-100
peso decimal(5,2), -- o tipo decimal é mais preciso do que o float
salario decimal(10,2), -- o tipo de dados decimal é bom para campos monetários
ativo boolean, -- tipo de dados lógico 0 = false, 1 = true
atualizadoEm timestamp default current_timestamp on update current_timestamp
-- atualiza automaticamente a data/hora quando a linha/registo é atualizado
);
 
# Inserção de registos (não tem o campo 'id' e 'autalizadoEm')
INSERT INTO TiposDados (nome, idade, altura, dataNascimento, inscricao, genero, horaSaida, observacoes, codigoPostal, peso, salario, ativo)
VALUES 
('João Ribeiro', 28, 1.75, '1997-04-12', '2025-12-10 09:15:32', 'M', '17:30:00','Preferência por aulas ao fim da tarde. Tem carta de condução e disponibilidade para deslocações.', '2950-001', 72.50, 1450.00, 1),
('Marta Silva', 34, 1.68, '1991-06-03', '2025-12-11 14:02:05', 'F', '18:10:00','Concluiu o módulo de Bases de Dados com distinção. Necessita de apoio em Power Automate.', '1000-120', 63.20, 1825.75, 1);
 
describe TiposDados;
select * from TiposDados;

#########################################################################################################################################


################## ####################################NOT NULL -> nao permite campos nulos ##############################################
drop table if exists estudante;
create table estudante(
id int,
nome varchar (50) not null, -- nao permite campo null
apelido varchar (50)
 );
 insert into estudante values(1,"lincoln","silva");
 -- insert into estudante (id,apelido) values(1,"silva")
 #########################################################################################################################################
 
 ################## UNIQUE -> nao permite registro em duplicado na coluna/ campo onde for definido o UNIQUE ##############################
 drop table if exists roupa;
 create table roupa(
 id int,
 marca varchar (50) unique,
 tamanho varchar(50)
 );
 
insert into roupa values(1,"nike","XL");
insert into roupa values(2,"adidas","M");
insert into roupa values(3,"nike","XL");

######################################################################################################################################### 
 
################## CHECK -> funciona como uma condicao que verifica o registro inserido no campo ########################################
drop table if exists pessoa;
 create table pessoa(
 id int,
 marca varchar (50) unique,
 idade int, check(idade>=18),
 cidade varchar(50), check(cidade IN("almada","setubal","azeitao"))
 );
 
insert into pessoa values(1,"pedro","18","almada");
-- insert into pessoa values(2,"ana","8"); -- da erro o registro anterior pois a idade tem de ser >=18
insert into pessoa values(3,"pedro","18","lisboa"); -- da erro de registro pois as cidades tem de ser uma das 3 definidas
######################################################################################################################################### 
 

################## Defaut -> preenche automaticamente um registro no campo se o mesmo nao for prrenchido ################################
drop table if exists formando;
 create table formando(
 id int,
 nome varchar (50),
 idade int,
 cidade varchar(50) default "lisboa"
 );
 
insert into formando values(1,"pedro",27,"setubal");
insert into formando (id, nome, idade)values(1,"pedro",27);
insert into formando values(3,"pedro","18", default);

select * from formando;
######################################################################################################################################### 








