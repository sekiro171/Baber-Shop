CREATE DATABASE BaberShop;
GO
USE BaberShop;
GO

-- Tạo bảng Staff
CREATE TABLE Staff (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    phone_number NVARCHAR(15) NOT NULL UNIQUE,
	status INT NOT NULL DEFAULT 1
);
GO

-- Tạo bảng WorkSchedule
CREATE TABLE WorkSchedule (
    id INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT NOT NULL,
    work_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id)
);
GO

-- Tạo bảng Customer
CREATE TABLE Customer (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    phone_number NVARCHAR(15) NOT NULL UNIQUE,
	status INT NOT NULL DEFAULT 1
);
GO

-- Tạo bảng Admin
CREATE TABLE Admin (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    phone_number NVARCHAR(15) NOT NULL UNIQUE
);
GO

-- Tạo bảng Service
CREATE TABLE Service (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    duration INT NOT NULL,
    description NVARCHAR(255) NOT NULL
);
GO

-- Tạo bảng Appointment
CREATE TABLE Appointment (
    id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_time DATETIME NOT NULL,
    customer_id INT NOT NULL,
    staff_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (staff_id) REFERENCES Staff(id)
);
GO

-- Tạo bảng Feedback
CREATE TABLE Feedback (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    staff_id INT,
    appointment_id INT NOT NULL,
	rate INT NOT NULL,
	feedback_time DATETIME,
    comment NVARCHAR(500),
	feedback_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);
GO

-- Tạo bảng Appointment_Service
CREATE TABLE Appointment_Service (
    appointment_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id),
    FOREIGN KEY (service_id) REFERENCES Service(id)
);
GO

-- Tạo bảng Voucher
CREATE TABLE Voucher (
    id INT IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(50) NOT NULL,
    value DECIMAL(18, 2) NOT NULL,
    expiry_date DATE NOT NULL,
    status NVARCHAR(50) NOT NULL,
    admin_id INT NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin(id)
);
GO

-- Tạo bảng Customer_Voucher
CREATE TABLE Customer_Voucher (
    customer_id INT NOT NULL,
    voucher_id INT NOT NULL,
    PRIMARY KEY (customer_id, voucher_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (voucher_id) REFERENCES Voucher(id)
);
GO

-- Tạo bảng Invoice
CREATE TABLE Invoice (
    id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL(18, 2) NOT NULL,
    payment_status NVARCHAR(50) NOT NULL,
    received_date DATE NOT NULL,
    appointment_id INT NOT NULL,
    voucher_id INT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id),
    FOREIGN KEY (voucher_id) REFERENCES Voucher(id)
);
GO
