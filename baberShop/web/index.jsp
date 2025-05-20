<%-- 
    Document   : index
    Created on : May 15, 2025, 2:46:10 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Cut&Styles Carousel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CSS/html.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

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
        <!-- Carousel -->
        <div class="container carousel-container">
            <div id="mainCarousel"
                 class="carousel slide"
                 data-bs-ride="carousel"
                 data-bs-interval="2000"
                 data-bs-wrap="true">
                <!-- Slides -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/image_banner/banner1.png" class="d-block w-100" alt="Ảnh 1">
                    </div>
                    <div class="carousel-item">
                        <img src="image/image_banner/banner2.png" class="d-block w-100" alt="Ảnh 2">
                    </div>
                    <div class="carousel-item">
                        <img src="image/image_banner/banner3.png" class="d-block w-100" alt="Ảnh 3">
                    </div>
                    <div class="carousel-item">
                        <img src="image/image_banner/banner4.png" class="d-block w-100" alt="Ảnh 4">
                    </div>
                    <div class="carousel-item">
                        <img src="image/image_banner/banner5.png" class="d-block w-100" alt="Ảnh 5">
                    </div>
                </div>

                <!-- Controls -->
                <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                    <span class="visually-hidden">Trước</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                    <span class="visually-hidden">Tiếp</span>
                </button>
                <!-- Indicators -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Service -->
        <div class="container py-5">
            <!-- DỊCH VỤ TÓC -->
            <h4 class="section-title">| DỊCH VỤ TÓC</h4>
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <a href="${pageContext.request.contextPath}/views/service/cutHairService.jsp" class="service-card">
                        <img src="image/image_service/cutHair.png" alt="Cắt tóc">
                        <div class="service-info">
                            <h5>Cắt tóc</h5>
                            <p>Giá từ 75.000VNĐ</p>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-3">
                    <a href="${pageContext.request.contextPath}/views/service/hairStylesService.jsp" class="service-card">
                        <img src="image/image_service/uon.png" alt="Uốn định hình">
                        <div class="service-info">
                            <h5>Uốn định hình</h5>
                            <p>Giá từ 379.000VNĐ</p>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-3">
                    <a href="${pageContext.request.contextPath}/views/service/hairStylesService.jsp" class="service-card">
                        <img src="image/image_service/nhuom.png" alt="Thay đổi màu tóc">
                        <div class="service-info">
                            <h5>Thay đổi màu tóc</h5>
                            <p>Giá từ 199.000VNĐ</p>
                        </div>
                    </a>
                </div>
            </div>
                        

            <!-- THƯ GIÃN VÀ CHĂM SÓC DA -->
            <h4 class="section-title">| THƯ GIÃN VÀ CHĂM SÓC DA</h4>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <a href="${pageContext.request.contextPath}/views/service/massageService.jsp" class="service-card">
                        <img src="image/image_service/massage.png" alt="Gội dưỡng sinh thư giãn">
                        <div class="service-info">
                            <h5>Gội dưỡng sinh thư giãn</h5>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-3">
                    <a href="${pageContext.request.contextPath}/views/service/massageService.jsp" class="service-card">
                        <img src="image/image_service/rayTai.png" alt="Lấy ráy tai êm">
                        <div class="service-info">
                            <h5>Lấy ráy tai êm</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- Cam kết dịch vụ -->
        <div class="commitment-section py-5">
            <div class="container">
                <div class="commitment-header">
                    <h3 class="commitment-title">| CAM KẾT CUT&STYLES CARE</h3>
                    <div class="subtitle-row">
                        <p class="commitment-subtitle">Sự hài lòng của anh là ưu tiên hàng đầu của Cut&Styles</p>
                        <a href="${pageContext.request.contextPath}/views/commit/details.jsp" class="commitment-link">Xem tất cả →</a>
                    </div>
                </div>

                <div class="commitment-banner">
                    <div class="commitment-banner-content">
                        <h2 class="banner-title">VÌ CHẤT LƯỢNG PHỤC VỤ LÀ HÀNG ĐẦU</h2>
                        <p class="banner-subtitle">Áp dụng tại salon bất kỳ toàn hệ thống Cut&Styles</p>
                    </div>
                </div>

                <div class="row commitment-features">
                    <div class="col-md-6 commitment-feature">
                        <div class="feature-content">
                            <div class="feature-number">07</div>
                            <div class="feature-unit">ngày</div>
                            <div class="feature-description">Bảo hành tóc miễn phí</div>
                        </div>
                    </div>

                    <div class="col-md-6 commitment-feature">
                        <div class="feature-content">
                            <div class="feature-title">Chính sách<br>đặc biệt</div>
                            <div class="feature-description">Nếu khách chờ lâu</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- AN TÂM & TIN TƯỞNG Section -->
        <div class="antam-tintruong-section py-5">
            <div class="container">
                <div class="section-header">
                    <h3 class="section-title">| AN TÂM & TIN TƯỞNG</h3>
                    <p class="section-subtitle">Thấu hiểu nhu cầu, hỗ trợ nhiệt tình</p>
                </div>

                <div class="row service-row">
                    <!-- Left service card -->
                    <div class="col-md-6 mb-4">
                        <a href="${pageContext.request.contextPath}/views/commit/support.jsp" class="card-link">
                            <div class="service-support-card">
                                <div class="service-support-img">
                                    <img src="image/image_service/support1.png" alt="Người đang tư vấn">
                                </div>
                                <div class="service-support-info">
                                    <h5>Những câu hỏi thường gặp</h5>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Right service card -->
                    <div class="col-md-6 mb-4">
                        <a href="${pageContext.request.contextPath}/views/commit/storage.jsp" class="card-link">
                            <div class="service-support-card">
                                <div class="service-support-img">
                                    <img src="image/image_service/support2.png" alt="Bảo quản xe">
                                </div>
                                <div class="service-support-info">
                                    <h5>Bảo quản xe cộ, đồ đạc</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- map -->
        <section class="map-section section">
            <div class="container">
                <h2 data-key="map-title">Bản Đồ Cut&Styles Barber</h2>
                <p class="text-center mb-5" data-key="map-subtitle">khu đô thị FPT city, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng Cut&Styles Barber là
                    điểm đến lý tưởng để bạn có được sự phục vụ tốt nhất.</p>
                <div class="map-container">
                    <iframe class="map-iframe"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856069316467!2d108.25831637589107!3d15.968891042114784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1747405983302!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                            title="Bản đồ Cut&Styles Barber " style="border:0;" allowfullscreen=""
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </section>


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
