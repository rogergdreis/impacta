create database db_cds;

use db_cds;


-- tabela artista
create table artistas (
	cod_art		int				not null auto_increment,
	nome_art	varchar(100)	not null,

constraint pk_art primary key (cod_art),
constraint uq_art unique(nome_art)
);

-- dados tabela artista
insert artistas values(null,'marisa monte')
,(null,'Baby do Brasil')
,(null,'Moraes Moreira')
,(null,'Pepeu Gomes')
,(null,'Paulinho Boca de Cantor')
,(null,'Luiz Galvão')
,(null,'Alceu Vaença')
,(null,'Geraldo Azevedo')
,(null,'Elba Ramalho')
,(null,'Carlinhos Brown')
,(null,'Arnaldo Antunes')
,(null,'Adriana Calcanhoto')
,(null,'Aline Barros')
,(null,'Gal Costa')
,(null,'Chico Buarque')
,(null,'Rita lee')
,(null,'Skank')
,(null,'Lulu Santos')
,(null,'Anitta')
;

-- tabela gravadora
create table gravadoras (
cod_grav	int			not null auto_increment,
nome_grav	varchar(50)	not null,

constraint pk_grav primary key (cod_grav),
constraint uq_grav unique (nome_grav)
);


-- dados tabela gravadora
insert gravadoras values(null,'Phonomotor')
,(null,'Biscoito Fino')
,(null,'som livre')
,(null,'sony music')
,(null,'Universal')
,(null,'Emi')
;



-- tabela categoria
create table categorias(
cod_cat		int			not null auto_increment,
nome_cat	varchar(50)	not null,

constraint pk_cat primary key (cod_cat),
constraint uq_cat unique (nome_cat)
) ;

-- dados tabela categoria
insert categorias values(null,'mpb')
,(null,'trilha sonora')
,(null,'Gospel')
,(null,'rock nacional');


-- tabela titulo
create table titulos
(
cod_tit 	int           	 auto_increment,
cod_cat  	int           	not null,
cod_grav 	int           	not null,
nome_cd   	varchar(100)	not null,
val_compra  	decimal(10,2)	not null,
val_cd  	decimal(10,2)	not null,
qtd_estq 	int           	not null,

constraint pk_tit primary key(cod_tit),

constraint uq_tit unique(nome_cd),

constraint fk_tit_1 foreign key(cod_cat) references categorias(cod_cat),

constraint fk_tit_2 foreign key(cod_grav) references gravadoras(cod_grav),

constraint ch_tit_1 check(val_cd>=0),

constraint ch_tit_2 check(qtd_estq>=0)
);




-- dados tabela titulo
insert titulos values(null,1,1,'tribalistas',130.00,150.00,1500)
,(null,1,3,'Acabou Chorare Novos Baianos se Encontram',50.00,200.00,500)
,(null,1,4,'O GRANDE ENCONTRO',60.00,120.00,1000)
,(null,1,2,'Estratosferica',50.00,70.00,2000)
,(null,1,2,'A Caravana',55.00,98.00,500)
,(null,1,4,'Loucura',230.00,300.00,200)
,(null,3,4,'Graça Extraordinária',200.00,250.00,100)
,(null,4,2,'Reza',30.00,130.00,300)
,(null,1,5,'Recanto',40.00,90.00,500)
,(null,1,6,'O Que Você Quer Saber de Verdade',130.00,180.00,500)
;




-- tabela titulo_artista (detalhes do titulo)
create table titulos_artistas
(
cod_tit 	int 	not null auto_increment,
cod_art 	int 	not null,

constraint pk_titart primary key(cod_tit,cod_art),

constraint fk1_titart foreign key(cod_tit) references titulos(cod_tit),

constraint fk2_titart foreign key(cod_art) references artistas(cod_art)
);



-- dados tabela artista_titulo
insert titulos_artistas values(1,1),
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
(10,1)
;



-- tabela estado
create table estados (
sigla_est	char(2)		not null ,
nome_est	char(50)	not null,

constraint pk_est  primary key(sigla_est),
constraint uq_est  unique(nome_est)
) ;



-- dados tabela estado
insert estados values ('sp','são paulo')
, ('mg','minas gerais')
, ('rj','rio de janeiro');


-- tabela cidade
create table cidades (
cod_cid		int				not null auto_increment,
sigla_est	char(2)			not null,
nome_cid	varchar(100)	not null,

constraint pk_cid primary key (cod_cid),
constraint fk_cid foreign key (sigla_est) references estados (sigla_est)
);


-- dados tabela cidade
insert cidades values (null,'sp','são paulo')
,(null,'sp','sorocaba')
,(null,'sp','jundiaí')
,(null,'sp','americana')
,(null,'sp','araraquara')
,(null,'mg','ouro preto')
,(null,'rj','cachoeiro do itapemirim');



-- tabela cliente
create table clientes (
cod_cli	int		not null auto_increment,
cod_cid	int		not null,
nome_cli	varchar(100)	not null,
end_cli	varchar(100)	not null,
renda_cli	decimal(10,2)	not null 	default 0,
sexo_cli	char(1)	not null 	default 'f',

constraint pk_cli primary key (cod_cli),

constraint fk_cli foreign key (cod_cid) references cidades (cod_cid),

constraint ch_cli_1 check (renda_cli>=0),

constraint ch_cli_2 check(sexo_cli in ('f','m'))
);


-- dados tabela cliente
insert clientes values(null,1,'josé nogueira','rua a',1500.00,'m')
,(null,1,'angelo pereira','rua b',2000.00,'m')
,(null,1,'além mar paranhos','rua c',1500.00,'f')
,(null,1,'catarina souza','rua d',892.00,'f')
,(null,1,'vagner costa','rua e',950.00,'m')
,(null,2,'antenor da costa','rua f',1582.00,'m')
,(null,2,'maria amélia de souza','rua g',1152.02,'f')
,(null,2,'paulo roberto da silva','rua h',3250.00,'m')
,(null,3,'fatima de souza','rua i',1632.00,'f')
,(null,3,'joel da rocha','rua j',2000,'m');


-- tabela conjuge
create table conjuges
(
cod_cli	int		not null ,
nome_conj	varchar(100)	not null,
renda_conj	decimal(10,2)	not null 	default 0,
sexo_conj	char(1)	not null 	default 'm',

constraint pk_conj primary key (cod_cli),

constraint fk_conj foreign key (cod_cli) references clientes (cod_cli),

constraint ch_conj_1 check (renda_conj>=0),

constraint ch_conj_2 check(sexo_conj in ('f','m'))
);



-- dados tabela conjuge
insert conjuges values (1,'carla nogueira',2500.00,'f')
,(2,'emilia pereira',5500.00,'f')
,(6,'altiva da costa',3000.00,'f')
,(7,'carlos de souza',3250.00,'m');






-- tabela funcionario
create table funcionarios
(
cod_func	int		not null auto_increment,
nome_func	varchar(100)	not null,
end_func	varchar(200)	not null,
sal_func	decimal(10,2)	not null 	default 0,
sexo_func	char(1)	not null 	default 'f' ,

constraint pk_func primary key (cod_func),

constraint ch_func_1 check (sal_func>=0),

constraint ch_func_2 check(sexo_func in ('f','m'))
);



-- dados tabela funcionario
insert funcionarios values(null,'vânia gabriela pereira','rua a',2500.00,'f')
,(null,'norberto pereira da silva','rua b',2300.00,'m')
,(null,'olavo linhares','rua c',2580.00,'m')
,(null,'paula da silva','rua d',3000.00,'f')
,(null,'rolando rocha','rua e',2000.00,'m');


-- tabela dependente
create table dependentes
(
cod_dep	int		not null auto_increment,
cod_func	int		not null,
nome_dep	varchar(100)	not null,
sexo_dep	char(1)	not null	 default 'm',

constraint pk_dep primary key (cod_dep),

constraint fk_dep foreign key (cod_func) references funcionarios (cod_func),

constraint ch_dep check(sexo_dep in ('f','m'))
);


-- dados tabela dependente
insert dependentes values (null,1,'ana pereira','f')
,(null,1,'roberto pereira','m')
,(null,1,'celso pereira','m')
,(null,3,'brisa linhares','f')
,(null,3,'mari sol linhares','f')
,(null,4,'sonia da silva','f');


-- tabela pedido
create table pedidos
(
num_ped 	int           		not null auto_increment,
cod_cli  	int           		not null,
cod_func 	int           		not null,
data_ped 	datetime	        not null,


constraint pk_ped primary key(num_ped),

constraint fk_ped_1 foreign key(cod_cli) references clientes(cod_cli),

constraint fk_ped_2 foreign key(cod_func) references funcionarios(cod_func)

);



-- dados tabela pedido
insert pedidos values(null,1,2,'2012/05/02')
,(null,3,4,'2012/05/02')
,(null,4,5,'2012/06/02')
,(null,1,4,'2013/03/02')
,(null,7,5,'2013/03/02')
,(null,4,4,'2013/03/02')
,(null,5,5,'2013/03/02')
,(null,8,2,'2013/03/02')
,(null,2,2,'2013/03/02')
,(null,7,1,'2013/03/02');



-- tabela titulo_pedido (detalhes do pedido)
create table titulos_pedidos
(
num_ped	  int		        not null ,
cod_tit 	int 		      not null,
qtd_cd  	int		        not null,
val_cd    decimal(10,2)	not null,

constraint pk_titped    primary key(num_ped,cod_tit),
constraint fk_titped_4  foreign key(cod_tit)  references titulos(cod_tit),
constraint fk_titped_3  foreign key(num_ped) references pedidos(num_ped),
constraint ch_titped_2  check(qtd_cd>=1),
constraint ch_titped_3  check(val_cd>=0) );


-- dados tabela titulo_pedido
insert titulos_pedidos values(1,1,2,150.00)
,(1,2,3,200.00)
,(2,1,1,150.00)
,(2,2,3,200.00)
,(3,1,2,150.00)
,(4,2,3,200.00)
,(5,1,2,150.00)
,(6,2,3,200.00)
,(6,3,1,120.00)
,(7,4,2,70.00)
,(8,1,4,150.00)
,(9,2,3,200.00)
,(10,7,2,250.00);




SELECT * FROM ARTISTAS;
SELECT * FROM GRAVADORAS;
SELECT * FROM CATEGORIAS;
SELECT * FROM ESTADOS;
SELECT * FROM CIDADES;
SELECT * FROM CLIENTES;
SELECT * FROM CONJUGES;
SELECT * FROM FUNCIONARIOS;
SELECT * FROM DEPENDENTES;
SELECT * FROM TITULOS;
SELECT * FROM PEDIDOS;
SELECT * FROM TITULOS_PEDIDOS;
SELECT * FROM TITULOS_ARTISTAS;



-- Exercícios com uma tabela e calculos

-- titulos
desc titulos;
-- 	01) TODOS
select * from titulos;
-- 	02) CODIGO 1, 2 OU 3
select * from titulos where cod_tit = 1 OR cod_tit = 2 OR cod_tit = 3;
select * from titulos where cod_tit in(1,2,3);

select * from titulos where cod_tit >= 1 and  cod_tit <=3;
select * from titulos where cod_tit between 1 and 3;

select * from titulos where cod_tit <= 3; 
select * from titulos where cod_tit < 4; 

select * from titulos order by cod_tit ASC limit 3;
select * from titulos order by cod_tit ASC limit 0,3;

-- 	03) CODIGO DIFERENTE DE 2, 6, 9
select * from titulos where cod_tit <> 2 AND  cod_tit <> 6 AND  cod_tit <> 9;
select * from titulos where cod_tit not in(2,6,9);

-- 	04) PRECO DE VENDA ENTRE 100 E 150
select * from titulos where val_cd between 100 and 150;
select * from titulos where val_cd > 100 and val_cd < 150;
-- 	05) PRECO DE CUSTO MENOR QUE 100
select * from titulos where val_compra < 100;
-- 	06) NOME COMEÇADO POR CONSOANTE
select * from titulos where nome_cd like 'b%' or nome_cd like 'c%' or nome_cd like 'd%'....;
select * from titulos where nome_cd not like 'a%' and 
										nome_cd not like 'e%' and 
										nome_cd not like 'i%' and 
										nome_cd not like 'o%' and 
										nome_cd not like 'u%' ; 

select * from titulos where nome_cd regexp '^[bcdfghjklmnpqrstvxwzy]';
select * from titulos where nome_cd regexp '^[^AEIOU]';
select * from titulos where nome_cd not regexp '^[AEIOU]';

select * from titulos where nome_cd rlike '^[^AEIOU]';
select * from titulos where nome_cd not rlike '^[AEIOU]';

--  07) NOME QUE CONTENHA O TEXTO 'saber'
select * from titulos where nome_cd like '%saber%';
-- 	08) NOME INICIADO COM 'Acabou'	
select * from titulos where nome_cd like 'Acabou%';

-- 	09) LUCRO MAIOR QUE 50%
select	nome_cd as 'Titulo',
			val_compra as 'Valor de Compra',
            val_cd as 'Valor de Venda',
            val_cd - val_compra as 'Lucro em R$',
            round((val_cd - val_compra)*100/val_cd,1) as 'Lucro em %',
            round(val_cd * 1.4 , 2) as 'Projeçao de  40 % no valor de venda',
            round(val_compra * 1.5 , 2) as 'Projeçao de  50 % de lucro'
            from titulos
            where   val_cd > val_compra * 1.5;
            
 select * from titulos where   val_cd > val_compra * 1.5;       
-- 	10) LUCRO MENOR QUE 100%
 select * from titulos where   val_cd < val_compra * 2; 
-- 	11) LUCRO MAIOR QUE R$ 100.00
 select * from titulos where  (val_cd - val_compra) > 100;
       
        
-- Exercícios com agregação e INNER JOIN 
        
-- 12) Qtos titulos existem cadastrados no sistema?
select * from titulos;
select count(*) from titulos;
select count(cod_tit) from titulos;

-- 13) Liste todos os titulos no sistema, trazendo a Categoria e a gravadora do mesmo.
select	
			nome_cat as 'Categoria',
            nome_cd as 'Titulo',
			nome_grav as 'Gravadora'
			from titulos t
            join categorias ct on t.cod_cat = ct.cod_cat
            join gravadoras g on t.cod_grav = g.cod_grav
            order by nome_cat,nome_cd;
-- 14) Qual a categoria e valor do titulo mais caro que nós já compramos ?
select	
			nome_cat as 'Categoria',
            nome_cd as 'Titulo',
            val_compra as 'Valor Compra'
			from titulos t
            join categorias ct on t.cod_cat = ct.cod_cat
            where val_compra = (select max(val_compra) from titulos);
-- 15) Qual a Categoria,a gravadora e valor do titulo mais caro que nós já compramos? 
select	
			nome_cat as 'Categoria',
            nome_cd as 'Titulo',
            val_compra as 'Valor Compra',
            nome_grav as 'Gravadora'
			from titulos t
            join categorias ct on t.cod_cat = ct.cod_cat
            join gravadoras g on t.cod_grav = g.cod_grav
            where val_compra = (select max(val_compra) from titulos);
            
-- 16) Qtos clientes do estado de São Paulo estão cadastrados no sistema? PS: Monte a query de busca pelo nome do estado; e não pelo ID do estado.        
select	nome_cli as 'Cliente',
			nome_cid as 'Cidade',
            nome_est as 'UF'
			from clientes cl
            join cidades cd on cl.cod_cid = cd.cod_cid
            join estados e on cd.sigla_est = e.sigla_est
            where nome_est = 'São Paulo';
            
select	count(cod_cli) as 'Numero de Clientes de São Paulo'
			from clientes cl
            join cidades cd on cl.cod_cid = cd.cod_cid
            join estados e on cd.sigla_est = e.sigla_est
            where nome_est = 'São Paulo';            
-- 17) Qto cada funcionario recebeu de comissão em cada venda ? A comissão é de 50% do lucro
select	nome_func as 'Funcionario',
			p.num_ped as 'Pedido',
            nome_cd as 'Titulo', 
            qtd_cd as 'Numero de cds',
            val_compra as 'Compra',
            tp.val_cd as 'Venda'
			from funcionarios f 
            join pedidos p on f.cod_func = p.cod_func
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit;
            
select	nome_func as 'Funcionario',
			p.num_ped as 'Pedido',
            group_concat(nome_cd) as 'Titulo', 
           sum( round((qtd_cd * (tp.val_cd - val_compra))/2,2)) as 'Comissao do Vendedor'
			from funcionarios f 
            join pedidos p on f.cod_func = p.cod_func
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            group by p.num_ped; 
            
-- 18) Qto cada funcionario recebeu ao total ?
select	nome_func as 'Funcionario',
			group_concat(distinct p.num_ped) as 'Pedidos',
           sum( round((qtd_cd * (tp.val_cd - val_compra))/2,2)) as 'Comissao do Vendedor'
			from funcionarios f 
            join pedidos p on f.cod_func = p.cod_func
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            group by nome_func; 

select	nome_func as 'Funcionario',
			group_concat(distinct p.num_ped) as 'Pedidos',
           sum( round((qtd_cd * (tp.val_cd - val_compra))/2,2)) as 'Comissao do Vendedor'
			from funcionarios f 
            join pedidos p on f.cod_func = p.cod_func
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            group by nome_func
            with rollup; 
            
select	case 
				when nome_func is not null then nome_func
                else 'Total de Comissoes'
			end as 'Funcionario',
            case 
				when nome_func is not null then group_concat(distinct p.num_ped) 
                else '  '
            end as 'Pedidos',
           sum( round((qtd_cd * (tp.val_cd - val_compra))/2,2)) as 'Comissao do Vendedor'
			from funcionarios f 
            join pedidos p on f.cod_func = p.cod_func
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            group by nome_func
            with rollup;      
            
-- Exercícios com JOIN de varias tabelas e OUTER JOIN

-- 	19)	pedidos de funcionario sem filho
select	num_ped as 'Pedido',
			nome_func as 'Funcionario',
            nome_dep as 'Dependente'
			from pedidos p
            join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            where cod_dep is null
            order by num_ped;
-- 	20)	pedidos de cliente solteiro
select 	num_ped as 'Pedido',
			nome_cli as 'Cliente',
            nome_conj as 'Conjuge'
			from conjuges cj 
            right join clientes c on cj.cod_cli = c.cod_cli
			join pedidos p on c.cod_cli = p.cod_cli
            where nome_conj is null
            ;
-- 	21)	pedidos de cliente solteiro que comprou 'marisa monte';
select 	p.num_ped as 'Pedido',
			nome_cli as 'Cliente',
            nome_conj as 'Conjuge',
			nome_art as 'Artista',
            nome_cd as 'Titulo'
			from conjuges cj 
            right join clientes c on cj.cod_cli = c.cod_cli
			join pedidos p on c.cod_cli = p.cod_cli
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            where nome_conj is null
            and nome_art = 'marisa monte'
            ;
-- 	22)	pedidos de 'marisa monte', com nome do funcionario e nome do cliente
select 	p.num_ped as 'Pedido',
			nome_cli as 'Cliente',
           nome_func as 'Funcionario',
			nome_art as 'Artista',
            nome_cd as 'Titulo'
            
			from pedidos p 
			join clientes c on  c.cod_cli = p.cod_cli
            join funcionarios f on p.cod_func = f.cod_func 
            join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            where nome_art = 'marisa monte'
            ;
-- 	23)	pedidos de mpb, exceto titulo começado com vogal, com nome do funcionario e nome do cliente e com o nome do conjuge e filhos, (se existirem)
select	p.num_ped as 'Pedido',
			nome_func as 'Funcionario',
            nome_dep as 'Dependente',
            nome_cli as 'Cliente',
            nome_conj as 'Conjuge',
            nome_cd as 'Titulo'

			from pedidos p
            
            join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            
            join clientes c on p.cod_cli = c.cod_cli
            left join conjuges cj on c.cod_cli = cj.cod_cli
            
			join titulos_pedidos tp on p.num_ped = tp.num_ped
            join titulos t on tp.cod_tit = t.cod_tit
            join categorias ct on t.cod_cat = ct.cod_cat
            
            where nome_cat = 'mpb'
            and nome_cd regexp '^[^aeiou]'
			;

-- Exercícios com SUB SELECT

-- 26) Apresente todos os clientes Solteiros 
select * from clientes where cod_cli not in(select cod_cli from conjuges);

-- 27) Apresente todos os Clientes Casados 
select * from clientes where cod_cli in(select cod_cli from conjuges);


select 	nome_cli as 'Cliente', 
			'Solteiro' as 'Estado Civil' 
            from clientes where cod_cli not in(select cod_cli from conjuges)
union 
select 	nome_cli ,  
			'Casado' 
			from clientes where cod_cli in(select cod_cli from conjuges)
            
            order by Cliente;
-- 28) Apresente todas as categorias que estão sem CD 
select * from categorias where cod_cat not in(select distinct cod_cat from titulos);

-- 29) Apresente	apenas os funcionários que tem dependentes e que nunca atenderam a nenhum pedido
select 	* 
			from funcionarios
            where cod_func in(select distinct cod_func from dependentes)
            and cod_func not in(select distinct cod_func from pedidos)
            ;
            
            
            
-- 30) Mostre todos os funcionários que atenderam a pedidos de clientes casados
select * from funcionarios where cod_func in(
					select distinct cod_func from pedidos where cod_cli in
																		(select cod_cli from conjuges)
																	);
-- 31) Apresente os dados dos CDs Mais Caros 
select * from titulos order by val_cd desc limit 1;

select * from titulos where val_cd = (select max(val_cd) from titulos);

-- Exercícios com GROUP BY

-- 32) Quantos títulos possui cada artista no catálogo ? 
select 	nome_art as 'Arista',
			count(nome_cd) as 'Qtd_Titulos',
            group_concat(nome_cd) as 'Titulos'
			from artistas a 
            left join titulos_artistas ta on a.cod_art = ta.cod_art
            left join titulos t on ta.cod_tit = t.cod_tit
            group by nome_art
            having count(nome_cd) < 2
            order by Qtd_Titulos
            -- order by count(nome_cd)
            ;
-- 33) Quantos artistas possui cada Gravadora em nosso catálogo ? 
select	nome_grav as 'Gravadora',
			count(nome_art) as 'Qtd Artista',
            group_concat(nome_art) as 'Artsita'
			from gravadoras g 
            join titulos t on g.cod_grav = t.cod_grav
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            group by nome_grav
            ;
-- 34) Quantos artistas possui cada Gravadora em nosso catálogo e qual o total de artistas ? 
select	nome_grav as 'Gravadora',
			count(nome_art) as 'Qtd Artista',
            group_concat(nome_art) as 'Artsita'
			from gravadoras g 
            join titulos t on g.cod_grav = t.cod_grav
            join titulos_artistas ta on t.cod_tit = ta.cod_tit
            join artistas a on ta.cod_art = a.cod_art
            group by nome_grav
            with rollup;
-- 35) Liste todos os pedidos feitos no ano de 2013 e qual o total faturado no ano ? 
select 	p.num_ped as 'Pedido',
			qtd_cd * val_cd as 'Valor Pedido'
			from pedidos p
            join titulos_pedidos tp on p.num_ped = tp.num_ped 
            where year(data_ped) = 2012;
 
 select 	case
				when p.num_ped is not null then p.num_ped 
                else 'Total Faturado no Ano'
             end   as 'Pedido',
			sum(qtd_cd * val_cd) as 'Valor Pedido'
			from pedidos p
            join titulos_pedidos tp on p.num_ped = tp.num_ped 
            where year(data_ped) = 2012
            group by p.num_ped
            with rollup;
            
 select 	p.num_ped as 'Pedido',
			sum(qtd_cd * val_cd) as 'Valor Pedido'
			from pedidos p
            join titulos_pedidos tp on p.num_ped = tp.num_ped 
            where year(data_ped) = 2013
            group by p.num_ped
            having sum(qtd_cd * val_cd) > 500
            -- with rollup
 union
	select 	'Total',
			sum(qtd_cd * val_cd) 
			from pedidos p
            join titulos_pedidos tp on p.num_ped = tp.num_ped 
            where year(data_ped) = 2013
            having sum(qtd_cd * val_cd) > 500
            -- with rollup            
            ;    

            
-- 36) Liste todos os funcionarios e quantos dependentes cada um deles possui. 
select	nome_func as 'Funcionarios',
			count(nome_dep) as 'No Dependentes',
            group_concat(nome_dep) as 'Nome Dependentes'
			from funcionarios f
            left join dependentes d on f.cod_func = d.cod_func
            group by nome_func
            order by 2;



-- UNION
-- 37) Todos os pedidos 
-- com funcionarios e clientes. 
-- Trazer conjuges e dependentes se existirirem.
-- trazer funcionarios e clientes que nunca fizeram um pedido.

select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            LEFT join clientes c on p.cod_cli = c.cod_cli -- retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas nao retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
            ;

select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            RIGHT join clientes c on p.cod_cli = c.cod_cli -- não retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas  retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
            ;

-- ##############################################


select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            LEFT join clientes c on p.cod_cli = c.cod_cli -- retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas nao retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
union
select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            RIGHT join clientes c on p.cod_cli = c.cod_cli -- não retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas  retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
            ;






-- view
-- 38) Criar view com a consulta anterior 
create or replace view mostraTudo as
	select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            LEFT join clientes c on p.cod_cli = c.cod_cli -- retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas nao retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
	union
	select	num_ped,
			nome_func,
            nome_dep,
            nome_cli,
            nome_conj
			from pedidos p 
            right join funcionarios f on p.cod_func = f.cod_func
            left join dependentes d on f.cod_func = d.cod_func
            RIGHT join clientes c on p.cod_cli = c.cod_cli -- não retorna o Olavo Linhares - funcionario que nunca fez pedido
            -- mas  retorna os cliente que nunca fizeram pedido
           left  join conjuges cj on c.cod_cli = cj.cod_cli
;


select * from mostratudo;

select * from mostratudo
			where num_ped is null
            and nome_conj is not null;

show databases;
use mysql;
show tables;
use information_schema;
select * from views;

-- tabela temporaria
-- 39)Criar tabela temporaria view com o resultado da consulta utilizando a view criada na questão anterior.
use db_cds;
show tables;

create temporary table temp_mostraTudo as select * from mostratudo; 
desc temp_mostraTudo;
select * from  temp_mostraTudo;

select * from temp_mostratudo
			where num_ped is null
            and nome_conj is not null;

