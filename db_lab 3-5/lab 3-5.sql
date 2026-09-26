CREATE DATABASE Library

CREATE TABLE Readers (
    Reader_ID INT PRIMARY KEY,
    FIO VARCHAR(100) NOT NULL,
    Phone_number VARCHAR(20)
);
INSERT INTO Readers (Reader_ID, FIO, Phone_number) VALUES
(1,'Анна Петрова', '+7-900-111-22-33'),
(2,'Иван Соколов', '+7-900-222-33-44'),
(3,'Мария Ким', '+7-900-333-44-55'),
(4,'Олег Васильев', '+7-900-444-55-66');


CREATE TABLE Authors (
    Author_ID SERIAL PRIMARY KEY,
    FIO VARCHAR(100) NOT NULL
);
INSERT INTO Authors (Author_ID, FIO) VALUES
(1, 'Михаил Булгаков'),
(2, 'Фёдор Достоевский'),
(3, 'Лев Толстой'),
(4, 'Илья Ильф'),
(5, 'Евгений Петров'),
(6, 'Аркадий Стругацкий'),
(7, 'Борис Стругацкий');

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE, 
    Title VARCHAR(255) NOT NULL,
    Year_pub INT 
);
INSERT INTO Books (Book_ID, ISBN, Title, Year_pub) VALUES
(1, '978-5-17-118366-8', 'Мастер и Маргарита', '1967'),
(2, '978-5-389-06256-6', 'Преступление и наказание', '1866'),
(3, '978-5-04-116716-3', 'Война и мир', '1869'),
(4, '978-5-699-12014-7', 'Золотой теленок', '1931'),
(5, '978-5-389-03713-7', 'Пикник на обочине', '1972');

CREATE TABLE Authorship (
    Book_ID INT NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Book_ID, Author_ID)
);


CREATE TABLE Loan (
    Loan_ID SERIAL PRIMARY KEY,
    Reader_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Issue_Date DATE NOT NULL,
    Expected_Date DATE,
    Action_Date DATE
);
