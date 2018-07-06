DROP DATABASE IF EXISTS bookstore;

CREATE DATABASE bookstore;

USE bookstore;

CREATE TABLE User(
	username VARCHAR(20) NOT NULL PRIMARY KEY,
	password VARCHAR(20) NOT NULL,
	email VARCHAR(50)
);

INSERT INTO User(username,password,email) values("admin","1234","whx@gmail.com");

CREATE TABLE Book(
	id int auto_increment PRIMARY KEY,
	bookname varchar(20) NOT NULL,
	author varchar(20),
	ISBN varchar(20),
	amount int unsigned,
	price double
);

INSERT INTO Book(bookname,author,ISBN,amount,price) values("Database","zhangsan","123",100,30);
INSERT INTO Book(bookname,author,ISBN,amount,price) values("Computer Network","lisi","asd",100,30);
INSERT INTO Book(bookname,author,ISBN,amount,price) values("Operating System","wangwu","asdf",100,30);

CREATE TABLE Book_Order(
	order_id int auto_increment NOT NULL,
	book_id int NOT NULL,
	username varchar(20) NOT NULL,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	amount int,
	PRIMARY KEY(order_id,book_id,username,order_date),
	FOREIGN KEY(book_id) REFERENCES Book(id),
	FOREIGN KEY(username) REFERENCES User(username)
);

INSERT INTO Book_Order(book_id,username,amount) values(2,"admin",1);
INSERT INTO Book_Order(book_id,username,amount) values(1,"admin",2);
INSERT INTO Book_Order(book_id,username,amount) values(3,"admin",3);