package babershopDAO;

import static babershopDatabase.databaseInfo.DBURL;
import static babershopDatabase.databaseInfo.DRIVERNAME;
import static babershopDatabase.databaseInfo.PASSDB;
import static babershopDatabase.databaseInfo.USERDB;
import java.beans.Statement;
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


    public void insertAppointment(String appointmentTime, int customerId, int staffId) {
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

    public void updateAppointment(int id, int staffId) {

        String sql = "UPDATE Appointment SET staff_id = ? WHERE id = ?";

        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, staffId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteAppointment(int id) {
        String sql = "delete from Appointment where id=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int sizeOfListAppointment() {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "Select id from Appointment";
        int count = 0;
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ++count;
            }
            return count;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public String Booking(int customerId, int staffId, String appointmentTime, int numberOfPeople, int serviceId) {
        String insertAppointment = "INSERT INTO Appointment (customerId, staffId, appointmentTime, [numberOfPeople], [status]) VALUES (?, ?, ?, ?, 'pending')";
        String insertAppointmentService = "INSERT INTO Appointment_Service (appointmentId, serviceId, quantity) VALUES (?, ?, ?)";
        String checkDuplicate = "SELECT COUNT(*) FROM Appointment WHERE staffId = ? AND appointmentTime = ?";

        try (Connection con = getConnect()) {

            // --- Bước 1: Kiểm tra trùng lịch ---
            try (PreparedStatement checkStmt = con.prepareStatement(checkDuplicate)) {
                checkStmt.setInt(1, staffId);
                checkStmt.setString(2, appointmentTime);
                ResultSet rsCheck = checkStmt.executeQuery();
                if (rsCheck.next() && rsCheck.getInt(1) > 0) {
                    return "Staff is not available at this time.";
                }
            }

            // --- Bước 2: Insert vào bảng Appointment ---
            try (PreparedStatement ps1 = con.prepareStatement(insertAppointment, PreparedStatement.RETURN_GENERATED_KEYS)) {
                ps1.setInt(1, customerId);
                ps1.setInt(2, staffId);
                ps1.setString(3, appointmentTime);
                ps1.setInt(4, numberOfPeople);

                int check = ps1.executeUpdate();
                if (check > 0) {
                    try (ResultSet rs = ps1.getGeneratedKeys()) {
                        if (rs.next()) {
                            int appointmentId = rs.getInt(1);

                            // --- Bước 3: Insert vào bảng AppointmentService ---
                            try (PreparedStatement ps2 = con.prepareStatement(insertAppointmentService)) {
                                ps2.setInt(1, appointmentId);
                                ps2.setInt(2, serviceId);
                                ps2.setInt(3, 1); // quantity
                                int check2 = ps2.executeUpdate();
                                if (check2 > 0) {
                                    return "Booking successful";
                                } else {
                                    return "Booking failed when adding service";
                                }
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra để debug
        }

        return "Không thể kết nối server";
    }

}
