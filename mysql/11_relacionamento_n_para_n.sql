create database relacionamentos;
use relacionamentos;

create table funcionarios(
	fun_id int auto_increment,
    fun_nome varchar(100) not null,
    fun_sexo enum('m','f') not null default 'm',
    fun_salario decimal(10,2),
    primary key(fun_id)
);

desc funcionarios;

insert funcionarios(fun_nome,fun_salario) values
	('Luis Melodia',6500.00),
    ('Luis Airao',7850.00),
    ('Luis Tatit',3268.00),
    ('Marcos de Barros',9854.00),
    ('Elton Soares',1234.00),
    ('Milton Cruz',8521.00),
    ('Sandro Bueno',3578.00),
    ('Ivan Narciso',4415.00)
;

select * from funcionarios;

create table treinamentos(
	trei_id int auto_increment,
    trei_nome varchar(100) not null,
    primary key(trei_id)
);

insert treinamentos(trei_nome) values
	('Excell'),
    ('MySql'),
    ('Project')
;

desc treinamentos;
select * from treinamentos;

-- tabela de ligação
create table fun_trei(
	fun_id int,
    trei_id int,
    primary key(fun_id,trei_id),
    foreign key(fun_id) references funcionarios(fun_id),
    foreign key(trei_id) references treinamentos(trei_id)
);

insert fun_trei values
	(1,2),
    (1,3),
    (2,1),
    (2,2),
    (2,3)
;

desc fun_trei;
select * from fun_trei;







