use empresa;
describe clientes;
select * from clientes;

insert into clientes values
	(null,'Jose Carlos','m','sp','1995-12-03'),
	(null,'Manoel Carlos','m','sp','1998-08-15'),
	(null,'João Antonio','m','rj','1997-05-23'),
	(null,'Antonio Marcos','m','sp','1996-09-16'),
	(null,'Nilvan','m','sc','2002-09-11'),
	(null,'Anastacia','f','sp','2001-07-23'),
	(null,'Manuela','f','sc','1998-09-18'),
	(null,'Vania','f','sp','2001-08-14'),
	(null,'Marian','f','mg','2007-08-28'),
	(null,'João Firmino','m','pr','1998-01-07'),
	(null,'Antonieta','f','mg','2007-06-30'),
	(null,'Stevan','m','sp','1998-05-22'),
	(null,'João Anisio','m','sp','2003-10-06'),
	(null,'Juan','m','sp','2005-03-13'),
	(null,'Mirian','f','mg','2003-12-05'),
	(null,'Tania','f','rj','2000-07-12');

-- DQL - DATA QUERY LANGUAGE - SELECT

-- select simples
select * from clientes;

-- select escolhendo campos
select nomeCliente,dataNascimento from clientes;
select nomeCliente,nomeCliente,dataNascimento from clientes;
select dataNascimento,nomeCliente,nomeCliente from clientes;
select *,dataNascimento from clientes; -- * tem que ser sempre o primeiro na lista

-- select ultilizando apelido para as colunas
select nomeCliente as 'Nome do Cliente', dataNascimento as 'Nascimento' from clientes;

-- select com coluna falsa
select nomeCliente as 'Nome do Cliente', 
	dataNascimento as 'Nascimento', 
    idCliente * 100 as 'Salario',
    'Brasileiro' as 'Nascionalidade'
    from clientes;
    
-- ordenação
-- maior ladrão de performace
select * from clientes order by ufNascimento;
select * from clientes order by ufNascimento, dataNascimento;
select * from clientes order by ufNascimento asc, dataNascimento desc;
select * from clientes order by ufNascimento desc, dataNascimento desc;

select * from clientes order by 4 desc, 5 desc;

select nomeCliente as 'Nome do Cliente', 
	dataNascimento as 'Nascimento', 
    idCliente * 100 as 'Salario',
    'Brasileiro' as 'Nascionalidade'
    from clientes
    order by Nascimento;
    
-- limitando campos
select * from clientes limit 3;  -- 3 primeiras linhas
select * from clientes limit 0,3;  -- 3 primeiras linhas
select * from clientes limit 3,3;  -- 4,5,6
select * from clientes limit 4,6;  -- 5 ao 10

-- CLAUSULA WHERE

-- operadores de comparação
select * from clientes where idCliente = 3;
select * from clientes where ufNascimento = 'rj';

select * from clientes where idCliente <> 3;
select * from clientes where ufNascimento != 'rj';

select * from clientes where idCliente > 10;
select * from clientes where idCliente >= 10;

select * from clientes where idCliente < 10;
select * from clientes where idCliente <= 10;

-- operadores logicos and, or
select * from clientes where idCliente < 10 and ufNascimento != 'sp';
select * from clientes where idCliente < 10 or ufNascimento = 'sp';

-- CLAUSULA BETWEEN
select * from clientes where idCliente >= 5 and idCliente <= 10;
select * from clientes where idCliente between 5 and 10;

select * from clientes where idCliente < 5 or idCliente > 10;
select * from clientes where idCliente not between 5 and 10;

-- CLAUSULA IN
select * from clientes where idCliente = 5 or idCliente = 10 or idCliente = 15;
select * from clientes where idCliente in(5,10,15);

select * from clientes where idCliente != 5 and idCliente != 10 and idCliente != 15;
select * from clientes where idCliente not in(5,10,15);

-- CLAUSULA DISTINCT
select  distinct ufNascimento from clientes;

-- CLAUSUSLA LIKE
select * from clientes where nomeCliente = 'Nilvan';
select * from clientes where nomeCliente like 'Nilvan';
select * from clientes where nomeCliente like 'an%';
select * from clientes where nomeCliente like '%an';
select * from clientes where nomeCliente like '%an%';
select * from clientes where nomeCliente not like '%an%';






