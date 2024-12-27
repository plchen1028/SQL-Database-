CREATE TABLE customer(
id int NOT NULL PRIMARY KEY,
username varchar(20),
passcode varchar(20),
first_name varchar (50),
last_name varchar(50),
phone_number int(40)
);

CREATE TABLE shopping_session(
shopping_session_id INT NOT NULL PRIMARY KEY,
user_id int,
session_create_date timestamp,
FOREIGN KEY (user_id)
REFERENCES customer(id), 
);

CREATE TABLE user_address(
address_id int,
user_id int,
address_line varchar(50),
city varchar(50),
zip_code varchar(50),
country varchar(50),
phone_number varchar(50),
FOREIGN KEY(user_id)
REFERENCES customer(id)
);



CREATE TABLE product_category (
category_id int NOT NULL PRIMARY KEY,
category_name varchar (50)
);


CREATE TABLE product_inventory(
inventory_id int NOT NULL PRIMARY KEY,
count int
);

CREATE TABLE product(
id int not null primary key,
product_name varchar(50),
category_id int,
inventory_id int,
price decimal,
FOREIGN KEY (category_id) 
REFERENCES product_category (category_id),
FOREIGN KEY (inventory_id) 
REFERENCES product_inventory (inventory_id)
);

CREATE TABLE payment (
payment_id int not null primary key,
amount decimal,
bank_provider varchar(50),
created_at timestamp,
modified_at timestamp
);

CREATE TABLE order_details (
order_details_id int NOT NULL PRIMARY KEY,
user_id int,
total decimal,
payment_id int,
order_date timestamp,
FOREIGN KEY (user_id) 
REFERENCES customer (id),
FOREIGN KEY (payment_id)
REFERENCES payment(payment_id)
);

CREATE TABLE order_items (
order_items_id int NOT NULL PRIMARY KEY,
order_id int,
product_id int,
quantity int,
FOREIGN KEY (order_id) 
REFERENCES order_details (order_details_id),
FOREIGN KEY(product_id)
REFERENCES 	product(id)
);

CREATE TABLE cart_item(
cart_item_id int NOT NULL PRIMARY KEY,
shopping_session_id int,
product_id int,
created timestamp,
FOREIGN KEY (shopping_session_id)
REFERENCES shopping_session(shopping_session_id),
FOREIGN KEY (product_id)
REFERENCES product(id),
);
