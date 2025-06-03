/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import babershopDAO.AppointmentDAO;
import babershopDAO.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Staff;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List <Staff> staffs = StaffDAO.getAllStaff();
        request.setAttribute("listOfStaff", staffs);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form parameters
//            String customerIdStr = request.getParameter("customerId");
//            String staffIdStr = request.getParameter("staffId");
            String numberOfPeopleStr = request.getParameter("numberOfPeople");
            String appointmentDateStr = request.getParameter("appointmentDate"); // e.g., "2025-06-02"
            String appointmentTimeStr = request.getParameter("appointmentTime"); // e.g., "08:30"
//            String[] serviceIds = request.getParameterValues("serviceId"); // Array of service IDs

            // Validate parameters
//            if (customerIdStr == null || staffIdStr == null || numberOfPeopleStr == null ||
//                appointmentDateStr == null || appointmentTimeStr == null || serviceIds == null) {
//                throw new IllegalArgumentException("One or more required parameters are missing");
//            }

            // Parse parameters
//            int customerId = Integer.parseInt(customerIdStr);
//            int staffId = Integer.parseInt(staffIdStr);
            int numberOfPeople = Integer.parseInt(numberOfPeopleStr);

            // Parse date and time
            LocalDate appointmentDate = LocalDate.parse(appointmentDateStr); // Parse YYYY-MM-DD
            LocalTime appointmentTime = LocalTime.parse(appointmentTimeStr); // Parse HH:MM
            LocalDateTime appointmentDateTime = LocalDateTime.of(appointmentDate, appointmentTime);

            // Format dateTime for AppointmentDAO (assuming it expects "YYYY-MM-DD HH:MM:SS")
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String dateTime = appointmentDateTime.format(formatter);


            // Call AppointmentDAO (assuming it handles multiple services)
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            // Since the original Booking method only handles one serviceId, loop through serviceIds
            String message = null;


                message = appointmentDAO.Booking(1, 1, dateTime, numberOfPeople, 1);
                System.out.println("Booking result for service ID " + ": " + message);
            

            // Redirect to confirmation page
            request.setAttribute("message", message);
            request.getRequestDispatcher("/views/booking/confirmation.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing booking: " + e.getMessage());
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
