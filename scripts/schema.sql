CREATE DATABASE pizza_sales_db;

USE pizza_sales_db;

CREATE TABLE categories(
	category_id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (category_id)
);

CREATE TABLE ingredients(
	ingredient_id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (ingredient_id)
);

CREATE TABLE orders(
	order_id INT AUTO_INCREMENT,
	date DATE NOT NULL,
	time TIME NOT NULL,
	PRIMARY KEY (order_id)
);

CREATE TABLE pizza_types(
	pizza_type_id VARCHAR(50) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL UNIQUE,
	category_id INT NOT NULL,
	PRIMARY KEY (pizza_type_id),
	FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE pizza_ingredients(
	pizza_type_id VARCHAR(50) NOT NULL,
	ingredient_id INT NOT NULL,
	PRIMARY KEY (pizza_type_id, ingredient_id),
	FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

CREATE TABLE pizzas(
	pizza_id VARCHAR(50) NOT NULL UNIQUE,
	pizza_type_id VARCHAR(50) NOT NULL,
	size ENUM('S', 'M', 'L', 'XL', 'XXL') NOT NULL,
	price DECIMAL(4,2) NOT NULL,
	PRIMARY KEY (pizza_id),
	FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);

CREATE TABLE order_details(
	order_details_id INT AUTO_INCREMENT,
	order_id INT NOT NULL,
	pizza_id VARCHAR(50) NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY (order_details_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);






