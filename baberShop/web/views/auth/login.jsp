<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cut&Styles Barber - Đăng nhập</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/login.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="login-container">
        <div class="scissor-icon scissor-1">✂️</div>
        <div class="scissor-icon scissor-2">✂️</div>

        <div class="logo">
            <h1>Cut&<span>Styles</span></h1>
            <p>PREMIUM BARBER SHOP</p>
        </div>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>

            <div class="form-footer">
                <div class="checkbox">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Ghi nhớ đăng nhập</label>
                </div>
                <a href="forgot-password.jsp" class="forgot-link">Quên mật khẩu?</a>
            </div>

            <button type="submit" class="login-btn">Đăng nhập</button>

            <div class="social-login">
                <p>Hoặc đăng nhập với</p>
                <div class="social-icons">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/baberShop/login&response_type=code&client_id=552910919594-b47aioal2hmfeusv4npr35bfegd7ocun.apps.googleusercontent.com&approval_prompt=force" class="social-icon google">
                        <i class="fab fa-google"></i>
                        <span>Đăng nhập với Google</span>
                    </a>
                </div>
            </div>

            <div class="register-link">
                Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
            </div>
        </form>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>