// BanCustomerServlet.java
package Controller;

import babershopDAO.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ban-customer")
public class BanCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean ban = Boolean.parseBoolean(request.getParameter("ban"));

            // Đảo trạng thái: nếu đang là active (1) thì ban (set 0), ngược lại mở ban (set 1)
            boolean success = CustomerDAO.banCustomer(id, ban);

            if (success) {
                System.out.println("✔ Đã cập nhật trạng thái cho tài khoản ID: " + id);
            } else {
                System.out.println("❌ Cập nhật thất bại cho tài khoản ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace();
           
        }

        // Redirect về trang quản lý khách hàng
        response.sendRedirect(request.getContextPath() + "/admin/view-customers");
    }
}
