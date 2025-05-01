create database if not exists empresa;
use empresa;
create table if not exists clientes(
						idCliente int not null primary key auto_increment,
                        nomeCliente varchar(100) not null,
                        sexoCliente enum('m','f'),
                        ufNascimento char(2),
                        dataNascimento date
                        );
                        
desc clientes;

-- DATA MANIPULATION LANGUAGE
-- INSERT UPDATE DELETE

-- INSERT DECLARATORIO - DECLARO OS CAMPOS QUE RECEBERÃO DADOS

insert into clientes (nomeCliente,sexoCliente,ufNascimento,dataNascimento)
						values
                     ('Alem Mar Paranhos','m','sp','1995-05-30');
                     
insert into clientes (nomeCliente,sexoCliente)
						values
                     ('Suzana Maria', 'f');

insert into clientes (sexoCliente,ufNascimento,nomeCliente)
						values
                     ('m','rj','Antonio Carlos');

insert into clientes (nomeCliente,sexoCliente)
						values
					 ('Suzi Rego','f'),
                     ('Ana Melo','f'),
                     ('Jorge Freitas','m');
                     
-- INSERT POSICIONAL
insert into clientes values
						(null,'Jussara Maria','f','sc','2000-05-21');
                        
insert into clientes values
						(null,'João Carlos','m',null,null);

insert into clientes values
					(null,'Jose Carlos','m','sp','19951203'),
                    (null,'Manoel Carlos','m','sp','1998-08-15'),
                    (null,'João Antonio','m','rj','1997-05-23'),
                    (null,'João Firmino','m','sp','1998-09-18'),
                    (null,'João','m','rj','2000-07-12');
                    
select * from clientes;