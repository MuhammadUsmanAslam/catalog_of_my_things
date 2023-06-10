
-- Table for movies
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
);

-- Table for sources
CREATE TABLE sources (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) 
)
-- Create the books table by using the following schema

CREATE TABLE IF NOT EXISTS books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  author_id INT REFERENCES author(id)
);

-- Genere Table
CREATE TABLE IF NOT EXISTS genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  items JSONB[]
);

-- Create the labels table by using the following schema
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)

);
-- Table for games
CREATE TABLE games (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE
);

-- Table for authors
CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  nationality VARCHAR(255),
  birth_date DATE,
  bio TEXT
);

