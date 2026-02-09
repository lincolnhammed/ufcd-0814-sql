use ufcd0814;
 
-- select 

drop table if exists socio2;
 
create table socio2(

id_socio2 int primary key,

nome varchar (50),

localidade varchar(50),

tlm varchar(50),

dataNascimento date

);

describe socio2;

insert into socio2 values (1,'Teresa Costa','Guarda','914185255','1997-01-10');

insert into socio2 values (2,'Ana Reis','Qtª do Anjo','918700579','1993-11-11');

insert into socio2 values (3,'Xavier Rodrigues','Guarda','961245242','1976-04-26');

insert into socio2 values (4,'Tiago Lima','Lau','936551027','1999-09-27');

insert into socio2 values (5,'Manel Santos','Faro','937980653','1997-05-27');

insert into socio2 values (6,'Manel Santos','Guarda','968682916','1974-08-11');

insert into socio2 values (7,'Sofia Reis','Lisboa','962112409','1994-01-15');

insert into socio2 values (8,'Cristina Santos','Pinhal Novo','965911516','1992-04-18');

insert into socio2 values (9,'Paulo Silva','Pinhal Novo','919165122','1982-11-08');

insert into socio2 values (10,'Xavier Martins','Azeitão','919875936','1987-07-19');

insert into socio2 values (11,'Teresa Santos','Lau','911020305','1976-08-08');

insert into socio2 values (12,'Lucas Reis','Sesimbra','918025664','1977-08-17');

insert into socio2 values (13,'Tiago Castro','Guarda','912625970','2010-11-01');

insert into socio2 values (14,'Ana Reis','Oeiras','937186765','1974-10-20');

insert into socio2 values (15,'João Silva','Porto','918391002','1977-10-27');

insert into socio2 values (16,'Pedro Costa','Porto','961897572','1997-08-25');

insert into socio2 values (17,'Pedro Rodrigues','Porto','913634348','1999-08-15');

insert into socio2 values (18,'António Castro','Pinhal Novo','911634229','1979-12-22');

insert into socio2 values (19,'Tiago Barros','Porto','911862050','1996-01-07');

insert into socio2 values (20,'Paulo Pereira','Montijo','919687939','1988-05-10');
 
 
-- mostra todos  os registros da tabela

select * from socio2;

#registros entre  o id 10 e 15  
select *from socio2 where id_socio2 between 10 and 15;

#ultimos 5 registros 
select *from socio2 where id_socio2 between 16 and 20;

#agora de forma dinamica ultimos 5 registros
select *from socio2 order by id_socio2 desc limit 5;

#socios que moram em lisboa faro e guarda
select * from socio2
-- where localidade="Lisboa" or localidade="Faro" or localidade="Guarda";
 -- where localidade in("Lisboa","Faro", "Guarda");
 where localidade not in("Lisboa","Faro", "Guarda");
 
 #socios que nao moram em faro
select * from socio2 
-- where localidade != "Faro";
where localidade<>"Faro";

#socios cujo nome inicia pela letra  "P"
select *from socio2 where nome like "P%";

#socios cujo nome termina com letra  "o"
select *from socio2 where nome like "%o";

#socios cujo nome contem a letra  "x"
select *from socio2 where nome like "%x%";

#socios cujo nome nao tem a letra "a"
select *from socio2 where nome not like "%a%";

#socios cuja 2° letra do nome é "e"
select *from socio2 where nome like "_e%";

#pessoas que moram em localidade cujo nome tem so 6 caracteres
select * from socio2 where localidade like "______";

#pessoas que moram em localidade cujo nome nao tem so 6 caracteres
select * from socio2 where localidade not like "______";

#mostrar o numero de caracteres que cada cidade tem
select localidade, char_length(localidade) as NumCaracteres from socio2;

#mostrar socicios que nasceram na decada de 70
select*from socio2 where dataNascimento between "1970-1-1" and "1979-12-31";
select*from socio2 where dataNascimento like"197%";
select*from socio2 where year (dataNascimento) between "1970" and "1979";

#mostrar os socios que nao tem tlm da operadora nos(93) e que nao moram em lau
select *from socio2;
SELECT * FROM socio2 WHERE NOT (tlm LIKE '93%' AND localidade = 'Lau');









