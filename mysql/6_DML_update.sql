use empresa;
describe clientes;
select * from clientes;

update clientes 
			set
            dataNascimento = '2001-07-12',
            ufNascimento = 'pr'
            where idCliente = 13;
            
update clientes 
			set
            ufNascimento = 'mg'
            where ufNascimento is null;
            
