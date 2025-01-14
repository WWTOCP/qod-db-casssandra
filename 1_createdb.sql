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

CREATE TABLE quotes (
  quote_id serial NOT NULL, -- 'serial' will increment by 1 in postgres, cockroachdb will create a INT8 NOT NULL DEFAULT unique_rowid()
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  quote VARCHAR(1024),
  CONSTRAINT quote_pk PRIMARY KEY (quote_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
