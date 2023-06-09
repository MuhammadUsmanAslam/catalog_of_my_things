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