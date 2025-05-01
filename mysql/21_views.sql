use relacionamentos;

select * from funcionarios;

-- ###############################################

create view v_funcionarios as
	select
		fun_nome as 'Nome',
		fun_sexo as 'Sexo',
		fun_salario as 'Salario',
		car_nome as 'Cargo'
	from
		funcionarios f 
	join
		cargos c
	on
		f.car_id = c.car_id;
        
select * from v_funcionarios;

-- ###############################################

select
	Nome,
    case Sexo
		when 'm' then 'Masculino'
        when 'f' then 'Feminino'
    end
from
	v_funcionarios;
    
-- ###############################################

show databases;
use information_schema;
show tables;
select * from views;
    
-- ###############################################

show create view v_funcionarios;
    
alter view
	v_funcionarios
as
	select
		fun_nome as 'Nome',
        case fun_sexo
			when'm' then 'Masculino'
            when 'f' then 'Feminino'
        end as 'Sexo',
        fun_salario as 'Salario',
        car_nome as 'Cargo'
	from
		funcionarios f
	join
     cargos c
	on
		f.car_id = c.car_id;
        
-- ###############################################

drop view v_funcionarios;

create or replace view
	v_funcionarios
as
	select
		fun_id,
		fun_nome as 'Nome',
        case fun_sexo
			when'm' then 'Masculino'
            when 'f' then 'Feminino'
        end as 'Sexo',
        fun_salario as 'Salario',
        car_nome as 'Cargo'
	from
		funcionarios f
	join
		cargos c
	on
		f.car_id = c.car_id;
    
select * from v_funcionarios;
    
-- ###############################################

create or replace view v_final as
	select 
		fun_id,
		Nome,
        Sexo,
        replace(
			replace(
				replace(
					format(
						Salario
					,2)
				,'.','@')
			,',','.')
		,'@',',')as Salario,
        
        Cargo
    from
		v_funcionarios
;
    
select * from v_final;

-- ###############################################

select * from v_funcionarios;

update
	v_funcionarios
set
	Nome = 'Lucas de Aguas'
where
	fun_id = 4;

-- ###############################################

delete from v_funcionarios where fun_id = 4;

/*
Atualizaveis
	Não será atualizavel(distinct, union, union all, case, subquery em lista de campos).
*/

create table tabela4 as select * from v_funcionarios;

desc tabela4;







    
    
    
    
    
    
    
    
    
    
    
    
    
    