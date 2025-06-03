
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Sekiro
 */
@WebServlet(name = "ConfirmationServlet", urlPatterns = {"/ConfirmationServlet"})
public class ConfirmationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String message = (String) request.getAttribute("message");
       int customerId = (Integer) request.getAttribute("customerId");
       int staffId =  (Integer) request.getAttribute("staffId");
       int serviceId =  (Integer) request.getAttribute("serviceId");
       int numberOfPeople =  (Integer) request.getAttribute("numberOfPeople");
       request.setAttribute("message", message);
       request.setAttribute("customerId", customerId);
       request.setAttribute("staffId", staffId);
       request.setAttribute("numberOfPeople", numberOfPeople);
       request.setAttribute("servieId", serviceId);
       request.getRequestDispatcher("confirmation.jsp").forward(request, response);
       
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
