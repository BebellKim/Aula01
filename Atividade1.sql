create database bd_exporta;
use bd_exporta;

create table departamento (
id int primary key auto_increment,
nome varchar(100),
localizacao varchar(50),
orcamento decimal (10,2)
);


insert into departamento (nome,localizacao,orcamento)
 values ("Giovana","SESI",10000),
	    ("Maria","SENAI",17000),
        ("Elias","SHOPPING",20000),
        ("Lucas","CASA",10000),
        ("Isabella","UBER",10000),
        ("Guhneli","FESTA",30000);



SHOW VARIABLES LIKE 'secure_file_priv';


select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

SET SQL_SAFE_UPDATES=0;

delete from departamento; 

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

start transaction;

-- Aumentar o orcamento do departamento do ti em 1000
update departamento set orcamento = orcamento + 1000.0 where nome = 'TI';

-- Aumentar o orcamento do departamento do financiero em 1000
update departamento set orcamento = orcamento + 1000.0 where nome = 'Financeiro';

-- confirmar a tranação
commit;



