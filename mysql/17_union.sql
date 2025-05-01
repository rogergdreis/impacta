



select fun_nome as 'Funcionarios',
	fun_salario as 'Salário',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    left join cargos as c on c.car_id = f.car_id
    
    union
    
select fun_nome as 'Funcionarios',
	fun_salario as 'Salário',
	car_nome as 'Cargos'
    
    from funcionarios as f 
    right join cargos as c on c.car_id = f.car_id
    ;
    
    /*
    
		-Mesmo número de campos nas duas consultas
        -Mesmo tipo de dados nos campos que serão unidos
        -Apelidos para os campos na primeira consulta
        -Clausula where pode ser ultilizada em qualquer consulta
        -Order by apos a ultima consulta
        -Não ultilizar o nome da coluna para ordenar (usar apelido ou número da coluna)

    */