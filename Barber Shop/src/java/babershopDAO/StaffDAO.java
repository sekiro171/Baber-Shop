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
import model.Staff;

public class StaffDAO {

    // Method to establish a connection to the database
    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver: " + e);
        }
        try {
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    // Method to get a staff member by ID
    public static Staff getStaff(int id) {
        String sql = "SELECT s.id, a.email, a.phoneNumber, a.password, a.role, a.status, s.firstName, s.lastName, s.img " +
                     "FROM Staff s JOIN Account a ON s.accountId = a.id WHERE s.id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                        rs.getString("password"), rs.getString("role"), rs.getInt("status"),
                                        rs.getString("firstName"), rs.getString("lastName"), rs.getString("img"));
                return staff;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to check staff login
    public Staff checkStaff(String username, String password) {
        String sql = "SELECT s.id, a.email, a.phoneNumber, a.password, a.role, a.status, s.firstName, s.lastName, s.img " +
                     "FROM Staff s JOIN Account a ON s.accountId = a.id WHERE a.email = ? AND a.password = ? AND a.status = 1";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Staff staff = new Staff(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                        rs.getString("password"), rs.getString("role"), rs.getInt("status"),
                                        rs.getString("firstName"), rs.getString("lastName"), rs.getString("img"));
                return staff;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to get all staff members
    public static List<Staff> getAllStaffs() {
        List<Staff> staffs = new ArrayList<>();
        String sql = "SELECT s.id, a.email, a.phoneNumber, a.password, a.role, a.status, s.firstName, s.lastName, s.img " +
                     "FROM Staff s JOIN Account a ON s.accountId = a.id";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                        rs.getString("password"), rs.getString("role"), rs.getInt("status"),
                                        rs.getString("firstName"), rs.getString("lastName"), rs.getString("img"));
                staffs.add(staff);
            }
            return staffs;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return staffs;
    }

    // Method to insert a new staff member
    public static void insertStaff(int accountId, String firstName, String lastName, String img) {
        String sql = "INSERT INTO Staff (accountId, firstName, lastName, img) VALUES (?,?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, img);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to update staff details
    public static void updateStaff(int id, String firstName, String lastName, String img) {
        String sql = "UPDATE Staff SET firstName = ?, lastName = ?, img = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, img);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to soft delete a staff member (by setting status to 0)
    public static boolean deleteStaff(int id) {
        String sql = "UPDATE Account SET status = 0 WHERE id IN (SELECT accountId FROM Staff WHERE id = ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
