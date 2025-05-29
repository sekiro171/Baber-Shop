
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import babershopDAO.AccountDAO;
import babershopDAO.AdminDAO;
import babershopDAO.CustomerDAO;
import babershopDAO.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Admin;
import model.Customer;
import model.Staff;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        // Sử dụng AccountDAO để kiểm tra đăng nhập
        Account account = AccountDAO.checkAccount(email, password);

        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            
            Customer customer = CustomerDAO.getCustomerByAccountId(account.getId());
            session.setAttribute("customer", customer);
            Staff staff = StaffDAO.getStaffByAccountId(account.getId());
            session.setAttribute("staff", staff);
            Admin admin = AdminDAO.getAdminByAccountId(account.getId());
            session.setAttribute("admin", admin);
            if ("Admin".equals(account.getRole())) {
                response.sendRedirect(request.getContextPath() + "/views/admin/dashboard.jsp");
            } else if ("Staff".equals(account.getRole())) {
                response.sendRedirect(request.getContextPath() + "/views/staff/registerForAShift.jsp");
//            } else if("Customer".equals(account.getRole())) {
            } else {
                response.sendRedirect(request.getContextPath() + "/views/common/home.jsp");
            }
            // Lưu email vào cookie nếu 'remember me' được chọn
            if ("on".equals(remember)) {
                Cookie userCookie = new Cookie("username", email);
                userCookie.setMaxAge(3 * 24 * 60 * 60);
                response.addCookie(userCookie);
            }
        } else {
            request.setAttribute("loginError", "Sai email hoặc mật khẩu!");
            System.out.println("Login fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
