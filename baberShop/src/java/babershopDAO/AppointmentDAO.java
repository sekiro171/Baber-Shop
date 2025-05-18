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
import model.Service;

public class AppointmentDAO {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
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
        String sql = "Select appointment_time,  customer_id, staff_id from Appointment where id= ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String date = rs.getString(1);
                LocalDateTime appointment_time = LocalDateTime.parse(date, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                int customerId = rs.getInt(2);
                int staff = rs.getInt(3);
                Appointment appointment = new Appointment(appointment_time, customerId, staff);
                return appointment;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "Select appointment_time,  customer_id, staff_id from Appointment";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String date = rs.getString(1);
                LocalDateTime appointment_time = LocalDateTime.parse(date, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                int customerId = rs.getInt(2);
                int staff = rs.getInt(3);
                Appointment appointment = new Appointment(appointment_time, customerId, staff);
                appointments.add(appointment);
                return appointments;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void insertAppointment(String appointmentTime, int customerId, int staffId) {
        String sql = "INSERT INTO Appointment (appointment_time, customer_id, staff_id, ) VALUES (?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
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

        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, staffId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteAppointment(int id) {
        String sql = "delete from Appointment where id=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
