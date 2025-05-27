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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Feedback;

/**
 * @author Sekiro
 */
public class FeedbackDAO {
    
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
    
    // Lấy tất cả feedback
    public static List<Feedback> getAllFeedback() {
        List<Feedback> feedbacks = new ArrayList<>();
        String sql = "SELECT id, customerId, staffId, appointmentId, serviceId, rating, comment, feedbackTime FROM Feedback";
        
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setStaffId(rs.getInt("staffId"));
                feedback.setAppointmentId(rs.getInt("appointmentId"));
                feedback.setServiceId(rs.getInt("serviceId"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                
                feedbacks.add(feedback);
            }
            return feedbacks;
        } catch (SQLException e) {
            System.out.println("Error in getAllFeedback: " + e);
        }
        return feedbacks;
    }
    
    // Lấy feedback theo ID
    public static Feedback getFeedbackById(int id) {
        String sql = "SELECT id, customerId, staffId, appointmentId, serviceId, rating, comment, feedbackTime FROM Feedback WHERE id = ?";
        
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setCustomerId(rs.getInt("customerId"));
                feedback.setStaffId(rs.getInt("staffId"));
                feedback.setAppointmentId(rs.getInt("appointmentId"));
                feedback.setServiceId(rs.getInt("serviceId"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedback.setFeedbackTime(rs.getTimestamp("feedbackTime"));
                
                return feedback;
            }
        } catch (SQLException e) {
            System.out.println("Error in getFeedbackById: " + e);
        }
        return null;
    }
    
    // Thêm feedback mới
    public static boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (customerId, staffId, appointmentId, serviceId, rating, comment, feedbackTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, feedback.getCustomerId());
            ps.setInt(2, feedback.getStaffId());
            ps.setInt(3, feedback.getAppointmentId());
            ps.setInt(4, feedback.getServiceId());
            ps.setInt(5, feedback.getRating());
            ps.setString(6, feedback.getComment());
            ps.setTimestamp(7, new Timestamp(feedback.getFeedbackTime().getTime()));
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error in addFeedback: " + e);
        }
        return false;
    }
}