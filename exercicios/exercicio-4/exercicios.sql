use minhabasededados;

CREATE TABLE pessoas( #primeira tabela
	id int NOT NULL AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
    nascimento date,
    sexo enum('M','F'),
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(30) DEFAULT 'Portugal',   
    PRIMARY KEY (id)
    ) DEFAULT charset = utf8mb4;
    
    
    INSERT INTO pessoas
VALUES
(DEFAULT, 'Paulo',   '1988-02-11', 'M', '79.4', '1.82', 'Portugal'),
(DEFAULT, 'Cláudia', '1989-06-23', 'F', '63.1', '1.67', 'Brasil'),
(DEFAULT, 'Ricardo', '1990-09-15', 'M', '85.0', '1.86', DEFAULT),
(DEFAULT, 'Helena',  '1992-12-04', 'F', '57.8', '1.64', 'Portugal'),
(DEFAULT, 'André',   '1994-03-28', 'M', '90.2', '1.88', 'França'),
(DEFAULT, 'Patrícia','1996-07-19', 'F', '62.5', '1.69', DEFAULT),
(DEFAULT, 'Fábio',   '1998-11-01', 'M', '76.0', '1.77', 'Brasil'),
(DEFAULT, 'Carla',   '2000-01-09', 'F', '59.9', '1.66', 'Portugal'),
(DEFAULT, 'Bruno',   '2001-05-17', 'M', '81.3', '1.80', DEFAULT),
(DEFAULT, 'Mónica',  '2002-08-30', 'F', '54.6', '1.61', 'Espanha'),
(DEFAULT, 'Nuno',    '2003-10-12', 'M', '73.5', '1.75', 'Portugal'),
(DEFAULT, 'Rita',    '2005-02-26', 'F', '58.2', '1.63', DEFAULT),
(DEFAULT, 'Diogo',   '2007-06-08', 'M', '68.7', '1.72', 'Brasil'),
(DEFAULT, 'Catarina','2009-09-21', 'F', '56.0', '1.65', 'Portugal'),
(DEFAULT, 'Samuel',  '2011-12-14', 'M', '70.1', '1.74', DEFAULT),
(DEFAULT, 'Lara',    '2014-04-03', 'F', '49.5', '1.58', 'Portugal'),
(DEFAULT, 'Daniel',  '2017-07-27', 'M', '62.3', '1.69', 'França'),
(DEFAULT, 'Eva',     '2020-10-05', 'F', '46.8', '1.55', DEFAULT),
(DEFAULT, 'Mateus',  '2023-01-16', 'M', '52.0', '1.60', 'Brasil'),
(DEFAULT, 'Noah',    '2026-06-18', 'M', '48.9', '1.57', 'Portugal');
############################### exercicios ###################################################################
# 1 - Uma listagem com o nome de todas as pessoas”
select nome from pessoas;
######################################################################################################################################
# 2- Uma listagem com os dados de todos os utilizadores que nasceram entre 1/Jan/2000 e 31/Dez/2015”
select * from pessoas where nascimento between '2000-01-01' and '2015-12-31';
######################################################################################################################################
# 3- Uma listagem com o nome e a profissão de todos os homens que trabalham como Programadores”
ALTER TABLE pessoas ADD COLUMN profissao varchar(15);
UPDATE  pessoas SET profissao= 'TI';
select nome,profissao from pessoas where sexo ='M' and profissao= 'TI';

######################################################################################################################################
# 4 - Uma listagem com os dados de todas as mulheres que nasceram em Portugal e que tem o nome iniciado com a letra J
insert into pessoas values(default, 'Jaqueline','2001-05-17', 'M', '81.3', '1.80', 'Portugal','TI');
update pessoas set sexo ="F" where id ="21";
update pessoas set nome ="Joana", nacionalidade ="Portugal" where id="2"; 
select * from pessoas where sexo ="F" and nacionalidade ="Portugal" and nome like "j%";
######################################################################################################################################
# 5 - Uma listagem com o nome e  nacionalidade  de todos os homens que têm Silva no nome, não nasceram em Portugal e pesam menos de 100 Kg
alter table pessoas add column apelido varchar(15) after nome;
UPDATE  pessoas SET apelido= 'Silva';
update pessoas set peso='140.50' where id= "7";
select nome,nacionalidade from pessoas where sexo="M" and apelido ="Silva" and nacionalidade != "Portugal" and peso < "100";
select * from pessoas;
describe pessoas;
select count(*) from pessoas where apelido= 'Silva';

######################################################################################################################################
# 6 - Qual é a maior altura das pessoas do sexo feminino que moram em Portugal?”

select  nome, max(altura)  from pessoas   where sexo ='F' and nacionalidade ='Portugal' ;

######################################################################################################################################
# 7 - “Qual é a média de peso dos utilizadores do EUA?”
select round(avg(peso),2) from pessoas where nacionalidade ='EUA';

######################################################################################################################################
# 8 - Qual é o menor peso entre os utilizadores mulheres que nasceram fora de Portugal e entre
#     01/Jan/1990 e 31/Dez/2000?”

select nome,min(peso) from pessoas where sexo='F' and nacionalidade != 'Portugal' and nascimento between '1990-01-01' and '2000-12-31';
update pessoas set nacionalidade ='EUA' where id='8';
select * from pessoas;

######################################################################################################################################
# 9 - Quantos utilizadores mulheres têm mais de 1.90m de altura?”
update pessoas set altura ='1.91' where id='2';
update pessoas set altura ='1.94' where id='6';
select * from pessoas where altura >'1.90' and sexo='F';
select count(*) from pessoas where altura >'1.90' and sexo='F';

######################################################################################################################################
# 10 - “Uma lista com as profissões e as respetivas quantidades”

select profissao,count(*) from pessoas group by profissao;
update pessoas set profissao ='agronomo' where id='1';
update pessoas set profissao ='agronomo' where id='6';
update pessoas set profissao ='motorista' where id='5';
update pessoas set profissao ='motorista' where id='7';
update pessoas set profissao ='manicure' where id='13';
update pessoas set profissao ='cabelereiro' where id='18';
update pessoas set profissao ='analista' where id='2';
update pessoas set profissao ='professor' where id='21';

######################################################################################################################################
# 11 - “Quantos utilizadores homens e quantas mulheres nasceram depois de 01/Jan/2005?”
select sexo,count(*) from pessoas where nascimento > '2005-01-01' group by sexo;  
######################################################################################################################################
# 12 - “Uma listagem com o número de utilizadores e o país desses utilizadores que
#       nasceram fora de Portugal. Só nos interessam os países com mais de 3 utilizadores com
#       essa nacionalidade”
select*from pessoas;

select nacionalidade,count(*) from pessoas where nacionalidade != 'portugal' group by nacionalidade having count(*)>2;
######################################################################################################################################
# 13 -  “Uma listagem agrupada pela altura dos utilizadores, onde mostra quantas pessoas
#        pesam mais de 100Kg e que estão acima da média de altura de todos os utilizadores”
update pessoas set peso='110' where id = '2';
update pessoas set peso='101' where id = '6';
update pessoas set peso='105' where id = '9';
update pessoas set altura='1.70' where id = '9';
select id,nome,altura from pessoas where peso>'100' group by altura having altura > (select avg(altura) from pessoas) ;
select round(avg(altura),2) from pessoas;


