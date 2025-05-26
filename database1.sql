CREATE DATABASE baberShop;
GO

USE baberShop;
GO

-- Tạo bảng Voucher
CREATE TABLE Voucher (
    id INT PRIMARY KEY IDENTITY,
    code NVARCHAR(255) NOT NULL,
    value FLOAT NOT NULL,
    expiryDate DATETIME NOT NULL,
    status NVARCHAR(50) NOT NULL
);
GO

-- Tạo bảng Customer_Voucher
CREATE TABLE Customer_Voucher (
    customerId INT NOT NULL,
    voucherId INT NOT NULL,
    receivedDate DATETIME NOT NULL,
    PRIMARY KEY (customerId, voucherId),
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (voucherId) REFERENCES Voucher(id)
);
GO

-- Tạo bảng Service (thêm trường description)
CREATE TABLE Service (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    duration INT NOT NULL,
    description NVARCHAR(MAX) NOT NULL,  -- Thêm trường description
	[image] [nvarchar](max) NULL
);
GO

-- Tạo bảng Appointment
-- Tạo bảng Appointment
CREATE TABLE Appointment (
    id INT PRIMARY KEY IDENTITY,
    customerId INT NOT NULL,  -- Người đặt lịch
    staffId INT NOT NULL,     -- Nhân viên phục vụ
    appointmentTime DATETIME NOT NULL,
    numberOfPeople INT NOT NULL DEFAULT 1,  -- Số lượng người tham gia dịch vụ
    status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (staffId) REFERENCES Staff(id)
);
GO

-- Tạo bảng Invoice
CREATE TABLE Invoice (
    id INT PRIMARY KEY IDENTITY,
    appointmentId INT NOT NULL,  -- Liên kết với bảng Appointment
    totalAmount FLOAT NOT NULL,  -- Tổng số tiền cần thanh toán
    voucherCode NVARCHAR(255) NULL,  -- Mã voucher (nếu có)
    receivedDate DATETIME NOT NULL,  -- Ngày hóa đơn được nhận
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id)
);
GO

-- Tạo bảng Payment
CREATE TABLE Payment (
    id INT PRIMARY KEY IDENTITY,
    invoiceId INT NOT NULL,
    amount FLOAT NOT NULL,  -- Số tiền thanh toán (sẽ bằng totalAmount trong Invoice)
    paymentMethod NVARCHAR(50) NOT NULL,  -- Phương thức thanh toán (tiền mặt, thẻ...)
    paymentDate DATETIME NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES Invoice(id)
);
GO


-- Tạo bảng Appointment_Service (bỏ id và thêm trường quantity)
CREATE TABLE Appointment_Service (
    appointmentId INT NOT NULL,
    serviceId INT NOT NULL,
    quantity INT NOT NULL,  -- Thêm trường quantity
    PRIMARY KEY (appointmentId, serviceId),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id),
    FOREIGN KEY (serviceId) REFERENCES Service(id)
);
GO

-- Tạo bảng Feedback (thêm trường feedbackTime)
CREATE TABLE Feedback (
    id INT PRIMARY KEY IDENTITY,
    customerId INT NOT NULL,
    staffId INT NOT NULL,
    appointmentId INT NOT NULL,
    serviceId INT NOT NULL,
    rating INT NOT NULL,
    comment NVARCHAR(MAX) NOT NULL,
    feedbackTime DATETIME NOT NULL,  -- Thêm trường feedbackTime
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (staffId) REFERENCES Staff(id),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id),
    FOREIGN KEY (serviceId) REFERENCES Service(id)
);
GO

-- Tạo bảng Account
CREATE TABLE Account (
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(255) NOT NULL UNIQUE,
    phoneNumber NVARCHAR(15) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    role NVARCHAR(50) NOT NULL,
    status INT NOT NULL DEFAULT 1
);
GO

-- Tạo bảng Customer
CREATE TABLE Customer (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Tạo bảng Staff
CREATE TABLE Staff (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    img NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Tạo bảng Admin
CREATE TABLE Admin (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Tạo bảng WorkSchedule
CREATE TABLE WorkSchedule (
    id INT PRIMARY KEY IDENTITY,
    staffId INT NOT NULL,
    workDate DATE NOT NULL,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (staffId) REFERENCES Staff(id)
);
GO
