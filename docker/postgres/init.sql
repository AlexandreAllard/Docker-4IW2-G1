CREATE DATABASE symfony;

CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    done BOOLEAN
);