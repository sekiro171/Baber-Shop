<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt lịch giữ chỗ - Cut&Styles Barber</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/booking.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <style>
            /* Staff Selection Styles */
            .staff-selection {
                margin-top: 1rem;
                display: none;
            }
            
            .staff-grid {
                display: flex;
                gap: 1rem;
                overflow-x: auto;
                padding: 1rem 0;
                scrollbar-width: thin;
            }
            
            .staff-card {
                flex: 0 0 auto;
                width: 120px;
                text-align: center;
                border: 2px solid #e0e0e0;
                border-radius: 12px;
                padding: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                background: white;
            }
            
            .staff-card:hover {
                border-color: #007bff;
                box-shadow: 0 4px 12px rgba(0, 123, 255, 0.15);
                transform: translateY(-2px);
            }
            
            .staff-card.selected {
                border-color: #007bff;
                background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
                color: white;
            }
            
            .staff-avatar {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 0.5rem;
                border: 3px solid #f8f9fa;
            }
            
            .staff-card.selected .staff-avatar {
                border-color: white;
            }
            
            .staff-name {
                font-size: 0.9rem;
                font-weight: 500;
                margin-bottom: 0.25rem;
            }
            
            .staff-rating {
                font-size: 0.8rem;
                color: #ffc107;
            }
            
            .staff-card.selected .staff-rating {
                color: #fff3cd;
            }
            
            @media (max-width: 768px) {
                .staff-grid {
                    justify-content: flex-start;
                }
                
                .staff-card {
                    width: 100px;
                    padding: 0.75rem;
                }
                
                .staff-avatar {
                    width: 50px;
                    height: 50px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">                   
                    Cut&Styles Barber
                </a>
                <ul class="nav-links">
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/views/common/aboutUs.jsp">Về chúng tôi</a></li>
                    <li><a class="nav-link" href="${pageContext.request.contextPath}/views/common/franchise.jsp">Nhượng quyền</a></li>
                </ul>
                <div class="auth-buttons">
                    <a class="btn-auth" href="${pageContext.request.contextPath}/views/auth/login.jsp">Đăng nhập</a>
                    <a class="btn-auth" href="${pageContext.request.contextPath}/views/auth/register.jsp">Đăng ký</a>
                </div>
            </div>
        </nav>

        <!-- Background Image Section -->
        <div class="background-section"></div>

        <!-- Main Content -->
        <div class="main-container">
            <div class="booking-card fade-in">
                <!-- Header -->
                <div class="booking-header">
                    <h1 class="booking-title">Đặt lịch giữ chỗ</h1>
                    <p class="booking-subtitle">Đặt lịch nhanh chóng để trải nghiệm dịch vụ cao cấp tại salon của bạn</p>
                </div>

                <!-- Steps -->
                <div class="steps-container">
                    <!-- Step 1: Choose Number of People -->
                    <div class="step">
                        <div class="step-header">
                            <div class="step-number">1</div>
                            <div class="step-title">Chọn số người</div>
                        </div>
                        <div class="step-content">
                            <button class="btn btn-outline btn-full" id="togglePeopleForm">
                                <i class="bi bi-people"></i>
                                Chọn số người sử dụng dịch vụ
                            </button>
                            <div id="peopleForm" class="people-form" style="display: none;">
                                <div class="form-group">
                                    <label class="form-label" for="numPeople">Số người bạn muốn đặt:</label>
                                    <select id="numPeople" class="form-select">
                                        <option value="1">1 người</option>
                                        <option value="2">2 người</option>
                                        <option value="3">3 người</option>
                                        <option value="4">4 người</option>
                                        <option value="5">5 người</option>
                                        <option value="6">6 người</option>
                                        <option value="7">7 người</option>
                                        <option value="8">8 người</option>
                                        <option value="9">9 người</option>
                                        <option value="10">10 người</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2: Choose Service -->
                    <div class="step">
                        <div class="step-header">
                            <div class="step-number">2</div>
                            <div class="step-title">Chọn dịch vụ</div>
                        </div>
                        <div class="step-content">
                            <div id="serviceList" class="service-list"></div>
                            <a href="${pageContext.request.contextPath}/views/service/services.jsp" class="btn btn-secondary btn-full" style="margin-top: 1rem;">
                                <i class="bi bi-scissors"></i>
                                Chọn thêm dịch vụ
                            </a>
                        </div>
                    </div>

                    <!-- Step 3: Choose Date, Time & Stylist -->
                    <div class="step">
                        <div class="step-header">
                            <div class="step-number">3</div>
                            <div class="step-title">Chọn ngày, giờ & stylist</div>
                        </div>
                        <div class="step-content">
                            <div class="datetime-container">
                                <div class="date-picker-row">
                                    <div class="date-input-group">
                                        <i class="bi bi-calendar3"></i>
                                        <input type="date" id="bookingDate" class="date-input">
                                    </div>
                                    <button class="btn btn-weekend" id="weekendBtn">
                                        <i class="bi bi-calendar2-week"></i>
                                        <span id="dayType">Ngày thường</span>
                                    </button>
                                </div>
                                <button class="btn btn-outline btn-full" id="toggleTimeGrid">
                                    <i class="bi bi-clock"></i>
                                    <span id="toggleTimeText">Xem khung giờ</span>
                                </button>
                                <div class="time-grid" id="timeSlots" style="display: none;"></div>
                                
                                <!-- Staff Selection -->
                                <button class="btn btn-outline btn-full" id="toggleStaffSelection" style="margin-top: 1rem;">
                                    <i class="bi bi-person-badge"></i>
                                    <span id="toggleStaffText">Chọn nhân viên</span>
                                </button>
                                <div class="staff-selection" id="staffSelection">
                                    <div class="staff-grid" id="staffGrid"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Confirm Section -->
                <div class="confirm-section">
                    <button type="button" class="btn btn-primary btn-full pulse" id="confirmBtn" disabled>
                        <i class="bi bi-check-circle"></i>
                        Xác nhận đặt lịch
                    </button>
                </div>
            </div>
        </div>

        <!-- Hidden Form for Submission -->
        <form id="bookingForm" action="${pageContext.request.contextPath}/BookingServlet" method="post">
            <input type="hidden" name="numberOfPeople" id="hiddenNumberOfPeople">
            <input type="hidden" name="appointmentDate" id="hiddenAppointmentDate">
            <input type="hidden" name="appointmentTime" id="hiddenAppointmentTime">
            <input type="hidden" name="customerId" id="hiddenCustomerId" value="${sessionScope.customerId}">
            <input type="hidden" name="staffId" id="hiddenStaffId">
            <!-- serviceId inputs will be added dynamically -->
        </form>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div>
                    <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Cut&Styles Logo" class="footer-logo">
                </div>
                <div>
                    <h4 class="footer-title">Liên kết nhanh</h4>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/views/common/aboutUs.jsp">Về chúng tôi</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/common/franchise.jsp">Liên hệ nhượng quyền</a></li>
                        <li><a href="${pageContext.request.contextPath}/views/commit/support.jsp">Chính sách cam kết</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="footer-title">Thông tin liên hệ</h4>
                    <div class="footer-contact">
                        <p><i class="bi bi-geo-alt-fill"></i> Khu đô thị FPT city, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng</p>
                        <p><i class="bi bi-telephone-fill"></i> Liên hệ học nghề tóc: 0774511941</p>
                        <p><i class="bi bi-clock-fill"></i> Giờ phục vụ: Thứ 2 đến Chủ Nhật, 8h30 - 20h30</p>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>© 2025 Cut&Styles Barber. Tất cả quyền được bảo lưu.</p>
            </div>
        </footer>

        <script>
            const container = document.getElementById("timeSlots");
            const confirmBtn = document.getElementById("confirmBtn");
            const bookingDate = document.getElementById("bookingDate");
            const weekendBtn = document.getElementById("weekendBtn");
            const dayType = document.getElementById("dayType");
            const togglePeopleForm = document.getElementById("togglePeopleForm");
            const peopleForm = document.getElementById("peopleForm");
            const toggleTimeGrid = document.getElementById("toggleTimeGrid");
            const toggleTimeText = document.getElementById("toggleTimeText");
            const serviceList = document.getElementById("serviceList");
            const toggleStaffSelection = document.getElementById("toggleStaffSelection");
            const staffSelection = document.getElementById("staffSelection");
            const toggleStaffText = document.getElementById("toggleStaffText");
            const staffGrid = document.getElementById("staffGrid");

            const startHour = 8.5; // 8:30 AM
            const endHour = 20.5;  // 8:30 PM

            // Sample staff data
            const staffData = [
                { id: 1, name: "Anh Tuấn", avatar: "<%=request.getContextPath()%>/image/staff/staff1.jpg", rating: "4.9★" },
                { id: 2, name: "Anh Minh", avatar: "<%=request.getContextPath()%>/image/staff/staff2.jpg", rating: "4.8★" },
                { id: 3, name: "Chị Lan", avatar: "<%=request.getContextPath()%>/image/staff/staff3.jpg", rating: "4.9★" },
                { id: 4, name: "Anh Đức", avatar: "<%=request.getContextPath()%>/image/staff/staff4.jpg", rating: "4.7★" },
                { id: 5, name: "Chị Hương", avatar: "<%=request.getContextPath()%>/image/staff/staff5.jpg", rating: "4.8★" }
            ];

            let selectedStaff = null;
            let selectedTime = null;
            let selectedServices = [];
            let selectedDate = null;

            // Set date constraints
            const today = new Date();
            today.setHours(0, 0, 0, 0);
            const maxDate = new Date();
            maxDate.setDate(today.getDate() + 3);
            bookingDate.min = today.toISOString().split("T")[0];
            bookingDate.max = maxDate.toISOString().split("T")[0];

            // Update day type
            function updateDayType(selectedDate) {
                const day = selectedDate.getDay();
                dayType.textContent = (day === 0 || day === 6) ? "Cuối tuần" : "Ngày thường";
            }

            // Show available times
            function showAvailableTimes(selectedDate) {
                container.style.display = "grid";
                container.classList.add("expanded");
                toggleTimeText.textContent = "Thu gọn khung giờ";
                container.innerHTML = '';

                const now = new Date();
                const currentTime = now.getHours() * 60 + now.getMinutes();
                const selectedDateMidnight = new Date(selectedDate);
                selectedDateMidnight.setHours(0, 0, 0, 0);

                for (let hour = Math.floor(startHour); hour <= Math.floor(endHour); hour++) {
                    for (let minute of [0, 30]) {
                        if (hour === Math.floor(startHour) && minute < (startHour % 1) * 60) continue;
                        if (hour === Math.floor(endHour) && minute > (endHour % 1) * 60) continue;

                        const label = hour.toString().padStart(2, '0') + ':' + (minute === 0 ? '00' : '30');
                        const timeValue = hour * 60 + minute;
                        const isToday = selectedDateMidnight.toDateString() === today.toDateString();
                        const isEnabled = isToday ? (timeValue > currentTime) : true;

                        const btn = document.createElement("button");
                        btn.className = "time-slot" + (isEnabled ? "" : " disabled");
                        btn.innerText = label;
                        if (!isEnabled) btn.disabled = true;

                        if (isEnabled) {
                            btn.addEventListener("click", () => {
                                document.querySelectorAll(".time-slot").forEach(b => b.classList.remove("selected"));
                                btn.classList.add("selected");
                                selectedTime = label;
                                checkFormComplete();
                            });
                        }

                        container.appendChild(btn);
                    }
                }
            }

            // Initialize staff grid
            function initializeStaffGrid() {
                staffGrid.innerHTML = '';
                staffData.forEach(staff => {
                    const staffCard = document.createElement("div");
                    staffCard.className = "staff-card";
                    staffCard.innerHTML = `
                        <img src="${staff.avatar}" alt="${staff.name}" class="staff-avatar" onerror="this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjAiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCA2MCA2MCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iNjAiIGhlaWdodD0iNjAiIGZpbGw9IiNGMkYyRjIiLz48cGF0aCBkPSJNMTkuNSA0Mi41QzE5LjUgNDQuMDg5OCAyMC43NDAxIDQ1LjM1IDIyLjMyIDQ1LjM1SDQyLjY4QzQ0LjI1OTkgNDUuMzUgNDUuNSA0NC4wODk4IDQ1LjUgNDIuNVY0MC41QzQ1LjUgMzguOTEwMiA0NC4yNTk5IDM3LjY1IDQyLjY4IDM3LjY1SDIyLjMyQzIwLjc0MDEgMzcuNjUgMTkuNSA0OC45MTAyIDE5LjUgNDAuNVY0Mi41WiIgZmlsbD0iI0Q5RDlEOSIvPjxwYXRoIGQ9Ik0zMi41IDE5LjVDMjcuODYzIDE5LjUgMjQuMDUgMjMuMzEzMiAyNC4wNSAyNy45NUMyNC4wNSAzMi41ODY4IDI3Ljg2MyAzNi40IDMyLjUgMzYuNFMzOC45NSAzMi41ODY4IDM4Ljk1IDI3Ljk1QzM4Ljk1IDIzLjMxMzIgMzUuMTM3IDE9LjUgMzIuNSAxOS41WiIgZmlsbD0iI0Q5RDlEOSIvPjwvc3ZnPg=='">
                        <div class="staff-name">${staff.name}</div>
                        <div class="staff-rating">${staff.rating}</div>
                    `;

                    staffCard.addEventListener("click", () => {
                        document.querySelectorAll(".staff-card").forEach(card => card.classList.remove("selected"));
                        staffCard.classList.add("selected");
                        selectedStaff = staff;
                        checkFormComplete();
                    });

                    staffGrid.appendChild(staffCard);
                });
            }

            // Check if selections are complete
            function checkFormComplete() {
                const hasSelectedTime = selectedTime !== null;
                const hasSelectedStaff = selectedStaff !== null;
                const hasSelectedServices = selectedServices.length > 0;
                const hasSelectedPeople = document.getElementById("numPeople").value !== "";
                const hasSelectedDate = bookingDate.value !== "";

                if (hasSelectedTime && hasSelectedStaff && hasSelectedServices && hasSelectedPeople && hasSelectedDate) {
                    confirmBtn.disabled = false;
                } else {
                    confirmBtn.disabled = true;
                }
            }

            // Date change handler
            bookingDate.addEventListener("change", () => {
                selectedDate = bookingDate.value;
                const selectedDateObj = new Date(bookingDate.value);
                const selectedDateMidnight = new Date(selectedDateObj);
                selectedDateMidnight.setHours(0, 0, 0, 0);

                if (selectedDateMidnight >= today && selectedDateMidnight <= maxDate) {
                    updateDayType(selectedDateObj);
                    showAvailableTimes(selectedDateObj);
                    checkFormComplete();
                } else {
                    alert("Vui lòng chọn ngày trong phạm vi từ hôm nay đến 3 ngày tới.");
                    bookingDate.value = '';
                    selectedDate = null;
                    container.style.display = "none";
                    container.classList.remove("expanded");
                    toggleTimeText.textContent = "Xem khung giờ";
                    checkFormComplete();
                }
            });

            // Weekend button handler
            weekendBtn.addEventListener("click", () => {
                const now = new Date();
                const day = now.getDay();
                const diff = (6 - day + 7) % 7 || 7;
                const nextSaturday = new Date(now);
                nextSaturday.setDate(now.getDate() + diff);
                nextSaturday.setHours(0, 0, 0, 0);
                bookingDate.valueAsDate = nextSaturday;
                selectedDate = bookingDate.value;
                updateDayType(nextSaturday);
                showAvailableTimes(nextSaturday);
                checkFormComplete();
            });

            // Toggle people form
            togglePeopleForm.addEventListener("click", () => {
                peopleForm.style.display = peopleForm.style.display === "none" ? "block" : "none";
            });

            // Toggle time grid
            toggleTimeGrid.addEventListener("click", () => {
                if (container.classList.contains("expanded")) {
                    container.classList.remove("expanded");
                    container.style.display = "none";
                    toggleTimeText.textContent = "Xem khung giờ";
                } else if (bookingDate.value) {
                    container.classList.add("expanded");
                    container.style.display = "grid";
                    toggleTimeText.textContent = "Thu gọn khung giờ";
                }
            });

            // Toggle staff selection
            toggleStaffSelection.addEventListener("click", () => {
                if (staffSelection.style.display === "none" || staffSelection.style.display === "") {
                    staffSelection.style.display = "block";
                    toggleStaffText.textContent = "Ẩn danh sách nhân viên";
                    initializeStaffGrid();
                } else {
                    staffSelection.style.display = "none";
                    toggleStaffText.textContent = "Chọn nhân viên";
                }
            });

            // Update check form when number of people changes
            document.getElementById("numPeople").addEventListener("change", () => {
                checkFormComplete();
            });

            // Confirm booking handler
            confirmBtn.addEventListener("click", (e) => {
                e.preventDefault();

                const form = document.getElementById('bookingForm');

                // Clear existing serviceId inputs
                form.querySelectorAll('input[name="serviceId"]').forEach(input => input.remove());

                // Add new serviceId inputs for each selected service
                selectedServices.forEach(service => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'serviceId';
                    input.value = service.id;
                    form.appendChild(input);
                });

                // Set other fields
                document.getElementById('hiddenNumberOfPeople').value = document.getElementById('numPeople').value;
                document.getElementById('hiddenStaffId').value = selectedStaff.id;
                document.getElementById('hiddenAppointmentDate').value = selectedDate || bookingDate.value;
                document.getElementById('hiddenAppointmentTime').value = selectedTime;

                // Debugging: Log form data to ensure values are set
                console.log('Form Data:');
                console.log('Number of People:', document.getElementById('hiddenNumberOfPeople').value);
                console.log('Appointment Date:', document.getElementById('hiddenAppointmentDate').value);
                console.log('Appointment Time:', document.getElementById('hiddenAppointmentTime').value);
                console.log('Customer ID:', document.getElementById('hiddenCustomerId').value);
                console.log('Staff ID:', document.getElementById('hiddenStaffId').value);
                console.log('Service IDs:', selectedServices.map(s => s.id));

                // Submit the form to BookingServlet
                form.submit();
            });

            // Display selected services from sessionStorage
            window.addEventListener("load", () => {
                selectedServices = JSON.parse(sessionStorage.getItem("selectedServices") || "[]");
                if (selectedServices.length > 0) {
                    serviceList.innerHTML = "<h4>Dịch vụ đã chọn:</h4><ul>";
                    selectedServices.forEach(service => {
                        serviceList.innerHTML += `<li class="service-item"><span class="service-name">${service.name}</span><span class="service-price">${service.price.toLocaleString('vi-VN')} VNĐ</span></li>`;
                    });
                    serviceList.innerHTML += "</ul>";
                } else {
                    serviceList.innerHTML = "<p>Chưa có dịch vụ nào được chọn. Vui lòng chọn dịch vụ từ trang dịch vụ.</p>";
                }
                checkFormComplete();
            });

            // Scroll staff grid on mobile with touch
            let isDown = false;
            let startX;
            let scrollLeft;

            staffGrid.addEventListener('mousedown', (e) => {
                isDown = true;
                startX = e.pageX - staffGrid.offsetLeft;
                scrollLeft = staffGrid.scrollLeft;
            });

            staffGrid.addEventListener('mouseleave', () => {
                isDown = false;
            });

            staffGrid.addEventListener('mouseup', () => {
                isDown = false;
            });

            staffGrid.addEventListener('mousemove', (e) => {
                if (!isDown) return;
                e.preventDefault();
                const x = e.pageX - staffGrid.offsetLeft;
                const walk = (x - startX) * 2;
                staffGrid.scrollLeft = scrollLeft - walk;
            });
        </script>
    </body>
</html>