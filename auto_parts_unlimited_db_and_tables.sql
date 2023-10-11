--Jillian Cashman

--create a database
CREATE DATABASE auto_parts_unlimited;

--create customers table
CREATE TABLE Customers
(
	customer_id BIGSERIAL,
	Fist_name VARCHAR(50),
	last_name VARCHAR(50),
	Phone_number CHAR(20),
	email VARCHAR(100),
	Street_Address VARCHAR(100),
    City VARCHAR(40),
    Zip_Code CHAR(5),
	State_Code CHAR(2)
);

--create employees table
CREATE TABLE Employees
(
	employee_id SERIAL,
	Fist_name VARCHAR(50),
	last_name VARCHAR(50),
	Phone_number CHAR(20),
	email VARCHAR(50),
	street_address VARCHAR(100),
    city VARCHAR(40),
    zip_code CHAR(5),
	state_code CHAR(2),
	hire_date DATE,
	salary_USD NUMERIC(10,2),
	probation_status BOOLEAN	
);

--create parts inventory table
CREATE TABLE Parts_Inventory
(
	part_number varchar(50),
	manufacturer_name VARCHAR(50),
	quantity_in_stock INTEGER,
	price NUMERIC(9,2),
	backordered BOOLEAN
);
