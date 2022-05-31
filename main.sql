PRAGMA foreign_keys = ON;

CREATE TABLE items (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	price REAL,
	weight REAL,
	stock INTEGER
);
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	password TEXT,
	email TEXT,
	phone TEXT,
	address TEXT,
	credit_card TEXT
);
CREATE TABLE purchases (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER,
	item_id INTEGER,
	FOREIGN KEY (user_id)
	    REFERENCES users (id)
	        ON UPDATE NO ACTION
	        ON DELETE NO ACTION
	FOREIGN KEY (item_id)
	    REFERENCES items(id)
	        ON UPDATE NO ACTION
	        ON DELETE NO ACTION
);

INSERT INTO items(name) VALUES ("Foo"), ("Bar"), ("Baz");
INSERT INTO users(name) VALUES ("John"), ("Jacob"), ("Jingleheimer"), ("Schmidt");
INSERT INTO purchases(user_id, item_id) VALUES (4, 1), (4, 2), (1, 2), (3, 1), (3, 2), (3, 3), (2, 3);

SELECT * FROM items;
SELECT * FROM users;
SELECT * FROM purchases;

SELECT users.name, items.name FROM purchases
	JOIN users
	ON purchases.user_id = users.id
	JOIN items
	ON purchases.item_id = items.id;
