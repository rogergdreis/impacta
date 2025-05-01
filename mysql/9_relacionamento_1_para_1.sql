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

insert funcionarios values(null,'Itamar Assunção','m',2000.69);
insert funcionarios(fun_nome,fun_salario) values('Luis Melodia',3000.00);

select * from funcionarios;

delete from funcionarios where fun_id = 2;
delete from conjuge where fun_id = 2;

create table conjuge(
	conj_id int auto_increment,
    conj_nome varchar(100),
    conj_nasc date,
    fun_id int not null,
    primary key(conj_id),
    foreign key(fun_id) references funcionarios(fun_id),
    unique (fun_id)
);

desc conjuge;

insert conjuge values(null,'Tete Spinola','1990-03-25',2);
insert conjuge values(null,'Zeze Mota','1990-03-25',1);

select * from conjuge;

drop table conjuge;










