-- Chèn dữ liệu vào bảng Staff
INSERT INTO Staff (first_name, last_name, email, password, phone_number)
VALUES ('Linh', 'Nguyen Van', 'linh123@gmail.com', '12345', '0395439449'),
		('Cuong', 'Tran Minh', 'cuong123@gmail.com', '123123', '0987654321'),
		('Phuc', 'Phan Vinh', 'phuc@gmail.com', '123123', '012345678'); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Customer
INSERT INTO Customer (first_name, last_name, email, password, phone_number)
VALUES ('Nguyen', 'Nguy Nhu Phan', ' nguyen123@gmail.com', '123123', '012341234'); -- Thêm thông tin vào

/*
-- Chèn dữ liệu vào bảng Service
INSERT INTO Service (name, price, duration, description)
VALUES ('', 0.0, 0, ''); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Appointment
INSERT INTO Appointment (appointment_time, status, customer_id, staff_id)
VALUES ('', '', 0, 0); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Feedback
INSERT INTO Feedback (customer_id, staff_id, rating, comment, appointment_id, feedback_time, rate)
VALUES (0, 0, 0, '', 0); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng WorkSchedule
INSERT INTO WorkSchedule (staff_id, work_date, start_time, end_time)
VALUES (0, '', '', ''); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Appointment_Service
INSERT INTO Appointment_Service (appointment_id, service_id, quantity)
VALUES (0, 0, 0); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Invoice
INSERT INTO Invoice (appointment_id, amount, status, received_date)
VALUES (0, 0.0, '', ''); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Voucher
INSERT INTO Voucher (code, value, expiry_date, status, admin_id)
VALUES ('', 0.0, '', '', 0); -- Thêm thông tin vào

-- Chèn dữ liệu vào bảng Customer_Voucher
INSERT INTO Customer_Voucher (customer_id, voucher_id, admin_id)
VALUES (0, 0, 0); -- Thêm thông tin vào
*/
-- Chèn dữ liệu vào bảng Admin
INSERT INTO Admin (first_name, last_name, email, password, phone_number)
VALUES ('Linh', ' Nguyen Van', 'linh204@gmail.com', '123123', '0395444771'); -- Thêm thông tin vào
