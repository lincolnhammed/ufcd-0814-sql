# (Ex_a_2_países) Escreva um novo script SQL que permita: 
# a. Criar uma tabela de países 
# b. Inclua os campos/colunas pais_id, pais_nome, e pais_capital  i. 
# c. Coloque o pais_id com chave primária e com incremento automático de valor/registo Acrescente o código que permita inserir 6 registos 
# d. Descreva a tabela criada e. Guarde o script com o nome: Ex_a_2_países 
use efaprog004_exercicios;
create table paises(
pais_id int auto_increment primary key,
pais_nome varchar(50),
pais_capital varchar(50)
);
insert into paises values(default,"portugal","lisboa"),(default,"algola","luanda"),(default,"brasil","brasilia"),(default,"espanha","madrid");
select * from paises;
