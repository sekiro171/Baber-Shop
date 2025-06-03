package Controller;

import babershopDAO.StaffScheduleDAO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.StaffSchedule;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/api/staff-schedule")
public class StaffScheduleServlet extends HttpServlet {
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String staffIdStr = request.getParameter("staffId");
        String date = request.getParameter("date");

        if (staffIdStr == null || date == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu staffId hoặc date");
            return;
        }

        int staffId = Integer.parseInt(staffIdStr);
        List<StaffSchedule> schedules = StaffScheduleDAO.getScheduleByStaffAndDate(staffId, date);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(schedules));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedReader reader = request.getReader();
        StaffSchedule[] schedules = gson.fromJson(reader, StaffSchedule[].class);

        boolean success = StaffScheduleDAO.saveSchedule(List.of(schedules));

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\":" + success + "}");
    }
}
