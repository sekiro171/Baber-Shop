-- Tạo cơ sở dữ liệu
CREATE DATABASE BarberShop;
GO

-- Sử dụng cơ sở dữ liệu BarberShop
USE BarberShop;
GO

-- Tạo bảng Staff
CREATE TABLE Staff (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL
);
GO

-- Tạo bảng Customer
CREATE TABLE Customer (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL
);
GO

-- Tạo bảng Admin
CREATE TABLE Admin (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL
);
GO

-- Tạo bảng WorkSchedule
CREATE TABLE WorkSchedule (
    id INT PRIMARY KEY IDENTITY(1,1),
    staff_id INT,
    work_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(id)
);
GO

-- Tạo bảng Service
CREATE TABLE Service (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    duration INT NOT NULL, -- Thời gian phục vụ (phút)
    description NVARCHAR(500)
);
GO

-- Tạo bảng Appointment
CREATE TABLE Appointment (
    id INT PRIMARY KEY IDENTITY(1,1),
    appointment_time DATETIME NOT NULL,
    status NVARCHAR(50) NOT NULL,
    customer_id INT,
    staff_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (staff_id) REFERENCES Staff(id)
);
GO

-- Tạo bảng Appointment_Service (cho phép mỗi cuộc hẹn sử dụng nhiều dịch vụ)
CREATE TABLE Appointment_Service (
    appointment_id INT,
    service_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id),
    FOREIGN KEY (service_id) REFERENCES Service(id)
);
GO

-- Tạo bảng Invoice
CREATE TABLE Invoice (
    id INT PRIMARY KEY IDENTITY(1,1),
    appointment_id INT,
    amount FLOAT NOT NULL,
    payment_status NVARCHAR(50) NOT NULL,
    voucher_id INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id),
    FOREIGN KEY (voucher_id) REFERENCES Voucher(id)
);
GO

-- Tạo bảng Feedback
CREATE TABLE Feedback (
    id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    staff_id INT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(500),
    appointment_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (staff_id) REFERENCES Staff(id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);
GO

-- Tạo bảng Voucher
CREATE TABLE Voucher (
    id INT PRIMARY KEY IDENTITY(1,1),
    code NVARCHAR(50) NOT NULL UNIQUE,
    value FLOAT NOT NULL,
    expiry_date DATE NOT NULL,
    status NVARCHAR(50) NOT NULL,
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admin(id)
);
GO

-- Tạo bảng Customer_Voucher (quan hệ giữa Customer và Voucher)
CREATE TABLE Customer_Voucher (
    customer_id INT,
    voucher_id INT,
    received_date DATE NOT NULL,
    admin_id INT,
    PRIMARY KEY (customer_id, voucher_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (voucher_id) REFERENCES Voucher(id),
    FOREIGN KEY (admin_id) REFERENCES Admin(id)
);
GO
