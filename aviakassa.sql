CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    phone_number VARCHAR(20),
    birth_date DATE
);

CREATE TABLE Airports (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(100)
);

CREATE TABLE Airplanes (
    airplane_id SERIAL PRIMARY KEY,
    model VARCHAR(50),
    airline VARCHAR(50),
    total_seats INT
);

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    booking_status VARCHAR(20),
    total_price DECIMAL(10, 2)
);

CREATE TABLE Flights (
    flight_id SERIAL PRIMARY KEY,
    flight_num VARCHAR(20),
    airplane_id INT REFERENCES Airplanes(airplane_id),
    departure_airport_id INT REFERENCES Airports(airport_id),
    arrival_airport_id INT REFERENCES Airports(airport_id),
    departure_time TIMESTAMPTZ,
    arrival_time TIMESTAMPTZ
);

CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    flight_num VARCHAR(20),
    booking_id INT REFERENCES Booking(booking_id),
    flight_id INT REFERENCES Flights(flight_id),
    pass_name VARCHAR (100),
    passport VARCHAR(20),
    seat VARCHAR(5),
    class VARCHAR(10),
    price DECIMAL(10, 2)
);
