package babershopDAO;

import model.StaffSchedule;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static babershopDatabase.databaseInfo.*;

public class StaffScheduleDAO {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (Exception e) {
            System.out.println("DB Connect Error: " + e);
        }
        return null;
    }

    public static List<StaffSchedule> getScheduleByStaffAndDate(int staffId, String date) {
        List<StaffSchedule> schedules = new ArrayList<>();
        String sql = "SELECT id, staff_id, work_date, time_slot, status FROM StaffSchedule WHERE staff_id = ? AND work_date = ?";

        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, staffId);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StaffSchedule s = new StaffSchedule(
                        rs.getInt("id"),
                        rs.getInt("staff_id"),
                        rs.getString("work_date"),
                        rs.getString("time_slot"),
                        rs.getString("status")
                );
                schedules.add(s);
            }
        } catch (Exception e) {
            System.out.println("getSchedule Error: " + e);
        }
        return schedules;
    }

    public static boolean saveSchedule(List<StaffSchedule> schedules) {
        String deleteSQL = "DELETE FROM StaffSchedule WHERE staff_id = ? AND work_date = ?";
        String insertSQL = "INSERT INTO StaffSchedule (staff_id, work_date, time_slot, status) VALUES (?, ?, ?, ?)";

        if (schedules.isEmpty()) return false;

        try (Connection conn = getConnect();
             PreparedStatement del = conn.prepareStatement(deleteSQL);
             PreparedStatement ins = conn.prepareStatement(insertSQL)) {

            conn.setAutoCommit(false);

            int staffId = schedules.get(0).getStaffId();
            String workDate = schedules.get(0).getWorkDate();

            del.setInt(1, staffId);
            del.setString(2, workDate);
            del.executeUpdate();

            for (StaffSchedule s : schedules) {
                ins.setInt(1, s.getStaffId());
                ins.setString(2, s.getWorkDate());
                ins.setString(3, s.getTimeSlot());
                ins.setString(4, s.getStatus());
                ins.addBatch();
            }
            ins.executeBatch();
            conn.commit();
            return true;
        } catch (Exception e) {
            System.out.println("saveSchedule Error: " + e);
        }
        return false;
    }
} 
