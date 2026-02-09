create database 1_SQL_SPA;
use 1_SQL_SPA;
drop table t_associados;
create table t_associados(
n_associado int primary key auto_increment,
nome varchar(50),
morada varchar(50),
localidade varchar(50),
telemovel varchar(13),
data_nascimento date,
programa_selecionado varchar(50),
autorizacao_medica enum("Sim","Não")
);

INSERT INTO t_associados
(nome, morada, localidade, telemovel, data_nascimento, programa_selecionado, autorizacao_medica)
VALUES
('Afonso Ribeiro', 'Rua das Flores 12', 'Lisboa', '912345001', '1990-05-12', 'Massagem Vichy', 'Sim'),
('Beatriz Carvalho', 'Av. Central 45', 'Porto', '913456002', '1985-03-22', 'Massagem com pedras quentes', 'Sim'),
('Carlos Silva', 'Rua do Sol 8', 'Braga', '914567003', '1992-07-30', 'Rejuvenescimento', 'Sim'),
('Diana Fernandes', 'Rua Nova 12', 'Coimbra', '915678004', '1988-01-15', 'Banho Imersão', 'Não'),
('Eduardo Santos', 'Av. Liberdade 100', 'Lisboa', '916789005', '1995-11-09', 'Hidromassagem', 'Sim'),

('Fernanda Costa', 'Rua da Praia 3', 'Faro', '917890006', '1983-09-18', 'Vinoterapia', 'Sim'),
('Gonçalo Pereira', 'Rua do Campo 22', 'Viseu', '918901007', '1991-04-27', 'Aromaterapia', 'Sim'),
('Helena Rocha', 'Rua das Oliveiras 5', 'Évora', '919012008', '1986-12-05', 'Massagem Vichy', 'Não'),
('Igor Nunes', 'Av. Atlântico 77', 'Setúbal', '910123009', '1998-06-14', 'Massagem com pedras quentes', 'Não'),
('Júlia Martins', 'Rua da Fonte 9', 'Leiria', '911234010', '1979-08-21', 'Rejuvenescimento', 'Sim'),

('Katarina Lopes', 'Rua da Escola 4', 'Guimarães', '912987011', '1993-10-03', 'Banho Imersão', 'Sim'),
('Leonardo Figueiredo', 'Rua das Acácias 11', 'Aveiro', '913876012', '1981-02-17', 'Hidromassagem', 'Não'),
('Mafalda Gomes', 'Av. do Mar 60', 'Cascais', '914765013', '1996-09-25', 'Vinoterapia', 'Sim'),
('Nuno Batista', 'Rua do Pinhal 14', 'Santarém', '915654014', '1984-04-08', 'Aromaterapia', 'Sim'),
('Olívia Pinto', 'Rua das Amendoeiras 7', 'Beja', '916543015', '1990-12-19', 'Massagem Vichy', 'Sim'),

('Paulo Moreira', 'Rua do Castelo 1', 'Tomar', '917432016', '1977-07-07', 'Massagem com pedras quentes', 'Sim'),
('Quésia Duarte', 'Av. da Serra 19', 'Covilhã', '918321017', '1989-05-29', 'Rejuvenescimento', 'Não'),
('Rui Cardoso', 'Rua das Laranjeiras 16', 'Portimão', '919210018', '1994-01-11', 'Banho Imersão', 'Sim'),
('Sofia Azevedo', 'Rua do Lago 2', 'Chaves', '910109019', '2000-03-06', 'Hidromassagem', 'Sim'),
('Tiago Nunes', 'Av. dos Descobrimentos 88', 'Lagos', '911098020', '1982-06-23', 'Vinoterapia', 'Sim'),

('Úrsula Macedo', 'Rua do Mosteiro 13', 'Batalha', '912087021', '1997-08-16', 'Aromaterapia', 'Não'),
('Vasco Henriques', 'Rua da Feira 21', 'Barcelos', '913076022', '1985-11-28', 'Massagem Vichy', 'Sim'),
('Wilson Freitas', 'Rua do Comércio 30', 'Póvoa de Varzim', '914065023', '1978-02-02', 'Massagem com pedras quentes', 'Sim'),
('Xavier Loureiro', 'Av. do Parque 5', 'Matosinhos', '915054024', '1991-04-19', 'Rejuvenescimento', 'Sim'),
('Yara Macedo', 'Rua da Estação 18', 'Entroncamento', '916043025', '1999-09-01', 'Banho Imersão', 'Sim'),

('Zé Miguel', 'Rua do Mercado 6', 'Almada', '917032026', '1987-10-10', 'Hidromassagem', 'Sim'),
('Alexandra Sousa', 'Rua das Palmeiras 23', 'Oeiras', '918021027', '1992-12-24', 'Vinoterapia', 'Sim'),
('Beatriz Cunha', 'Av. das Nações 50', 'Lisboa', '919010028', '1995-01-30', 'Aromaterapia', 'Sim'),
('Carlos Pacheco', 'Rua da Ribeira 15', 'Peso da Régua', '910999029', '1980-06-04', 'Massagem Vichy', 'Não');


# a. Quais as pessoas sem autorização médica que moram em Setúbal? (Ca_Localidade)
select*from t_associados where autorizacao_medica ='Não' and localidade ="Setúbal";

#b. Qual o telemóvel das pessoas que moram fora Lisboa? (Cb_Localidade2)
select telemovel from t_associados where localidade<>"Lisboa";

#c. Qual o nome, morada e localidade dos 4 primeiros sócios? (Cb_4Primeiros)
select nome, morada, localidade from t_associados order by n_associado limit 4;

#d. Qual o nome e os Programas dos sócios 2, 6, 7 e 9? (Cd_Sócios)
select n_associado,nome from t_associados where n_associado in(2,6,7,9);

#e. Quais as pessoas que têm um telemóvel da rede 91? (Ce_Telemóvel91)
select nome,telemovel from t_associados where telemovel like("91%");

#f. Quais as pessoas que nasceram depois de 1/1/1985? (Cf_DataNasc)
select nome, data_nascimento from t_associados where data_nascimento > "1985-1-1";

#g. Quais as pessoas que nasceram antes de 1/1/1985? (Cg_DataNasc2)
select nome, data_nascimento from t_associados where data_nascimento < "1985-1-1";

#h. Quais as pessoas que nasceram entre 1/1/1980 e 1/1/1990? (Ch_DataNasc3)
select nome, data_nascimento from t_associados where data_nascimento between "1980-1-1"  and  "1990-1-1";

#i. Qual a localidade que mais utilizadores tem da Aromaterapia? (Ci_Users)
select localidade, count(*) from t_associados where programa_selecionado = "Aromaterapia" group by localidade; 

#j. Qual o nome e telemóvel das pessoas que fizeram Aromaterapia ou
#Rejuvenescimento? (Cj_MultiCriterios)
select nome,telemovel,programa_selecionado from t_associados where programa_selecionado = "Aromaterapia" or programa_selecionado="Rejuvenescimento";
select nome,telemovel,programa_selecionado from t_associados where programa_selecionado in("Aromaterapia" ,"Rejuvenescimento");
#k. Quais as pessoas que não praticam Massagem Vichy? (Ck_Negado
select * from t_associados where programa_selecionado  not in ("Massagem Vichy");

#l. Quais as pessoas que nasceram depois de 1985? (Cl_DataNasc3)
select nome, data_nascimento from t_associados where year (data_nascimento) > 1985;

