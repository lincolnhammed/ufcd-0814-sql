# Crie uma base de dados com o nome “BDex1_meunome”, onde meunome deve ser substituído pelo seu nome.
create database if not exists BDex1_lincoln DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_bin;

use BDex1_lincoln;

# Crie agora a tabela “Pessoa_meunome”, utilizando o conjunto de caracteres utf8mb4, com os seguintes campos:

create table if not exists pessoas_lincoln (
    codigo int not null auto_increment,
    primeiro_nome varchar(50) not null,
    ultimo_nome varchar(50) not null,
    morada varchar(80),
    profissao varchar(50) default 'Programador',
    telefone char(9) unique,
    datanascimento date,
    primary key (codigo)
)DEFAULT charset = utf8mb4;

# a) Acrescente à tabela anterior uma nova coluna (campo) com o nome “codigo_postal” do tipo caracter de 8 que seja único.
alter table pessoas_lincoln add column codigo_postal char (8) unique after morada;

# b) Insira pelo menos 5 registos na tabela Pessoa_meunome, garantindo que:
#    a) existem pessoas com profissões diferentes
#    b) pelo menos duas pessoas têm a mesma profissão
#    c) as datas de nascimento são diferentes

insert into pessoas_lincoln values
(default,'joao', 'silva', 'rua das flores 10', '1234-567', 'programador', '912345678', '1990-05-12'),
(default,'maria', 'santos', 'avenida central 25', '2345-678', 'designer', '923456789', '1985-03-20'),
(default,'carlos', 'pereira', 'travessa do ferro 8', '3456-789', 'programador', '934567891', '1992-11-02'),
(default,'ana', 'rocha', 'rua do sol 14', '4567-890', 'enfermeira', '945678912', '1988-07-15'),
(default,'ricardo', 'mendes', 'rua nova 3', '5678-901', 'professor', '956789123', '1995-01-30');

 # c) Liste o primeiro nome e a profissão das pessoas cuja profissão seja “Programador”.
 select primeiro_nome,profissao from pessoas_lincoln where profissao='Programador';
 
 # d) Liste todas as pessoas cujo primeiro nome começa por “A”.
 select * from pessoas_lincoln where primeiro_nome like 'A%';
 
 # e) Liste todas as moradas que contêm a letra ‘o’
 select * from pessoas_lincoln where morada like '%O%';
 
 # f) Liste o nome completo e a data de nascimento das pessoas, ordenadas da mais antiga para a mais recente.
 select primeiro_nome,ultimo_nome,datanascimento from pessoas_lincoln order by datanascimento;
 
 # g)Apresente o número de pessoas por profissão
 select profissao,count(*) as 'pessoas' from pessoas_lincoln group by profissao;
 
 # h) Liste apenas as profissões que têm mais do que uma pessoa associada.
 select profissao from pessoas_lincoln group by (profissao)  having count(*)>1 ; 
 
 # i) Apresente a profissão e a data de nascimento mais antiga, registada para cada profissão.
 select profissao,min(datanascimento) as"mais velho" from pessoas_lincoln group by profissao;
 
 # j) Apague a coluna “telefone”.
alter table  pessoas_lincoln drop column telefone;

# k) Apague a tabela “Pessoa_meunome”.
#drop table if exists pessoas_lincoln;

# l) Apague a base de dados “BDex1_meunome”
#drop database if exists BDex1_lincoln;
 
 
select*from pessoas_lincoln;
describe pessoas_lincoln;