create database Aromaecor;
use Aromaecor;

create table tbEmpregado(
cod_emp int, 
nome_emp varchar(30),
rua_emp varchar(50),
cidade_emp varchar(15),
fone_emp int,
cod_gerente int
);
describe tbEmpregado;

create table tbTrabalha(
cod_emp int,
cod_companhia int,
salario float
);

create table tbCompanhia(
cod_companhia int,
nome_companhia varchar(20),
cidade_companhia varchar(15)
);

create table tbGerente(
cod_gerente int primary key(cod_gerente),
nome_gerente varchar(20)
);
-- drop database tbempregado;