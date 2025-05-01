use relacionamentos;

select * from funcionarios;
select * from cargos;
select * from cargos where car_nome = 'Medico';
select car_id from cargos where car_nome = 'Medico';

-- ###################################################

select * from funcionarios where car_id = 1;

select *, 'medico' as 'Cargo' from funcionarios where car_id = (select car_id from cargos where car_nome = 'Medico');

/*
será "QUASE" sempre declarada dentro da clausula where, como condição de filtro da consulta principal

note que se o sub select for executado sozinho - somemte ele - retornara o resultado necessario para a consulta principal

ou seja:
	select car_id from cargos where car_nome = 'Medico' retornará 1
*/

select * from funcionarios order by fun_salario desc limit 1;

select * from funcionarios where fun_salario = (select max(fun_salario) from funcionarios);

-- ###################################################

select
	fun_nome as 'Funcionario',
    fun_salario as 'Salario',
    (fun_salario * 1.2) as 'Previsão 20%'
from funcionarios where car_id = (select car_id from cargos where car_nome = 'Jornalista');

-- ###################################################

update funcionarios set fun_salario = fun_salario * 1.2 where car_id =
	(select car_id from cargos where car_nome = 'Jornalista');

-- ###################################################

delete from funcionarios where car_id = (select car_id from cargos where car_nome = 'Jornalista');

-- ###################################################

select * from funcionarios;

create table funcionarios2 as select * from funcionarios;

desc funcionarios2;

create table funcionarios3 like funcionarios;

desc funcionarios3;

-- ###################################################

select * from funcionarios3;

insert into funcionarios3 (select * from funcionarios);










