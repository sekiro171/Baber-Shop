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
import java.util.ArrayList;
import java.util.List;
import model.Appointment;

public class AppointmentDAO {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver: " + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static Appointment getAppointment(int id) {
        String sql = "SELECT id, customerId, staffId, appointmentTime, numberOfPeople, status FROM Appointment WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setCustomerId(rs.getInt("customerId"));
                appointment.setStaffId(rs.getInt("staffId"));
                appointment.setAppointmentTime(rs.getTimestamp("appointmentTime"));
                appointment.setNumberOfPeople(rs.getInt("numberOfPeople"));
                appointment.setStatus(rs.getString("status"));
                return appointment;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "SELECT id, customerId, staffId, appointmentTime, numberOfPeople, status FROM Appointment";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setCustomerId(rs.getInt("customerId"));
                appointment.setStaffId(rs.getInt("staffId"));
                appointment.setAppointmentTime(rs.getTimestamp("appointmentTime"));
                appointment.setNumberOfPeople(rs.getInt("numberOfPeople"));
                appointment.setStatus(rs.getString("status"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return appointments;
    }

    public static boolean insertAppointment(java.util.Date appointmentTime, int customerId, int staffId, int numberOfPeople, String status) {
        String sql = "INSERT INTO Appointment (appointmentTime, customerId, staffId, numberOfPeople, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(appointmentTime.getTime()));
            ps.setInt(2, customerId);
            ps.setInt(3, staffId);
            ps.setInt(4, numberOfPeople);
            ps.setString(5, status);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        }
    }

    public static boolean insertAppointment(Appointment appointment) {
        String sql = "INSERT INTO Appointment (appointmentTime, customerId, staffId, numberOfPeople, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(appointment.getAppointmentTime().getTime()));
            ps.setInt(2, appointment.getCustomerId());
            ps.setInt(3, appointment.getStaffId());
            ps.setInt(4, appointment.getNumberOfPeople());
            ps.setString(5, appointment.getStatus());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        }
    }

    public static boolean updateAppointment(int id, java.util.Date appointmentTime, int staffId, int numberOfPeople, String status) {
        String sql = "UPDATE Appointment SET appointmentTime = ?, staffId = ?, numberOfPeople = ?, status = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(appointmentTime.getTime()));
            ps.setInt(2, staffId);
            ps.setInt(3, numberOfPeople);
            ps.setString(4, status);
            ps.setInt(5, id);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        }
    }

    public static boolean updateAppointment(Appointment appointment) {
        String sql = "UPDATE Appointment SET appointmentTime = ?, customerId = ?, staffId = ?, numberOfPeople = ?, status = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(appointment.getAppointmentTime().getTime()));
            ps.setInt(2, appointment.getCustomerId());
            ps.setInt(3, appointment.getStaffId());
            ps.setInt(4, appointment.getNumberOfPeople());
            ps.setString(5, appointment.getStatus());
            ps.setInt(6, appointment.getId());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        }
    }

    public static boolean deleteAppointment(int id) {
        String sql = "DELETE FROM Appointment WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        }
    }

}