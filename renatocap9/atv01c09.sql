-- 01
CREATE DATABASE renatocap9;

USE renatocap9;

CREATE TABLE tbNovela(
codNovela INT PRIMARY KEY AUTO_INCREMENT,
nomeNovela VARCHAR(30),
priCap DATE,
ultCap DATE,
horario TIME
);

CREATE TABLE tbAtor(
codAtor INT PRIMARY KEY AUTO_INCREMENT,
nomeAtor VARCHAR(20),
idade INT,
cidade VARCHAR(20),
salAtor DECIMAL,
sexo CHAR(1)
);

CREATE TABLE tbPersonagem(
codPersonagem INT PRIMARY KEY AUTO_INCREMENT,
nomePersonagem VARCHAR(50),
idadePersonagem INT,
sitFinanceira VARCHAR(20),
codAtor INT,
CONSTRAINT fk_codAtor FOREIGN KEY (codAtor) REFERENCES tbAtor (codAtor)
);

CREATE TABLE tbNovelaPersonagem(
codNovela INT,
codPersonagem INT,
CONSTRAINT fk_codNovela FOREIGN KEY (codNovela) REFERENCES tbNovela (codNovela),
CONSTRAINT fk_codPersonagem FOREIGN KEY (codPersonagem) REFERENCES tbPersonagem (codPersonagem)
);

CREATE TABLE tbCapitulos(
codCap INT PRIMARY KEY AUTO_INCREMENT,
nomeCap VARCHAR(50),
dataCap DATE,
codNovela INT,
CONSTRAINT fk_codNovela_tbCapitulos FOREIGN KEY (codNovela) REFERENCES tbNovela (codNovela)
);

-- 02
INSERT INTO tbNovela(nomeNovela, priCap, ultCap, Horario) VALUES('rei do gado', '1996/06/14', '1997/02/14', '20:45'),
('tieta', '1989/07/14', '1990/05/31', '20:00'), ('a viagem', '1994/04/11', '1994/10/21', '19:00');
-- UPDATE tbNovela SET priCap = '1996/06/14', ultCap = '1997/02/14' WHERE codNovela=1; 
-- UPDATE tbNovela SET priCap = '1989/07/14', ultCap = '1990/05/31' WHERE codNovela=2;
-- UPDATE tbNovela SET priCap = '1994/04/11', ultCap = '1994/10/21' WHERE codNovela=3;

INSERT INTO tbAtor(nomeAtor, idade, cidade, salAtor, sexo) 
VALUES ('Antonio Fagundes', 73, 'Sao Paulo', 360000, 'M'), ('Livinia Vlasak', 45, 'Rio de Janeiro', 40000, 'F'), 
('Joana Maria Fomm', 82, 'Belo Horizonte', 80000, 'F'), ('José Mayer', 72, 'Jaguaraçu', 280000, 'M'), 
('Guilherme Fontes', 55, 'Petropolis', 100000, 'M'), ('Christiane Torloni', 65, 'Sao Paulo', 150000, 'F');
-- UPDATE tbAtor SET salAtor = 360000.00 WHERE codAtor = 1;
-- UPDATE tbAtor SET salAtor = 40000.00 WHERE codAtor = 2;
-- UPDATE tbAtor SET salAtor = 80000.00 WHERE codAtor =3;
-- UPDATE tbAtor SET salAtor = 280000.80 WHERE codAtor = 4;
-- UPDATE tbAtor SET salAtor = 150230.50 WHERE codAtor = 5;
-- UPDATE tbAtor SET salAtor = 155000 WHERE codAtor = 6;

INSERT INTO tbPersonagem(nomePersonagem, idadePersonagem, sitFinanceira, codAtor)
VALUES ('Alexandre', 25, 'classe media', 5), ('Dinah', 40, 'classe media', 6), ('Osnar', 35, 'classe media', 4),
('Perpérua', 30, 'classe media', 3), ('Antonia Mezenga', 50, 'classe media alta', 1),
('Lia Mezenga', 23, 'classe media alta', 2), ('Otávio César', 46, 'classe media alta', 1);

INSERT INTO tbNovelaPersonagem(codNovela, codPersonagem)
VALUES (3, 1), (3, 2), (2, 3), (2, 4), (1, 5), (1, 6), (3, 7);

INSERT INTO tbCapitulos(nomeCap, dataCap, codNovela) 
VALUES ('ep1', '1996-06-14', 1), ('ep2', '1996-06-15', 1), ('ep3', '1996-06-16', 1), ('ep4', '1996-06-17', 1),
('ep5', '1996-06-18', 1), ('ep6', '1996-06-19', 1), ('ep7', '1996-06-20', 1), ('ep8', '1996-06-21', 1), 
('ep9', '1996-06-22', 1), ('ep10', '1997-02-14', 1), ('ep1', '1989-07-14', 2), ('ep2', '1989-07-15', 2), 
('ep3', '1989-07-16', 2), ('ep4', '1989-07-17', 2), ('ep5', '1989-07-18', 2), ('ep6', '1989-07-19', 2),
('ep7', '1989-07-20', 2), ('ep8', '1989-07-21', 2), ('ep9', '1989-07-22', 2), ('ep10', '1990-05-31', 2), 
('ep1', '1994-04-11', 3), ('ep2', '1994-04-12', 3), ('ep3', '1994-04-13', 3), ('ep4', '1994-04-14', 3),
('ep5', '1994-04-15', 3), ('ep6', '1994-04-16', 3), ('ep7', '1994-04-17', 3), ('ep8', '1994-04-18', 3),
('ep9', '1994-04-19', 3), ('ep10', '1994-10-21', 3);

-- 03
SELECT ultCap FROM tbNovela WHERE nomeNovela = 'rei do gado';

-- 04
SELECT nomeNovela FROM tbNovela WHERE horario = NULL;

-- 05
SELECT nomeAtor FROM tbAtor WHERE cidade LIKE 'S%'; 

-- 06
SELECT * FROM tbNovela WHERE nomeNovela LIKE '%gado'; 

-- 07
SELECT count(1) AS qntNovelas FROM tbNovela WHERE codNovela IN(
  SELECT pn.codNovela FROM tbNovelaPersonagem AS pn, tbPersonagem AS p, tbAtor AS a 
  WHERE pn.codPersonagem = p.codPersonagem AND p.codAtor = a.codAtor AND a.nomeAtor LIKE 'An%'
); 

-- 08 
SELECT * FROM tbPersonagem ORDER BY nomePersonagem ASC;

-- 09
SELECT * FROM tbPersonagem ORDER BY idadePersonagem DESC;

-- 10
SELECT nomeAtor FROM tbAtor WHERE sexo LIKE 'M';

-- 11
SELECT nomeNovela FROM tbNovela;

-- 12 
SELECT count(1) AS qntCap FROM tbCapitulos WHERE codNovela IN(
  SELECT nomeNovela FROM tbNovela AS n, tbCapitulos AS c 
  WHERE n.codNovela = c.codNovela AND c.nomeCap LIKE 'ep%' 
);


-- 13
SELECT nomeAtor FROM tbAtor WHERE sexo LIKE 'F';

-- 14
SELECT avg(idadePersonagem) AS idadeMedia FROM tbPersonagem;

-- 15
SELECT nomePersonagem AS n, min(idadePersonagem) AS i FROM tbPersonagem AS p GROUP BY n HAVING i < 35;

-- 16 
select * from tbAtor;
select * from tbPersonagem; 
SELECT tbAtor.nomeAtor, tbAtor.idade AS ia, tbPersonagem.idadePersonagem AS ip FROM tbAtor AS ta INNER JOIN tbPersonagem AS tp ON ta.ia = tp.ip; 


-- 17
select * from tbAtor;
SELECT max(salAtor) AS salMaior FROM tbAtor;

-- 18
SELECT min(salAtor) AS salMenor FROM tbAtor; 

-- 19
SELECT sum(salAtor) AS salTotal FROM tbAtor;

-- 20
SELECT  nomeAtor, nomePersonagem AS qntPersonagem FROM tbPersonagem INNER JOIN tbAtor 
ON tbPersonagem.codAtor = tbAtor.codAtor; 

-- 21
select nomeNovela from tbNovela WHERE codNovela IN( 
  select tbCapitulos.codNovela FROM tbCapitulos WHERE tbNovela.codNovela = tbCapitulos.codNovela 
  having sum(nomeCap) < 11
);

-- 22
SELECT nomeAtor FROM tbAtor WHERE codAtor IN(
SELECT codAtor FROM tbPersonagem WHERE codPersonagem IN(
SELECT codPersonagem FROM tbPersonagem) 
);
