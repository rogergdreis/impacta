create database relacionamentos;
use relacionamentos;
drop database relacionamentos;

create table funcionarios(
	fun_id int auto_increment,
    fun_nome varchar(100) not null,
    fun_sexo enum('m','f') not null default 'm',
    fun_salario decimal(10,2),
    car_id int,
    primary key(fun_id),
    foreign key(car_id)references cargos(car_id)
);

desc funcionarios;

insert funcionarios(fun_nome,fun_salario, car_id) values
	('Luis Melodia', 6500.00, 2),
    ('Luis Airao', 7850.00, 4),
    ('Luis Tatit', 3268.00, 2),
    ('Marcos de Barros', 9854.00, 1),
    ('Elton Soares', 1234.00, 2),
    ('Milton Cruz', 8521.00, 1),
    ('Sandro Bueno', 3578.00, 2),
    ('Ivan Narciso', 4415.00, 4),
    ('Luan Souza', 4415.00, null),
    ('Mari Mariana',4415.00, 4),
    ('Mauricio Souares', 4415.00, 1),
    ('Luis Ricardo', 4415.00, 2),
    ('Marilia Mendonça', 4415.00, null),
    ('Lia Melo', 4415.00, 4),
    ('Alexandre Paixão', 4415.00, 1),
    ('Lia Andrade', 4415.00, 2),
    ('Walmir Belisario', 4415.00, 1),
    ('Rodrigo Rodrigus', 4415.00, null),
    ('Ricardo Selmo', 4415.00, 4),
    ('Berenice Merlin', 4415.00, 4)
;

select * from funcionarios;

create table cargos(
	car_id int auto_increment,
    car_nome varchar(100),
    primary key(car_id)
);

insert cargos(car_nome) values
	('Medico'),
    ('Jornalista'),
    ('Arquiteto'),
    ('Radialista')
;

desc cargos;
select * from cargos;

















