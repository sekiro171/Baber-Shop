<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cut and Style - Franchies </title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CSS/html.css">
        <style>
            :root {
                --primary-gold: #D4AF37;
                --dark-charcoal: #1a1a1a;
                --light-gray: #f8f9fa;
                --accent-brown: #8B4513;
                --text-muted: #6c757d;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', sans-serif;
                line-height: 1.6;
                color: var(--dark-charcoal);
                overflow-x: hidden;
                background: url('https://images.unsplash.com/photo-1585747860715-2ba37e788b70?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1374&q=80') center center/cover fixed no-repeat;
            }

            .content-overlay {
                ackground: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                margin: 0;
                min-height: 100vh;
            }

            .luxury-header {
                background: linear-gradient(135deg, var(--dark-charcoal) 0%, #2c2c2c 100%);
                color: white;
                padding: 2rem 0;
                position: relative;
                overflow: hidden;
            }

            .luxury-header::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="barber" patternUnits="userSpaceOnUse" width="100" height="100"><rect fill="%23000" width="100" height="100"/><circle cx="50" cy="50" r="2" fill="%23D4AF37" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23barber)"/></svg>') repeat;
                opacity: 0.3;
            }

            .brand-logo {
                font-family: 'Playfair Display', serif;
                font-size: 3rem;
                font-weight: 700;
                color: var(--primary-gold);
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
                position: relative;
                z-index: 2;
            }

            .brand-tagline {
                font-size: 1.2rem;
                color: #cccccc;
                margin-top: 0.5rem;
                position: relative;
                z-index: 2;
            }

            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.2));
                padding: 8rem 0;
                color: white;
                text-align: center;
                position: relative;
   
                border-radius: 25px;
                backdrop-filter: blur(5px);
            }

            .hero-title {
                font-family: 'Playfair Display', serif;
                font-size: 4rem;
                font-weight: 700;
                margin-bottom: 1.5rem;
                text-shadow: 3px 3px 6px rgba(0,0,0,0.7);
                letter-spacing: 2px;
            }

            .hero-subtitle {
                font-size: 1.5rem;
                margin-bottom: 3rem;
                color: #f8f9fa;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
                font-weight: 300;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            .stats-section {
                background: rgba(255, 255, 255, 0.9);
                padding: 5rem 2rem;
                backdrop-filter: blur(15px);
                margin: 2rem;
                border-radius: 25px;
                box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            }

            .stat-card {
                text-align: center;
                padding: 3rem 2rem;
                background: rgba(255, 255, 255, 0.8);
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.08);
                transition: all 0.4s ease;
                margin-bottom: 2rem;
                border: 2px solid rgba(212, 175, 55, 0.1);
                backdrop-filter: blur(10px);
            }

            .stat-card:hover {
                transform: translateY(-15px) scale(1.02);
                box-shadow: 0 25px 50px rgba(212, 175, 55, 0.15);
                border-color: var(--primary-gold);
                background: rgba(255, 255, 255, 0.95);
            }

            .stat-number {
                font-size: 3rem;
                font-weight: 700;
                color: var(--primary-gold);
                font-family: 'Playfair Display', serif;
            }

            .stat-label {
                font-size: 1.1rem;
                color: var(--text-muted);
                margin-top: 0.5rem;
            }

            .features-section {
                padding: 6rem 2rem;
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(15px);
                box-shadow: 0 20px 60px rgba(0,0,0,0.1);
                position: relative;
            }

            .features-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: linear-gradient(135deg, rgba(212, 175, 55, 0.05) 0%, transparent 100%);
                border-radius: 25px;
                z-index: 0;
            }

            .features-section .container {
                position: relative;
                z-index: 1;
            }

            .feature-card {
                text-align: center;
                padding: 3rem 2rem;
                height: 100%;
                transition: all 0.4s ease;
                background: rgba(255, 255, 255, 0.8);
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.06);
                border: 2px solid rgba(212, 175, 55, 0.1);
                backdrop-filter: blur(10px);
            }

            .feature-card:hover {
                transform: translateY(-10px) scale(1.02);
                box-shadow: 0 20px 40px rgba(212, 175, 55, 0.12);
                background: rgba(255, 255, 255, 0.95);
                border-color: var(--primary-gold);
            }

            .feature-icon {
                width: 80px;
                height: 80px;
                background: linear-gradient(135deg, var(--primary-gold), #B8860B);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem;
                box-shadow: 0 10px 20px rgba(212, 175, 55, 0.3);
            }

            .feature-icon i {
                font-size: 2rem;
                color: white;
            }

            .form-section {
                background: linear-gradient(135deg, rgba(26, 26, 26, 0.8) 0%, rgba(44, 44, 44, 0.7) 100%);
                padding: 6rem 2rem;
                color: white;
                position: relative;
         
                border-radius: 25px;
                backdrop-filter: blur(15px);
                box-shadow: 0 20px 60px rgba(0,0,0,0.2);
            }

            .form-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.2);
                border-radius: 25px;
                z-index: 1;
            }

            .form-section .container {
                position: relative;
                z-index: 2;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.95);
                border-radius: 25px;
                padding: 4rem 3rem;
                box-shadow: 0 30px 80px rgba(0,0,0,0.3);
                color: var(--dark-charcoal);
                backdrop-filter: blur(15px);
                border: 1px solid rgba(212, 175, 55, 0.2);
            }

            .form-title {
                font-family: 'Playfair Display', serif;
                font-size: 2.5rem;
                color: var(--dark-charcoal);
                text-align: center;
                margin-bottom: 2rem;
            }

            .luxury-input {
                border: 2px solid rgba(233, 236, 239, 0.8);
                border-radius: 15px;
                padding: 18px 25px;
                font-size: 1rem;
                transition: all 0.4s ease;
                background: rgba(248, 249, 250, 0.8);
                backdrop-filter: blur(5px);
            }

            .luxury-input:focus {
                border-color: var(--primary-gold);
                box-shadow: 0 0 0 0.3rem rgba(212, 175, 55, 0.15);
                background: rgba(255, 255, 255, 0.95);
                transform: translateY(-2px);
            }

            .luxury-textarea {
                min-height: 120px;
                resize: vertical;
            }

            .luxury-btn {
                background: linear-gradient(135deg, var(--primary-gold), #B8860B);
                color: white;
                border: none;
                padding: 18px 50px;
                border-radius: 50px;
                font-size: 1.2rem;
                font-weight: 600;
                transition: all 0.4s ease;
                box-shadow: 0 15px 30px rgba(212, 175, 55, 0.3);
                position: relative;
                overflow: hidden;
            }

            .luxury-btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
                transition: left 0.5s;
            }

            .luxury-btn:hover::before {
                left: 100%;
            }

            .luxury-btn:hover {
                transform: translateY(-3px) scale(1.05);
                box-shadow: 0 20px 40px rgba(212, 175, 55, 0.4);
                background: linear-gradient(135deg, #B8860B, var(--primary-gold));
            }

            .section-title {
                font-family: 'Playfair Display', serif;
                font-size: 2.8rem;
                font-weight: 700;
                text-align: center;
                margin-bottom: 3rem;
                color: var(--dark-charcoal);
            }

            .golden-line {
                width: 100px;
                height: 3px;
                background: var(--primary-gold);
                margin: 1rem auto 2rem;
            }

            .fade-in {
                opacity: 0;
                transform: translateY(30px);
                transition: all 0.8s ease;
            }

            .fade-in.visible {
                opacity: 1;
                transform: translateY(0);
            }

            @media (max-width: 768px) {
                .hero-title {
                    font-size: 2.8rem;
                }

                .hero-subtitle {
                    font-size: 1.2rem;
                }

                .brand-logo {
                    font-size: 2rem;
                }

                .form-container {
                    padding: 2.5rem 2rem;
                    margin: 0 1rem;
                }

                .hero-section {
                    padding: 6rem 1rem;
                    margin: 1rem;
                }

                .stats-section, .features-section, .form-section {
                    padding: 4rem 1rem;
                    margin: 1rem;
                }

                .content-overlay {
                    padding: 0;
                }
            }

            .floating-elements {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                pointer-events: none;
            }

            .floating-elements::before {
                content: '✂';
                position: absolute;
                font-size: 2rem;
                color: rgba(212, 175, 55, 0.1);
                animation: float 6s ease-in-out infinite;
                top: 20%;
                left: 10%;
            }

            .floating-elements::after {
                content: '♛';
                position: absolute;
                font-size: 1.5rem;
                color: rgba(212, 175, 55, 0.1);
                animation: float 8s ease-in-out infinite reverse;
                top: 60%;
                right: 15%;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-20px);
                }
            }
        </style>
    </head>
    <body>
        <%@ page contentType="text/html; charset=UTF-8" %>

        <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                    <img src="image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">
                    Cut&Styles Barber
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aboutUs.jsp">Về chúng tôi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="franchise.jsp">Nhượng quyền</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đối tác</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đặt lịch</a>
                        </li>
                    </ul>

                    <div class="d-flex gap-2">
                        <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/views/auth/login.jsp">Đăng nhập</a>
                        <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/views/auth/register.jsp">Đăng ký</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Content overlay pour l'effet glassmorphism -->
        <div class="content-overlay">
            <!-- Section Hero -->
            <section class="hero-section">
                <div class="container">
                    <h2 class="hero-title fade-in">Nhượng quyền  thương hiệu</h2>
                    <p class="hero-subtitle fade-in">Gia nhập mạng lưới salon nam cao cấp hàng đầu Việt Nam</p>
                    <div class="golden-line"></div>
                </div>
            </section>

            <!-- Thống kê -->
<!--            <section class="stats-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-6">
                            <div class="stat-card fade-in">
                                <div class="stat-number">50+</div>
                                <div class="stat-label">Cửa hàng</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-card fade-in">
                                <div class="stat-number">10K+</div>
                                <div class="stat-label">Khách hàng</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-card fade-in">
                                <div class="stat-number">95%</div>
                                <div class="stat-label">Hài lòng</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="stat-card fade-in">
                                <div class="stat-number">5★</div>
                                <div class="stat-label">Đánh giá</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>-->

            <!-- Đặc điểm nổi bật -->
            <section class="features-section">
                <div class="container">
                    <h2 class="section-title fade-in">Tại Sao Chọn Cut & Style?</h2>
                    <div class="golden-line"></div>

                    <div class="row">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-crown"></i>
                                </div>
                                <h4>Thương Hiệu Uy Tín</h4>
                                <p>10 năm kinh nghiệm trong ngành làm đẹp nam giới với thương hiệu được tin tưởng</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-graduation-cap"></i>
                                </div>
                                <h4>Đào Tạo Chuyên Nghiệp</h4>
                                <p>Chương trình đào tạo toàn diện từ kỹ thuật cắt tóc đến quản lý kinh doanh</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <h4>Lợi Nhuận Cao</h4>
                                <p>Mô hình kinh doanh hiệu quả với ROI trung bình 25-30% trong năm đầu</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-tools"></i>
                                </div>
                                <h4>Hỗ Trợ Toàn Diện</h4>
                                <p>Hỗ trợ thiết kế, trang thiết bị, marketing và vận hành từ A-Z</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <h4>Vị Trí Chiến Lược</h4>
                                <p>Tư vấn chọn địa điểm kinh doanh tối ưu dựa trên phân tích thị trường</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="feature-card fade-in">
                                <div class="feature-icon">
                                    <i class="fas fa-mobile-alt"></i>
                                </div>
                                <h4>Công Nghệ Hiện Đại</h4>
                                <p>Hệ thống đặt lịch online, quản lý khách hàng và báo cáo doanh thu</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Form đăng ký -->
            <section class="form-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="form-container fade-in">
                                <h2 class="form-title">Đăng Ký Nhận Tư Vấn</h2>
                                <div class="golden-line"></div>

                                <form id="franchiseForm" action="processFranchise.jsp" method="POST">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="fullName" class="form-label">Họ và Tên *</label>
                                            <input type="text" 
                                                   class="form-control luxury-input" 
                                                   id="fullName" 
                                                   name="fullName" 
                                                   required 
                                                   placeholder="Nhập họ và tên của bạn">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="phone" class="form-label">Số Điện Thoại *</label>
                                            <input type="tel" 
                                                   class="form-control luxury-input" 
                                                   id="phone" 
                                                   name="phone" 
                                                   required 
                                                   placeholder="0123 456 789">
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email *</label>
                                        <input type="email" 
                                               class="form-control luxury-input" 
                                               id="email" 
                                               name="email" 
                                               required 
                                               placeholder="example@gmail.com">
                                    </div>

                                    <div class="mb-3">
                                        <label for="capabilities" class="form-label">Giới Thiệu Năng Lực *</label>
                                        <textarea class="form-control luxury-input luxury-textarea" 
                                                  id="capabilities" 
                                                  name="capabilities" 
                                                  required 
                                                  placeholder="Hãy cho chúng tôi biết về kinh nghiệm, năng lực và sự chuẩn bị của bạn cho việc kinh doanh..."></textarea>
                                    </div>

                                    <div class="mb-4">
                                        <label for="proposal" class="form-label">Đề Xuất Hợp Tác</label>
                                        <textarea class="form-control luxury-input luxury-textarea" 
                                                  id="proposal" 
                                                  name="proposal" 
                                                  placeholder="Chia sẻ ý tưởng, kế hoạch kinh doanh và mong muốn hợp tác của bạn..."></textarea>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="luxury-btn">
                                            <i class="fas fa-paper-plane me-2"></i>
                                            Gửi Thông Tin Đăng Ký
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <!-- Logo and About -->
                    <div class="col-lg-4 col-md-6 footer-col">
                        <img src="image/image_logo/LogoShop.png" alt="Cut&Styles Logo" class="footer-logo">                      
                    </div>

                    <!-- Links -->
                    <div class="col-lg-4 col-md-6 footer-col">
                        <h4 class="footer-title">Liên kết nhanh</h4>
                        <ul class="footer-links">
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="franchies.jsp">Liên hệ nhượng quyền</a></li>
                            <li><a href="#">Đối tác</a></li>
                            <li><a href="#">Chính sách cam kết</a></li>
                        </ul>
                    </div>

                    <!-- Contact -->
                    <div class="col-lg-4 col-md-6 footer-col">
                        <h4 class="footer-title">Thông tin liên hệ</h4>
                        <div class="footer-contact">
                            <p><i class="bi bi-geo-alt-fill"></i> <span>Khu đô thị FPT city, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng</span></p>
                            <p><i class="bi bi-telephone-fill"></i> <span>Liên hệ học nghề tóc: 0774511941</span></p>
                            <p><i class="bi bi-clock-fill"></i> <span>Giờ phục vụ: Thứ 2 đến Chủ Nhật, 8h30 - 20h30</span></p>
                        </div>
                    </div>
                </div>

                <!-- Footer bottom -->
                <div class="row footer-bottom">
                    <div  class="col-12 text-center">
                        <p>&copy; 2025 Cut&Styles Barber. Tất cả quyền được bảo lưu.</p>
                    </div>
                </div>
            </div>
        </footer>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script>
            // Animation on scroll
            function animateOnScroll() {
                const elements = document.querySelectorAll('.fade-in');

                elements.forEach(element => {
                    const elementTop = element.getBoundingClientRect().top;
                    const elementVisible = 150;

                    if (elementTop < window.innerHeight - elementVisible) {
                        element.classList.add('visible');
                    }
                });
            }

            window.addEventListener('scroll', animateOnScroll);
            window.addEventListener('load', animateOnScroll);

            // Form validation và submission
            document.getElementById('franchiseForm').addEventListener('submit', function (e) {
                e.preventDefault();

                // Validation
                const fullName = document.getElementById('fullName').value.trim();
                const phone = document.getElementById('phone').value.trim();
                const email = document.getElementById('email').value.trim();
                const capabilities = document.getElementById('capabilities').value.trim();

                if (!fullName || !phone || !email || !capabilities) {
                    alert('Vui lòng điền đầy đủ các thông tin bắt buộc!');
                    return;
                }

                // Email validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Vui lòng nhập email hợp lệ!');
                    return;
                }

                // Phone validation
                const phoneRegex = /^[0-9]{10,11}$/;
                const cleanPhone = phone.replace(/\s+/g, '');
                if (!phoneRegex.test(cleanPhone)) {
                    alert('Vui lòng nhập số điện thoại hợp lệ (10-11 chữ số)!');
                    return;
                }

                // Success simulation
                const submitBtn = document.querySelector('.luxury-btn');
                const originalText = submitBtn.innerHTML;

                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Đang gửi...';
                submitBtn.disabled = true;

                setTimeout(() => {
                    alert('Cảm ơn bạn đã đăng ký! Chúng tôi sẽ liên hệ với bạn trong vòng 24h.');
                    this.reset();
                    submitBtn.innerHTML = originalText;
                    submitBtn.disabled = false;
                }, 2000);
            });

            // Smooth scrolling
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Floating animation
            setInterval(() => {
                const floatingElements = document.querySelector('.floating-elements');
                if (floatingElements) {
                    floatingElements.style.transform = `translateY(${Math.sin(Date.now() / 1000) * 5}px)`;
                }
            }, 100);
        </script>
    </body>
</html>