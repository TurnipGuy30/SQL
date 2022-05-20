PRAGMA foreign_keys = ON;

CREATE TABLE items (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	price REAL,
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

INSERT INTO items(name, price, stock) VALUES ("Item 1", 2.5, 7), ("Item 2", 3.7, 13), ("Item 3", 5, 10);
INSERT INTO users(name) VALUES ("Customer 1"), ("Customer 2"), ("Customer 3");
INSERT INTO purchases(user_id, item_id) VALUES (1, 2), (3, 1), (2, 3);

SELECT * FROM items;
SELECT * FROM users;
SELECT * FROM purchases;

SELECT users.name, items.name FROM purchases
	JOIN users
	ON purchases.user_id = users.id
	JOIN items
	ON purchases.item_id = items.id;
