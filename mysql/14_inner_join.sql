use relacionamentos;

-- INNER JOIN
-- retornará os registros (tupla) que obedeçam a uma regra de relacionamento definida pelo usuario

select * from funcionarios inner join cargos on cargos.car_id = funcionarios.car_id;

-- INNER pode ser omitida

select * from funcionarios join cargos on cargos.car_id = funcionarios.car_id;

-- AS pode ser omitido 
select * from funcionarios as f join cargos as c on c.car_id = f.car_id;


select fun_nome as 'Funcionarios',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    join cargos as c on c.car_id = f.car_id
    ;
    
    
-- Filtrando por cargo
select fun_nome as 'Funcionarios',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    join cargos as c on c.car_id = f.car_id
    where car_nome = 'Medico'
    ;
    
    
-- Sem usar clausula join
select fun_nome as 'Funcionarios',
	car_nome as 'Cargos'
    
    from funcionarios as f, cargos as c
    where c.car_id = f.car_id
    ;
    
    select fun_nome as 'Funcionarios',
	car_nome as 'Cargos'
    
    from funcionarios as f, cargos as c
    where c.car_id = f.car_id
    and car_nome = 'Medico'
    ;



