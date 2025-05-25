<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Lịch hẹn - Barbershop Admin</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
        <style>
            .custom-navbar {
                background: rgba(29, 29, 27, 0.95) !important;
                backdrop-filter: blur(10px);
                border-bottom: 2px solid rgba(218, 165, 32, 0.3) !important;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1100;
                height: 70px;
            }

            .navbar-brand img {
                border-radius: 50%;
                border: 2px solid #DAA520;
            }

            .custom-navbar .btn-outline-warning {
                border-color: #DAA520;
                color: #DAA520;
                font-weight: 500;
                padding: 8px 16px;
                border-radius: 25px;
                transition: all 0.3s ease;
            }

            .custom-navbar .btn-outline-warning:hover {
                background-color: #DAA520;
                border-color: #DAA520;
                color: #1d1d1b;
            }

            .custom-navbar .btn-warning {
                background-color: #DAA520;
                border-color: #DAA520;
                color: #1d1d1b;
                font-weight: 500;
                padding: 8px 16px;
                border-radius: 25px;
                transition: all 0.3s ease;
            }

            .custom-navbar .btn-warning:hover {
                background-color: #B8860B;
                border-color: #B8860B;
            }

            .navbar-toggler {
                border-color: #DAA520;
            }

            .navbar-toggler-icon {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='%23DAA520' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
            }

            .dashboard-layout {
                display: flex;
                min-height: 100vh;
                padding-top: 70px;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(rgba(29, 29, 27, 0.7), rgba(29, 29, 27, 0.7)),
                    url('https://images.unsplash.com/photo-1585747860715-2ba37e788b70?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1374&q=80');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                min-height: 100vh;
                color: #fff;
            }

            .sidebar {
                width: 280px;
                background: rgba(29, 29, 27, 0.95);
                backdrop-filter: blur(10px);
                border-right: 2px solid rgba(218, 165, 32, 0.3);
                position: fixed;
                height: calc(100vh - 70px);
                left: 0;
                top: 70px;
                z-index: 1000;
                transition: transform 0.3s ease;
                overflow-y: auto;
            }

            .sidebar-header {
                padding: 30px 20px;
                text-align: center;
                border-bottom: 1px solid rgba(218, 165, 32, 0.2);
            }

            .logo {
                font-size: 2rem;
                color: #DAA520;
                margin-bottom: 10px;
            }

            .logo-text {
                font-size: 1.3rem;
                font-weight: 600;
                color: #fff;
                margin-bottom: 5px;
            }

            .logo-subtitle {
                font-size: 0.9rem;
                color: #ccc;
            }

            .nav-menu {
                padding: 20px 0;
            }

            .nav-item {
                margin: 8px 0;
            }

            .nav-link {
                display: flex;
                align-items: center;
                padding: 15px 25px;
                color: #ccc;
                text-decoration: none;
                transition: all 0.3s ease;
                border-left: 3px solid transparent;
            }

            .nav-link:hover, .nav-link.active {
                background: rgba(218, 165, 32, 0.1);
                color: #DAA520;
                border-left-color: #DAA520;
            }

            .nav-link i {
                width: 20px;
                margin-right: 15px;
                font-size: 1.1rem;
            }

            .main-content {
                flex: 1;
                margin-left: 280px;
                padding: 30px;
            }

            .header {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px 30px;
                margin-bottom: 30px;
                border: 1px solid rgba(218, 165, 32, 0.2);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header h1 {
                font-size: 2.2rem;
                color: #DAA520;
                margin-bottom: 8px;
            }

            .header p {
                color: #ccc;
                font-size: 1rem;
            }

            .header-actions {
                display: flex;
                gap: 15px;
            }

            .btn {
                padding: 12px 24px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .btn-primary {
                background: linear-gradient(45deg, #DAA520, #B8860B);
                color: #1d1d1b;
                font-weight: 600;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(218, 165, 32, 0.4);
            }

            .btn-secondary {
                background: rgba(218, 165, 32, 0.1);
                color: #DAA520;
                border: 1px solid rgba(218, 165, 32, 0.3);
            }

            .btn-secondary:hover {
                background: rgba(218, 165, 32, 0.2);
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stats-card {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px;
                border: 1px solid rgba(218, 165, 32, 0.2);
                display: flex;
                align-items: center;
                gap: 20px;
                transition: transform 0.3s ease;
            }

            .stats-card:hover {
                transform: translateY(-5px);
            }

            .stats-icon {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
            }

            .stats-info h3 {
                font-size: 2rem;
                font-weight: 700;
                color: #fff;
                margin-bottom: 5px;
            }

            .stats-info p {
                color: #ccc;
                font-size: 0.9rem;
            }

            .search-section {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px;
                margin-bottom: 25px;
                border: 1px solid rgba(218, 165, 32, 0.2);
            }

            .search-row {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
                align-items: end;
            }

            .search-group {
                display: flex;
                flex-direction: column;
            }

            .search-group label {
                color: #DAA520;
                margin-bottom: 8px;
                font-weight: 600;
                font-size: 0.9rem;
            }

            .search-input, .search-select {
                padding: 12px 15px;
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid rgba(218, 165, 32, 0.3);
                border-radius: 8px;
                color: #fff;
                font-size: 0.9rem;
            }

            .search-input:focus, .search-select:focus {
                outline: none;
                border-color: #DAA520;
                box-shadow: 0 0 0 2px rgba(218, 165, 32, 0.2);
            }

            .search-input::placeholder {
                color: #999;
            }

            .table-container {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px;
                border: 1px solid rgba(218, 165, 32, 0.2);
                overflow-x: auto;
            }

            .table-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                flex-wrap: wrap;
                gap: 15px;
            }

            .table-title {
                font-size: 1.3rem;
                color: #DAA520;
                font-weight: 600;
            }

            .table-info {
                color: #ccc;
                font-size: 0.9rem;
            }

            .appointment-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
                min-width: 800px;
            }

            .appointment-table th,
            .appointment-table td {
                padding: 15px 12px;
                text-align: left;
                border-bottom: 1px solid rgba(218, 165, 32, 0.1);
            }

            .appointment-table th {
                background: rgba(218, 165, 32, 0.1);
                color: #DAA520;
                font-weight: 600;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .appointment-table td {
                color: #fff;
                font-size: 0.9rem;
            }

            .appointment-table tbody tr {
                transition: all 0.3s ease;
            }

            .appointment-table tbody tr:hover {
                background: rgba(218, 165, 32, 0.05);
            }

            .appointment-id {
                font-family: 'Courier New', monospace;
                color: #DAA520;
                font-weight: 600;
            }

            .customer-info {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .customer-avatar {
                width: 35px;
                height: 35px;
                border-radius: 50%;
                background: linear-gradient(45deg, #DAA520, #B8860B);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #1d1d1b;
                font-weight: 600;
                font-size: 0.8rem;
            }

            .service-list {
                max-width: 200px;
            }

            .service-item {
                background: rgba(218, 165, 32, 0.1);
                padding: 2px 8px;
                border-radius: 12px;
                font-size: 0.8rem;
                margin: 2px;
                display: inline-block;
                border: 1px solid rgba(218, 165, 32, 0.3);
            }

            .datetime-info {
                text-align: center;
            }

            .date-display {
                font-weight: 600;
                color: #DAA520;
                margin-bottom: 3px;
            }

            .time-display {
                font-size: 0.8rem;
                color: #ccc;
            }

            .people-count {
                text-align: center;
                font-weight: 600;
                color: #DAA520;
                font-size: 1.1rem;
            }

            .badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .badge-pending {
                background: rgba(255, 193, 7, 0.2);
                color: #FFC107;
                border: 1px solid rgba(255, 193, 7, 0.3);
            }

            .badge-confirmed {
                background: rgba(76, 175, 80, 0.2);
                color: #4CAF50;
                border: 1px solid rgba(76, 175, 80, 0.3);
            }

            .badge-completed {
                background: rgba(33, 150, 243, 0.2);
                color: #2196F3;
                border: 1px solid rgba(33, 150, 243, 0.3);
            }

            .badge-cancelled {
                background: rgba(244, 67, 54, 0.2);
                color: #f44336;
                border: 1px solid rgba(244, 67, 54, 0.3);
            }

            .action-buttons {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
            }

            .btn-action {
                padding: 6px 12px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 0.8rem;
                transition: all 0.3s ease;
            }

            .btn-view {
                background: rgba(33, 150, 243, 0.2);
                color: #2196F3;
                border: 1px solid rgba(33, 150, 243, 0.3);
            }

            .btn-confirm {
                background: rgba(76, 175, 80, 0.2);
                color: #4CAF50;
                border: 1px solid rgba(76, 175, 80, 0.3);
            }

            .btn-cancel {
                background: rgba(244, 67, 54, 0.2);
                color: #f44336;
                border: 1px solid rgba(244, 67, 54, 0.3);
            }

            .btn-edit {
                background: rgba(255, 152, 0, 0.2);
                color: #FF9800;
                border: 1px solid rgba(255, 152, 0, 0.3);
            }

            .btn-action:hover {
                transform: translateY(-1px);
            }

            .mobile-menu-btn {
                display: none;
                position: fixed;
                top: 20px;
                left: 20px;
                z-index: 1001;
                background: rgba(29, 29, 27, 0.9);
                color: #DAA520;
                border: none;
                padding: 10px;
                border-radius: 5px;
                font-size: 1.2rem;
            }

            .modal-content {
                background: rgba(29, 29, 27, 0.95);
                border: 1px solid rgba(218, 165, 32, 0.3);
                border-radius: 15px;
            }

            .modal-header {
                border-bottom: 1px solid rgba(218, 165, 32, 0.2);
                color: #DAA520;
            }

            .modal-body {
                color: #fff;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                color: #DAA520;
                font-weight: 600;
                margin-bottom: 8px;
                display: block;
            }

            .form-control {
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid rgba(218, 165, 32, 0.3);
                border-radius: 8px;
                color: #fff;
                padding: 12px 15px;
            }

            .form-control:focus {
                background: rgba(255, 255, 255, 0.1);
                border-color: #DAA520;
                box-shadow: 0 0 0 2px rgba(218, 165, 32, 0.2);
                color: #fff;
            }

            .form-control::placeholder {
                color: #999;
            }

            .detail-section {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 15px;
            }

            .detail-title {
                color: #DAA520;
                font-weight: 600;
                margin-bottom: 10px;
                font-size: 1rem;
            }

            .service-detail {
                display: flex;
                justify-content: space-between;
                padding: 8px 0;
                border-bottom: 1px solid rgba(218, 165, 32, 0.1);
            }

            .service-detail:last-child {
                border-bottom: none;
            }

            @media (max-width: 768px) {
                .mobile-menu-btn {
                    display: block;
                }

                .sidebar {
                    transform: translateX(-100%);
                }

                .sidebar.active {
                    transform: translateX(0);
                }

                .main-content {
                    margin-left: 0;
                    padding: 80px 20px 20px;
                }

                .header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 15px;
                }

                .header-actions {
                    width: 100%;
                    justify-content: flex-start;
                }

                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .search-row {
                    grid-template-columns: 1fr;
                }

                .table-container {
                    padding: 15px;
                }

                .appointment-table {
                    font-size: 0.8rem;
                }

                .appointment-table th,
                .appointment-table td {
                    padding: 10px 8px;
                }

                .action-buttons {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
            <div class="container-fluid px-4">
                <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                    <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <div class="d-flex gap-2 align-items-center">
                        <div class="text-warning d-none d-lg-block me-3">
                            <i class="fas fa-user-shield me-1"></i>
                            <span>Admin</span>
                        </div>
                        <a class="btn btn-warning" href="#" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?')">
                            <i class="fas fa-sign-out-alt me-1"></i>
                            Đăng xuất
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <button class="mobile-menu-btn" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>

        <div class="dashboard-layout">
            <nav class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <div class="logo">
                        <i class="fas fa-cut"></i>
                    </div>
                    <div class="logo-text">BarberShop Pro</div>
                    <div class="logo-subtitle">Admin Dashboard</div>
                </div>
                   <div class="nav-menu">
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="nav-link">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/customerManagement.jsp" class="nav-link">
                            <i class="fas fa-users"></i>
                            <span>Quản lý Khách hàng</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/staffManagement.jsp" class="nav-link active">
                            <i class="fas fa-user-tie"></i>
                            <span>Quản lý Nhân viên</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/appointmentManagement.jsp" class="nav-link">
                            <i class="fas fa-calendar-check"></i>
                            <span>Quản lý Lịch hẹn</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/feedbackManagement.jsp" class="nav-link">
                            <i class="fas fa-comments"></i>
                            <span>Quản lý Phản hồi</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/serviceManagement.jsp" class="nav-link">
                            <i class="fas fa-store"></i>
                            <span>Quản lý Dịch Vụ</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/voucherManagement.jsp" class="nav-link">
                            <i class="fas fa-ticket-alt"></i>
                            <span>Quản lý Voucher</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/franchiseManagement.jsp" class="nav-link">
                            <i class="fas fa-handshake"></i>
                            <span>Quản lý Nhượng quyền</span>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/views/admin/revenueManagement.jsp" class="nav-link">
                            <i class="fas fa-chart-line"></i>
                            <span>Quản lý Doanh thu</span>
                        </a>
                    </div>
                </div>
            </nav>

            <main class="main-content">
                <div class="header">
                    <div>
                        <h1><i class="fas fa-calendar-check"></i> Quản lý Lịch hẹn</h1>
                        <p>Theo dõi và quản lý tất cả các lịch hẹn của khách hàng</p>
                    </div>
                    <div class="header-actions">
                        <button class="btn btn-secondary" onclick="exportAppointments()">
                            <i class="fas fa-file-excel"></i>
                            Xuất Excel
                        </button>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAppointmentModal">
                            <i class="fas fa-plus"></i>
                            Tạo lịch hẹn
                        </button>
                    </div>
                </div>

                <div class="stats-grid">
                    <div class="stats-card">
                        <div class="stats-icon" style="background: rgba(255, 193, 7, 0.2);">
                            <i class="fas fa-clock" style="color: #FFC107;"></i>
                        </div>
                        <div class="stats-info">
                            <h3 id="pendingCount">0</h3>
                            <p>Chờ xác nhận</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-icon" style="background: rgba(76, 175, 80, 0.2);">
                            <i class="fas fa-check-circle" style="color: #4CAF50;"></i>
                        </div>
                        <div class="stats-info">
                            <h3 id="confirmedCount">0</h3>
                            <p>Đã xác nhận</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-icon" style="background: rgba(33, 150, 243, 0.2);">
                            <i class="fas fa-calendar-check" style="color: #2196F3;"></i>
                        </div>
                        <div class="stats-info">
                            <h3 id="todayCount">0</h3>
                            <p>Hôm nay</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <div class="stats-icon" style="background: rgba(218, 165, 32, 0.2);">
                            <i class="fas fa-users" style="color: #DAA520;"></i>
                        </div>
                        <div class="stats-info">
                            <h3 id="totalPeople">0</h3>
                            <p>Tổng số khách</p>
                        </div>
                    </div>
                </div>

                <div class="search-section">
                    <div class="search-row">
                        <div class="search-group">
                            <label>Tìm kiếm khách hàng</label>
                            <input type="text" id="searchCustomer" class="search-input" placeholder="Nhập tên hoặc số điện thoại">
                        </div>
                        <div class="search-group">
                            <label>Trạng thái</label>
                            <select id="searchStatus" class="search-select">
                                <option value="">Tất cả</option>
                                <option value="pending">Chờ xác nhận</option>
                                <option value="confirmed">Đã xác nhận</option>
                                <option value="completed">Hoàn thành</option>
                                <option value="cancelled">Đã hủy</option>
                            </select>
                        </div>
                        <div class="search-group">
                            <label>Ngày</label>
                            <input type="date" id="searchDate" class="search-input">
                        </div>
                        <div class="search-group">
                            <button class="btn btn-primary" onclick="searchAppointments()">
                                <i class="fas fa-search"></i>
                                Tìm kiếm
                            </button>
                        </div>
                    </div>
                </div>

                <div class="table-container">
                    <div class="table-header">
                        <div>
                            <div class="table-title">Danh sách Lịch hẹn</div>
                            <div class="table-info" id="tableInfo">Hiển thị 0 lịch hẹn</div>
                        </div>
                        <div class="header-actions">
                            <button class="btn btn-secondary" onclick="resetFilters()">
                                <i class="fas fa-sync-alt"></i>
                                Đặt lại
                            </button>
                        </div>
                    </div>
                    <table class="appointment-table">
                        <thead>
                            <tr>
                                <th>Mã lịch hẹn</th>
                                <th>Khách hàng</th>
                                <th>Dịch vụ</th>
                                <th>Ngày & Giờ</th>
                                <th>Số lượng</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody id="appointmentTableBody"></tbody>
                    </table>
                </div>
            </main>
        </div>

        <!-- Add Appointment Modal -->
        <div class="modal fade" id="addAppointmentModal" tabindex="-1" aria-labelledby="addAppointmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAppointmentModalLabel">Tạo lịch hẹn mới</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên khách hàng</label>
                            <input type="text" id="customerName" class="form-control" placeholder="Nhập tên khách hàng">
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" id="customerPhone" class="form-control" placeholder="Nhập số điện thoại">
                        </div>
                        <div class="form-group">
                            <label>Dịch vụ</label>
                            <select id="services" class="form-control" multiple>
                                <option value="Cắt tóc">Cắt tóc</option>
                                <option value="Cạo mặt">Cạo mặt</option>
                                <option value="Nhuộm tóc">Nhuộm tóc</option>
                                <option value="Gội đầu">Gội đầu</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Ngày</label>
                            <input type="date" id="appointmentDate" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Giờ</label>
                            <input type="time" id="appointmentTime" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Số lượng người</label>
                            <input type="number" id="peopleCount" class="form-control" min="1" value="1">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" onclick="addAppointment()">Tạo lịch hẹn</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- View Appointment Modal -->
        <div class="modal fade" id="viewAppointmentModal" tabindex="-1" aria-labelledby="viewAppointmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewAppointmentModalLabel">Chi tiết lịch hẹn</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="detail-section">
                            <div class="detail-title">Thông tin khách hàng</div>
                            <div class="service-detail">
                                <span>Mã lịch hẹn:</span>
                                <span id="viewAppointmentId"></span>
                            </div>
                            <div class="service-detail">
                                <span>Tên:</span>
                                <span id="viewCustomerName"></span>
                            </div>
                            <div class="service-detail">
                                <span>Số điện thoại:</span>
                                <span id="viewCustomerPhone"></span>
                            </div>
                        </div>
                        <div class="detail-section">
                            <div class="detail-title">Thông tin lịch hẹn</div>
                            <div class="service-detail">
                                <span>Ngày:</span>
                                <span id="viewAppointmentDate"></span>
                            </div>
                            <div class="service-detail">
                                <span>Giờ:</span>
                                <span id="viewAppointmentTime"></span>
                            </div>
                            <div class="service-detail">
                                <span>Số lượng người:</span>
                                <span id="viewPeopleCount"></span>
                            </div>
                            <div class="service-detail">
                                <span>Trạng thái:</span>
                                <span id="viewStatus"></span>
                            </div>
                        </div>
                        <div class="detail-section">
                            <div class="detail-title">Dịch vụ</div>
                            <div id="viewServices"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Sample appointment data
            let appointments = [
                {
                    id: "APPT001",
                    customerName: "Nguyễn Văn A",
                    customerPhone: "0901234567",
                    services: ["Cắt tóc", "Nhuộm tóc"],
                    date: "2025-05-25",
                    time: "10:00",
                    peopleCount: 2,
                    status: "pending"
                },
                {
                    id: "APPT002",
                    customerName: "Trần Thị B",
                    customerPhone: "0912345678",
                    services: ["Cạo mặt", "Gội đầu"],
                    date: "2025-05-25",
                    time: "14:30",
                    peopleCount: 1,
                    status: "confirmed"
                },
                {
                    id: "APPT003",
                    customerName: "Lê Văn C",
                    customerPhone: "0923456789",
                    services: ["Cắt tóc"],
                    date: "2025-05-24",
                    time: "09:00",
                    peopleCount: 1,
                    status: "completed"
                },
                {
                    id: "APPT004",
                    customerName: "Phạm Thị D",
                    customerPhone: "0934567890",
                    services: ["Gội đầu"],
                    date: "2025-05-24",
                    time: "10:00",
                    peopleCount: 1,
                    status: "completed"
                },
                {
                    id: "APPT005",
                    customerName: "Đỗ Văn E",
                    customerPhone: "0945678901",
                    services: ["Cắt tóc", "Cạo mặt"],
                    date: "2025-05-24",
                    time: "11:00",
                    peopleCount: 2,
                    status: "completed"
                },
                {
                    id: "APPT006",
                    customerName: "Bùi Thị F",
                    customerPhone: "0956789012",
                    services: ["Nhuộm tóc"],
                    date: "2025-05-24",
                    time: "12:00",
                    peopleCount: 1,
                    status: "completed"
                },
                {
                    id: "APPT007",
                    customerName: "Hoàng Văn G",
                    customerPhone: "0967890123",
                    services: ["Cắt tóc"],
                    date: "2025-05-24",
                    time: "13:00",
                    peopleCount: 1,
                    status: "completed"
                },
                {
                    id: "APPT008",
                    customerName: "Vũ Thị H",
                    customerPhone: "0978901234",
                    services: ["Gội đầu", "Nhuộm tóc"],
                    date: "2025-05-24",
                    time: "14:00",
                    peopleCount: 1,
                    status: "completed"
                }
            ];

            // Filtered appointments
            let filteredAppointments = [...appointments];

            // Initialize page
            document.addEventListener('DOMContentLoaded', function() {
                updateStats();
                renderAppointments();
            });

            // Toggle sidebar for mobile
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                if (sidebar) {
                    sidebar.classList.toggle('active');
                }
            }

            // Update statistics
            function updateStats() {
                const pendingCount = appointments.filter(a => a.status === 'pending').length;
                const confirmedCount = appointments.filter(a => a.status === 'confirmed').length;
                
                // Adjust for +07 timezone
                const now = new Date();
                const offset = 7 * 60; // +07:00 in minutes
                const today = new Date(now.getTime() + (offset - now.getTimezoneOffset()) * 60000)
                    .toISOString()
                    .split('T')[0];
                
                const todayCount = appointments.filter(a => a.date === today).length;
                const totalPeople = appointments.reduce((sum, a) => sum + (a.peopleCount || 0), 0);

                document.getElementById('pendingCount').textContent = pendingCount;
                document.getElementById('confirmedCount').textContent = confirmedCount;
                document.getElementById('todayCount').textContent = todayCount;
                document.getElementById('totalPeople').textContent = totalPeople;
            }

            // Render appointments
            function renderAppointments() {
                const tableBody = document.getElementById('appointmentTableBody');
                if (!tableBody) return;

                tableBody.innerHTML = '';

                filteredAppointments.forEach(appointment => {
                    const row = document.createElement('tr');

                    // Appointment ID
                    const idCell = document.createElement('td');
                    idCell.className = 'appointment-id';
                    idCell.textContent = appointment.id || 'N/A';
                    row.appendChild(idCell);

                    // Customer Info
                    const customerCell = document.createElement('td');
                    customerCell.className = 'customer-info';
                    const avatarDiv = document.createElement('div');
                    avatarDiv.className = 'customer-avatar';
                    avatarDiv.textContent = appointment.customerName?.charAt(0) || '?';
                    const infoDiv = document.createElement('div');
                    const nameDiv = document.createElement('div');
                    nameDiv.textContent = appointment.customerName || 'N/A';
                    const phoneDiv = document.createElement('div');
                    phoneDiv.className = 'text-muted small';
                    phoneDiv.textContent = appointment.customerPhone || 'N/A';
                    infoDiv.appendChild(nameDiv);
                    infoDiv.appendChild(phoneDiv);
                    customerCell.appendChild(avatarDiv);
                    customerCell.appendChild(infoDiv);
                    row.appendChild(customerCell);

                    // Services
                    const servicesCell = document.createElement('td');
                    servicesCell.className = 'service-list';
                    if (Array.isArray(appointment.services)) {
                        appointment.services.forEach(service => {
                            const span = document.createElement('span');
                            span.className = 'service-item';
                            span.textContent = service;
                            servicesCell.appendChild(span);
                        });
                    }
                    row.appendChild(servicesCell);

                    // Date & Time
                    const datetimeCell = document.createElement('td');
                    datetimeCell.className = 'datetime-info';
                    const dateDiv = document.createElement('div');
                    dateDiv.className = 'date-display';
                    dateDiv.textContent = appointment.date || 'N/A';
                    const timeDiv = document.createElement('div');
                    timeDiv.className = 'time-display';
                    timeDiv.textContent = appointment.time || 'N/A';
                    datetimeCell.appendChild(dateDiv);
                    datetimeCell.appendChild(timeDiv);
                    row.appendChild(datetimeCell);

                    // People Count
                    const peopleCell = document.createElement('td');
                    peopleCell.className = 'people-count';
                    peopleCell.textContent = appointment.peopleCount || 0;
                    row.appendChild(peopleCell);

                    // Status
                    const statusCell = document.createElement('td');
                    const statusSpan = document.createElement('span');
                    const statusValue = appointment.status || 'pending'; // Default to 'pending' if undefined
                    statusSpan.className = 'badge badge-' + statusValue;
                    statusSpan.textContent = getStatusText(statusValue);
                    statusCell.appendChild(statusSpan);
                    row.appendChild(statusCell);

                    // Actions
                    const actionsCell = document.createElement('td');
                    actionsCell.className = 'action-buttons';
                    const viewBtn = document.createElement('button');
                    viewBtn.className = 'btn-action btn-view';
                    viewBtn.textContent = 'Xem';
                    viewBtn.onclick = function() { viewAppointment(appointment.id); };
                    actionsCell.appendChild(viewBtn);

                    if (statusValue === 'pending') {
                        const confirmBtn = document.createElement('button');
                        confirmBtn.className = 'btn-action btn-confirm';
                        confirmBtn.textContent = 'Xác nhận';
                        confirmBtn.onclick = function() { updateStatus(appointment.id, 'confirmed'); };
                        actionsCell.appendChild(confirmBtn);
                    }

                    if (statusValue !== 'cancelled') {
                        const cancelBtn = document.createElement('button');
                        cancelBtn.className = 'btn-action btn-cancel';
                        cancelBtn.textContent = 'Hủy';
                        cancelBtn.onclick = function() { updateStatus(appointment.id, 'cancelled'); };
                        actionsCell.appendChild(cancelBtn);
                    }

                    if (statusValue !== 'completed' && statusValue !== 'cancelled') {
                        const editBtn = document.createElement('button');
                        editBtn.className = 'btn-action btn-edit';
                        editBtn.textContent = 'Sửa';
                        editBtn.onclick = function() { editAppointment(appointment.id); };
                        actionsCell.appendChild(editBtn);
                    }

                    row.appendChild(actionsCell);
                    tableBody.appendChild(row);
                });

                const tableInfo = document.getElementById('tableInfo');
                if (tableInfo) {
                    tableInfo.textContent = 'Hiển thị ' + filteredAppointments.length + ' lịch hẹn';
                }
            }

            // Get status text
            function getStatusText(status) {
                switch (status) {
                    case 'pending': return 'Chờ xác nhận';
                    case 'confirmed': return 'Đã xác nhận';
                    case 'completed': return 'Hoàn thành';
                    case 'cancelled': return 'Đã hủy';
                    default: return 'Không xác định';
                }
            }

            // Search appointments
            function searchAppointments() {
                const customerQuery = document.getElementById('searchCustomer').value.toLowerCase();
                const status = document.getElementById('searchStatus').value;
                const date = document.getElementById('searchDate').value;

                filteredAppointments = appointments.filter(function(appointment) {
                    const matchesCustomer = (appointment.customerName || '').toLowerCase().includes(customerQuery) || 
                                          (appointment.customerPhone || '').includes(customerQuery);
                    const matchesStatus = !status || appointment.status === status;
                    const matchesDate = !date || appointment.date === date;

                    return matchesCustomer && matchesStatus && matchesDate;
                });

                renderAppointments();
            }

            // Reset filters
            function resetFilters() {
                document.getElementById('searchCustomer').value = '';
                document.getElementById('searchStatus').value = '';
                document.getElementById('searchDate').value = '';
                filteredAppointments = [...appointments];
                renderAppointments();
            }

            // Add appointment
            function addAppointment() {
                const customerName = document.getElementById('customerName').value;
                const customerPhone = document.getElementById('customerPhone').value;
                const services = Array.from(document.getElementById('services').selectedOptions).map(function(option) { return option.value; });
                const date = document.getElementById('appointmentDate').value;
                const time = document.getElementById('appointmentTime').value;
                const peopleCount = parseInt(document.getElementById('peopleCount').value);

                if (!customerName || !customerPhone || services.length === 0 || !date || !time || !peopleCount) {
                    alert('Vui lòng điền đầy đủ thông tin!');
                    return;
                }

                const newAppointment = {
                    id: 'APPT' + (appointments.length + 1).toString().padStart(3, '0'),
                    customerName: customerName,
                    customerPhone: customerPhone,
                    services: services,
                    date: date,
                    time: time,
                    peopleCount: peopleCount,
                    status: 'pending'
                };

                appointments.push(newAppointment);
                filteredAppointments = [...appointments];
                updateStats();
                renderAppointments();
            }

            // Reset add modal
            function resetAddModal() {
                document.getElementById('customerName').value = '';
                document.getElementById('customerPhone').value = '';
                document.getElementById('services').value = [];
                document.getElementById('appointmentDate').value = '';
                document.getElementById('appointmentTime').value = '';
                document.getElementById('peopleCount').value = '1';
            }

            // View appointment
            function viewAppointment(id) {
                const appointment = appointments.find(function(a) { return a.id === id; });
                if (!appointment) return;

                document.getElementById('viewAppointmentId').textContent = appointment.id || 'N/A';
                document.getElementById('viewCustomerName').textContent = appointment.customerName || 'N/A';
                document.getElementById('viewCustomerPhone').textContent = appointment.customerPhone || 'N/A';
                document.getElementById('viewAppointmentDate').textContent = appointment.date || 'N/A';
                document.getElementById('viewAppointmentTime').textContent = appointment.time || 'N/A';
                document.getElementById('viewPeopleCount').textContent = appointment.peopleCount || 0;
                document.getElementById('viewStatus').textContent = getStatusText(appointment.status);
                document.getElementById('viewServices').innerHTML = Array.isArray(appointment.services)
                    ? appointment.services.map(function(service) {
                        return '<div class="service-detail"><span>' + service + '</span></div>';
                    }).join('')
                    : 'Không có dịch vụ';

                if (typeof bootstrap !== 'undefined') {
                    const modal = new bootstrap.Modal(document.getElementById('viewAppointmentModal'));
                    modal.show();
                } else {
                    console.error('Bootstrap is not loaded');
                    document.getElementById('viewAppointmentModal').classList.add('show');
                    document.body.classList.add('modal-open');
                    const backdrop = document.createElement('div');
                    backdrop.className = 'modal-backdrop fade show';
                    document.body.appendChild(backdrop);
                }
            }

            // Update appointment status
            function updateStatus(id, newStatus) {
                const appointment = appointments.find(function(a) { return a.id === id; });
                if (!appointment) return;

                if (confirm('Bạn có chắc chắn muốn ' + (newStatus === 'confirmed' ? 'xác nhận' : 'hủy') + ' lịch hẹn này?')) {
                    appointment.status = newStatus;
                    updateStats();
                    renderAppointments();
                }
            }

            // Edit appointment (placeholder for future implementation)
            function editAppointment(id) {
                alert('Chức năng chỉnh sửa đang được phát triển!');
            }

            // Export appointments to CSV
            function exportAppointments() {
                const headers = ['Mã lịch hẹn', 'Khách hàng', 'Số điện thoại', 'Dịch vụ', 'Ngày', 'Giờ', 'Số lượng', 'Trạng thái'];
                const csvContent = [
                    headers.join(','),
                    ...filteredAppointments.map(function(a) {
                        return [
                            a.id || 'N/A',
                            '"' + (a.customerName || 'N/A') + '"',
                            a.customerPhone || 'N/A',
                            '"' + (Array.isArray(a.services) ? a.services.join(';') : '') + '"',
                            a.date || 'N/A',
                            a.time || 'N/A',
                            a.peopleCount || 0,
                            getStatusText(a.status)
                        ].join(',');
                    })
                ].join('\n');

                // Add UTF-8 BOM for better compatibility with Excel
                const bom = '\uFEFF';
                const blob = new Blob([bom + csvContent], { type: 'text/csv;charset=utf-8;' });
                const link = document.createElement('a');
                link.href = URL.createObjectURL(blob);
                link.download = 'appointments.csv';
                link.click();
            }
        </script>
    </body>
</html>