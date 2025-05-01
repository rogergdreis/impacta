use relacionamentos;

-- RIGTH OUTER JOIN
-- retornará os registros (tupla) que obedeçam a uma regra de relacionamento definida pelo usuario e mais todos os registros da tabela da direita

select * from funcionarios right outer join cargos on cargos.car_id = funcionarios.car_id;

-- OUTER pode ser omitida

select * from funcionarios right join cargos on cargos.car_id = funcionarios.car_id;


select fun_nome as 'Funcionarios',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    right join cargos as c on c.car_id = f.car_id
    ;
    
    
-- Filtrando por cargo
select -- fun_nome as 'Funcionarios',
	-- fun_salario as 'Salário',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    right join cargos as c on c.car_id = f.car_id
    where fun_nome is null
    ;
    
    
