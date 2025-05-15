-- Tạo database BarberShop
CREATE DATABASE BarberShop;
GO

-- Sử dụng database này
USE BarberShop;
GO

-- Bảng Admin
CREATE TABLE Admin (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);
GO

-- Bảng Customer
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);
GO

-- Bảng Staff
CREATE TABLE Staff (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);
GO

-- Bảng Service
CREATE TABLE Service (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price FLOAT,
    duration INT,
    description VARCHAR(MAX)
);
GO

-- Bảng WorkSchedule
CREATE TABLE WorkSchedule (
    id INT PRIMARY KEY,
    staff_id INT FOREIGN KEY REFERENCES Staff(id),
    work_date DATE,
    start_time TIME,
    end_time TIME
);
GO

-- Bảng Appointment
CREATE TABLE Appointment (
    id INT PRIMARY KEY,
    appointment_time DATETIME,
    status VARCHAR(50),
    customer_id INT FOREIGN KEY REFERENCES Customer(id),
    staff_id INT FOREIGN KEY REFERENCES Staff(id)
);
GO

-- Bảng Appointment_Service (bảng trung gian giữa Appointment và Service)
CREATE TABLE Appointment_Service (
    appointment_id INT FOREIGN KEY REFERENCES Appointment(id),
    service_id INT FOREIGN KEY REFERENCES Service(id),
    quantity INT,
    PRIMARY KEY (appointment_id, service_id)
);
GO

-- Bảng Invoice
CREATE TABLE Invoice (
    id INT PRIMARY KEY,
    appointment_id INT FOREIGN KEY REFERENCES Appointment(id),
    amount FLOAT,
    payment_status VARCHAR(50)
);
GO

-- Bảng Feedback
CREATE TABLE Feedback (
    id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customer(id),
    staff_id INT FOREIGN KEY REFERENCES Staff(id),
    rating INT,
    comment VARCHAR(MAX),
    appointment_id INT FOREIGN KEY REFERENCES Appointment(id)
);
GO
