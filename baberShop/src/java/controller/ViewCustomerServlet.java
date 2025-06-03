// ViewCustomerServlet.java
package Controller;

import babershopDAO.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Customer;


@WebServlet("/admin/view-customers")
public class ViewCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> userList = CustomerDAO.getAllCustomer();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/views/admin/customerManagement.jsp").forward(request, response);
    }
}
