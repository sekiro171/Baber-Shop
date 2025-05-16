<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>About Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Kết nối với Google Fonts để thay đổi font chữ -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CSS/html.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Toàn bộ trang sử dụng font chữ hiện đại và dễ đọc */
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f4f6f8;
                color: #333;
            }

            h2, h3, h4 {
                font-family: 'Poppins', sans-serif;
                color:#1d1d1b
                    
                    ;
                font-weight: 600;
            }

            p {
                color: #555;
                font-size: 1.1rem; 
                line-height: 1.8;
                margin-bottom: 15px;
            }

            ul {
                color: #555;
                font-size: 1.1rem;
                margin-bottom: 20px;
                line-height: 1.8;
            }

            /* Các phần section */
            section {
                margin-top: -20px;
                margin-bottom: -20px;
            }

            #about, #mission, #wills, #endnote {
                margin-bottom: 60px;
            }

            #about, #mission, #wills {
                padding: 40px 0;
                background-color: #fff;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            #about img {
                width: 100%;
                height: auto;
                margin-top: 0px;
            }

            footer {
                background-color: #1d1d1b;
                color: #fff;
                padding: 20px;
                text-align: center;
                font-size: 0.9rem;
            }

            footer p {
                margin: 0;
            }

            /* Các cải tiến cho phần tiêu đề và nội dung */
            h2 {
                font-size: 2rem;
                color: #d4af37;
                margin-bottom: 20px;
            }

            .container {
                max-width: 1400px;
            }

            /* Các kiểu cho các phần có hình ảnh */
            #about img, #logo img, #wills img {
                max-width: 100%;
                border-radius: 10px;
            }

            /* Cải tiến phần giới thiệu */
            #about p, #mission p, #wills p {
                font-size: 1.1rem;
                color: #333;
                line-height: 1.8;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
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

        <!-- Section giới thiệu -->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row" style="">
                    <div class="col-lg-6">
                        <h2>Cut&Styles - Điểm Tựa Cho Phong Cách</h2>
                        <p>Mỗi người đàn ông đều có một hành trình riêng, một thế giới muốn chinh phục.</p>
                        <p>Có người đang tiến về đích, có người vẫn đang tìm hướng đi.</p>
                        <p><b>Dù bạn đang ở đâu trên hành trình ấy, bản lĩnh và sự tự tin luôn có trong chính bạn.</b></p>
                        <p>Cut&Styles không tạo ra chúng. <b>Chúng tôi là điểm tựa</b>, giúp bạn thể hiện phong thái.</p>
                    </div>
                    <div class="col-lg-12">
                        <img src="image/image_banner/van-hoa-barber-va-nghe-thuat-rau-toc-cho-quy-ong.jpg" alt="alt" width="100%" height="75%"/>
                    </div>
                </div>
            </div>
        </section>

        <!-- Các phần khác -->
        <section id="about" class="py-5">
            <div class="container">
                <h2 class="mb-4">Kiểu Tóc Đẹp Không Phải Đích Đến – Mà Là Điểm Khởi Đầu</h2>
                <p>Một kiểu tóc đẹp không chỉ để ngắm nhìn – mà còn để cảm nhận:</p>
                <p>Cảm nhận sự thoải mái, tự tin, sẵn sàng đối mặt với mọi thử thách.</p>
                <p>Cảm nhận một phiên bản tốt hơn của chính mình.</p>
                <p>Với đội ngũ thợ tận tâm và các dịch vụ chăm sóc tóc chuyên nghiệp, Cut&Styles không chỉ mang đến một diện mạo mới.</p>
            </div>
        </section>

        <section id="logo" class="bg-light py-5">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <img src="image/image_logo/LogoShop.png" alt="alt" width="65%"/>
                    </div>
                    <div class="col-8">
                        <h2>Ý Nghĩa Logo Và Thương Hiệu</h2>
                        <p>
                            Cut&Styles đại diện cho sự tỏa sáng, khát vọng vươn lên và phong cách mạnh mẽ của mỗi người đàn ông hiện đại. Logo của chúng tôi thể hiện sự kết hợp giữa sự hiện đại và sự tự tin, với mong muốn khẳng định vị thế của bạn trong xã hội.
                        </p>
                        <p>
                            Màu sắc chủ đạo của Cut&Styles, với màu xanh dương hiện đại, là biểu tượng của sự đổi mới không ngừng và tinh thần khởi nghiệp mạnh mẽ.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section id="wills" class="py-5">
            <div class="container">
                <h2>WILLS – Văn Hoá Tinh Thần Của Những Người Dám Tiến Lên</h2>
                <p>
                    Tại Cut&Styles, chúng tôi không chỉ tạo ra diện mạo tuyệt vời, mà còn phục vụ những người đàn ông luôn muốn tốt hơn mỗi ngày. Dù bạn đang bắt đầu, bứt phá hay khẳng định chính mình, tinh thần WILLS luôn đồng hành cùng bạn:
                </p>
                <ul class="mb-4">
                    <li>W - Warrior (Chiến binh) – Kiên cường, không lùi bước trước thử thách</li>
                    <li>I - Intervention (Can thiệp) – Tạo ra cơ hội, không đợi hoàn hảo</li>
                    <li>L - Learning (Ham học hỏi) – Phát triển không giới hạn, không ngừng nâng cấp bản thân</li>
                    <li>L - Leadership (Đổi mới) – Sáng tạo và dẫn đầu sự thay đổi</li>
                    <li>S - Sincerity (Chân thành) – Minh bạch, đáng tin cậy, tạo dựng giá trị bền vững</li>
                </ul>
                <p>
                    Không có đúng hay sai – chỉ có phiên bản tốt nhất của chính mình, và Cut&Styles luôn đồng hành cùng bạn để giúp bạn tự tin thể hiện điều đó.
                </p>
            </div>
        </section>

        <section id="mission" class="bg-light py-5">
            <div class="container">
                <h2 class="mb-4">Sứ Mệnh – Tôn Vinh Đôi Bàn Tay Tài Hoa Người Thợ Việt</h2>
                <p>
                    Cut&Styles không chỉ là điểm tựa giúp đàn ông thể hiện phong độ, mà còn mang trong mình một sứ mệnh lớn hơn:
                </p>
                <p>
                    Chúng tôi tôn vinh và nâng tầm đôi bàn tay tài hoa của người thợ Việt trên bản đồ thế giới. Với tay nghề vượt trội, các thợ cắt tóc tại Cut&Styles không chỉ giỏi mà còn có thể vươn xa, khẳng định bản thân trong ngành tóc quốc tế.
                </p>
                <p>
                    Bằng việc không ngừng đổi mới, nâng cao chất lượng dịch vụ và xây dựng môi trường phát triển chuyên nghiệp, Cut&Styles giúp người thợ Việt phát triển bản thân, nghề nghiệp và vị thế trong ngành tóc toàn cầu.
                </p>
            </div>
        </section>

        <section id="endnote" class="py-5">
            <div class="container">
                <h2 class="mb-4">Ai Cũng Có Việc Lớn Của Riêng Mình – Chỉ Cần Một Điểm Tựa</h2>
                <p>
                    Không có lộ trình nào giống nhau. Không có đích đến nào là duy nhất. Tại Cut&Styles, chúng tôi sẽ là điểm tựa cho bạn trên hành trình tìm kiếm phong cách riêng của chính mình.
                </p>
            </div>
        </section>

        <footer class="bg-dark text-white py-4 text-center">
            <p>&copy; 2025 Cut&Styles. Tất cả quyền lợi được bảo lưu.</p>
        </footer>

        <!-- Link tới Bootstrap JS và các thư viện liên quan -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
