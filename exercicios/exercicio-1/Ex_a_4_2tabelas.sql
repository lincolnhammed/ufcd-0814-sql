#Crie um novo script para a criação de 2 tabelas agora em simultâneo e ao seu critério,
# colocando as colunas/campos, tipos de dados, chaves primárias, etc., também ao seu critério.
# Inclua alguns registos. Guarde com o nome: Ex_a_4_2tabelas 

use efaprog004_exercicios;
#################################################
set foreign_key_checks=0; -- desativa as ligacoes do fk de chaves estrangeiras tabelas relacionadas 

drop table if exists pessoa;
create table pessoa(
id_pessoa int auto_increment primary key,
nome_pessoa varchar(50)
);
insert into pessoa values (default, "joao"),(default, "pedro"),(default, "maria");
#################################################
drop table if exists personagem;
create table personagem(
id_personagem int auto_increment primary key,
nome_personagem varchar(50)
);
insert into personagem values (default, "batman"),(default, "homem aranha"),(default, "mulher maravilha");
#################################################

drop table if exists pessoa_personagem;
create table pessoa_personagem(
id_pessoa int,
id_personagem int,
primary key(id_pessoa,id_personagem),
foreign key (id_pessoa) references pessoa(id_pessoa)ON DELETE CASCADE,
foreign key (id_personagem) references personagem(id_personagem)ON DELETE CASCADE
);
insert into pessoa_personagem (id_pessoa,id_personagem) values(1,1),(2,2),(3,3);
set foreign_key_checks=1; -- ativa as chaves estrangeiras e nao apaga mas sem uma sequencia

################################################
select p.nome_pessoa as Pessoa, c.nome_personagem as Personagem
from pessoa_personagem pp
join pessoa p on pp.id_pessoa = p.id_pessoa
join personagem c on pp.id_personagem = c.id_personagem;