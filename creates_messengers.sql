DROP SCHEMA IF EXISTS messengers;
CREATE SCHEMA IF NOT EXISTS messengers;
USE messengers;

CREATE TABLE office (
id int(4) NOT NULL,
latitude float DEFAULT NULL,
longitude float DEFAULT NULL,
adress varchar(255) DEFAULT NULL,
constraint pk_office primary key (id) # when constraint and when just primary key ()
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE driver (
id int(4) NOT NULL,
name varchar(255) DEFAULT NULL,
office_id int(4) NOT NULL,
constraint pk_driver primary key(id),
constraint fk_driver_office FOREIGN KEY(office_id) REFERENCES office(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE type (
id int(4) NOT NULL,
name varchar(255) DEFAULT NULL,
number_of_wheels int DEFAULT NULL,
constraint pk_type primary key(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE vehicle (
id int(4) NOT NULL,
brand varchar(255) DEFAULT NULL,
model varchar(255) DEFAULT NULL,
capacity int DEFAULT NULL,
type_id int(4) NOT NULL,
constraint pk_vehicle primary key(id),
constraint fk_vehicle_type FOREIGN KEY(type_id) REFERENCES type(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE category (
id int(4) NOT NULL,
name varchar(255) DEFAULT NULL,
parent_category_id int(4) NOT NULL,
constraint pk_category primary key(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

ALTER TABLE category
	ADD CONSTRAINT fk_category_parent_category_id FOREIGN KEY(parent_category_id) REFERENCES category(id);

CREATE TABLE customer(
id int(4) NOT NULL,
name varchar(255) DEFAULT NULL,
latitude float DEFAULT NULL,
longitude float DEFAULT NULL,
adress varchar(255) DEFAULT NULL,
category_id int(4) NOT NULL,
constraint pk_customer primary key(id),
constraint fk_costumer_category FOREIGN KEY(category_id) REFERENCES category(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE serve (
id int(4) NOT NULL,
customer_id int(4) NOT NULL,
office_id int(4) NOT NULL,
distance float DEFAULT NULL,
constraint pk_serve primary key(id),
constraint fk_serve_customer FOREIGN KEY(customer_id) REFERENCES customer(id),
constraint fk_serve_office FOREIGN KEY(office_id) REFERENCES office(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE drive (
id int(4) NOT NULL,
driver_id int(4) NOT NULL,
type_id int(4) NOT NULL,
experience int DEFAULT NULL,
constraint pk_drive primary key(id),
constraint fk_drive_driver FOREIGN KEY(driver_id) REFERENCES driver(id),
constraint fk_drive_type FOREIGN KEY(type_id) REFERENCES type(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE have (
id int(4) NOT NULL,
vehicle_id int(4) NOT NULL,
office_id int(4) NOT NULL,
constraint pk_have primary key(id),
constraint fk_have_vehicle FOREIGN KEY(vehicle_id) REFERENCES vehicle(id),
constraint fk_have_office FOREIGN KEY(office_id) REFERENCES office(id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;


