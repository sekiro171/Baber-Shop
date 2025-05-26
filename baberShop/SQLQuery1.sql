-- Chèn dữ liệu vào bảng Voucher
CREATE TABLE Voucher (
    id INT PRIMARY KEY IDENTITY,
    code NVARCHAR(255) NOT NULL,
    value FLOAT NOT NULL,
    expiryDate DATETIME NOT NULL,
    status NVARCHAR(50) NOT NULL
);
GO

-- Chèn dữ liệu vào bảng Customer_Voucher
CREATE TABLE Customer_Voucher (
    customerId INT NOT NULL,
    voucherId INT NOT NULL,
    receivedDate DATETIME NOT NULL,
    PRIMARY KEY (customerId, voucherId),
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (voucherId) REFERENCES Voucher(id)
);
GO

-- Chèn dữ liệu vào bảng Service
CREATE TABLE Service (
    id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    duration INT NOT NULL
);
GO

-- Chèn dữ liệu vào bảng Appointment
CREATE TABLE Appointment (
    id INT PRIMARY KEY IDENTITY,
    customerId INT NOT NULL,
    staffId INT NOT NULL,
    appointmentTime DATETIME NOT NULL,
    status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (staffId) REFERENCES Staff(id)
);
GO

-- Chèn dữ liệu vào bảng Invoice
CREATE TABLE Invoice (
    id INT PRIMARY KEY IDENTITY,
    appointmentId INT NOT NULL,
    amount FLOAT NOT NULL,
    paymentStatus NVARCHAR(50) NOT NULL,
    paymentMethod NVARCHAR(50) NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id)
);
GO

-- Chèn dữ liệu vào bảng Appointment_Service
CREATE TABLE Appointment_Service (
    id INT PRIMARY KEY IDENTITY,
    appointmentId INT NOT NULL,
    serviceId INT NOT NULL,
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id),
    FOREIGN KEY (serviceId) REFERENCES Service(id)
);
GO

-- Chèn dữ liệu vào bảng Feedback
CREATE TABLE Feedback (
    id INT PRIMARY KEY IDENTITY,
    customerId INT NOT NULL,
    staffId INT NOT NULL,
    appointmentId INT NOT NULL,
    serviceId INT NOT NULL,
    rating INT NOT NULL,
    comment NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    FOREIGN KEY (staffId) REFERENCES Staff(id),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(id),
    FOREIGN KEY (serviceId) REFERENCES Service(id)
);
GO

-- Chèn dữ liệu vào bảng Account
CREATE TABLE Account (
    id INT PRIMARY KEY IDENTITY,
    email NVARCHAR(255) NOT NULL UNIQUE,   -- Đảm bảo email là unique
    phoneNumber NVARCHAR(15) NOT NULL UNIQUE,  -- Đảm bảo phoneNumber là unique
    password NVARCHAR(255) NOT NULL,
    role NVARCHAR(50) NOT NULL,
    status Int NOT NULL
);
GO

-- Chèn dữ liệu vào bảng Customer
CREATE TABLE Customer (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Chèn dữ liệu vào bảng Staff
CREATE TABLE Staff (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    img NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Chèn dữ liệu vào bảng Admin
CREATE TABLE Admin (
    id INT PRIMARY KEY IDENTITY,
    accountId INT NOT NULL,
    firstName NVARCHAR(255) NOT NULL,
    lastName NVARCHAR(255) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);
GO

-- Chèn dữ liệu vào bảng WorkSchedule
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

-- Chèn dữ liệu vào bảng Payment
CREATE TABLE Payment (
    id INT PRIMARY KEY IDENTITY,
    invoiceId INT NOT NULL,
    amount FLOAT NOT NULL,
    paymentMethod NVARCHAR(50) NOT NULL,
    paymentDate DATETIME NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES Invoice(id)
);
GO
