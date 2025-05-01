use relacionamentos;

select * from funcionarios;

-- ##################################################

select
	fun_nome as 'Funcionarios',
    case fun_sexo
		when 'm' then 'Masculino'
        when 'f' then 'Feminino'
        else 'Não informado'
    end
    as 'Sexo'
from
	funcionarios;

-- ##################################################

select
	fun_nome as 'Funcionario',
    case 
		when car_nome is null then 'Não definido'
		when car_nome is not null then car_nome
    end 
    as 'Cargo'
from
	funcionarios f
    
left join
	cargos c
on
	f.car_id = c.car_id;

-- ##################################################

select
	fun_nome as 'Funcionario',
    case
		when  fun_salario >= 5000 then 'Confidencial'
        when fun_salario < 5000 then fun_salario
        else 'Não informado'
    end
    as 'Salario'
from
	funcionarios;


























