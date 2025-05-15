<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cut & Styles Barber - Đăng Nhập</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/login.css">    
    </head>
    <body>
        <div class="container">
            <div class="info-side">
                <div class="logo">
                    <div class="logo-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#c59d5f" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M8 2v2"></path>
                        <path d="M16 2v2"></path>
                        <path d="M8 11h8"></path>
                        <path d="M8 14h4"></path>
                        <path d="M12 22v-6.5l-4-2.5"></path>
                        <path d="M16 13.5v4l4-2.5v-4l-4-2.5L12 11l-4-2.5-4 2.5 4 2.5 4 2.5z"></path>
                        </svg>
                    </div>
                    CUT & STYLES
                </div>
                <div class="info-text">
                    <h2>Chào mừng đến với Cut & Styles Barber</h2>
                    <p>
                        Nơi phong cách gặp gỡ truyền thống. Chúng tôi mang đến cho bạn trải nghiệm cắt tóc độc đáo với các dịch vụ cao cấp từ những thợ cắt tóc chuyên nghiệp và nhiều năm kinh nghiệm.
                    </p>
                    <p style="margin-top: 15px">
                        Đăng nhập ngay để đặt lịch online, tích điểm thành viên và nhận những ưu đãi đặc biệt.
                    </p>
                </div>
                <!-- Đã loại bỏ phần social-icons theo yêu cầu -->
            </div>
            <div class="login-side">
                <div class="login-header">
                    <h1>Đăng Nhập</h1>
                    <p>Chào mừng trở lại! Vui lòng đăng nhập để tiếp tục</p>
                </div>
                <form action="auth_process.jsp" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="form-group">
                        <label for="username">Số Điện Thoại hoặc Email</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập số điện thoại hoặc email" required>
                        <div class="form-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật Khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                        <div class="form-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                        </div>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" name="remember">
                            Ghi nhớ đăng nhập
                        </label>
                        <a href="forgot-password.jsp" class="forgot-password">Quên mật khẩu?</a>
                    </div>
                    <button type="submit" class="btn">Đăng Nhập</button>
                    <div class="register-link">
                        Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Validate form
            document.querySelector('form').addEventListener('submit', function (e) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();

                if (username === '' || password === '') {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin đăng nhập!');
                }
            });

            // Show/Hide Password
            document.querySelector('.form-icon').addEventListener('click', function () {
                const passwordInput = document.getElementById('password');
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    this.innerHTML = `
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                            <circle cx="12" cy="12" r="3"></circle>
                        </svg>
                    `;
                } else {
                    passwordInput.type = 'password';
                    this.innerHTML = `
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    `;
                }
            });
        </script>
    </body>
</html>