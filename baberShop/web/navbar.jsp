<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Navbar Cut&Styles</title>
  <style>
    body {
      margin: 0;
      font-family: sans-serif;
    }
    .navbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 30px;
      background-color: #fff;
      border-bottom: 1px solid #ddd;
    }
    .logo {
      display: flex;
      align-items: center;
      font-size: 22px;
      font-weight: bold;
      color: #003366;
    }
    .logo img {
      height: 32px;
      margin-right: 10px;
    }
    .nav-links {
      display: flex;
      gap: 25px;
      align-items: center;
    }
    .nav-links a {
      text-decoration: none;
      color: #000;
      font-size: 15px;
      position: relative;
    }
    .nav-links a.active::after {
      content: "";
      position: absolute;
      left: 0;
      bottom: -4px;
      width: 100%;
      height: 2px;
      background-color: #004aad;
    }
    .auth-buttons {
      display: flex;
      gap: 12px;
    }
    .auth-buttons button {
      padding: 6px 14px;
      border: 1px solid #004aad;
      background-color: white;
      color: #004aad;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }
    .auth-buttons button:hover {
      background-color: #004aad;
      color: white;
    }
  </style>
</head>
<body>

  <nav class="navbar">
    <div class="logo">
      <img src="logo.png" alt="Cut&Styles"> <!-- Thay ?nh logo n?u có -->
      Cut&Styles Barber
    </div>
    <div class="nav-links">
      <a href="#" class="active">Trang ch?</a>
      <a href="#">V? chúng tôi</a>
      <a href="#">Nh??ng quy?n</a>
      <a href="#">??i tác</a>
    </div>
    <div class="auth-buttons">
      <button>??ng nh?p</button>
      <button>??ng ký</button>
    </div>
  </nav>

</body>
</html>
