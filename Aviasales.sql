CREATE DATABASE aviasales;

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TYPE status_book AS ENUM ('Оплачено', 'Отменено', 'Ожидание подтверждения', 'Обработка', 'Ошибка оплаты', 'Истекло время бронирования');

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    date_booking DATE NOT NULL,
    flight_id INT REFERENCES Flights(flight_id),
    seat_id INT REFERENCES Seats(seat_id),
    status_booking status_book DEFAULT 'Ожидание подтверждения' NOT NULL
);

CREATE TABLE Flights (
    flight_id SERIAL PRIMARY KEY,
    date_flight TIMESTAMPTZ NOT NULL,
    airplane_id INT REFERENCES Airplanes(airplane_id),
    airport_id INT REFERENCES Airports(airport_id)
);

CREATE TABLE Airplanes (
    airplane_id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES Airlines(airline_id),
    model VARCHAR(50) NOT NULL
);

CREATE TABLE Airlines (
    airline_id SERIAL PRIMARY KEY,
    name_airline VARCHAR(50) NOT NULL
);

CREATE TABLE Seats (
    seat_id SERIAL PRIMARY KEY,
    airplane_id INT REFERENCES Airplanes(airplane_id),
    name_seat VARCHAR(5) NOT NULL
);

CREATE TABLE Airports (
    airport_id SERIAL PRIMARY KEY,
    name_airport VARCHAR(100) NOT NULL, 
    city_id INT REFERENCES Cities(city_id)
);

CREATE TABLE Cities (
    city_id SERIAL PRIMARY KEY,
    name_city VARCHAR(50) NOT NULL,
    country_id INT REFERENCES Countries(country_id)
);

CREATE TABLE Countries (
    country_id SERIAL PRIMARY KEY,
    name_country VARCHAR(50) NOT NULL
);

-- Countries
INSERT INTO Countries (name_country) VALUES
('Россия'),
('Германия'),
('Франция'),
('Турция'),
('Испания'),
('Италия'),
('Китай'),
('ОАЭ');

-- Airlines
INSERT INTO Airlines (name_airline) VALUES
('Аэрофлот'),
('S7 Airlines'),
('Lufthansa'),
('Air France'),
('Turkish Airlines'),
('Emirates'),
('Победа'),
('Россия');

-- Cities
INSERT INTO Cities (name_city, country_id) VALUES
('Москва', 1),
('Санкт-Петербург', 1),
('Казань', 1),
('Берлин', 2),
('Мюнхен', 2),
('Париж', 3),
('Стамбул', 4),
('Барселона', 5),
('Рим', 6),
('Пекин', 7),
('Дубай', 8);

-- Airports
INSERT INTO Airports (name_airport, city_id) VALUES
('Шереметьево', 1),
('Домодедово', 1),
('Пулково', 2),
('Казань (Международный)', 3),
('Берлин-Бранденбург', 4),
('Мюнхен (Франц Йозеф Штраус)', 5),
('Шарль де Голль', 6),
('Стамбул (Истикляль)', 7),
('Барселона-Эль-Прат', 8),
('Фьюмичино', 9),
('Пекин (Дасин)', 10),
('Дубай (Международный)', 11);

-- Airplanes
INSERT INTO Airplanes (airline_id, model) VALUES
(1, 'Boeing 737-800'),
(1, 'Airbus A320'),
(2, 'Airbus A319'),
(2, 'Boeing 737 MAX 8'),
(3, 'Airbus A350-900'),
(4, 'Boeing 777-300ER'),
(5, 'Airbus A321neo'),
(6, 'Airbus A380-800'),
(7, 'Boeing 737-800'),
(8, 'Sukhoi Superjet 100');

-- Seats (по 3 места для каждого самолёта для примера)
INSERT INTO Seats (airplane_id, name_seat) VALUES
(1, '1A'), (1, '1B'), (1, '1C'),
(2, '2A'), (2, '2B'), (2, '2C'),
(3, '3A'), (3, '3B'), (3, '3C'),
(4, '4A'), (4, '4B'), (4, '4C'),
(5, '5A'), (5, '5B'), (5, '5C'),
(6, '6A'), (6, '6B'), (6, '6C'),
(7, '7A'), (7, '7B'), (7, '7C'),
(8, '8A'), (8, '8B'), (8, '8C'),
(9, '9A'), (9, '9B'), (9, '9C'),
(10, '10A'), (10, '10B'), (10, '10C');

-- Flights
INSERT INTO Flights (date_flight, airplane_id, airport_id) VALUES
('2025-06-01 08:30:00+03', 1, 1),
('2025-06-01 12:45:00+03', 2, 2),
('2025-06-02 06:15:00+03', 3, 3),
('2025-06-02 18:20:00+02', 5, 5),
('2025-06-03 09:00:00+02', 4, 6),
('2025-06-03 22:10:00+02', 6, 7),
('2025-06-04 14:30:00+03', 7, 8),
('2025-06-05 11:05:00+02', 8, 9),
('2025-06-05 20:40:00+02', 6, 10),
('2025-06-06 07:55:00+08', 5, 11),
('2025-06-07 16:25:00+04', 8, 12);

-- Customers
INSERT INTO Customers (full_name, phone_number, birth_date) VALUES
('Иванов Иван Иванович', '+79161234567', '1990-05-15'),
('Петрова Анна Сергеевна', '+79162345678', '1988-11-23'),
('Сидоров Пётр Алексеевич', '+79163456789', '1995-03-08'),
('Кузнецова Мария Ивановна', '+79164567890', '1992-07-30'),
('Смирнов Алексей Петрович', '+79165678901', '1985-12-12'),
('Волкова Ольга Дмитриевна', '+79166789012', '1999-01-25'),
('Морозов Дмитрий Владимирович', '+79167890123', '1979-09-05'),
('Новикова Екатерина Андреевна', '+79168901234', '2000-04-18'),
('Фёдоров Николай Павлович', '+79169012345', '1969-06-22'),
('Соколова Татьяна Юрьевна', '+79160123456', '1993-10-10');

-- Bookings (разные статусы)
INSERT INTO Bookings (customer_id, date_booking, flight_id, seat_id, status_booking) VALUES
(1, '2025-05-01', 1, 1, 'Оплачено'),
(2, '2025-05-02', 1, 2, 'Оплачено'),
(3, '2025-05-03', 2, 4, 'Ожидание подтверждения'),
(4, '2025-05-04', 3, 7, 'Обработка'),
(5, '2025-05-05', 4, 10, 'Оплачено'),
(6, '2025-05-06', 5, 13, 'Отменено'),
(7, '2025-05-07', 6, 16, 'Ошибка оплаты'),
(8, '2025-05-08', 7, 19, 'Оплачено'),
(9, '2025-05-09', 8, 22, 'Истекло время бронирования'),
(10, '2025-05-10', 9, 25, 'Ожидание подтверждения'),
(1, '2025-05-11', 10, 28, 'Оплачено'),
(2, '2025-05-12', 11, 30, 'Обработка');
