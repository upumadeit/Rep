CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    phone_number VARCHAR(15),
    birth_date DATE
);

CREATE TYPE status_book AS ENUM ('Оплачено', 'Отменено', 'Ожидание подтверждения', 'Обработка', 'Ошибка оплаты', 'Истекло время бронирования');

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    date_booking DATE,
    flight_id INT REFERENCES Flights(flight_id),
    seat_id INT REFERENCES Seats(seat_id),
    status_booking status_book DEFAULT 'Ожидание подтверждения'
);

CREATE TABLE Flights (
    flight_id SERIAL PRIMARY KEY,
    date_flight DATE,
    airplane_id INT REFERENCES Airplanes(airplane_id),
    airport_id INT REFERENCES Airports(airport_id)
);

CREATE TABLE Airplanes (
    airplane_id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES Airlines(airline_id),
    model VARCHAR(50)
);

CREATE TABLE Airlines (
    airline_id SERIAL PRIMARY KEY,
    name_airline VARCHAR(50)
);

CREATE TABLE Seats (
    seat_id SERIAL PRIMARY KEY,
    airpalne_id INT REFERENCES Airplanes(airplane_id),
    name_seat VARCHAR(5)
);

CREATE TABLE Airports (
    airport_id SERIAL PRIMARY KEY,
    name_airport VARCHAR(100),
    city_id INT REFERENCES Cities(city_id)
);

CREATE TABLE Cities (
    city_id SERIAL PRIMARY KEY,
    name_city VARCHAR(50),
    country_id INT REFERENCES Countries(country_id)
);

CREATE TABLE Countries (
    country_id SERIAL PRIMARY KEY,
    name_country VARCHAR(50)
);
