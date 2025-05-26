-- Chèn dữ liệu vào bảng Voucher
INSERT INTO Voucher (code, value, expiryDate, status)
VALUES ('Linh123', 20, GETDATE(), ''); 
GO

-- Chèn dữ liệu vào bảng Customer_Voucher
INSERT INTO Customer_Voucher (customerId, voucherId, receivedDate)
VALUES (1, 1, GETDATE());
GO

-- Chèn dữ liệu vào bảng Service
INSERT INTO Service (name, price, duration)
VALUES ('Cắt tóc cơ bản', 90000, 45);
GO

-- Chèn dữ liệu vào bảng Appointment
INSERT INTO Appointment (customerId, staffId, appointmentTime, status)
VALUES (0, 0, GETDATE(), '');
GO

-- Chèn dữ liệu vào bảng Invoice
INSERT INTO Invoice (appointmentId, amount, paymentStatus, paymentMethod)
VALUES (0, 0, '', '');
GO

-- Chèn dữ liệu vào bảng Appointment_Service
INSERT INTO Appointment_Service (appointmentId, serviceId)
VALUES (0, 0);
GO

-- Chèn dữ liệu vào bảng Feedback
INSERT INTO Feedback (customerId, staffId, appointmentId, serviceId, rating, comment)
VALUES (0, 0, 0, 0, 0, '');
GO

-- Chèn dữ liệu vào bảng Account
INSERT INTO Account (email, phoneNumber, password, role, status)
VALUES ('Linh@gmail.com', '0987654321', 'Linh123@', 'Admin', '1'),
('Linh@gmail.com', '0987654321', 'Linh123@', 'Admin', '1'),
('Luon@gmail.com', '0987651234', 'Luong123@', 'Customer', '1'),
('Nguyen@gmail.com', '0123401234', 'Nguyen123@', 'Staff', '1')
;
GO

-- Chèn dữ liệu vào bảng Customer
INSERT INTO Customer (accountId, firstName, lastName)
VALUES (2, 'Nguyen Van', 'Luon');
GO

-- Chèn dữ liệu vào bảng Staff
INSERT INTO Staff (accountId, firstName, lastName, img)
VALUES (3, 'Nguy Nhu Phan', 'Nguyen', 'null');
GO

-- Chèn dữ liệu vào bảng Admin
INSERT INTO Admin (accountId, firstName, lastName)
VALUES (1, 'Nguyen Van', 'Linh');
GO

-- Chèn dữ liệu vào bảng WorkSchedule
INSERT INTO WorkSchedule (staffId, workDate, startTime, endTime, status)
VALUES (0, GETDATE(), GETDATE(), GETDATE(), '');
GO

-- Chèn dữ liệu vào bảng Payment
INSERT INTO Payment (invoiceId, amount, paymentMethod, paymentDate)
VALUES (0, 0, '', GETDATE());
GO
