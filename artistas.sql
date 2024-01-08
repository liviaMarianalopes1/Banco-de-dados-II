CREATE TABLE artista (
  id_artista SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);
CREATE TABLE musica (
  id_musica SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  ano INT,
  fk_id_artista INT,
  FOREIGN KEY (fk_id_artista) REFERENCES artista (id_artista)
);

INSERT INTO artista (nome)
VALUES
	('Caetano Veloso'),
    ('Tribalistas'),
    ('Tim Maia'),
    ('Cazuza');

INSERT INTO musica (nome, ano, fk_id_artista)
VALUES
	('Sozinho', 1998, 1),
	('Velha Infância', 2002, 2),
	('Marinheiro Só', 1969, 1),
	('Gostava tanto de você', 1973, 3),
	('Brisa do mar', 0, NULL);
    
SELECT artista.id_artista, artista.nome AS artista, musica.nome as nome_musica FROM artista
INNER JOIN musica
ON artista.id_artista = musica.fk_id_artista;

SELECT artista.id_artista, artista.nome AS artista, musica.nome as nome_musica FROM artista
LEFT JOIN musica
ON artista.id_artista = musica.fk_id_artista;

SELECT artista.id_artista, artista.nome AS artista, musica.nome as nome_musica FROM artista
RIGHT JOIN musica
ON artista.id_artista = musica.fk_id_artista;

SELECT artista.id_artista, artista.nome AS artista, musica.nome as nome_musica FROM artista
FULL JOIN musica
ON artista.id_artista = musica.fk_id_artista;
