-- 1
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    publisher_name VARCHAR(255),    -- Название издательства
    publisher_city VARCHAR(100)     -- Город, в котором находится издательство
);
-- 1. функциональные зависимости: book_id -> title, author_name, publisher_id. (определяется ключом)
-- publisher_id -> publisher_name, publisher_city. (определяются самими издательством)

-- 2. транзитивная зависимость: book_id -> pulisher_id -> publisher_name.
-- book_id -> publisher_id -> publisher_city.

-- приведение к 3НФ
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- 2
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),      -- Модель автомобиля
    car_manufacturer VARCHAR(100), -- Производитель автомобиля
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id)
);
-- таблица не соответствует 3НФ.
-- функциональные зависимости: (race_id, driver_id) -> car_model, car_manufacturer, finish_time (определеяется ключом)

-- приведение к 3НФ
CREATE TABLE CarModels (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);

CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);

-- 3
CREATE TABLE RoomBookings (
    booking_time DATETIME,
    room_name VARCHAR(100),
    event_name VARCHAR(255),
    event_type VARCHAR(50)
);
-- есть правило: Таблица находится в НФБК, если для каждой нетривиальной функциональной зависимости X → Y,
-- детерминант X является суперключом (то есть потенциальным ключом).
-- здесь event_type не суперключ.

-- приведение к НФБК
CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100)
);

CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50),
    FOREIGN KEY (event_type) REFERENCES EventTypes(event_type)
);

CREATE TABLE RoomBookings (
    booking_time DATE,
    event_name VARCHAR(255),
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name) REFERENCES Events(event_name)
);
