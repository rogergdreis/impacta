/*
	Tipos de Tabelas - tabela temporaria
*/

use relaciomentos;

select * from v_funcionarios;

desc funcionarios;

create temporary table funcionarios_temp like funcionarios;

desc funcionarios_temp;

show tables;

-- #############################################################

create temporary table temp as select * from v_funcionarios;

select * from temp;

select * from temp where cargo = 'Radialista';

drop temporary table temp;


/*
	Tipos de Tabelas - tabela recursiva
*/

create table recursiva(
	rec_id int primary key auto_increment,
    rec_nome varchar(100) not null,
    rec_desc varchar(6000) not null,
    rec_date timestamp not null default current_timestamp ON UPDATE current_timestamp,
    rec_sementes int,
    rec_anterior int,
    
    foreign key(rec_anterior) references recursiva(rec_id)
);

desc recursiva;

-- #############################################################

insert into recursiva (
	rec_nome,
    rec_desc,
    rec_sementes
)
values
	('Perobas', 'no no no no no no noooo', 100),
	('Ipe', 'bla bla bla bla bla blaaaa', 200),
	('Rosas', 'bleeee bleeeee bleeee', 300)
    
;

select * from recursiva;

-- #############################################################

insert into recursiva (
	rec_nome,
    rec_desc,
    rec_sementes,
    rec_anterior
)
values
	('Perobas 2', 'no no no no no no noooo', 25, 1),
	('Perobas 3', 'no no no no no no noooo', 25, 1),
	('Perobas 4', 'no no no no no no noooo', 25, 1)
;

-- #############################################################

insert into recursiva (
	rec_nome,
    rec_desc,
    rec_sementes,
    rec_anterior
)
values
	('Perobas 2.1', 'no no no no no no noooo', 12, 4)
;

/*
	Tipos de Tabelas - transações
*/

SET autocommit = 1;

start transaction;

select * from funcionarios;

update funcionarios set fun_salario = fun_salario * 1.2;

rollback;


















