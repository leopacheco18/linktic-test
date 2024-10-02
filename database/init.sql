
DROP SCHEMA IF EXISTS linktic CASCADE;


CREATE SCHEMA linktic AUTHORIZATION root;



CREATE SEQUENCE linktic.products_product_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.seq_category definition

-- DROP SEQUENCE linktic.seq_category;

CREATE SEQUENCE linktic.seq_category
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.seq_order definition

-- DROP SEQUENCE linktic.seq_order;

CREATE SEQUENCE linktic.seq_order
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.seq_order_products definition

-- DROP SEQUENCE linktic.seq_order_products;

CREATE SEQUENCE linktic.seq_order_products
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.seq_product definition

-- DROP SEQUENCE linktic.seq_product;

CREATE SEQUENCE linktic.seq_product
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.seq_user definition

-- DROP SEQUENCE linktic.seq_user;

CREATE SEQUENCE linktic.seq_user
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- linktic.users_user_id_seq definition

-- DROP SEQUENCE linktic.users_user_id_seq;

CREATE SEQUENCE linktic.users_user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


CREATE TABLE linktic.categories (
	category_id int8 DEFAULT nextval('linktic.seq_category'::regclass) NOT NULL,
	code varchar NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT category_pk PRIMARY KEY (category_id)
);

INSERT INTO linktic.categories (code, "name") VALUES('TECH', 'Tecnologia');
INSERT INTO linktic.categories (code, "name") VALUES('HOME', 'Hogar');
INSERT INTO linktic.categories (code, "name") VALUES('ACC', 'Accesorios');
INSERT INTO linktic.categories (code, "name") VALUES('SHOES', 'Zapatos');
INSERT INTO linktic.categories (code, "name") VALUES('CLOTHES', 'Ropa');
INSERT INTO linktic.categories (code, "name") VALUES('PET', 'Mascotas');
INSERT INTO linktic.categories (code, "name") VALUES('SPORTS', 'Deportes');
INSERT INTO linktic.categories (code, "name") VALUES('OTHER', 'Otros');
-- linktic.users definition

-- Drop table

-- DROP TABLE linktic.users;

CREATE TABLE linktic.users (
	email varchar NOT NULL,
	"password" varchar NOT NULL,
	"role" varchar DEFAULT 'buyer'::character varying NOT NULL,
	user_id serial4 NOT NULL,
	CONSTRAINT "PK_96aac72f1574b88752e9fb00089" PRIMARY KEY (user_id)
);


-- linktic.products_product_id_seq definition


-- linktic.orders definition

-- Drop table

-- DROP TABLE linktic.orders;

CREATE TABLE linktic.orders (
	order_id int8 DEFAULT nextval('linktic.seq_order'::regclass) NOT NULL,
	buyer_id int8 NOT NULL,
	total numeric NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	status bool DEFAULT true NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY (order_id),
	CONSTRAINT orders_users_fk FOREIGN KEY (buyer_id) REFERENCES linktic.users(user_id)
);


-- linktic.products definition

-- Drop table

-- DROP TABLE linktic.products;

CREATE TABLE linktic.products (
	product_id bigserial NOT NULL,
	"name" varchar NOT NULL,
	description varchar NULL,
	url_image varchar NOT NULL,
	price numeric NOT NULL,
	quantity int8 NOT NULL,
	created_at timestamptz DEFAULT now() NOT NULL,
	status bool DEFAULT true NOT NULL,
	created_by int8 NOT NULL,
	category_id int8 NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id),
	CONSTRAINT products_categories_fk FOREIGN KEY (category_id) REFERENCES linktic.categories(category_id)
);


INSERT INTO linktic.products ("name", description, url_image, price, quantity, created_at, status, created_by, category_id) VALUES('Iphone 16', 'New Iphone 16', 'https://lpacheco-linktic.s3.us-east-2.amazonaws.com/c31eb7a4-1321-45ba-b4db-fc87ad09f976.jpg', 1500, 100, '2024-10-01 22:25:11.536', true, 1, 1);
INSERT INTO linktic.products ("name", description, url_image, price, quantity, created_at, status, created_by, category_id) VALUES('Macbook Air M3', '', 'https://lpacheco-linktic.s3.us-east-2.amazonaws.com/6da50047-9cb3-4d26-89e3-7acdc16e0699.jpeg', 1350.99, 10, '2024-10-01 22:25:43.451', true, 1, 1);
INSERT INTO linktic.products ("name", description, url_image, price, quantity, created_at, status, created_by, category_id) VALUES('Reloj Casio', '', 'https://lpacheco-linktic.s3.us-east-2.amazonaws.com/c3172384-4425-4876-ac92-d7eb81f53f9a.jpg', 350.25, 20, '2024-10-01 22:26:08.789', true, 1, 3);

-- linktic.order_products definition

-- Drop table

-- DROP TABLE linktic.order_products;

CREATE TABLE linktic.order_products (
	order_products_id int8 DEFAULT nextval('linktic.seq_order_products'::regclass) NOT NULL,
	order_id int8 NOT NULL,
	product_id int8 NOT NULL,
	quantity int4 NOT NULL,
	CONSTRAINT order_products_pk PRIMARY KEY (order_products_id),
	CONSTRAINT order_products_orders_fk FOREIGN KEY (order_id) REFERENCES linktic.orders(order_id),
	CONSTRAINT order_products_products_fk FOREIGN KEY (product_id) REFERENCES linktic.products(product_id)
);

INSERT INTO linktic.users
(email, "password", "role")
VALUES('admin@linktic.com', '$2b$10$.brCarLGWjugHfcwrJG7hu3inoiRCxPBBu8MDDe7cNhz.j7JzkeZ2', 'admin');
INSERT INTO linktic.users
(email, "password", "role")
VALUES('buyer@linktic.com', '$2b$10$.brCarLGWjugHfcwrJG7hu3inoiRCxPBBu8MDDe7cNhz.j7JzkeZ2', 'buyer');


