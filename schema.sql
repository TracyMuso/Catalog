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
