CREATE DATABASE ${DB_NAME};

DROP TABLE IF EXISTS todo;

CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    done BOOLEAN
);

INSERT INTO todo (id, titre, done) VALUES (1, 'Faire les courses', false);
INSERT INTO todo (id, titre, done) VALUES (2, 'Acheter du pain', true);
INSERT INTO todo (id, titre, done) VALUES (3, 'Acheter du lait', false);
INSERT INTO todo (id, titre, done) VALUES (4, 'Acheter du beurre', false);
INSERT INTO todo (id, titre, done) VALUES (5, 'Acheter des oeufs', true);
INSERT INTO todo (id, titre, done) VALUES (6, 'Acheter des pâtes', false);
INSERT INTO todo (id, titre, done) VALUES (7, 'Acheter du riz', true);
INSERT INTO todo (id, titre, done) VALUES (8, 'Acheter des légumes', false);
INSERT INTO todo (id, titre, done) VALUES (9, 'Acheter des fruits', true);
INSERT INTO todo (id, titre, done) VALUES (10 ,'Acheter de la viande', false);