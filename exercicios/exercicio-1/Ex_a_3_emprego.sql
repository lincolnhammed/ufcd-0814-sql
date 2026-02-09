# (Ex_a_3_emprego) Escreva um novo script SQL que permita: 
# a. Criar uma tabela de emprego 
# b. Inclua as colunas id_empergo, título_emprego, e salário_minimo 
# c. Coloque o id_emprego com chave primária e com incremento automático de valor/registo 
# d. O salário mínimo deve ter um valor pré-definido (Default) de 500 
# i. Default é uma limitação, sendo colocada logo a seguir ao tipo de dados daquele campo 
# e. Acrescente o código que permite inserir 6 registos.
#f. Descreva a tabela  
# g.Guarde o script com o nome: Ex_a_3_emprego 

use efaprog004_exercicios;
drop table if exists emprego;
create table emprego(
id_empergo int auto_increment primary key,
título_emprego varchar(50), 
salário_minimo decimal(10,2) default "500"
);

insert into emprego values 
(default,"programador",default),
(default,"pedreiro","1000"),
(default,"padeiro","900"),
(default,"cabelereiro","1500"),
(default,"motorista",default),
(default,"manicure",default);
select * from emprego;
describe emprego;
