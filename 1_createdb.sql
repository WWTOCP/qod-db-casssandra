CREATE DATABASE IF NOT EXISTS qod;

USE qod;

CREATE TABLE authors (
  author_id INT NOT NULL,
  author VARCHAR(100),
  CONSTRAINT author_pk PRIMARY KEY (author_id)
);

CREATE TABLE genres (
  genre_id INT NOT NULL,
  genre VARCHAR(100),
  CONSTRAINT genre_pk PRIMARY KEY (genre_id)
);

CREATE SEQUENCE quotes_quote_id_sequence START WITH 1 INCREMENT BY 1;
-- cockroachdb says this about a sequence when creating the table:
-- using sequential values in a primary key does not perform as well as using random UUIDs. See https://www.cockroachlabs.com/docs/v24.3/serial.html

CREATE TABLE quotes (
  -- 'serial' will increment by 1 in postgres, cockroachdb will create a INT8 NOT NULL DEFAULT unique_rowid()
  -- therefore, with cockroachdb, I decided to use a manually defined sequence.
  quote_id INT NOT NULL DEFAULT nextval('quotes_quote_id_sequence'), 
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  quote VARCHAR(1024),
  CONSTRAINT quote_pk PRIMARY KEY (quote_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
