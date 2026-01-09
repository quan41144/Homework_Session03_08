-- Create database LibraryDB
create database LibraryDB02;
-- create schema library
create schema library;
-- create table Books
create table library.books(
	book_id bigserial primary key,
	title varchar(200),
	author varchar(200),
	published_year int,
	available boolean default true
);
-- Create table Members
create table library.members(
	member_id bigserial primary key,
	name varchar(200) not null,
	email varchar(200) not null unique,
	join_date date default current_date
);
-- Create schema sales
create schema sales;
-- Create table Products
create table sales.products(
	product_id serial primary key,
	product_name varchar(200) not null,
	price numeric(10, 2),
	stock_quantity int
);
-- Create table Orders
create table sales.orders(
	order_id serial primary key,
	order_date date default current_date,
	member_id bigint not null references library.members(member_id)
);
-- Create table OrderDetails
create table sales.orderdetails(
	order_detail_id serial primary key,
	order_id int not null references sales.orders(order_id),
	product_id int not null references sales.products(product_id),
	quantity int
);
-- Add column 'genre' into table Books
alter table library.books add column genre varchar(100);
-- Rename column 'available' to 'is_available'
alter table library.books rename column available to is_available;
-- Drop column 'email' in table Members
alter table library.members drop column email;
-- Drop table OrderDetails
drop table sales.orderdetails;