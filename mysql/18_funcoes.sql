select round(123321.8698);
select round(123321.8698,2);

select cast(123321.8698 as char);

-- #######################################################

select cast(round(123321.8698,2) as char);

select cast(
	round(123321.8698,2)
as char);

-- #######################################################

select concat('10',' e ', '20');

select concat(10, ' e ', '20');

select concat(cast(10 as char), ' e ', '20');

select concat(
	cast(
		10 as char
	), 
    ' e ', '20');
    
/*
	https://dev.mysql.com/doc/refman/8.4/en/cast-functions.html
*/

-- #######################################################

select replace('MySql não é legal', 'não é', 'é muito');

select concat('R$ ', -- concatenar caracteres
	replace( -- logalizar e substituir
		cast( -- transformar em string
			round( -- arredondar
				23564.6847
			,2)
		as char),
	'.',',')
) as 'Preço';

-- ########################################################

select ('Impacta Online');
select right('Impacta Online', 6); -- 6 digitos da direita para a esquerda
select left('Impacta Online', 7); -- 7 digitos da esquerda para a direita

select substring('Impacta Online', 9); -- 9 digitos da esquerda para direita
select substring('Impacta Online', -6); -- 6 digitos da direita para esquerda
select substring('Impacta Online', 9, 2); -- 9 digitos da esquerda para direita só 2 digitos

select trim('                     Impacta                  ')as oi; -- remove espaços em branco
select ltrim('                     Impacta                  ')as oi; -- remove espaços em branco somente da esquerda
select rtrim('                     Impacta                  ')as oi; -- remove espaços em branco  somente da direita

select upper('ImPaCtA'); -- tudo em maiusculo [ucase]
select lower('ImPaCtA'); -- tudo em minusculo [lcase]

-- ########################################################

use empresa;

select lcase(nomeCliente), lcase(ufNascimento) from clientes;
update clientes set ufNascimento = ucase(ufNascimento);

select * from clientes;

/*
	strings
	https://dev.mysql.com/doc/refman/8.4/en/string-functions.html

	data
	https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
*/

-- ########################################################

select date_format(now(),'%d/%m/%Y');

select date_format(dataNascimento,'%d/%m/%Y') as 'Nascimento' from clientes;
select year(dataNascimento) as 'Nascimento' from clientes;
select * from clientes where year(dataNascimento) >= 2000 and month(dataNascimento) = 10;

-- ########################################################

use relacionamentos;
select * from funcionarios;

select max(fun_salario) from funcionarios; -- maior valor
select min(fun_salario) from funcionarios; -- menor valor

-- ########################################################

select * from funcionarios;
select sum(fun_salario) from funcionarios; -- soma todos os valores da coluna

select * from cargos;
select group_concat(car_nome) from cargos; -- agrupa todos os nomes da coluna

-- ########################################################

select count(fun_nome) from funcionarios;
select count(car_id) from funcionarios;
select count(*) from funcionarios;
select count(fun_id) from funcionarios;
select * from funcionarios;

select count(fun_salario), sum(fun_salario), avg(fun_salario) from funcionarios;

-- ########################################################

-- TOTALIZAÇÃO DE DADOS

select * from funcionarios;

-- ########################################################

select
	count(fun_nome),
    car_id
from
	funcionarios
group by
	car_id
with rollup;

-- ########################################################

select
    c.car_nome as Categoria,
    group_concat(f.fun_nome) as Funcionario,
    sum(f.fun_salario) as Salario
from
    funcionarios f
left join
    cargos c on f.car_id = c.car_id
group by
    c.car_nome
with rollup;

-- ########################################################

select
    c.car_nome as Categoria,
    group_concat(f.fun_nome) as Funcionario,
    sum(f.fun_salario) as Salario
from
    funcionarios f
left join
    cargos c on f.car_id = c.car_id
group by
    c.car_nome
union
select
	'Total',
    '------------------------------------------',
    sum(f.fun_salario)
from
	funcionarios f;

-- ########################################################

select
    c.car_nome as Categoria,
    group_concat(f.fun_nome) as Funcionario,
    sum(f.fun_salario) as Salario
from
    funcionarios f
left join
    cargos c on f.car_id = c.car_id
group by
    c.car_nome
having sum(f.fun_salario) > 30000;





































