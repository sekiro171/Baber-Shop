<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Franchise</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Kết nối với Google Fonts để thay đổi font chữ -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CSS/html.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .form{
                margin: 30px;
                border: solid, 2px;
                border-radius:  20px;
                border-color: #3acfd2;
                padding: 40px;
                font-size: 20px;
                align-content: center
            }
        </style>
    </head>
    <body>
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
                        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/views/auth/login.jsp">Đăng nhập</a>
                        <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/views/auth/register.jsp">Đăng ký</a>
                    </div>
                </div>
            </div>
        </nav>


        <section>
            <div  class="container">
                <div>
                    <h2>
                        Nhượng quyền kinh doanh thành công cùng thương hiệu Cut&Style
                    </h2>
                </div>
                <div class="row">
                    <div class="col-3 text-center form" style="margin: 30px; border: solid, 2px; border-radius:  20px; border-color: #3acfd2 ">
                        Quy trình vận hành, dịch vụ, marketing và thương hiệu đã được xây dựng và chứng minh từ 2015
                    </div>
                    <div class="col-3 text-center form" style="margin: 30px">
                        Đối tác có thể tự đầu tư với khả năng thu hồi vốn nhanh chóng hoặc kết hợp 30Shine đầu tư, đối tác vận hành khai thác kinh doanh
                    </div>
                    <div class="col-3 text-center form" style="margin: 30px">
                        Tỷ suất lợi nhuận mang lại cao và ổn định
                    </div>
                </div>
                <div>
                    <button> 
                </div>
            </div>
        </section>

        <section>
            <div class="container">
                <div>
                    <h2>
                        Nhượng quyền kinh doanh thành công cùng thương hiệu Cut&Style
                    </h2>
                </div>
                <div class="row">
                    <div class="col-7">
                        <p>Thương hiệu Cut&Style được thành lập vào năm 2022 với cửa hàng đầu tiên tại Đà Nẵng. Trong suốt thời gian qua,
                            Cut&Style luôn khẳng định vị thế của mình trên thị trường, và luôn nhận được sự thương yêu và ủng hộ từ khách hàng.</p>
                        <p>Hiện nay, Cut&Style đang muốn tìm kiếm đối tác kinh doanh nhượng quyền thương hiệu Cut&Style.</p>
                        <p>Với sự chuẩn bị kỹ càng về chương trình marketing tổng thể và chương trình bán hàng hiệu quả cho từng cửa hàng.
                            Doanh thu của các cửa hàng thương hiệu 30Shine luôn nằm trong mức cao hơn thị trường với lợi nhuận hấp dẫn.</p>
                    </div>
                    <div class="col-4">

                    </div>

                </div>
            </div>
        </section>
    </body>

</html>
