<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt lịch giữ chỗ - Cut&Styles Barber</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/booking.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <%@ include file="/views/common/navbar.jsp" %>
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
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Confirm Section -->
                <div class="confirm-section">
                    <button class="btn btn-primary btn-full pulse" id="confirmBtn" disabled>
                        <i class="bi bi-check-circle"></i>
                        Xác nhận đặt lịch
                    </button>
                    <p class="note">
                        <i class="bi bi-info-circle"></i>
                        Thanh toán sau khi hoàn tất, hủy lịch miễn phí
                    </p>
                </div>
            </div>
        </div>

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

            const startHour = 8.5; // 8:30 AM
            const endHour = 20.5;  // 8:30 PM

            // Set date constraints
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Reset time to midnight for date comparison
            const maxDate = new Date();
            maxDate.setDate(today.getDate() + 3);
            bookingDate.min = today.toISOString().split("T")[0];
            bookingDate.max = maxDate.toISOString().split("T")[0];

            // Update day type based on selected date
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
                const currentTime = now.getHours() * 60 + now.getMinutes(); // Current time in minutes
                const selectedDateMidnight = new Date(selectedDate);
                selectedDateMidnight.setHours(0, 0, 0, 0);

                for (let hour = Math.floor(startHour); hour <= Math.floor(endHour); hour++) {
                    for (let minute of [0, 30]) {
                        if (hour === Math.floor(startHour) && minute < (startHour % 1) * 60)
                            continue;
                        if (hour === Math.floor(endHour) && minute > (endHour % 1) * 60)
                            continue;

                        const label = hour.toString().padStart(2, '0') + 'h' + (minute === 0 ? '00' : '30');
                        const timeValue = hour * 60 + minute;

                        // Check if the selected date is today
                        const isToday = selectedDateMidnight.toDateString() === today.toDateString();
                        const isEnabled = isToday ? (timeValue > currentTime) : true;

                        const btn = document.createElement("button");
                        btn.className = "time-slot" + (isEnabled ? "" : " disabled");
                        btn.innerText = label;
                        if (!isEnabled)
                            btn.disabled = true;

                        if (isEnabled) {
                            btn.addEventListener("click", () => {
                                document.querySelectorAll(".time-slot").forEach(b => b.classList.remove("selected"));
                                btn.classList.add("selected");
                                confirmBtn.disabled = false;
                            });
                        }

                        container.appendChild(btn);
                    }
                }
            }

            // Date change handler
            bookingDate.addEventListener("change", () => {
                const selectedDate = new Date(bookingDate.value);
                const selectedDateMidnight = new Date(selectedDate);
                selectedDateMidnight.setHours(0, 0, 0, 0);

                if (selectedDateMidnight >= today && selectedDateMidnight <= maxDate) {
                    updateDayType(selectedDate);
                    showAvailableTimes(selectedDate);
                } else {
                    alert("Vui lòng chọn ngày trong phạm vi từ hôm nay đến 3 ngày tới.");
                    bookingDate.value = '';
                    container.style.display = "none";
                    container.classList.remove("expanded");
                    toggleTimeText.textContent = "Xem khung giờ";
                }
            });

            // Weekend button handler
            weekendBtn.addEventListener("click", () => {
                const now = new Date();
                const day = now.getDay();
                const diff = (6 - day + 7) % 7 || 7; // Next Saturday
                const nextSaturday = new Date(now);
                nextSaturday.setDate(now.getDate() + diff);
                nextSaturday.setHours(0, 0, 0, 0);
                bookingDate.valueAsDate = nextSaturday;
                updateDayType(nextSaturday);
                showAvailableTimes(nextSaturday);
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

            // Enable confirm button when number of people and time slot are selected
            document.getElementById("numPeople").addEventListener("change", () => {
                if (bookingDate.value && document.querySelector(".time-slot.selected")) {
                    confirmBtn.disabled = false;
                }
            });

            // Display selected services from sessionStorage
            window.addEventListener("load", () => {
                const selectedServices = JSON.parse(sessionStorage.getItem("selectedServices") || "[]");
                if (selectedServices.length > 0) {
                    serviceList.innerHTML = "<h4>Dịch vụ đã chọn:</h4><ul>";
                    selectedServices.forEach(service => {
                        serviceList.innerHTML += `<li class="service-item"><span class="service-name">${service.name}</span><span class="service-price">${service.price.toLocaleString('vi-VN')} VNĐ</span></li>`;
                    });
                    serviceList.innerHTML += "</ul>";
                } else {
                    serviceList.innerHTML = "<p>Chưa có dịch vụ nào được chọn. Vui lòng chọn dịch vụ từ trang dịch vụ.</p>";
                }
            });
        </script>
    </body>
</html>