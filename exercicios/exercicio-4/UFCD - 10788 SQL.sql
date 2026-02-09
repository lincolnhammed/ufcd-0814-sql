#aqui vamos escrever as nossas consultas
 
/*outro comentario*/
  
USE minhabasededados;
 
CREATE TABLE pessoas (
nome varchar(50),
idade tinyint,
sexo char(1),
peso float,
altura float,
nacionalidade varchar(30)
);
 
DROP DATABASE minhabasededados;
 
CREATE DATABASE minhabasededados
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_bin;
 
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
 
/*INSERT INTO pessoas
( nome, sexo) #falta nacionalidade e id
 
VALUES
	('Godofredo','M');*/
 
 
INSERT INTO pessoas
VALUES
(DEFAULT, 'Rui', '1980-12-25', 'M', '60.3', '1.81', 'Brasil'),
(DEFAULT, 'João', '1981-11-22', 'M', '70.3', '1.85', DEFAULT),
(DEFAULT, 'Rui', '1980-12-25', 'M', '60.3', '1.81', 'Brasil'),
(DEFAULT, 'João', '1981-11-22', 'M', '70.3', '1.85', DEFAULT);
 
DELETE FROM pessoas
WHERE id='1';
 
USE minhabasededados;
 
SELECT * FROM pessoas;
 
UPDATE pessoas
SET nascimento = NULL
WHERE id='1';
 
ALTER TABLE pessoas
ADD COLUMN profissao varchar(15);
 
ALTER TABLE pessoas
DROP COLUMN pessoas
 
ALTER TABLE pessoas
ADD COLUMN profi varchar(15) AFTER nome;
 
ALTER TABLE pessoas
ADD COLUMN profi1 varchar(15) FIRST;
 
ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(30) NOT NULL;
 
ALTER TABLE pessoas
MODIFY COLUMN profi varchar(30) NOT NULL;
 
SELECT * FROM pessoas;
 
# DELETE cOLUMN profi
 
UPDATE  pessoas
SET profissao= 'TI';
 
 
INSERT INTO pessoas(nome,profissao)
VALUES ('João', 'Bombeiro');
 
ALTER TABLE pessoas
CHANGE COLUMN profi profissao varchar(30);
 
ALTER TABLE pessoas
DROP COLUMN profi;
 
ALTER TABLE pessoas
DROP COLUMN profi1;
 
ALTER TABLE pessoas
RENAME TO pessoas1;
 
CREATE TABLE IF NOT EXISTS cursos(
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
totaulas int,
ano YEAR DEFAULT '2016'
)DEFAULT charset = utf8mb4;

alter table cursos add column idCurso int first, -- adiciona o idCurso a tabela na primeira posicao
add primary key(idCurso); -- torna chave primaria 

##################################### inserindo dados errados para corrigir #########################################
INSERT INTO cursos VALUES
('1','HTML4','Curso de HTML5', '40','37','2014'),
('2','Algoritmos','Lógica Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução Linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer','40','30','2018'),
('10','Youtuber','Gerar polêmica','5','2','2018');
select * from cursos;
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
 -- -------------updates da tabela curso --------------------------------------------------------------------------
update cursos set nome="HTML5" where idCurso ="1";
update cursos set nome="PHP", ano="2015" where idCurso ="4"; 
update cursos set nome="Java", carga="40", ano="2025" where idCurso ="5"; 
 
 -- -------------delete da tabela curso --------------------------------------------------------------------------
delete from cursos where idCurso="9";
delete from cursos where ano>='2018';
delete from cursos where ano>='2018' limit 2;

 -- -------------truncate da tabela curso --------------------------------------------------------------------------
truncate table cursos;
delete from cursos;
select * from cursos;
####################################################################################################################

##################################### pesquisas personalizadas ########### #########################################

select * from cursos order by ano;
select * from cursos order by descricao desc;
 
 -- -------------pesquisando somente algumas colunas----------------------------------------------------------------
select nome,ano from cursos order by nome;

select * from cursos where totaulas >=30 order by ano;
select nome,ano,carga from cursos where ano <='2015' order by ano,carga;

select * from cursos where ano between '2016' and '2018';

select nome, totaulas,carga from cursos where carga in ('40','30','5');

select nome,carga,totaulas from cursos where carga > 10 and totaulas < 50;

select * from cursos where nome = "word";

select * from cursos where nome like"A%"; -- like"A%"  like"%A%"  like"%A"

select * from cursos where nome like"al%o_"; -- al%gorition%o_s

select distinct ano from cursos order by ano; -- distinct mostra valores unicos

######################### funcao de agregacao ##################################

select count(*) from cursos where nome like "%s%";

select max(ano) from cursos; -- maior valor

select min(ano) from cursos; -- menor valor

select avg(carga) from cursos; -- tira a media da coluna

select sum(carga) from cursos; -- faz a soma da coluna

select round(avg(carga),2)from cursos; -- arredonda valor com casa decimais 

select distinct carga from cursos order by carga;
select carga, count(*) from cursos group by(carga) order by carga ;
select carga, count(*) from cursos group by(carga) having count(*)>2 order by carga ;
select carga, count(*) from cursos where ano>'2015' group by(carga) having count(*)>2 order by carga ;

SELECT carga ,COUNT(*) FROM cursos WHERE ano > 2015 GROUP BY carga HAVING carga > (SELECT AVG(carga) FROM cursos);

####################################################################################################################
use minhabasededados;
alter table pessoas add column cursopreferido int;
alter table pessoas add foreign key (cursopreferido) references cursos(idcurso);

select * from pessoas;
select * from cursos;

delete from cursos where idcurso="1"; 

select * from cursos join pessoas; -- mostra todos os dados combinados (nao fica bem)

select * from pessoas join cursos on cursos.idcurso = pessoas.cursopreferido;

select pessoas.nome, pessoas.nacionalidade,cursos.nome,cursos.carga from pessoas join cursos on cursos.idcurso = pessoas.cursopreferido;

select pessoas.*,cursos.nome,cursos.carga from pessoas inner join cursos on cursos.idcurso = pessoas.cursopreferido;

select p.nome, p.sexo, p.peso, c.nome, c.descricao from pessoas as p inner join cursos as c on c.idcurso = p.cursopreferido order by p.nome;

select p.nome, c.nome from pessoas as p left join cursos as c on c. idcurso = p.cursopreferido;

select p.nome, c.nome from cursos as c right join pessoas as p on c. idcurso = p.cursopreferido;


