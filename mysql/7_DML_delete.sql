use empresa;
describe clientes;
select * from clientes;

delete from clientes where idCliente = 2;
delete from clientes where nomeCliente = 'João';
delete from clientes where dataNascimento is null;

delete from clientes; -- exclui a tabela inteira *linha por linha*

truncate table clientes; -- exclui a tabela inteira e a recria sem nenhum registro