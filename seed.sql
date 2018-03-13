DROP TABLE IF EXISTS book;

CREATE TABLE book (

 id SERIAL PRIMARY KEY,
 title VARCHAR(255),
 body TEXT

);

INSERT INTO book (title , body) VALUES ("Book 1" , "Body text 1");
INSERT INTO book (title , body) VALUES ("Book 2" , "Body text 2");
INSERT INTO book (title , body) VALUES ("Book 3" , "Body text 3");
INSERT INTO book (title , body) VALUES ("Book 4" , "Body text 4");