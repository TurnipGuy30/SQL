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
		REFERENCES items (id)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
);

INSERT INTO items (name) VALUES ("foo"), ("bar"), ("baz"), ("qux"), ("quux"), ("quuz"), ("corge"), ("grault"), ("garply"), ("waldo"), ("fred"), ("plugh"), ("xyzzy"), ("thud");
INSERT INTO users (name) VALUES ("John"), ("Jacob"), ("Jingleheimer"), ("Schmidt");

INSERT INTO purchases (user_id, item_id) VALUES
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items)),
	((SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM users), (SELECT ABS(RANDOM() % COUNT(name)) + 1 FROM items));

SELECT id "Item ID", name "Item Name" FROM items;
SELECT id "User ID", name "Username" FROM users;
SELECT id "Purchase ID", user_id "User ID", item_id "Item ID" FROM purchases;

SELECT users.name "User", items.name "Item" FROM purchases
	JOIN users
	ON purchases.user_id = users.id
	JOIN items
	ON purchases.item_id = items.id;
