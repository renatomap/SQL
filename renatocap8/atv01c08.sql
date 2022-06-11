-- 01
CREATE DATABASE renatocap8;
USE renatocap8;

CREATE TABLE tbSala(
numeroSala INT PRIMARY KEY AUTO_INCREMENT,
descricaoSala VARCHAR(20),
capacidade INT
);
DESCRIBE tbSala;
SELECT * FROM tbSala;

CREATE TABLE tbDiretor(
codDiretor INT PRIMARY KEY AUTO_INCREMENT,
nomeDiretor VARCHAR(20)
);
SELECT * FROM tbDiretor;
DESCRIBE tbDiretor;

CREATE TABLE tbFilme(
codFilme INT PRIMARY KEY AUTO_INCREMENT,
nomeFilme VARCHAR(50), 
anoLancamento INT,
catFilme VARCHAR(20),
codDiretor INT,
CONSTRAINT fk_codDiretor FOREIGN KEY (codDiretor) REFERENCES tbDiretor (codDiretor)
);
DESCRIBE tbFilme;
SELECT * FROM tbFilme;

CREATE TABLE tbSalaFilme(
numeroSala INT,
codFilme INT ,
dataFilme DATE PRIMARY KEY,
horario TIME,
CONSTRAINT fk_numeroSala FOREIGN KEY (numeroSala) REFERENCES tbSala (numeroSala),
CONSTRAINT fk_codFilme FOREIGN KEY (codFilme) REFERENCES tbFilme (codFilme)
);

CREATE TABLE tbPremio(
codPremio INT PRIMARY KEY AUTO_INCREMENT,
nomePremio VARCHAR(20),
anoPremiacao INT,
codFilme INT,
CONSTRAINT fk_codFime FOREIGN KEY (codFilme) REFERENCES tbFilme (codFilme)
);
describe tbPremio;
select * from tbPremio;

-- 02
INSERT INTO tbSala(descricaoSala, capacidade) VALUES('Sala01', 40), ('Sala02', 50), ('Sala03', 60);
INSERT INTO tbDiretor(nomeDiretor) VALUES ('quentin tarantino'), ('steven spielberg'), ('walter salles');
INSERT INTO tbFilme(nomeFilme, anoLancamento, catFilme) VALUES ('django livre', 2012, 'faroeste'), 
('jurassic park', 1994, 'ficcao cientifica'), ('central do brasil', 1998, 'drama');
INSERT INTO tbSalaFilme(dataFilme, horario) VALUES ('2022-05-20', '18:00:00'), ('2022-06-20', '20:00:00');
INSERT INTO tbPremio(nomePremio, anoPremiacao) VALUES ('mtv movie award', 2013), ('oscar efeito visual', 1994);

-- 03
SELECT nomeDiretor FROM tbDiretor;

-- 04
SELECT nomeFilme FROM tbFilme WHERE catFilme = 'ficcao cientifica';

-- 05
UPDATE tbSala SET capacidade = 200 WHERE numeroSala = 1;

-- 06 
UPDATE tbSalaFilme SET numeroSala = 1 WHERE numeroSala = 3 AND dataFilme = '2015-11-15';

-- 07 
DELETE FROM tbDiretor WHERE nomeDiretor = 'walter salles';

-- 08 
SELECT tbFilme.nomeFilme FROM tbFilme INNER JOIN tbDiretor ON tbFilme.codFilme = tbDiretor.codDiretor 
WHERE nomeDiretor = 'steven spielberg';

-- 09 
SELECT tbFilme.nomeFilme FROM tbFilme INNER JOIN tbSalaFilme ON tbFilme.codFilme = tbFilme.codFilme 
WHERE tbSalaFilme.dataFilme = '2022-05-20'; 

-- 10 
SELECT tbPremio.codPremio FROM tbPremio INNER JOIN tbFilme ON tbFilme.codFilme = tbPremio.codPremio 
WHERE tbFilme.nomeFilme = 'jurassic park';

-- 11 
SELECT tbFilme.nomeFilme FROM tbFilme INNER JOIN tbSala ON tbSala.numeroSala = tbFilme.codFilme 
WHERE tbSala.capacidade > 200;

-- 12 
SELECT tbFilme.nomeFilme, tbSalaFilme.numeroSala, tbSalaFilme.horario FROM tbFilme INNER JOIN tbSalaFilme 
WHERE tbSalaFilme.dataFilme = '2022-05-20';

-- 13 
SELECT tbFilme.nomeFilme, tbPremio.nomePremio FROM tbFilme INNER JOIN tbPremio 
WHERE tbPremio.anoPremiacao > 2000;

-- 14 
SELECT tbFilme.nomeFilme FROM tbFilme where tbFilme.anoLancamento = '1994';

-- 15 Faça uma consulta que retorne a descrição da sala, a categoria e o nome dos filmes que foram dirigidos pelo diretor “quentin tarantino”.
SELECT tbSala.descricaoSala, tbFilme.catFilme, tbFilme.nomeFilme FROM tbSala INNER JOIN tbSalaFilme ON tbSala.numeroSala = tbSalaFilme.numeroSala WHERE tbDiretor.nomeDiretor = 'quentin tarantino';