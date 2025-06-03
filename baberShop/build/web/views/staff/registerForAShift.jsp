<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký Lịch Làm Việc - Barbershop Staff</title>
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
            padding: 20px; /* Reduced padding for compactness */
        }

        .header {
            background: rgba(29, 29, 27, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 10px; /* Reduced radius */
            padding: 15px 20px; /* Reduced padding */
            margin-bottom: 20px; /* Reduced margin */
            border: 1px solid rgba(218, 165, 32, 0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 1.8rem; /* Reduced font size */
            color: #DAA520;
            margin-bottom: 5px; /* Reduced margin */
        }

        .header p {
            color: #ccc;
            font-size: 0.9rem; /* Reduced font size */
        }

        .schedule-container {
            background: rgba(29, 29, 27, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 10px; /* Reduced radius */
            padding: 15px; /* Reduced padding */
            border: 1px solid rgba(218, 165, 32, 0.2);
            margin-bottom: 15px; /* Reduced margin */
        }

        .month-selector {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 15px; /* Reduced margin */
            gap: 10px; /* Reduced gap */
        }

        .month-nav-btn {
            background: rgba(218, 165, 32, 0.2);
            border: 1px solid rgba(218, 165, 32, 0.3);
            color: #DAA520;
            padding: 8px 12px; /* Reduced padding */
            border-radius: 6px; /* Reduced radius */
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem; /* Reduced font size */
        }

        .month-nav-btn:hover {
            background: rgba(218, 165, 32, 0.3);
            transform: translateY(-2px);
        }

        .current-month {
            font-size: 1.2rem; /* Reduced font size */
            font-weight: 600;
            color: #DAA520;
            min-width: 150px; /* Reduced width */
            text-align: center;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px; /* Reduced gap */
            margin-bottom: 15px; /* Reduced margin */
        }

        .calendar-header {
            text-align: center;
            padding: 8px 5px; /* Reduced padding */
            font-weight: 600;
            color: #DAA520;
            background: rgba(218, 165, 32, 0.1);
            border-radius: 6px; /* Reduced radius */
            font-size: 0.8rem; /* Reduced font size */
        }

        .calendar-day {
            aspect-ratio: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 6px; /* Reduced radius */
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            font-weight: 500;
            border: 2px solid transparent;
            font-size: 0.9rem; /* Reduced font size */
        }

        .calendar-day:not(.disabled):not(.other-month) {
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
        }

        .calendar-day:not(.disabled):not(.other-month):hover {
            background: rgba(218, 165, 32, 0.2);
            transform: scale(1.05);
        }

        .calendar-day.selected {
            background: linear-gradient(45deg, #DAA520, #B8860B);
            color: #1d1d1b;
            font-weight: 600;
            border-color: #DAA520;
        }

        .calendar-day.disabled {
            background: rgba(244, 67, 54, 0.2);
            color: #F44336;
            cursor: not-allowed;
        }

        .calendar-day.other-month {
            color: #666;
            cursor: not-allowed;
        }

        .calendar-day.full {
            background: rgba(255, 152, 0, 0.2);
            color: #FF9800;
            cursor: not-allowed;
        }

        .day-count {
            position: absolute;
            top: -4px; /* Adjusted position */
            right: -4px; /* Adjusted position */
            background: #F44336;
            color: white;
            border-radius: 50%;
            font-size: 0.6rem; /* Reduced font size */
            min-width: 14px; /* Reduced size */
            height: 14px; /* Reduced size */
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        .info-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Reduced minmax */
            gap: 15px; /* Reduced gap */
            margin-bottom: 15px; /* Reduced margin */
        }

        .info-card {
            background: rgba(29, 29, 27, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 10px; /* Reduced radius */
            padding: 15px; /* Reduced padding */
            border: 1px solid rgba(218, 165, 32, 0.2);
            text-align: center;
        }

        .info-card h3 {
            color: #DAA520;
            font-size: 1rem; /* Reduced font size */
            margin-bottom: 8px; /* Reduced margin */
        }

        .info-card .value {
            font-size: 1.5rem; /* Reduced font size */
            font-weight: 600;
            margin-bottom: 5px;
        }

        .info-card .description {
            color: #ccc;
            font-size: 0.8rem; /* Reduced font size */
        }

        .btn {
            padding: 10px 20px; /* Reduced padding */
            border: none;
            border-radius: 6px; /* Reduced radius */
            cursor: pointer;
            font-size: 0.9rem; /* Reduced font size */
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px; /* Reduced gap */
        }

        .btn-primary {
            background: linear-gradient(45deg, #DAA520, #B8860B);
            color: #1d1d1b;
            font-weight: 600;
        }

        .btn-primary:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(218, 165, 32, 0.4);
        }

        .btn-primary:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-secondary {
            background: rgba(218, 165, 32, 0.1);
            color: #DAA520;
            border: 1px solid rgba(218, 165, 32, 0.3);
        }

        .btn-secondary:hover {
            background: rgba(218, 165, 32, 0.2);
        }

        .legend {
            display: flex;
            flex-wrap: wrap;
            gap: 15px; /* Reduced gap */
            justify-content: center;
            margin-bottom: 15px; /* Reduced margin */
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 6px; /* Reduced gap */
            font-size: 0.8rem; /* Reduced font size */
        }

        .legend-color {
            width: 16px; /* Reduced size */
            height: 16px; /* Reduced size */
            border-radius: 3px; /* Reduced radius */
        }

        .mobile-menu-btn {
            display: none;
            position: fixed;
            top: 80px;
            left: 20px;
            z-index: 1001;
            background: rgba(29, 29, 27, 0.9);
            color: #DAA520;
            border: none;
            padding: 8px; /* Reduced padding */
            border-radius: 4px; /* Reduced radius */
            font-size: 1rem; /* Reduced font size */
        }

        .action-buttons {
            display: flex;
            gap: 10px; /* Reduced gap */
            justify-content: center;
            flex-wrap: wrap;
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
                padding: 60px 15px 15px; /* Reduced padding */
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px; /* Reduced gap */
            }

            .month-selector {
                flex-direction: column;
                gap: 10px; /* Reduced gap */
            }

            .current-month {
                font-size: 1rem; /* Reduced font size */
            }

            .calendar-grid {
                gap: 3px; /* Reduced gap */
            }

            .calendar-day {
                font-size: 0.8rem; /* Reduced font size */
            }

            .info-cards {
                grid-template-columns: 1fr;
            }
        }

        .calendar-day:focus {
            outline: 2px solid #DAA520;
            outline-offset: 2px;
        }

        .toast {
            position: fixed;
            bottom: 15px; /* Reduced position */
            right: 15px; /* Reduced position */
            min-width: 200px; /* Reduced width */
            z-index: 2000;
            display: none;
        }

        .toast.show {
            display: block;
            animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); } /* Reduced translate */
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeOut {
            from { opacity: 1; transform: translateY(0); }
            to { opacity: 0; transform: translateY(15px); } /* Reduced translate */
        }

        .spinner {
            display: none;
            width: 1.2rem; /* Reduced size */
            height: 1.2rem; /* Reduced size */
            border: 2px solid #DAA520;
            border-top-color: transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-left: 6px; /* Reduced margin */
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
        <div class="container-fluid px-4">
            <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Logo Barbershop" width="55" height="55" class="me-2">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <div class="d-flex gap-2 align-items-center">
                    <div class="text-warning d-none d-lg-block me-3">
                        <i class="fas fa-user-tie me-1"></i>
                        <span class="me-3" style="color: #FF9900"> Nhân viên: <strong>${sessionScope.staff.lastName} ${sessionScope.staff.firstName}</strong></span>
                    </div>
                    <a class="btn btn-warning" href="${pageContext.request.contextPath}/logout" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?')" aria-label="Đăng xuất">
                        <i class="fas fa-sign-out-alt me-1"></i>
                        Đăng xuất
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <button class="mobile-menu-btn" onclick="toggleSidebar()" aria-label="Mở/đóng menu">
        <i class="fas fa-bars"></i>
    </button>

    <div class="dashboard-layout">
        <nav class="sidebar" id="sidebar" aria-label="Menu điều hướng">
            <div class="sidebar-header">
                <div class="logo">
                    <i class="fas fa-cut"></i>
                </div>
                <div class="logo-text">BarberShop Pro</div>
                <div class="logo-subtitle">Staff Dashboard</div>
            </div>
            <div class="nav-menu">
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/views/staff/dashboard.jsp" class="nav-link" aria-label="Trang tổng quan">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/views/staff/registerForAShift.jsp" class="nav-link active" aria-label="Đăng ký lịch làm việc">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Đăng ký Lịch Làm</span>
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/views/staff/appointments.jsp" class="nav-link" aria-label="Lịch hẹn của tôi">
                        <i class="fas fa-clock"></i>
                        <span>Lịch Hẹn của Tôi</span>
                    </a>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/views/staff/profile.jsp" class="nav-link" aria-label="Thông tin cá nhân">
                        <i class="fas fa-user"></i>
                        <span>Thông Tin Cá Nhân</span>
                    </a>
                </div>
            </div>
        </nav>

        <main class="main-content" aria-label="Nội dung chính">
            <div class="header">
                <div>
                    <h1><i class="fas fa-calendar-alt"></i> Đăng ký Lịch Làm Việc</h1>
                    <p>Chọn tối đa 4 ngày nghỉ trong tháng</p>
                </div>
            </div>

            <div class="info-cards">
                <div class="info-card">
                    <h3>Ngày Nghỉ Đã Chọn</h3>
                    <div class="value" id="selectedCount">0</div>
                    <div class="description">/ 4 ngày cho phép</div>
                </div>
                <div class="info-card">
                    <h3>Tháng Hiện Tại</h3>
                    <div class="value" id="currentMonthDisplay">--</div>
                    <div class="description">Đang đăng ký</div>
                </div>
                <div class="info-card">
                    <h3>Trạng Thái</h3>
                    <div class="value" id="statusDisplay">Chưa Hoàn Thành</div>
                    <div class="description">Lịch làm việc</div>
                </div>
            </div>

            <div class="schedule-container">
                <div class="month-selector">
                    <button class="month-nav-btn" onclick="previousMonth()" aria-label="Tháng trước">
                        <i class="fas fa-chevron-left"></i> Tháng Trước
                    </button>
                    <div class="current-month" id="monthYear"></div>
                    <button class="month-nav-btn" onclick="nextMonth()" aria-label="Tháng sau">
                        Tháng Sau <i class="fas fa-chevron-right"></i>
                    </button>
                </div>

                <div class="legend" aria-label="Chú thích lịch">
                    <div class="legend-item">
                        <div class="legend-color" style="background: rgba(255, 255, 255, 0.05);"></div>
                        <span>Ngày có thể chọn</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background: linear-gradient(45deg, #DAA520, #B8860B);"></div>
                        <span>Ngày nghỉ đã chọn</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background: rgba(255, 152, 0, 0.2);"></div>
                        <span>Đã đủ 2 người đăng ký</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background: rgba(244, 67, 54, 0.2);"></div>
                        <span>Không thể chọn</span>
                    </div>
                </div>

                <div class="calendar-grid" id="calendarGrid" role="grid" aria-label="Lịch tháng"></div>

                <div class="action-buttons">
                    <button class="btn btn-secondary" onclick="clearSelection()" aria-label="Xóa tất cả lựa chọn">
                        <i class="fas fa-undo"></i>
                        Xóa Tất Cả
                    </button>
                    <button class="btn btn-primary" id="saveBtn" onclick="saveSchedule()" disabled aria-label="Lưu lịch nghỉ">
                        <i class="fas fa-save"></i>
                        Lưu Lịch Nghỉ
                        <span class="spinner" id="saveSpinner"></span>
                    </button>
                </div>
            </div>

            <!-- Toast Notification -->
            <div class="toast" id="toastNotification" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-body bg-dark text-white">
                    <span id="toastMessage"></span>
                </div>
            </div>
        </main>
    </div>

    <script>
        class ScheduleManager {
            constructor() {
                // Set current date to May 25, 2025, 10:32 AM +07
                this.currentDate = new Date('2025-05-25T10:32:00+07:00');
                this.selectedDays = [];
                this.maxSelections = 4;
                this.dayRegistrations = {
                    '2025-05-15': 2,
                    '2025-05-20': 1,
                    '2025-05-25': 2,
                    '2025-06-10': 1,
                    '2025-06-15': 2,
                };
                this.disallowedDays = [
                    '2025-05-01', // Labor Day
                    '2025-09-02', // National Day
                ];
                this.monthNames = [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                    'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
                ];
                this.init();
            }

            init() {
                document.addEventListener('DOMContentLoaded', () => {
                    this.updateCalendar();
                    this.updateStatus();
                });
            }

            toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                if (sidebar) {
                    sidebar.classList.toggle('active');
                }
            }

            formatDateString(date) {
                const year = date.getFullYear();
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const day = String(date.getDate()).padStart(2, '0');
                return `${year}-${month}-${day}`;
            }

            showToast(message, type = 'success') {
                const toast = document.getElementById('toastNotification');
                const toastMessage = document.getElementById('toastMessage');
                toastMessage.textContent = message;
                toast.className = "toast bg-" + (type === "success" ? "success" : "danger") + " show";
                setTimeout(() => {
                    toast.className = 'toast';
                }, 3000);
            }

            updateCalendar() {
                const year = this.currentDate.getFullYear();
                const month = this.currentDate.getMonth();
                const calendarGrid = document.getElementById('calendarGrid');
                calendarGrid.innerHTML = '';

                // Update month display using JavaScript
                document.getElementById('monthYear').textContent = this.monthNames[month] + ' ' + year;
                document.getElementById('currentMonthDisplay').textContent = (month + 1) + '/' + year;

                // Add day headers
                const dayHeaders = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
                dayHeaders.forEach(day => {
                    const header = document.createElement('div');
                    header.className = 'calendar-header';
                    header.textContent = day;
                    calendarGrid.appendChild(header);
                });

                // Generate calendar days
                const firstDay = new Date(year, month, 1);
                const lastDay = new Date(year, month + 1, 0);
                const startDate = new Date(firstDay);
                startDate.setDate(startDate.getDate() - firstDay.getDay());

                for (let i = 0; i < 42; i++) {
                    const day = new Date(startDate);
                    day.setDate(startDate.getDate() + i);

                    const dayElement = document.createElement('div');
                    dayElement.className = 'calendar-day';
                    dayElement.textContent = day.getDate();
                    dayElement.setAttribute('role', 'gridcell');
                    dayElement.setAttribute('aria-label', 'Ngày ' + day.getDate() + ' ' + this.monthNames[month] + ' ' + year);

                    const dateString = this.formatDateString(day);
                    const isCurrentMonth = day.getMonth() === month;
                    const isPastDay = day < new Date('2025-05-25T10:32:00+07:00').setHours(0, 0, 0, 0);
                    const isSunday = day.getDay() === 0;
                    const isDisallowed = this.disallowedDays.includes(dateString);
                    const registrationCount = this.dayRegistrations[dateString] || 0;
                    const isFull = registrationCount >= 2;
                    const isSelected = this.selectedDays.includes(dateString);

                    if (!isCurrentMonth) {
                        dayElement.classList.add('other-month');
                        dayElement.setAttribute('aria-disabled', 'true');
                    } else if (isPastDay || isSunday || isDisallowed) {
                        dayElement.classList.add('disabled');
                        dayElement.setAttribute('aria-disabled', 'true');
                    } else if (isFull && !isSelected) {
                        dayElement.classList.add('full');
                        dayElement.setAttribute('aria-disabled', 'true');
                        const countIndicator = document.createElement('div');
                        countIndicator.className = 'day-count';
                        countIndicator.textContent = registrationCount;
                        dayElement.appendChild(countIndicator);
                    } else {
                        dayElement.tabIndex = 0;
                        dayElement.onclick = () => this.toggleDaySelection(dateString, dayElement);
                        dayElement.onkeydown = (e) => {
                            if (e.key === 'Enter' || e.key === ' ') {
                                e.preventDefault();
                                this.toggleDaySelection(dateString, dayElement);
                            }
                        };
                        if (registrationCount > 0) {
                            const countIndicator = document.createElement('div');
                            countIndicator.className = 'day-count';
                            countIndicator.textContent = registrationCount;
                            countIndicator.style.background = '#FF9800';
                            dayElement.appendChild(countIndicator);
                        }
                    }

                    if (isSelected) {
                        dayElement.classList.add('selected');
                        dayElement.setAttribute('aria-selected', 'true');
                    }

                    calendarGrid.appendChild(dayElement);
                }
            }

            toggleDaySelection(dateString, element) {
                const index = this.selectedDays.indexOf(dateString);
                if (index > -1) {
                    this.selectedDays.splice(index, 1);
                    element.classList.remove('selected');
                    element.setAttribute('aria-selected', 'false');
                    this.showToast('Đã bỏ chọn ngày ' + dateString);
                } else {
                    if (this.selectedDays.length >= this.maxSelections) {
                        this.showToast('Bạn chỉ có thể chọn tối đa ' + this.maxSelections + ' ngày nghỉ!', 'danger');
                        return;
                    }
                    this.selectedDays.push(dateString);
                    element.classList.add('selected');
                    element.setAttribute('aria-selected', 'true');
                    this.showToast('Đã chọn ngày ' + dateString);
                }
                this.updateStatus();
            }

            updateStatus() {
                const selectedCount = document.getElementById('selectedCount');
                const statusDisplay = document.getElementById('statusDisplay');
                const saveBtn = document.getElementById('saveBtn');

                selectedCount.textContent = this.selectedDays.length;

                if (this.selectedDays.length === 0) {
                    statusDisplay.textContent = 'Chưa Chọn';
                    statusDisplay.style.color = '#ccc';
                    saveBtn.disabled = true;
                } else if (this.selectedDays.length === this.maxSelections) {
                    statusDisplay.textContent = 'Hoàn Thành';
                    statusDisplay.style.color = '#4CAF50';
                    saveBtn.disabled = false;
                } else {
                    statusDisplay.textContent = 'Đang Chọn';
                    statusDisplay.style.color = '#FF9800';
                    saveBtn.disabled = false;
                }
            }

            previousMonth() {
                this.currentDate.setMonth(this.currentDate.getMonth() - 1);
                this.selectedDays = [];
                this.updateCalendar();
                this.updateStatus();
            }

            nextMonth() {
                this.currentDate.setMonth(this.currentDate.getMonth() + 1);
                this.selectedDays = [];
                this.updateCalendar();
                this.updateStatus();
            }

            clearSelection() {
                if (this.selectedDays.length > 0 && confirm('Bạn có chắc chắn muốn xóa tất cả ngày đã chọn?')) {
                    this.selectedDays = [];
                    this.updateCalendar();
                    this.updateStatus();
                    this.showToast('Đã xóa tất cả ngày đã chọn');
                }
            }

            saveSchedule() {
                if (this.selectedDays.length === 0) {
                    this.showToast('Vui lòng chọn ít nhất 1 ngày nghỉ!', 'danger');
                    return;
                }
                this.showToast('Lưu lịch nghỉ (chỉ giao diện, backend chưa kết nối)', 'success');
                // Placeholder for backend integration
            }
        }

        // Initialize ScheduleManager
        const scheduleManager = new ScheduleManager();

        // Expose methods to global scope for HTML event handlers
        window.toggleSidebar = () => scheduleManager.toggleSidebar();
        window.previousMonth = () => scheduleManager.previousMonth();
        window.nextMonth = () => scheduleManager.nextMonth();
        window.clearSelection = () => scheduleManager.clearSelection();
        window.saveSchedule = () => scheduleManager.saveSchedule();
    </script>
</body>
</html>