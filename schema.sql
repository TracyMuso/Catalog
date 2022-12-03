<<<<<<< HEAD
-- Create table called labels
CREATE TABLE labels (
	id INT GENERATED ALWAYS AS IDENTITY,
	title	varchar(50),
	color	varchar(50)
)


-- Create table called books
CREATE TABLE books (
	id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
	publisher	varchar(50), 
	cover_state	varchar(5), 
  publish_date DATE,
  archived BOOLEAN,
  label_id INT,
  CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id),
)
=======
CREATE Table item (
    id INTEGER PRIMARY KEY,
    source_id INTEGER,
    genere_id INTEGER,
    label_id INTEGER,
    author_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (source_id) REFERENCES source(id),
    FOREIGN KEY (genere_id) REFERENCES genere(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
    );
CREATE Table source (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
    );
CREATE Table Movies(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    publish_date DATE,
    silet BOOLEAN,
    FOREIGN KEY (source_id) REFERENCES source(id)
    );

    
>>>>>>> b1039fe30a7a83bbcf800ae76c708d07218a49f7
