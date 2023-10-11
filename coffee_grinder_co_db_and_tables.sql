--create database coffee grinder co
CREATE DATABASE coffee_grinder_co;

--create table coffee_inventory
CREATE TABLE Coffee_Inventory
(
	SKU VARCHAR(50),
	coffee_name VARCHAR(50),
	Type_of_Roast VARCHAR(6),
	Pounds_on_Hand NUMERIC(9,2),
	Organic BOOLEAN,
	Low_acid BOOLEAN,
	Price_Per_LB NUMERIC(7,2)
);

--create table sales transactions
CREATE TABLE Sales_Transaction
(
	receipt_id BIGSERIAL,
	sale_amount_USD NUMERIC(10,2),
	sale_type VARCHAR(8),
	transaction_date TIMESTAMPTZ
);

--create table store
CREATE TABLE Store
(
	Store_ID SERIAL,
	Store_Manager VARCHAR(105),
	Store_PhoneNumber char(20),
	Street_Address VARCHAR(50),
	City VARCHAR(40),
	Zip_Code CHAR(5),
	State_Abbreviation CHAR(2)	
);