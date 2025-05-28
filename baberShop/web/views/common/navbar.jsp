<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <a class="nav-link" href="${pageContext.request.contextPath}/views/common/home.jsp">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/views/common/aboutUs.jsp">Về chúng tôi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/views/common/franchise.jsp">Nhượng quyền</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/views/booking/booking.jsp">Đặt lịch</a>
                </li>

                <!-- Hiển thị Dashboard cho Admin và Staff -->
                <c:if test="${sessionScope.account != null}">
                    <c:choose>
                        <c:when test="${sessionScope.account.role == 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/adminDashboard">Dashboard Admin</a>
                            </li>
                        </c:when>
                        <c:when test="${sessionScope.account.role == 'staff'}">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/staffDashboard">Dashboard Staff</a>
                            </li>
                        </c:when>
                    </c:choose>
                </c:if>

            </ul>

            <!-- Hiển thị nút login và register nếu chưa đăng nhập -->
            <div class="d-flex gap-2">
                <c:if test="${sessionScope.account == null}">
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                    <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/views/auth/register.jsp">Đăng ký</a>
                </c:if>

                <!-- Hiển thị thông tin người dùng và logout nếu đã đăng nhập -->
                <c:if test="${sessionScope.account != null}">
                    <span class="me-3" style="color: #FF9900"> Xin chào, <strong>${sessionScope.account.email}</strong></span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger">Logout</a>
                </c:if>
            </div>
        </div>
    </div>
</nav>
