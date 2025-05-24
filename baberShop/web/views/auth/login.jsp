<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cut&Styles Barber - Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/login.css">  
        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f5f5f5;
    background-image: url("/api/placeholder/1200/800");
    background-size: cover;
    background-position: center;
    background-blend-mode: overlay;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    position: relative;
}

body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    z-index: -1;
}

.login-container {
    width: 100%;
    max-width: 450px;
    background-color: rgba(255, 255, 255, 0.95);
    border-radius: 15px;
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    padding: 40px;
    position: relative;
    animation: fadeIn 0.8s ease;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.logo {
    text-align: center;
    margin-bottom: 40px;
    position: relative;
}

.logo h1 {
    font-size: 32px;
    font-weight: 800;
    color: #333;
    text-transform: uppercase;
    letter-spacing: 2px;
}

.logo span {
    color: #c59d5f;
}

.logo p {
    font-size: 14px;
    color: #777;
    margin-top: 5px;
    letter-spacing: 1px;
}

.logo::after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, #c59d5f, #8e6d2f);
    margin: 15px auto 0;
}

.form-group {
    margin-bottom: 25px;
    position: relative;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    color: #555;
    font-weight: 600;
}

.form-group input {
    width: 100%;
    padding: 15px 15px 15px 45px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 15px;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
}

.form-group input:focus {
    border-color: #c59d5f;
    box-shadow: 0 0 0 3px rgba(197, 157, 95, 0.2);
    outline: none;
    background-color: #fff;
}

.form-group i {
    position: absolute;
    left: 15px;
    top: 45px;
    color: #aaa;
}

.form-footer {
    display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
    align-items: center;
}

.checkbox {
    display: flex;
    align-items: center;
}

.checkbox input {
    margin-right: 8px;
    width: 16px;
    height: 16px;
    accent-color: #c59d5f;
}

.checkbox label {
    font-size: 14px;
    color: #666;
}

.forgot-link {
    font-size: 14px;
    color: #c59d5f;
    text-decoration: none;
    transition: all 0.3s ease;
    font-weight: 600;
}

.forgot-link:hover {
    color: #8e6d2f;
    text-decoration: underline;
}

.login-btn {
    width: 100%;
    padding: 16px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(90deg, #c59d5f, #8e6d2f);
    color: white;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(197, 157, 95, 0.3);
    text-transform: uppercase;
    letter-spacing: 1px;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 7px 20px rgba(197, 157, 95, 0.4);
    background: linear-gradient(90deg, #d6b06c, #a17f34);
}

.social-login {
    margin-top: 35px;
    text-align: center;
}

.social-login p {
    color: #777;
    margin-bottom: 20px;
    position: relative;
    font-size: 14px;
}

.social-login p::before,
.social-login p::after {
    content: '';
    position: absolute;
    top: 50%;
    width: 35%;
    height: 1px;
    background-color: #ddd;
}

.social-login p::before {
    left: 0;
}

.social-login p::after {
    right: 0;
}

.social-icons {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 35px;
}

.social-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #f5f5f5;
    color: #555;
    transition: all 0.3s ease;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    text-decoration: none;
    font-size: 20px;
}

.facebook:hover {
    background-color: #3b5998;
    color: white;
}

.google:hover {
    background-color: #db4437;
    color: white;
}

.twitter:hover {
    background-color: #1da1f2;
    color: white;
}

.toggle-password {
    position: absolute;
    right: 15px;
    top: 45px;
    color: #aaa;
    cursor: pointer;
}

.register-link {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
    color: #666;
}

.register-link a {
    color: #c59d5f;
    font-weight: 600;
    text-decoration: none;
    margin-left: 5px;
    transition: all 0.3s ease;
}

.register-link a:hover {
    color: #8e6d2f;
    text-decoration: underline;
}

/* Hiệu ứng đẹp mắt cho form */
.scissor-icon {
    position: absolute;
    width: 50px;
    height: 50px;
    font-size: 30px;
    color: #c59d5f;
    opacity: 0.15;
}

.scissor-1 {
    top: 20px;
    right: 30px;
    transform: rotate(45deg);
}

.scissor-2 {
    bottom: 20px;
    left: 30px;
    transform: rotate(-45deg);
}

/* Responsive */
@media (max-width: 480px) {
    .login-container {
        padding: 30px 20px;
    }

    .logo h1 {
        font-size: 28px;
    }

    .social-icons {
        gap: 15px;
    }

    .social-icon {
        width: 45px;
        height: 45px;
        font-size: 18px;
    }
}
        </style>
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
                    <label for="username">Tên đăng nhập</label>
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
                        <a href="#" class="social-icon facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

                           &redirect_uri=http://localhost:8080/baberShop/login

                           &response_type=code

                           &client_id=552910919594-b47aioal2hmfeusv4npr35bfegd7ocun.apps.googleusercontent.com

                           &approval_prompt=force" class="social-icon google"><i class="fab fa-google"></i></a>
                        <a href="#" class="social-icon twitter"><i class="fab fa-twitter"></i></a>
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
