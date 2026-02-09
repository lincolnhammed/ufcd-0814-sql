############################   gerir tabelas e campos  ##############################################
use ufcd0814;
drop table if exists excel2;
CREATE TABLE excel2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    apelido VARCHAR(50),
    localidade VARCHAR(50),
    idade INT,
    tlm VARCHAR(20)
);
drop table excel;

INSERT INTO excel2 (nome, apelido, localidade, idade, tlm)
SELECT
    ELT(FLOOR(1 + RAND() * 30),
        'João','Maria','Pedro','Ana','Rui','Carla','Miguel','Sofia','Tiago','Inês',
        'Bruno','Diana','André','Patrícia','Fábio','Catarina','Daniel','Beatriz','Ricardo','Helena',
        'Paulo','Joana','Luís','Mariana','Nuno','Raquel','Sérgio','Cláudia','Vasco','Liliana'
    ) AS nome,

    ELT(FLOOR(1 + RAND() * 30),
        'Silva','Santos','Oliveira','Costa','Pereira','Ferreira','Rodrigues','Martins','Lopes','Gomes',
        'Ribeiro','Almeida','Nunes','Pinto','Teixeira','Moreira','Correia','Mendes','Cunha','Cardoso',
        'Rocha','Neves','Fonseca','Batista','Azevedo','Figueiredo','Pacheco','Tavares','Peixoto','Reis'
    ) AS apelido,

    ELT(FLOOR(1 + RAND() * 20),
        'Lisboa','Porto','Braga','Coimbra','Faro','Setúbal','Aveiro','Viseu','Leiria','Évora',
        'Guimarães','Barcelos','Chaves','Viana do Castelo','Penafiel',
        'Amarante','Lamego','Tomar','Torres Vedras','Caldas da Rainha'
    ) AS localidade,

    FLOOR(18 + RAND() * 50) AS idade,   -- 18 a 67

    CONCAT(
        '9',
        FLOOR(10 + RAND() * 89),
        FLOOR(100000 + RAND() * 899999)
    ) AS tlm
FROM information_schema.tables
LIMIT 30;


select count(*) from excel2;
######################### apagar/ delete registros ########################
set sql_safe_updates=0; -- evita o erro  de safe update mode....
delete from excel2 where localidade ="Lisboa";
set sql_safe_updates=1;

######################## atualizar registros ##############################
set sql_safe_updates=0; -- evita o erro  de safe update mode....
update excel2 set localidade = "Labutes" where localidade ="Aveiro";
set sql_safe_updates=1;

select * from excel2;