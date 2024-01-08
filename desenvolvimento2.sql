CREATE TABLE artista (
  id_artista SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  visualizacoes INT
);
CREATE TABLE musica (
  id_musica SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  ano INT,
  fk_id_artista INT,
  FOREIGN KEY (fk_id_artista) REFERENCES artista (id_artista)
);

CREATE TABLE lembrete (
  id_lembrete SERIAL PRIMARY KEY,
  mensagem VARCHAR(100), 
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

DELIMITER $$
CREATE TRIGGER inserir_dados
AFTER INSERT
ON artista FOR EACH ROW
BEGIN
  IF NEW visualizacoes IS NULL THEN
    INSERT INTO lembrete(mensagem, fk_id_artista)
    VALUES(CONCAT(Oi',NEW.name', atualize seu número de visualizações),new.id);
  END IF;
END$$
