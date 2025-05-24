<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Cut&Styles Carousel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/support.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">                   
                    Cut&Styles Barber
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Về chúng tôi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Nhượng quyền</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đối tác</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đặt lịch</a>
                        </li>
                    </ul>
                    <div class="d-flex gap-2">
                        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/views/auth/login.jsp">Đăng nhập</a>
                        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/views/auth/register.jsp">Đăng ký</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Support Section -->
        <section class="commitment-section py-5">
            <div class="container">
                <div class="section-header text-center mb-5">
                    <h2 class="section-title">CAM KẾT BẢO VỆ TÀI SẢN CỦA CUT&STYLES BABER</h2>
                        <div class="section-divider">
                            <span class="divider-line"></span>
                            <span class="divider-icon"><i class="fas fa-cut"></i></span>
                            <span class="divider-line"></span>
                        </div>
                        <p class="section-subtitle">Cam kết giữ xe - tư trang cá nhân an toàn</p>
                </div>

                <div class="row">
                    <div class="support-row d-flex align-items-center justify-content-between flex-wrap">
                        <div class="support-img col-md-5 mb-4 mb-md-0">
                            <img src="${pageContext.request.contextPath}/image/image_service/support2.png" alt="Giữ xe an toàn" class="img-fluid rounded">
                        </div>
                        <div class="support-text col-md-6">
                            <p>Để trải nghiệm tại 30Shine thực sự trọn vẹn, mọi lo toan dù là nhỏ nhất cần phải dẹp bỏ, trong đó có lo lắng mất xe, mất đồ.</p>
                            <p>30Shine cam kết bảo vệ tài sản của bạn. Tại đây luôn có ít nhất 1-2 bác bảo vệ giữ xe đảm bảo yên tâm tuyệt đối ngay cả trong giờ cao điểm.</p>
                        </div>
                    </div>

                    <div class="support-row d-flex align-items-center justify-content-between flex-wrap flex-md-row-reverse mt-5">
                        <div class="support-img col-md-5 mb-4 mb-md-0">
                            <img src="${pageContext.request.contextPath}/image/image_service/support3.png" alt="Tủ locker bảo vệ đồ" class="img-fluid rounded">
                        </div>
                        <div class="support-text col-md-6">
                            <p>Với các đồ dùng cá nhân như Balo, Áo khoác, bạn sẽ được giữ đồ tại tủ locker riêng có khóa. Các đồ vật giá trị như Laptop, máy ảnh... lễ tân hoặc trực tiếp trưởng cửa hàng sẽ giúp bạn cất giữ đảm bảo không mất mát, hư hại.</p>
                            <p>Salon được bố trí camera quan sát mọi góc cạnh tại khu gửi xe và toàn bộ salon giúp bạn tránh được mọi rủi ro mất mát.</p>
                        </div>
                    </div>
                        
                    <!-- Booking CTA Section -->
                    <div class="booking-cta py-5 text-center">
                        <a href="#" class="btn btn-primary btn-lg">Đặt lịch ngay</a>
                    </div>
                    
                    <!-- Footer -->
                    <footer class="footer">
                        <div class="container">
                            <div class="row">
                                <!-- Logo and About -->
                                <div class="col-lg-4 col-md-6 footer-col">
                                    <img src="${pageContext.request.contextPath}/image/image_logo/LogoShop.png" alt="Cut&Styles Logo" class="footer-logo">                      
                                </div>

                                <!-- Links -->
                                <div class="col-lg-4 col-md-6 footer-col">
                                    <h4 class="footer-title">Liên kết nhanh</h4>
                                    <ul class="footer-links">
                                        <li><a href="#">Về chúng tôi</a></li>
                                        <li><a href="#">Liên hệ nhượng quyền</a></li>
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
                    </body>
                    </html>