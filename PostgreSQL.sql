CREATE TABLE countries(

  id_country serial primary key,
  name varchar(50) not null
  
);

create table users(
  
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)  
  
);

insert into countries (name) values ('argentina') , ('colombia'),('chile');


select * from countries;


insert into users (id_country, email, name) 

values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman'); 

select * from users;



delete from users where email = 'bar@bar.com';



update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;


select * from users;

select * from users inner join  countries on users.id_country = countries.id_country;



select u.id_users as id, u.email, u.name as fullname, c.name 
from users u inner join  countries c on u.id_country = c.id_country;


CREATE TABLE countries(

  id_country serial primary key,
  name varchar(50) not null
  
);

CREATE TABLE PRIORITIES(
  
  id_priority SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL  
  
);

CREATE TABLE CONTACT_REQUEST(
  
  id_email VARCHAR(70) PRIMARY KEY,
  id_country INTEGER NOT NULL,
  id_priority INTEGER not NULL,
  name VARCHAR(50) NOT NULL,
  DETAIL VARCHAR(100),
  physical_addres VARCHAR(150),
  foreign key (id_country) references countries (id_country),
  foreign key (id_priority) references priorities (id_priority)
  
);

SELECT * FROM priorities

INSERT INTO countries(name) VALUES ('venezuela'), ('colombia'),  
('chile'),  ('peru'),  ('brazil');

SELECT * FROM countries;

INSERT INTO priorities(type_name) VALUES ('Arepa'), ('Lechona'),  
('Asado'),  ('Lomo Saltado'),  ('Acarajé');

SELECT * FROM priorities;


INSERT INTO contact_request(id_email,id_country,id_priority,name,detail,physical_addres) 
VALUES ('fooz@fooz.com',2,2,'fooz','persona que mide 1.50','vive en el estado Cesar  Valledupar'),
('echo@echo.com',3,3,'echo','persona que mide 1.80','vive en picunches region norte');

SELECT * FROM contact_request

select * from contact_request inner join  countries on contact_request.id_country = countries.id_country;


DELETE FROM contact_request WHERE id_email='echo@echo.com';


update contact_request set id_email = 'ausbelrivera@gmail.com', name = 'ausbel rivera' where id_country = 1;

SELECT * FROM contact_request

CREATE TABLE discounts(
	
  id_discount serial PRIMARY KEY,
  satutus VARCHAR(20),
  porcentage INTEGER  

)

CREATE TABLE offers(
	
  id_offer serial PRIMARY KEY,
  satutus VARCHAR(20)

)

CREATE TABLE payments(
	
  id_payment serial PRIMARY KEY,
  type VARCHAR(20)

)

CREATE TABLE roles(
	
  id_role serial PRIMARY KEY,
  name VARCHAR(20)

)

CREATE TABLE countries(
	
  country serial PRIMARY KEY,
  name VARCHAR(20)

)

CREATE TABLE taxes(
	
  id_tax serial PRIMARY KEY,
  porcentage INTEGER

)

CREATE TABLE products(
	
  id_product serial PRIMARY KEY,
  id_discount INTEGER NOT NULL, 
  id_offer INTEGER NOT NULL,
  id_tax INTEGER NOT NULL,
  name VARCHAR(50),
  details VARCHAR(100),
  minimum_stock INTEGER,
  maximun_stock INTEGER,
  current_stock INTEGER,
  price FLOAT,
  price_with_tax  FLOAT,
  FOREIGN KEY (id_discount) REFERENCES discounts (id_discount),
  FOREIGN KEY (id_offer) REFERENCES offers (id_offer),
  FOREIGN KEY (id_tax) REFERENCES taxes (id_tax)
  

)

CREATE TABLE customers(

  id_customer serial PRIMARY KEY,
  email VARCHAR(80) NOT NULL,
  id_country INTEGER not NULL,
  id_role INTEGER NOT NULL,
  name VARCHAR(40),
  age INTEGER,
  PASSWORD INTEGER,
  physical_adress VARCHAR(150),
  FOREIGN KEY (id_country) REFERENCES countries (country),
  FOREIGN KEY (id_role) REFERENCES roles (id_role)
  
  

)

CREATE TABLE products_customers(
	
  id_product INTEGER NOT NULL,
  id_customer INTEGER not NULL,
  FOREIGN KEY (id_product) REFERENCES products (id_product),
  FOREIGN KEY (id_customer) REFERENCES customers (id_customer)
  
  

)

CREATE TABLE invoice_status(
	
	id_invoice_status serial PRIMARY KEY,
 	satutus VARCHAR(50) 

)

CREATE TABLE invoice(
  
  id_invoice serial PRIMARY KEY,
  id_customer INTEGER,
  id_payment  INTEGER,
  id_invoice_status INTEGER,
  date VARCHAR(150),
  total_to_pay FLOAT,
  FOREIGN KEY (id_customer) REFERENCES customers (id_customer),
  FOREIGN KEY (id_payment) REFERENCES payments (id_payment),
  FOREIGN KEY (id_invoice_status) REFERENCES invoice_status (id_invoice_status)
  
)

CREATE TABLE orders(
  
  id_order serial PRIMARY KEY,
  id_invoice INTEGER,
  id_product INTEGER,
  detail VARCHAR(150),
  amount INTEGER,
  price FLOAT,
  FOREIGN KEY (id_invoice) REFERENCES invoice (id_invoice) ,
  FOREIGN KEY (id_product) REFERENCES products (id_product)
  

)

INSERT INTO countries(name) VALUES ('venezuela'), ('colombia'),  
('chile');

INSERT INTO roles(name) VALUES ('frencuente'), ('poco frecuente'),  
('no viene mas');

INSERT INTO discounts (status,porcentage) VALUES ('articulo caro',10), ('articulo medio costo',15),  
('articulo barato',20);

INSERT INTO offers (status) VALUES ('activo'),('desactivo'),('pausada');

INSERT INTO invoice_status (status) VALUES ('pago'),('no paga'),('deuda');

INSERT INTO payments (type) VALUES ('dolar'),('bolivares'),('pago movil');

INSERT INTO taxes (percentage) VALUES (12),(13),(14);

INSERT INTO products (id_discount,id_offer,id_tax,name,details,minimum_stock,maximun_stock,current_stock,price,price_with_tax) 
VALUES (2,1,1,'lapto','nueva',1,10,5,223,200),(1,3,1,'pantalla','refurbished',1,20,10,332,300),
(3,2,3,'telefono','nuevo',1,100,50,334,300);

INSERT INTO customers (email,id_country,id_role,name,age,password,physical_adress) 
VALUES ('aus@gmail.com',1,1,'ausbel',22,123456,'calle1'),
('jos@gmail.com',2,2,'jose',23,123456,'calle2'),
('res@gmail.com',3,3,'rosa',25,123456,'calle3');

INSERT INTO products_customers (id_product,id_customer) VALUES (1,1),(2,2),(3,3);

INSERT INTO invoice (id_customer,id_payment,id_invoice_status,date,total_to_pay) VALUES
(1,1,1,'04243114712',223),(2,2,2,'04243114785',334),(3,3,1,'0243154789',332);

INSERT into orders (id_invoice,id_product,detail,amount,price) 
VALUES (1,1,'pago total',223,223),(2,2,'pago parcial',300,332),(3,3,'pago total',334,334);

DELETE FROM products_customers WHERE id_customer = 3;
DELETE FROM invoice WHERE id_invoice = 3;
DELETE FROM orders WHERE id_invoice = 3;
DELETE FROM customers WHERE id_customer = 3;

UPDATE customers SET name = 'ricardo' WHERE name = 'ausbel';

UPDATE taxes SET percentage = 10 WHERE id_tax = 1;
UPDATE taxes SET percentage = 20 WHERE id_tax = 2;
UPDATE taxes SET percentage = 30 WHERE id_tax = 3;

UPDATE products SET price = 300

SELECT * FROM products 
























