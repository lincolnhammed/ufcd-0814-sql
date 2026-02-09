############################   gerir tabelas e campos  #############################################
use ufcd0814;
############## drop de varias tabelas ao mesmo tempo
drop table if exists tbl1,tbl2,tbl3;

create table tbl1(
id int,
nome varchar(50)
);
create table tbl2(
id int,
nome varchar(50)
);
create table tbl3(
id int,
nome varchar(50)
);
show tables;

################# adicionar campo #############################
alter table tbl1 add email varchar(50) after id;

################# apagar um campo #############################
alter table tbl1 drop column nome;

#################alterar tipo de dados ########################
alter table tbl1 modify column email varchar(100);

################# alterar nome de um campo ####################
alter table tbl1 rename column email to e_mail;

################# alterar posicao do campo ####################
alter table tbl1 modify id int after e_mail;
 
describe tbl1;