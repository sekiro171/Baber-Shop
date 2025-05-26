-- Chèn dữ liệu vào bảng Account (4 tài khoản)
INSERT INTO Account (email, phoneNumber, password, role)
VALUES ('Linh123@gmail.com', '0987654321', 'Linh123@', 'Admin'),  -- Tài khoản 1
('Nguyen123@gmail.com', '0123456789', 'Nguyen123@', 'Staff'),  -- Tài khoản 2
('Cuong123@gmail.com', '0123451234', 'Cuong123@', 'Customer'),  -- Tài khoản 3
('Phuc123@gmail.com', '0123412345', 'Phuc123@', 'Customer');  -- Tài khoản 4
GO

-- Chèn dữ liệu vào bảng Customer
INSERT INTO Customer (accountId, firstName, lastName)
VALUES (3, 'Cuong', 'Tran Van');  -- Dữ liệu trống cho Customer
GO

-- Chèn dữ liệu vào bảng Staff
INSERT INTO Staff (accountId, firstName, lastName, img)
VALUES (2, 'Nguyen', 'Phan', '');  -- Dữ liệu trống cho Staff
GO

-- Chèn dữ liệu vào bảng Admin
INSERT INTO Admin (accountId, firstName, lastName)
VALUES (1, 'Linh', 'Nguyen Van');  -- Dữ liệu trống cho Admin
GO

-- Chèn dữ liệu vào bảng Service
INSERT INTO Service (name, price, duration, description, image)
VALUES ('Cat toc thuong gia', 499000, 90, 'Cắt tóc cơ bản với kỹ thuật chuyên nghiệp, phù hợp mọi lứa tuổi, tạo kiểu tự nhiên', '');  -- Dữ liệu trống cho Service
GO

-- Chèn dữ liệu vào bảng Appointment
INSERT INTO Appointment (customerId, staffId, appointmentTime, numberOfPeople, status)
VALUES (1, 1, GETDATE(), 1, '');  -- Dữ liệu trống cho Appointment
GO

-- Chèn dữ liệu vào bảng Invoice
INSERT INTO Invoice (appointmentId, totalAmount, receivedDate)
VALUES (1, 0, GETDATE());  -- Dữ liệu trống cho Invoice
GO

-- Chèn dữ liệu vào bảng Payment
INSERT INTO Payment (invoiceId, amount, paymentMethod, paymentDate)
VALUES (1, 0, '', GETDATE());  -- Dữ liệu trống cho Payment
GO

-- Chèn dữ liệu vào bảng WorkSchedule
INSERT INTO WorkSchedule (staffId, workDate, startTime, endTime, status)
VALUES (1, GETDATE(), GETDATE(), GETDATE(), '');  -- Dữ liệu trống cho WorkSchedule
GO

-- Chèn dữ liệu vào bảng Customer_Voucher
INSERT INTO Customer_Voucher (customerId, voucherId, receivedDate)
VALUES (1, 1, GETDATE());  -- Dữ liệu trống cho Customer_Voucher
GO

-- Chèn dữ liệu vào bảng Appointment_Service
INSERT INTO Appointment_Service (appointmentId, serviceId, quantity)
VALUES (1, 1, 1);  -- Dữ liệu trống cho Appointment_Service
GO

-- Chèn dữ liệu vào bảng Feedback
INSERT INTO Feedback (customerId, staffId, appointmentId, serviceId, rating, comment, feedbackTime)
VALUES (1, 1, 1, 1, 0, '', GETDATE());  -- Dữ liệu trống cho Feedback
GO

-- Chèn dữ liệu vào bảng Voucher
INSERT INTO Voucher (code, value, expiryDate, status)
VALUES ('', 0, '1900-01-01', '');  -- Dữ liệu trống cho Voucher
GO