use cursos;
 
desc cursos;
 
create table cursosVerao like cursos;
 
desc cursosVerao;
alter table cursosVerao rename to cursosFerias;
desc cursosFerias;

alter table cursosFerias add column estacao varchar(20);
alter table cursosFerias add column teste varchar(20) after descricao;
alter table cursosFerias add column teste2 varchar(20) first;

alter table cursosFerias modify teste2 int(5) unsigned zerofill not null;
alter table cursosFerias change teste2  testando int(5) unsigned zerofill not null;

alter table cursosFerias drop column testando;

show tables;
drop table cursosFerias;
drop database cursos;