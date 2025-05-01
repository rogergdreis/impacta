create table cursos(
					idCurso int not null,
                    nomeCurso varchar(65) not null,
                    descricao text,
                    cargaHoraria int unsigned,
                    dataInicio date
                    );
                    
describe cursos;
explain cursos;
desc cursos;