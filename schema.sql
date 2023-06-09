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
