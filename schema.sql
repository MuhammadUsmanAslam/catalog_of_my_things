
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
-- Create the books table by using the following schema

CREATE TABLE books (
  id INT PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Create the labels table by using the following schema
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)

);