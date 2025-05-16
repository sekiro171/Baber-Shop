<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>About Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="CSS/html.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg custom-navbar border-bottom shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="image/image_logo/LogoShop.png" alt="Logo" width="55" height="55" class="me-2">
                    Cut&Styles Barber
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Trang ch?</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aboutUs.jsp">V? chúng tôi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Nh??ng quy?n</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">??i tác</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">??t l?ch</a>
                        </li>
                    </ul>

                    <div class="d-flex gap-2">
                        <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/views/auth/login.jsp">??ng nh?p</a>
                        <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/views/auth/register.jsp">??ng ký</a>
                    </div>
                </div>
            </div>
        </nav>

    </body>
</html>
