/* Criação da DB */

CREATE DATABASE yugiohCards;

CREATE TABLE duelist (
	id_duelista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (30) NOT NULL,
    senha VARCHAR(7) NOT NULL
);

CREATE TABLE card (
	id_card INT AUTO_INCREMENT PRIMARY KEY,
    cardname VARCHAR(50) NOT NULL,
    tipo ENUM('Monstro', 'Magia', 'Armadilha') NOT NULL,
    imagem_url VARCHAR(300)
);

CREATE TABLE colection (
	id_collection INT AUTO_INCREMENT PRIMARY KEY,
    id_duelista INT NOT NULL,
    nome VARCHAR (30) NOT NULL,
    FOREIGN KEY (id_duelista) REFERENCES duelist(id_duelista)
);

CREATE TABLE card_colection (
	id_card INT NOT NULL,
    id_collection INT NOT NULL,
    PRIMARY KEY (id_card, id_collection),
    FOREIGN KEY (id_card) REFERENCES card(id_card),
    FOREIGN KEY (id_collection) REFERENCES colection(id_collection)
);

/* POVOAMENTO */

INSERT INTO duelist (nome, senha) VALUES
('Seto Kaiba', 'blue'),
('Ishizu Ishitar', 'grave');

INSERT INTO colection (id_duelista, nome) VALUES
(1, 'Coleção de Seto Kaiba'),
(2, 'Coleção de Ishizu Ishitar');

INSERT INTO card (cardname, tipo, imagem_url) VALUES
('Blue Eyes White Dragon', 'Monstro', 'https://br.pinterest.com/pin/blueeyes-white-dragon-the-dark-side-of-dimension-by-yugimaster-on-deviantart--808114726907910184/'),
('Necrovalley', 'Magia', 'https://www.deviantart.com/akizaizinski01/art/Necrovalley-876321108');

INSERT INTO card_colection (id_card, id_collection) VALUES
(1, 1),
(2, 2);

/* Consultas SQL */

SELECT * FROM duelist;
/*
+-------------+---------------+-------+
| id_duelista | nome          | senha |
+-------------+---------------+-------+
| 1           | Seto Kaiba    | blue  |
| 2           | Ishizu Ishitar| grave |
+-------------+---------------+-------+
*/

SELECT * FROM card;
/*
+---------+------------------------+---------+------------------------------------------------------+
| id_card | cardname               | tipo    | imagem_url                                           |
+---------+------------------------+---------+------------------------------------------------------+
| 1       | Blue Eyes White Dragon | Monstro | 'URL do Blue Eyes'                                   |
| 2       | Necrovalley            | Magia   |'URL do Necrovalley'                                  |
+---------+------------------------+---------+------------------------------------------------------+
*/

SELECT * FROM colection;
/*
+--------------+-------------+--------------------------+
| id_collection| id_duelista | nome                     |
+--------------+-------------+--------------------------+
| 1            | 1           | Coleção de Seto Kaiba    |
| 2            | 2           | Coleção de Ishizu Ishitar|
+--------------+-------------+--------------------------+
*/

SELECT c.id_collection, c.nome AS nome_colecao, ca.id_card, ca.cardname, ca.tipo
FROM colection c
JOIN card_colection cc ON c.id_collection = cc.id_collection
JOIN card ca ON cc.id_card = ca.id_card;
/*
+--------------+--------------------------+---------+------------------------+---------+
| id_collection| nome_colecao             | id_card | cardname               | tipo    |
+--------------+--------------------------+---------+------------------------+---------+
| 1            | Coleção de Seto Kaiba    | 1       | Blue Eyes White Dragon | Monstro |
| 1            | Coleção de Seto Kaiba    | 2       | Necrovalley            | Magia   |
| 2            | Coleção de Ishizu Ishitar| 2       | Necrovalley            | Magia   |
+--------------+--------------------------+---------+------------------------+---------+
*/