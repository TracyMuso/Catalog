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

    