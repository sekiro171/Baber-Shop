package babershopDAO;

import static babershopDatabase.databaseInfo.DBURL;
import static babershopDatabase.databaseInfo.DRIVERNAME;
import static babershopDatabase.databaseInfo.PASSDB;
import static babershopDatabase.databaseInfo.USERDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import model.Appointment;

public class AppointmentDAO {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static Appointment getAppointment(int id) {
        String sql = "SELECT appointment_time, customer_id, staff_id FROM Appointment WHERE id = ?";
        try (Connection con = getConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                LocalDateTime appointmentTime = LocalDateTime.parse(rs.getString(1), DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                int customerId = rs.getInt(2);
                int staffId = rs.getInt(3);
                return new Appointment(appointmentTime, customerId, staffId);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "SELECT appointment_time, customer_id, staff_id FROM Appointment";
        try (Connection con = getConnect();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                LocalDateTime appointmentTime = LocalDateTime.parse(rs.getString(1), DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                int customerId = rs.getInt(2);
                int staffId = rs.getInt(3);
                appointments.add(new Appointment(appointmentTime, customerId, staffId));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return appointments;
    }

    public static void insertAppointment(String appointmentTime, int customerId, int staffId) {
        String sql = "INSERT INTO Appointment (appointment_time, customer_id, staff_id) VALUES (?, ?, ?)";
        try (Connection con = getConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, appointmentTime);
            ps.setInt(2, customerId);
            ps.setInt(3, staffId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void updateAppointment(int id, int staffId) {
        String sql = "UPDATE Appointment SET staff_id = ? WHERE id = ?";
        try (Connection con = getConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, staffId);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteAppointment(int id) {
        String sql = "DELETE FROM Appointment WHERE id = ?";
        try (Connection con = getConnect();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static List<String> getAllBookedDates() {
        List<String> dates = new ArrayList<>();
        String sql = "SELECT DISTINCT CAST(appointment_time AS DATE) AS bookedDate FROM Appointment WHERE status IN ('Pending', 'Confirmed')";
        try (Connection conn = getConnect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                dates.add(rs.getDate("bookedDate").toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return dates;
    }
}
