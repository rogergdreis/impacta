create database db_cds;

use db_cds;

-- tabela artistas
create table artistas(
	cod_art int	not null auto_increment,
	nome_art varchar(100) not null,

	constraint pk_art primary key (cod_art),
	constraint uq_art unique(nome_art)
);

desc artistas;

-- dados tabela artista
insert
	artistas
values
	(null,'marisa monte'),
	(null,'Baby do Brasil'),
	(null,'Moraes Moreira'),
	(null,'Pepeu Gomes'),
	(null,'Paulinho Boca de Cantor'),
	(null,'Luiz Galvão'),
	(null,'Alceu Vaença'),
	(null,'Geraldo Azevedo'),
	(null,'Elba Ramalho'),
	(null,'Carlinhos Brown'),
	(null,'Arnaldo Antunes'),
	(null,'Adriana Calcanhoto'),
	(null,'Aline Barros'),
	(null,'Gal Costa'),
	(null,'Chico Buarque'),
	(null,'Rita lee'),
	(null,'Skank'),
	(null,'Lulu Santos'),
	(null,'Anitta');

select * from artistas;

-- tabela gravadora
create table gravadoras(
	cod_grav int not null auto_increment,
	nome_grav varchar(50) not null,

	constraint pk_grav primary key (cod_grav),
	constraint uq_grav unique (nome_grav)
);

desc gravadoras;

-- dados tabela gravadora
insert
	gravadoras
values
	(null,'Phonomotor'),
	(null,'Biscoito Fino'),
	(null,'som livre'),
	(null,'sony music'),
	(null,'Universal'),
	(null,'Emi');

select * from gravadoras;

-- tabela categoria
create table categorias(
	cod_cat	int	not null auto_increment,
	nome_cat varchar(50)	not null,

	constraint pk_cat primary key (cod_cat),
	constraint uq_cat unique (nome_cat)
) ;

desc categorias;

-- dados tabela categoria
insert
	categorias
values
	(null,'mpb'),
	(null,'trilha sonora'),
	(null,'Gospel'),
	(null,'rock nacional');

select * from categorias;

-- tabela titulo
create table titulos(
	cod_tit int auto_increment,
	cod_cat int	not null,
	cod_grav int not null,
	nome_cd varchar(100) not null,
	val_compra decimal(10,2) not null,
	val_cd decimal(10,2) not null,
	qtd_estq int not null,

	constraint pk_tit primary key(cod_tit),
	constraint uq_tit unique(nome_cd),
	constraint fk_tit_1 foreign key(cod_cat) references categorias(cod_cat),
	constraint fk_tit_2 foreign key(cod_grav) references gravadoras(cod_grav),
	constraint ch_tit_1 check(val_cd>=0),
	constraint ch_tit_2 check(qtd_estq>=0)
);

desc titulos;

-- dados tabela titulo
insert
	titulos
values
	(null,1,1,'tribalistas',130.00,150.00,1500),
	(null,1,3,'Acabou Chorare Novos Baianos se Encontram',50.00,200.00,500),
	(null,1,4,'O GRANDE ENCONTRO',60.00,120.00,1000),
	(null,1,2,'Estratosferica',50.00,70.00,2000),
	(null,1,2,'A Caravana',55.00,98.00,500),
	(null,1,4,'Loucura',230.00,300.00,200),
	(null,3,4,'Graça Extraordinária',200.00,250.00,100),
	(null,4,2,'Reza',30.00,130.00,300),
	(null,1,5,'Recanto',40.00,90.00,500),
	(null,1,6,'O Que Você Quer Saber de Verdade',130.00,180.00,500);

select * from titulos;

-- tabela titulo_artista (detalhes do titulo)
create table titulos_artistas(
	cod_tit int not null auto_increment,
	cod_art int not null,

	constraint pk_titart primary key(cod_tit,cod_art),
	constraint fk1_titart foreign key(cod_tit) references titulos(cod_tit),
	constraint fk2_titart foreign key(cod_art) references artistas(cod_art)
);

desc titulos_artistas;

-- dados tabela artista_titulo
insert
	titulos_artistas
values
	(1,1),
	(1,10),
	(1,11),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(2,6),
	(3,7),
	(3,8),
	(3,9),
	(4,14),
	(5,15),
	(6,12),
	(7,13),
	(8,16),
	(9,14),
	(10,1);

select * from titulos_artistas;

-- tabela estado
create table estados (
	sigla_est char(2) not null ,
	nome_est char(50) not null,

	constraint pk_est  primary key(sigla_est),
	constraint uq_est  unique(nome_est)
) ;

desc estados;

-- dados tabela estado
insert
	estados
values
	('sp','são paulo'),
	('mg','minas gerais'),
	('rj','rio de janeiro');

select * from estados;

-- tabela cidade
create table cidades (
	cod_cid	int	not null auto_increment,
	sigla_est char(2) not null,
	nome_cid varchar(100) not null,

	constraint pk_cid primary key (cod_cid),
	constraint fk_cid foreign key (sigla_est) references estados (sigla_est)
);

desc cidades;

-- dados tabela cidade
insert
	cidades
values
	(null,'sp','são paulo'),
	(null,'sp','sorocaba'),
	(null,'sp','jundiaí'),
	(null,'sp','americana'),
	(null,'sp','araraquara'),
	(null,'mg','ouro preto'),
	(null,'rj','cachoeiro do itapemirim');

select * from cidades;

-- tabela cliente
create table clientes (
	cod_cli	int	not null auto_increment,
	cod_cid	int	not null,
	nome_cli varchar(100) not null,
	end_cli	varchar(100) not null,
	renda_cli decimal(10,2)	not null default 0,
	sexo_cli char(1) not null default 'f',

	constraint pk_cli primary key (cod_cli),
	constraint fk_cli foreign key (cod_cid) references cidades (cod_cid),
	constraint ch_cli_1 check (renda_cli>=0),
	constraint ch_cli_2 check(sexo_cli in ('f','m'))
);

desc clientes;

-- dados tabela cliente
insert
	clientes
values
	(null,1,'josé nogueira','rua a',1500.00,'m'),
	(null,1,'angelo pereira','rua b',2000.00,'m'),
	(null,1,'além mar paranhos','rua c',1500.00,'f'),
	(null,1,'catarina souza','rua d',892.00,'f'),
	(null,1,'vagner costa','rua e',950.00,'m'),
	(null,2,'antenor da costa','rua f',1582.00,'m'),
	(null,2,'maria amélia de souza','rua g',1152.02,'f'),
	(null,2,'paulo roberto da silva','rua h',3250.00,'m'),
	(null,3,'fatima de souza','rua i',1632.00,'f'),
	(null,3,'joel da rocha','rua j',2000,'m');

select * from clientes;

-- tabela conjuge
create table conjuges(
	cod_cli	int not null ,
	nome_conj varchar(100) not null,
	renda_conj decimal(10,2) not null default 0,
	sexo_conj char(1) not null default 'm',

	constraint pk_conj primary key (cod_cli),
	constraint fk_conj foreign key (cod_cli) references clientes (cod_cli),
	constraint ch_conj_1 check (renda_conj>=0),
	constraint ch_conj_2 check(sexo_conj in ('f','m'))
);

desc conjuges;

-- dados tabela conjuge
insert
	conjuges
values
	(1,'carla nogueira',2500.00,'f'),
	(2,'emilia pereira',5500.00,'f'),
	(6,'altiva da costa',3000.00,'f'),
	(7,'carlos de souza',3250.00,'m');

select * from conjuges;

-- tabela funcionario
create table funcionarios(
	cod_func int not null auto_increment,
	nome_func varchar(100) not null,
	end_func varchar(200) not null,
	sal_func decimal(10,2) not null  default 0,
	sexo_func char(1)	not null default 'f' ,

	constraint pk_func primary key (cod_func),
	constraint ch_func_1 check (sal_func>=0),
	constraint ch_func_2 check(sexo_func in ('f','m'))
);

desc funcionarios;

-- dados tabela funcionario
insert
	funcionarios
values
	(null,'vânia gabriela pereira','rua a',2500.00,'f'),
	(null,'norberto pereira da silva','rua b',2300.00,'m'),
	(null,'olavo linhares','rua c',2580.00,'m'),
	(null,'paula da silva','rua d',3000.00,'f'),
	(null,'rolando rocha','rua e',2000.00,'m')
;

select * from funcionarios;

-- tabela dependente
create table dependentes(
	cod_dep	int	not null auto_increment,
	cod_func int not null,
	nome_dep varchar(100) not null,
	sexo_dep char(1) not null default 'm',

	constraint pk_dep primary key (cod_dep),
	constraint fk_dep foreign key (cod_func) references funcionarios (cod_func),
	constraint ch_dep check(sexo_dep in ('f','m'))
);

desc dependentes;

-- dados tabela dependente
insert
	dependentes
values
	(null,1,'ana pereira','f'),
	(null,1,'roberto pereira','m'),
	(null,1,'celso pereira','m'),
	(null,3,'brisa linhares','f'),
	(null,3,'mari sol linhares','f'),
	(null,4,'sonia da silva','f')
;

select * from dependentes;

-- tabela pedido
create table pedidos(
	num_ped int not null auto_increment,
	cod_cli int not null,
	cod_func int not null,
	data_ped datetime not null,

	constraint pk_ped primary key(num_ped),
	constraint fk_ped_1 foreign key(cod_cli) references clientes(cod_cli),
	constraint fk_ped_2 foreign key(cod_func) references funcionarios(cod_func)
);

desc pedidos;

-- dados tabela pedido
insert
	pedidos
values
	(null,1,2,'2012/05/02'),
	(null,3,4,'2012/05/02'),
	(null,4,5,'2012/06/02'),
	(null,1,4,'2013/03/02'),
	(null,7,5,'2013/03/02'),
	(null,4,4,'2013/03/02'),
	(null,5,5,'2013/03/02'),
	(null,8,2,'2013/03/02'),
	(null,2,2,'2013/03/02'),
	(null,7,1,'2013/03/02');

select * from pedidos;

-- tabela titulo_pedido (detalhes do pedido)
create table titulos_pedidos(
	num_ped	int not null ,
	cod_tit int not null,
	qtd_cd  int not null,
	val_cd  decimal(10,2) not null,

	constraint pk_titped primary key(num_ped,cod_tit),
	constraint fk_titped_4  foreign key(cod_tit)  references titulos(cod_tit),
	constraint fk_titped_3  foreign key(num_ped) references pedidos(num_ped),
	constraint ch_titped_2  check(qtd_cd>=1),
	constraint ch_titped_3  check(val_cd>=0)
);

desc titulos_pedidos;
-- dados tabela titulo_pedido
insert
	titulos_pedidos
values
	(1,1,2,150.00),
	(1,2,3,200.00),
	(2,1,1,150.00),
	(2,2,3,200.00),
	(3,1,2,150.00),
	(4,2,3,200.00),
	(5,1,2,150.00),
	(6,2,3,200.00),
	(6,3,1,120.00),
	(7,4,2,70.00),
	(8,1,4,150.00),
	(9,2,3,200.00),
	(10,7,2,250.00);

select* from titulos_pedidos;





-- Exercícios com uma tabela e calculos

-- titulos
desc titulos;

-- 	01) TODOS
select * from titulos;

-- 	02) CODIGO 1, 2 OU 3
select * from titulos where cod_tit = 1 or cod_tit = 2 or cod_tit = 3;
select * from titulos where cod_tit in(1,2,3);

select * from titulos where cod_tit >= 1 and cod_tit <= 3;
select * from titulos where cod_tit between 1 and 3;

select * from titulos where cod_tit <= 3;
select * from titulos where cod_tit < 4;

select * from titulos order by cod_tit asc limit 3;
select * from titulos order by cod_tit asc limit 0,3;

-- 	03) CODIGO DIFERENTE DE 2, 6, 9
select * from titulos where cod_tit <> 2 and cod_tit <> 6 and cod_tit <> 9;
select * from titulos where cod_tit not in(2,6,9);

-- 	04) PRECO DE VENDA ENTRE 100 e 150
select * from titulos where val_cd between 100 and 150;

-- 	05) PRECO DE CUSTO MENOR QUE 10
select * from titulos where val_compra < 100;

-- 	06) NOME COMEÇADO POR CONSOANTE
select * from titulos where
	nome_cd not like 'a%' and
	nome_cd not like 'e%' and
	nome_cd not like 'i%' and
	nome_cd not like 'o%' and
	nome_cd not like 'u%';

-- espreções regulares
select * from titulos where nome_cd regexp'^[bcdfghjklmnpqrstvwxyz]'; -- regexp = rlike
select * from titulos where nome_cd not regexp'^[aeiou]'; -- negação "regexp'^[^aeiou]' tbm funciona"

--  07) NOME QUE CONTENHA O TEXTO 'saber'
select * from titulos where nome_cd like '%saber%';

-- 	08) NOME INICIADO COM 'Acabou'	
select * from titulos where nome_cd like 'acabou%';

-- 	09) LUCRO MAIOR QUE 50%
select
	nome_cd as 'Titulo',
    val_compra as 'Valor de Compra',
    val_cd as 'Valor de Venda',
    val_cd - val_compra as 'Lucro em R$',
    round((val_cd - val_compra) * 100 / val_cd, 1) as 'Lucro %',
    round(val_cd * 1.4, 2) as 'Projeção de 40% no valor de venda',
    round(val_compra * 1.5, 2) as 'Projeção de 50% de lucro'
from
	titulos
where
	val_cd > val_compra * 1.5;

select * from titulos where val_cd > val_compra * 1.5;	

-- 	10) LUCRO MENOR QUE 100%
select * from titulos where val_cd < val_compra * 2;

-- 	11) LUCRO MAIOR QUE R$ 100.00
select * from titulos where (val_cd - val_compra) > 100;
       
        
-- Exercícios com agregação e INNER JOIN 
        
-- 12) Qtos titulos existem cadastrados no sistema?
select count(cod_tit) from titulos;

-- 13) Liste todos os titulos no sistema, trazendo a Categoria e a gravadora do mesmo.
select
	nome_cd as 'Titrulo',
    nome_cat as 'Categoria',
    nome_grav as 'Gravadora'
from
	titulos t
join
	categorias ct
on
	t.cod_cat = ct.cod_cat
join
	gravadoras g
on
	t.cod_grav = g.cod_grav
    order by nome_cat, nome_cd;

-- 14) Qual a categoria e valor do titulo mais caro que nós já compramos ?
select
	nome_cd as 'Titrulo',
    nome_cat as 'Categoria',
    val_compra as 'Valor compra' 
from
	titulos t
join
	categorias ct
on
	t.cod_cat = ct.cod_cat
where
	val_compra =(select max(val_compra) from titulos);

-- 15) Qual a Categoria,a gravadora e valor do titulo mais caro que nós já compramos? 
select
	nome_cd as 'Titrulo',
    nome_cat as 'Categoria',
    val_compra as 'Valor compra',
    nome_grav as 'Gravadora'
from
	titulos t
join
	categorias ct
on
	t.cod_cat = ct.cod_cat
join
	gravadoras g
on
	t.cod_grav = g.cod_grav
where
	val_compra =(select max(val_compra) from titulos);

-- 16) Qtos clientes do estado de São Paulo estão cadastrados no sistema? PS: Monte a query de busca pelo nome do estado; e não pelo ID do estado.
select
	nome_cli as 'Cliente',
    nome_cid as 'Cidade',
    nome_est as 'Estado'
from
	clientes cl
join
	cidades cd
on
	cl.cod_cid = cd.cod_cid
join
	estados e
on
	cd.sigla_est = e.sigla_est
where
	nome_est = 'São Paulo';

-- ############################################################
select
	count(cod_cli) as 'Numero de Clientes de São Paulos'
from
	clientes cl
join
	cidades cd
on
	cl.cod_cid = cd.cod_cid
join
	estados e
on
	cd.sigla_est = e.sigla_est
where
	nome_est = 'São Paulo';
        
-- 17) Qto cada funcionario recebeu de comissão em cada venda ? A comissão é de 50% do lucro
select
	nome_func as 'Funcionario',
    p.num_ped as 'Pedido',
    sum((t.val_cd * tp.qtd_cd) - t.val_compra) as 'Lucro',
    round(sum((tp.val_cd * tp.qtd_cd) - t.val_compra)/2,2) as 'Comição'
from
	pedidos p
join
	funcionarios f
on
	p.cod_func = f.cod_func
join
	titulos_pedidos tp
on
	p.num_ped = tp.num_ped
join
	titulos t
on
	tp.cod_tit = t.cod_tit
group by
	 f.nome_func, p.num_ped
;

-- 18) Qto cada funcionario recebeu ao total ?
select
	nome_func as 'Funcionario',
    round(sum((t.val_cd * tp.qtd_cd) - t.val_compra)/2,2) as 'Comição Total'
from
	pedidos p
join
	funcionarios f
on
	p.cod_func = f.cod_func
join
	titulos_pedidos tp
on
	p.num_ped = tp.num_ped
join
	titulos t
on
	tp.cod_tit = t.cod_tit
group by
	 f.nome_func
;


-- Exercícios com JOIN de varias tabelas e OUTER JOIN

-- 	19)	pedidos de funcionario sem filho
select num_ped as 'Pedido',
	nome_func as 'Funcionario',
    nome_dep as 'Dependente'
	from pedidos p
    join funcionarios f on p.cod_func = f.cod_func
    left join dependentes d on f.cod_func = d.cod_func
    where cod_dep is null
    order by num_ped;
    
-- 	20)	pedidos de cliente solteiro
select num_ped as 'Pedido',
	nome_cli as 'Cliente',
    nome_conj as 'Conjuge'
	from conjuges cj
    right join clientes c on cj.cod_cli = c.cod_cli
    join pedidos p on c.cod_cli = p.cod_cli
    where nome_conj is null;

-- 	21)	pedidos de cliente solteiro que comprou 'marisa monte';
-- 	22)	pedidos de 'marisa monte', com nome do funcionario e nome do cliente
-- 	23)	pedidos de mpb, exceto titulo começado com vogal, com nome do funcionario e nome do cliente e com o nome do conjuge e filhos, (se existirem)



-- Exercícios com SUB SELECT

-- 26) Apresente todos os clientes Solteiros 
-- 27) Apresente todos os Clientes Casados 
-- 28) Apresente todas as categorias que estão sem CD 
-- 29) Apresente	apenas os funcionários que tem dependentes e que nunca atenderam a nenhum pedido
-- 30) Mostre todos os funcionários que atenderam a pedidos de clientes casados
-- 31) Apresente os dados dos CDs Mais Caros 


-- Exercícios com GROUP BY

-- 32) Quantos títulos possui cada artista no catálogo ? 
-- 33) Quantos artistas possui cada Gravadora em nosso catálogo ? 
-- 34) Quantos artistas possui cada Gravadora em nosso catálogo e qual o total de artistas ? 
-- 35) Liste todos os pedidos feitos no ano de 2013 e qual o total faturado no ano ? 
-- 36) Liste todos os funcionarios e quantos dependentes cada um deles possui. 

   


-- UNION
-- 37) Todos os pedidos com funcionarios e clientes. Trazer conjuges e dependentes se existirirem.
-- trazer funcionarios e clientes que nunca fizeram um pedido.


-- view
-- 38) Criar view com a consulta anterior 

-- tabela temporaria
-- 39)Criar tabela temporaria view com o resultado da consulta utilizando a view criada na questão anterior.
