<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cut & Styles Barber - Đăng Ký</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/register.css">    
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
                <h2>Đăng ký thành viên</h2>
                <p>
                    Chào mừng bạn đến với Cut & Styles Barber! Đăng ký tài khoản để đặt lịch dễ dàng, theo dõi lịch sử cắt tóc và nhận các ưu đãi đặc biệt.
                </p>
                <p style="margin-top: 15px">
                    Chúng tôi cam kết mang đến cho bạn những trải nghiệm cắt tóc tuyệt vời nhất với các thợ cắt tóc chuyên nghiệp và không gian sang trọng.
                </p>
            </div>
            <!-- Không có biểu tượng mạng xã hội theo yêu cầu -->
        </div>
        <div class="register-side">
            <div class="register-header">
                <h1>Đăng Ký Tài Khoản</h1>
                <p>Vui lòng điền thông tin để tạo tài khoản mới</p>
            </div>
            <form action="auth_process.jsp" method="post">
                <input type="hidden" name="action" value="register">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">Họ</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Nhập họ" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastName">Tên</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Nhập tên" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                    <div class="form-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                        </svg>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Nhập địa chỉ email" required>
                    <div class="form-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                            <polyline points="22,6 12,13 2,6"></polyline>
                        </svg>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    <div class="form-icon password-toggle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Xác nhận mật khẩu</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                    <div class="form-icon password-toggle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="birthdate">Ngày sinh</label>
                        <input type="date" class="form-control" id="birthdate" name="birthdate">
                    </div>
                    
                    <div class="form-group">
                        <label for="gender">Giới tính</label>
                        <select class="form-control" id="gender" name="gender">
                            <option value="" selected disabled>Chọn giới tính</option>
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-check">
                    <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" name="terms" required>
                        Tôi đồng ý với các <a href="#" style="color: #c59d5f;">Điều khoản và Điều kiện</a>
                    </label>
                </div>
                
                <div class="form-check">
                    <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" name="newsletter">
                        Tôi muốn nhận thông tin về khuyến mãi và tin tức
                    </label>
                </div>
                
                <button type="submit" class="btn">Đăng Ký</button>
                
                <div class="login-link">
                    Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Validate form
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp với mật khẩu!');
            }
        });

        // Show/Hide Password
        document.querySelectorAll('.password-toggle').forEach(function(icon) {
            icon.addEventListener('click', function() {
                const input = this.parentElement.querySelector('input');
                if (input.type === 'password') {
                    input.type = 'text';
                    this.innerHTML = `
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                            <circle cx="12" cy="12" r="3"></circle>
                        </svg>
                    `;
                } else {
                    input.type = 'password';
                    this.innerHTML = `
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    `;
                }
            });
        });

        // Phone number validation
        document.getElementById('phone').addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/[^0-9]/g, '');
        });
    </script>
</body>
</html>