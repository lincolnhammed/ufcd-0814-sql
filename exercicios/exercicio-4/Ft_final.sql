create database if not exists BDex2_lincoln;

use BDex2_lincoln;

create table if not exists produtos_lincoln(

 codigoprod int primary key auto_increment,	
 codigoforn		int	,	
 nomeprod		varchar(50)	,
 qtaprod		int,
 precoprod		decimal	(5,2)
);

create table if not exists fornecedor_lincoln(
 codigoforn		int primary key auto_increment	,			
 nomeforn		text
);

create table if not exists cliente_lincoln(

  codigocli		int primary key auto_increment,			
  nomecli		text
);


# b) Defina o campo codigoforn como chave estrangeira na tabela Produto_seunome, referenciando a tabela Fornecedor_seunome.
#alter table fornecedor_lincoln add primary key(codigoforn);
alter table produtos_lincoln add foreign key (codigoforn) references fornecedor_lincoln(codigoforn);

# c) Altere a tabela Cliente_seunome, adicionando a coluna IVA, depois do campo qtaprod, do tipo numérico, com 2 dígitos.
alter table produtos_lincoln add column iva decimal (2) after qtaprod;

# 2.a) Inserção de Dados (INSERT)  Insira pelo menos 3 fornecedores na tabela Fornecedor_seunome.
insert into fornecedor_lincoln (nomeforn) value  ("nike"),("adidas"),("zara");

# 2.b) Insira pelo menos 5 produtos, garantindo que:
#    • Todos os produtos estejam associados a um fornecedor válido.
#    • Existam produtos com preços diferentes.
#    • Existam produtos com quantidades distintas (incluindo valores baixos e elevados).

#alter table produtos_lincoln Modify column precoprod decimal(5,2);

INSERT INTO produtos_lincoln (codigoforn, nomeprod, qtaprod, iva, precoprod) value
(2, "tenis", 2,23, 123.2),
(1, "t-shirt", 2,13, 12.9),
(3, "bone", 2,10, 23.2),
(3, "blusa", 2,8, 53.4),
(2, "sueter", 2,3, 43.9);

# 2. c) Insira pelo menos 3 clientes na tabela Cliente_seunome, com valores de IVA distintos.
insert into cliente_lincoln(nomecli) values("lincoln"),("tamara"),("joao");

# 3. Consultas Simples (SELECT)
#    a) Liste todos os produtos existentes.
select * from produtos_lincoln;

# b)  Apresente apenas o nome e o preço dos produtos com preço superior a 10.
select nomeprod,precoprod from produtos_lincoln  where precoprod>10;

# c) Liste os produtos cuja quantidade seja inferior a 5.

select * from produtos_lincoln where qtaprod <5;

# d) Apresente os produtos com preço entre 5 e 20.
select nomeprod,precoprod from produtos_lincoln  where precoprod>=5 and precoprod<=20;

#4. Consultas com Funções de Agregação
#     a) Calcule o preço médio dos produtos (AVG).
select round(avg(precoprod),2) as "preco medio" from produtos_lincoln;

#b. Indique o produto mais barato e o mais caro (MIN, MAX).

select min(precoprod) as "preco minimo",MAX(precoprod) as "preco maximo" from produtos_lincoln;

#c. Apresente a quantidade total de produtos em stock (SUM).
select sum(qtaprod) from produtos_lincoln;

#   5. Consultas com Várias Tabelas (JOIN)
#    a) Liste todos os produtos mostrando:
#    • Nome do produto
#    • Nome do fornecedor
#    • Preço

select p.nomeprod as produto , f.nomeforn as fornecedor , p. precoprod as preco 
from produtos_lincoln p 
inner join fornecedor_lincoln f 
on p.codigoforn = f.codigoforn;

# b)Liste apenas os produtos cujo nome do fornecedor contenha a letra “a” (LIKE).

select nomeprod,nomeforn from produtos_lincoln p inner join fornecedor_lincoln f on p.codigoforn = f.codigoforn where nomeforn like "%a%";

# c) Apresente o preço médio dos produtos por fornecedor.

select nomeforn, round(avg(precoprod),2) from produtos_lincoln p inner join fornecedor_lincoln f on p.codigoforn = f.codigoforn group by (nomeforn);


# 6. Consultas Condicionais Avançadas
#    a) Liste os produtos cujo nome comece por “A”.

select* from produtos_lincoln where nomeprod like("a%");

# b) Liste os fornecedores que não têm produtos associados.

select f.codigoforn, f.nomeforn from fornecedor_lincoln f left join produtos_lincoln p on f.codigoforn = p.codigoforn where p.codigoprod is null;

# 7. Atualizações e Remoções
#    a) Atualize o preço de um produto à sua escolha, aumentando-o em 10%.
update produtos_lincoln set precoprod = precoprod * 1.10  where codigoprod = 1;

# b) Remova um produto específico da tabela.
delete from produtos_lincoln where nomeprod = 'bone';
