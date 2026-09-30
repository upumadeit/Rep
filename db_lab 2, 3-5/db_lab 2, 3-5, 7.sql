CREATE TABLE Reader (
    id_reader SERIAL PRIMARY KEY,
    fio VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    year_pub DATE
);

CREATE TABLE Loan (
    id_issue SERIAL PRIMARY KEY,
    id_reader INT REFERENCES reader(id_reader),
    id_book VARCHAR(20) REFERENCES book(ISBN),
    lend_date DATE,
    expected_date DATE,
    action_date DATE
);

CREATE TABLE Author (
    id_author SERIAL PRIMARY KEY,
    fio VARCHAR(100)
);

CREATE TABLE Authorship (
    id_author INT REFERENCES author(id_author),
    ISBN VARCHAR(20) REFERENCES book(ISBN)
);





INSERT INTO Reader (fio, phone_number) VALUES
('Анна Петрова', '+7-900-111-22-33'),
('Иван Соколов', '+7-900-222-33-44'),
('Мария Ким', '+7-900-333-44-55'),
('Олег Васильев', '+7-900-444-55-66');

INSERT INTO Book (ISBN, title, year_pub) VALUES
('978-5-17-118366-8', 'Мастер и Маргарита', '1967-01-25'),
('978-5-389-06256-6', 'Преступление и наказание', '1866-01-01'),
('978-5-04-116716-3', 'Война и мир', '1869-03-01'),
('978-5-699-12014-7', 'Золотой теленок', '1931-01-01'),
('978-5-389-03713-7', 'Пикник на обочине', '1972-10-01');

INSERT INTO Author (fio) VALUES
('Михаил Булгаков'),
('Фёдор Достоевский'),
('Лев Толстой'),
('Илья Ильф'),
('Евгений Петров'),
('Аркадий Cтругацкий'),
('Борис Стругацкий');

INSERT INTO Authorship (id_author, ISBN) VALUES
(1, '978-5-17-118366-8'),
(2, '978-5-389-06256-6'),
(3, '978-5-04-116716-3'),
(4, '978-5-699-12014-7'),
(5, '978-5-699-12014-7'),
(6, '978-5-389-03713-7'),
(7, '978-5-389-03713-7');

INSERT INTO Loan (id_reader, id_book, lend_date, expected_date, action_date) VALUES
(1, '978-5-17-118366-8', '2026-09-01', '2026-09-10', NULL),
(2, '978-5-389-06256-6', '2026-09-02', '2026-09-11', NULL),
(3, '978-5-04-116716-3', '2026-09-05', '2026-09-13', '2026-09-13'),
(4, '978-5-699-12014-7', '2026-09-07', '2026-09-15', '2026-09-17'),
(4, '978-5-389-03713-7', '2026-09-08', '2026-09-16', '2026-09-16'),
(2, '978-5-17-118366-8', '2026-09-11', '2026-09-20', '2026-09-20');

UPDATE reader
SET phone_number = '+7-982-500-44-33'
WHERE id_reader = 2;

UPDATE loan
SET action_date = '2026-09-17'
WHERE id_reader = 4;

DELETE FROM loan
WHERE id_reader = 1;




SELECT * FROM reader;

SELECT title, year_pub FROM book;

SELECT * FROM book
WHERE CAST(book.year_pub AS VARCHAR) LIKE '18%';

SELECT * FROM book 
WHERE CAST(book.year_pub AS VARCHAR) BETWEEN '1917' AND '1991';

SELECT * FROM reader
WHERE phone_number = '+7-900-222-33-44';

SELECT * FROM reader
WHERE fio LIKE '%в';

SELECT * FROM loan
WHERE action_date IS NULL;

SELECT title, year_pub FROM book ORDER BY title;

INSERT INTO loan (id_reader, id_book, lend_date, expected_date, action_date) VALUES
(1, '978-5-17-118366-8', '2026-09-01', '2026-09-10', NULL),
(2, '978-5-389-06256-6', '2026-09-02', '2026-09-11', NULL);
SELECT * FROM loan
WHERE action_date IS NULL
ORDER BY expected_date;

SELECT * FROM book
ORDER BY year_pub DESC
LIMIT 3; -- самые новые книги
