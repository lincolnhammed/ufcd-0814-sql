use ufcd0814;
drop table if exists pagamento;
drop table if exists empregado;

CREATE TABLE empregado (
    id_empregado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('Masculino','Feminino') NOT NULL,
    data_contratacao DATE NOT NULL
);

insert into empregado (nome,data_nascimento,genero,data_contratacao) value
('Ana Sofia Silva', '1992-03-14', 'Feminino', '2019-09-02'),
('João Miguel Ferreira', '1988-11-22', 'Masculino', '2020-01-15'),
('Maria Inês Santos', '1995-07-05', 'Feminino', '2021-03-01'),
('Tiago Alexandre Rodrigues', '1984-02-18', 'Masculino', '2018-10-08'),
('Catarina Filipa Costa', '1990-05-30', 'Feminino', '2022-02-14'),
('Rui Pedro Oliveira', '1979-12-03', 'Masculino', '2019-06-17'),
('Beatriz Mariana Pereira', '1998-09-27', 'Feminino', '2023-01-09'),
('Miguel Ângelo Gomes', '1986-04-11', 'Masculino', '2020-09-21'),
('Sofia Raquel Lopes', '1993-01-19', 'Feminino', '2021-07-12'),
('Afonso Manuel Marques', '1997-06-02', 'Masculino', '2022-11-07'),
('Inês Carolina Ribeiro', '1991-08-23', 'Feminino', '2019-03-25'),
('Pedro Nuno Martins', '1985-10-09', 'Masculino', '2018-09-03'),
('Helena Margarida Fonseca', '1996-12-28', 'Feminino', '2020-05-04'),
('Ricardo Jorge Carvalho', '1982-07-16', 'Masculino', '2021-04-19'),
('Patrícia Andreia Sousa', '1994-03-08', 'Feminino', '2022-09-05'),
('Bruno Daniel Matos', '1989-02-25', 'Masculino', '2019-11-18'),
('Carolina Maria Rocha', '1997-10-12', 'Feminino', '2023-05-15'),
('Luís Filipe Correia', '1978-06-21', 'Masculino', '2020-02-03'),
('Marta Joana Almeida', '1992-09-01', 'Feminino', '2021-01-11'),
('Diogo Rafael Pinto', '1990-12-15', 'Masculino', '2019-07-29'),
('Teresa Isabel Barros', '1987-05-07', 'Feminino', '2020-10-26'),
('Gonçalo Tiago Figueiredo', '1999-01-31', 'Masculino', '2023-03-06'),
('Filipa Catarina Tavares', '1995-04-26', 'Feminino', '2022-01-17'),
('André Luiz Moreira', '1983-03-03', 'Masculino', '2018-11-12'),
('Rita Alexandra Nunes', '1996-08-14', 'Feminino', '2021-06-07'),
('Hugo Miguel Antunes', '1981-09-29', 'Masculino', '2019-05-20'),
('Cláudia Sofia Teixeira', '1993-11-06', 'Feminino', '2020-08-31'),
('Vítor Emanuel Ribeiro', '1987-01-24', 'Masculino', '2022-04-04'),
('Daniela Filipa Morais', '2000-02-10', 'Feminino', '2024-02-19'),
('Eduardo José Batista', '2001-07-22', 'Masculino', '2025-01-13');

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT NOT NULL,
    quantia DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    #CONSTRAINT fk_pagamento_empregado
        FOREIGN KEY (id_empregado)
        REFERENCES empregado(id_empregado)
        ON DELETE CASCADE
);

INSERT INTO Pagamento (id_empregado, quantia, data_pagamento) VALUES
(3, 1200.00, '2025-01-31'),
(3, 1200.00, '2025-02-28'),
(7, 980.50,  '2025-01-15'),
(7, 980.50,  '2025-02-15'),
(12, 1500.00, '2025-01-31'),
(12, 1500.00, '2025-02-28');

delete from empregado where id_empregado="3";
UPDATE empregado SET data_contratacao = DATE_ADD(data_contratacao, INTERVAL 1 DAY);
select * from empregado;