CREATE TABLE items (
	item_id INTEGER PRIMARY KEY,
	name TEXT,
	price FLOAT,
	stock INTEGER
)
CREATE TABLE users (
	user_id INTEGER PRIMARY KEY,
	username TEXT,
	password TEXT,
	email TEXT,
	phone TEXT,
	address TEXT,
	credit_card TEXT
)
CREATE TABLE purchases (
	purchase_id INTEGER PRIMARY KEY,
	user_id INTEGER,
	item_id INTEGER
)
