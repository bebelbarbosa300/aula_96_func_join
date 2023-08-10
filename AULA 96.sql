CREATE DATABASE senai_tech;

USE senai_tech;

CREATE TABLE departamentos (
id INT,
nome VARCHAR (60),
PRIMARY KEY (id)
);

CREATE TABLE funcionarios (
id INT,
nome VARCHAR (60),
sobrenome VARCHAR (60),
salario DECIMAL (10,2),
id_departamento INT,
PRIMARY KEY (id),
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id)
);


-- -- LISTAR O NOME E O SOBRENOME E O NOME DO DEPARTAMENTO DOS FUNCIONARIOS 

select f.nome, f.sobrenome,d.nome as nome_departamento
from funcionarios f 
inner join departamentos d 
on f.id_departamento = d.id;


-- LISTAR O NOME E O SOBRENOME E O NOME DO DEPARTAMENTO DOS FUNCIONARIOS DE TI 

select f.nome,f.sobrenome, d.nome as nome_departamento
from funcionarios f 
inner join departamentos d 
on f.id_departamento = d.id
where d.nome = 'ti';


-- LISTAR O NOME E O SOBRENOME E O NOME DO DEPARTAMENTO DOS FUNCIONARIOS DE TI ORDENADO PELO NOME 
select f.nome, f.sobrenome, d.nome as nome_departamento 
from funcionarios f
inner join departamentos d 
on f.id_departamento = d.id
where d.nome = 'ti'
order by f.nome;
 
 
 -- LISTAR O NOME, E O SOBRENOME, SALARIO, E O NOME DO DERPARTAMENTO DOS FUNCIONARIOS DE TI QUE RECEBEM ACIMA DE 5000 
select f.nome, f.sobrenome, f.salario, d.nome as nome_departamento
from funcionarios f 
inner join departamentos d 
on f.id_departamento = d.id 
where d.nome = 'ti' and f.salario > 5000
order by f.nome;


-- CALCULAR A MEDIA SALARIAL DOS FUNCIONARIOS EM CADA DEPARTAMENTO 
select d.nome, avg(f.salario) as media_salarial 
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id 
group by d.id;


-- MOSTRAR O NOME COMPLETO JUNTANTO O NOME E SOBRENOME DOS FUNCIONARIOS  
select concat(f.nome, ' ', f.sobrenome) as nome_completo
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id
where d.nome = 'ti';   


-- CALCULAR A SOMA TOTAL DOS SALARIOS DE TODOS OS FUNCIONARIOS NE DEPARTAMENTO DE RECURSOS HUMANOS 
select d.nome, sum(f.salario) as folha_salarial
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id
where d.nome = 'recursoso humanos';   


-- CONTAR QUANTOS FUNCIONARIOS CADA DEPARTAMENTO POSSUI
   select d.nome, count(*) as numero_funcionarios
from funcionarios f 
inner join departamentos d on f.id_departamento = d.id
group by d.id;


-- LISTAR OS FUNCIONARIOS QUE GANHAM MAIS DE 7000 EM ORDEM ALFABETICA
select nome, sobrenome, salario 
from funcionarios 
where salario > 7000
order by nome;


-- MOSTRAR O NOME DO DEPARTAMENTO E A MEDIA DE SALARIO DOS FUNCIONARIOS DE CADA DEPARTAMENTO 
select d.nome, avg(f.salario) as media_salarial
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
group by d.id;


-- MOSTRAR OS FUNCIONARIOS QUE TEM SOBRENOME "MATISSE" E SEUS RESPECTIVOS DEPARTAMENTOS 
select concat (f.nome, ' ', f.sobrenome) as soma_completo, d.nome
from funcionarios f
inner join departamentos d on f.id_departamento = d.id
where f.sobrenome = 'matisse';







