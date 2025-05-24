<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Voucher - Barbershop Admin</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/html.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
        <style>
            
             /* Top Navigation Bar */
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

            .dashboard-layout {
                display: flex;
                min-height: 100vh;
            }

            /* Sidebar - Same as dashboard */
            .sidebar {
                width: 280px;
                background: rgba(29, 29, 27, 0.95);
                backdrop-filter: blur(10px);
                border-right: 2px solid rgba(218, 165, 32, 0.3);
                position: fixed;
                height: 100vh;
                left: 0;
                top: 0;
                z-index: 1000;
                transition: transform 0.3s ease;
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

            .admin-profile {
                position: absolute;
                bottom: 20px;
                left: 20px;
                right: 20px;
                padding: 20px;
                background: rgba(218, 165, 32, 0.1);
                border-radius: 10px;
                border: 1px solid rgba(218, 165, 32, 0.2);
            }

            .admin-avatar {
                width: 50px;
                height: 50px;
                background: linear-gradient(45deg, #DAA520, #B8860B);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 10px;
                font-size: 1.5rem;
                color: #1d1d1b;
            }

            /* Main Content */
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

            /* Search and Filter Section */
            .search-section {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px;
                margin-bottom: 25px;
                border: 1px solid rgba(218, 165, 32, 0.2);
            }

            .search-row {
                display: flex;
                gap: 20px;
                align-items: center;
                flex-wrap: wrap;
            }

            .search-group {
                flex: 1;
                min-width: 200px;
            }

            .search-group label {
                display: block;
                color: #DAA520;
                margin-bottom: 8px;
                font-weight: 600;
                font-size: 0.9rem;
            }

            .search-input, .search-select {
                width: 100%;
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

            /* Voucher Table */
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

            .voucher-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }

            .voucher-table th,
            .voucher-table td {
                padding: 15px 12px;
                text-align: left;
                border-bottom: 1px solid rgba(218, 165, 32, 0.1);
                vertical-align: middle;
            }

            .voucher-table th {
                background: rgba(218, 165, 32, 0.1);
                color: #DAA520;
                font-weight: 600;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .voucher-table td {
                color: #fff;
                font-size: 0.9rem;
            }

            .voucher-table tbody tr {
                transition: all 0.3s ease;
            }

            .voucher-table tbody tr:hover {
                background: rgba(218, 165, 32, 0.05);
            }

            .voucher-id {
                font-family: 'Courier New', monospace;
                color: #DAA520;
                font-weight: 600;
            }

            .voucher-code {
                font-family: 'Courier New', monospace;
                color: #4CAF50;
                font-weight: 600;
                background: rgba(76, 175, 80, 0.1);
                padding: 4px 8px;
                border-radius: 4px;
                border: 1px solid rgba(76, 175, 80, 0.3);
            }

            .voucher-discount {
                color: #FF9800;
                font-weight: 600;
            }

            .voucher-expiry {
                color: #ccc;
            }

            .voucher-expiry.expired {
                color: #f44336;
                font-weight: 600;
            }

            .voucher-expiry.expiring-soon {
                color: #FF9800;
                font-weight: 600;
            }

            .action-buttons {
                display: flex;
                gap: 8px;
            }

            .btn-action {
                padding: 6px 12px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 0.8rem;
                transition: all 0.3s ease;
            }

            .btn-edit {
                background: rgba(255, 152, 0, 0.2);
                color: #FF9800;
                border: 1px solid rgba(255, 152, 0, 0.3);
            }

            .btn-delete {
                background: rgba(244, 67, 54, 0.2);
                color: #f44336;
                border: 1px solid rgba(244, 67, 54, 0.3);
            }

            .btn-deactivate {
                background: rgba(158, 158, 158, 0.2);
                color: #9E9E9E;
                border: 1px solid rgba(158, 158, 158, 0.3);
            }

            .btn-activate {
                background: rgba(76, 175, 80, 0.2);
                color: #4CAF50;
                border: 1px solid rgba(76, 175, 80, 0.3);
            }

            .btn-action:hover {
                transform: translateY(-1px);
            }

            /* Status badges */
            .badge {
                padding: 4px 12px;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .badge-unused {
                background: rgba(76, 175, 80, 0.2);
                color: #4CAF50;
                border: 1px solid rgba(76, 175, 80, 0.3);
            }

            .badge-used {
                background: rgba(158, 158, 158, 0.2);
                color: #9E9E9E;
                border: 1px solid rgba(158, 158, 158, 0.3);
            }

            .badge-expired {
                background: rgba(244, 67, 54, 0.2);
                color: #f44336;
                border: 1px solid rgba(244, 67, 54, 0.3);
            }

            .badge-active {
                background: rgba(33, 150, 243, 0.2);
                color: #2196F3;
                border: 1px solid rgba(33, 150, 243, 0.3);
            }

            .badge-inactive {
                background: rgba(158, 158, 158, 0.2);
                color: #9E9E9E;
                border: 1px solid rgba(158, 158, 158, 0.3);
            }

            /* Pagination */
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 25px;
                gap: 10px;
            }

            .pagination-btn {
                padding: 8px 12px;
                background: rgba(218, 165, 32, 0.1);
                color: #DAA520;
                border: 1px solid rgba(218, 165, 32, 0.3);
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .pagination-btn:hover, .pagination-btn.active {
                background: rgba(218, 165, 32, 0.2);
                transform: translateY(-1px);
            }

            .pagination-info {
                color: #ccc;
                font-size: 0.9rem;
                margin: 0 15px;
            }

            /* Mobile Menu */
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

            /* Statistics Cards */
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-card {
                background: rgba(29, 29, 27, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 25px;
                border: 1px solid rgba(218, 165, 32, 0.2);
                text-align: center;
                transition: transform 0.3s ease;
            }

            .stat-card:hover {
                transform: translateY(-5px);
            }

            .stat-icon {
                font-size: 2.5rem;
                margin-bottom: 15px;
            }

            .stat-number {
                font-size: 2rem;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .stat-label {
                color: #ccc;
                font-size: 0.9rem;
            }

            .stat-card.total .stat-icon { color: #2196F3; }
            .stat-card.total .stat-number { color: #2196F3; }

            .stat-card.active .stat-icon { color: #4CAF50; }
            .stat-card.active .stat-number { color: #4CAF50; }

            .stat-card.used .stat-icon { color: #9E9E9E; }
            .stat-card.used .stat-number { color: #9E9E9E; }

            .stat-card.expired .stat-icon { color: #f44336; }
            .stat-card.expired .stat-number { color: #f44336; }

            /* Responsive */
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

                .search-row {
                    flex-direction: column;
                }

                .table-container {
                    padding: 15px;
                }

                .voucher-table {
                    font-size: 0.8rem;
                }

                .voucher-table th,
                .voucher-table td {
                    padding: 10px 8px;
                }

                .stats-grid {
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                }
            }
        </style>
    </head>
    <body>
        <%@ page contentType="text/html; charset=UTF-8" %>
        
           <!-- Top Navigation Bar -->
        <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
            <div class="container-fluid px-4">
                <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                    <img src="image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <div class="d-flex gap-2 align-items-center">
                        <div class="text-warning d-none d-lg-block me-3">
                            <i class="fas fa-user-shield me-1"></i>
                            <span>${sessionScope.adminName != null ? sessionScope.adminName : 'Admin'}</span>
                        </div>
                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/logout" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?')">
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
            <!-- Sidebar -->
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
                        <a href="${pageContext.request.contextPath}/views/admin/storeManagement.jsp" class="nav-link">
                            <i class="fas fa-store"></i>
                            <span>Quản lý Cửa hàng</span>
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

                <div class="admin-profile">
                    <div class="admin-avatar">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <div style="text-align: center;">
                        <div style="color: #DAA520; font-weight: 600; margin-bottom: 3px;">
                            Admin
                        </div>
                        <div style="color: #999; font-size: 0.8rem;">
                            Quản trị viên
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="main-content">
                <!-- Header -->
                <div class="header">
                    <div>
                        <h1><i class="fas fa-ticket-alt"></i> Quản lý Voucher</h1>
                        <p>Quản lý mã giảm giá và khuyến mãi của hệ thống</p>
                    </div>
                    <div class="header-actions">
                        <a href="#" class="btn btn-primary" onclick="showAddVoucherModal()">
                            <i class="fas fa-plus"></i>
                            Thêm voucher
                        </a>
                        <a href="#" class="btn btn-secondary">
                            <i class="fas fa-download"></i>
                            Xuất báo cáo
                        </a>
                    </div>
                </div>

                <!-- Statistics Cards -->
                <div class="stats-grid">
                    <div class="stat-card total">
                        <div class="stat-icon">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <div class="stat-number" id="totalVouchers">12</div>
                        <div class="stat-label">Tổng voucher</div>
                    </div>
                    <div class="stat-card active">
                        <div class="stat-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stat-number" id="activeVouchers">8</div>
                        <div class="stat-label">Còn hiệu lực</div>
                    </div>
                    <div class="stat-card used">
                        <div class="stat-icon">
                            <i class="fas fa-user-check"></i>
                        </div>
                        <div class="stat-number" id="usedVouchers">3</div>
                        <div class="stat-label">Đã sử dụng</div>
                    </div>
                    <div class="stat-card expired">
                        <div class="stat-icon">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <div class="stat-number" id="expiredVouchers">1</div>
                        <div class="stat-label">Đã hết hạn</div>
                    </div>
                </div>

                <!-- Search and Filter Section -->
                <div class="search-section">
                    <div class="search-row">
                        <div class="search-group">
                            <label for="searchCode">Tìm kiếm theo mã</label>
                            <input type="text" id="searchCode" class="search-input" 
                                   placeholder="Nhập mã voucher..." onkeyup="filterVouchers()">
                        </div>
                        <div class="search-group">
                            <label for="filterStatus">Lọc theo trạng thái</label>
                            <select id="filterStatus" class="search-select" onchange="filterVouchers()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="unused">Chưa sử dụng</option>
                                <option value="used">Đã sử dụng</option>
                                <option value="expired">Hết hạn</option>
                            </select>
                        </div>
                        <div class="search-group">
                            <label for="filterExpiry">Lọc theo hạn sử dụng</label>
                            <select id="filterExpiry" class="search-select" onchange="filterVouchers()">
                                <option value="">Tất cả</option>
                                <option value="valid">Còn hiệu lực</option>
                                <option value="expiring">Sắp hết hạn</option>
                                <option value="expired">Đã hết hạn</option>
                            </select>
                        </div>
                        <div class="search-group">
                            <label for="sortBy">Sắp xếp theo</label>
                            <select id="sortBy" class="search-select" onchange="sortVouchers()">
                                <option value="id">ID</option>