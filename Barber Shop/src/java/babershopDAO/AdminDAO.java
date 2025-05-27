package babershopDAO;

import static database.DatabaseInfor.DBURL;
import static database.DatabaseInfor.DRIVERNAME;
import static database.DatabaseInfor.PASSDB;
import static database.DatabaseInfor.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Admin;

public class AdminDAO {

    // Method to establish the connection
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
    
    // Method to check admin login based on username and password
    public Admin checkAdmin(String username, String password) {
        String sql = "SELECT a.id, a.firstName, a.lastName, ac.email, ac.phoneNumber FROM Admin a " +
                    "JOIN Account ac ON a.accountId = ac.id WHERE ac.email = ? AND ac.password = ?";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                      password, "admin", 1, rs.getString("firstName"), rs.getString("lastName"));
                return admin;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to get a specific admin by ID
    public static Admin getAdmin(int id) {
        String sql = "SELECT a.id, a.firstName, a.lastName, ac.email, ac.phoneNumber, ac.password FROM Admin a " +
                    "JOIN Account ac ON a.accountId = ac.id WHERE a.id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                      rs.getString("password"), "admin", 1, rs.getString("firstName"), rs.getString("lastName"));
                return admin;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to retrieve all admins
    public static List<Admin> getAllAdmin() {
        List<Admin> admins = new ArrayList<>();
        String sql = "SELECT a.id, a.firstName, a.lastName, ac.email, ac.phoneNumber, ac.password FROM Admin a " +
                    "JOIN Account ac ON a.accountId = ac.id";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                      rs.getString("password"), "admin", 1, rs.getString("firstName"), rs.getString("lastName"));
                admins.add(admin);
            }
            return admins;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return admins;
    }

    // Method to insert a new admin
    public static void insertAdmin(String firstName, String lastName, String email, String password, String phoneNumber) {
        String insertAccountSql = "INSERT INTO Account (email, phoneNumber, password, role, status) VALUES (?,?,?,?,?)";
        String insertAdminSql = "INSERT INTO Admin (accountId, firstName, lastName) VALUES (?,?,?)";
        
        try (Connection con = getConnect()) {
            con.setAutoCommit(false);  // Start transaction
            
            // Insert into Account table
            PreparedStatement ps1 = con.prepareStatement(insertAccountSql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps1.setString(1, email);
            ps1.setString(2, phoneNumber);
            ps1.setString(3, password);
            ps1.setString(4, "admin");
            ps1.setInt(5, 1);
            ps1.executeUpdate();
            
            ResultSet rs = ps1.getGeneratedKeys();
            int accountId = 0;
            if (rs.next()) {
                accountId = rs.getInt(1);  // Get generated accountId
            }
            
            // Insert into Admin table
            PreparedStatement ps2 = con.prepareStatement(insertAdminSql);
            ps2.setInt(1, accountId);
            ps2.setString(2, firstName);
            ps2.setString(3, lastName);
            ps2.executeUpdate();
            
            con.commit();  // Commit transaction
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to update admin details
    public static void updateAdmin(int id, String firstName, String lastName, String email, String password, String phoneNumber) {
        String updateAccountSql = "UPDATE Account SET email = ?, phoneNumber = ?, password = ? WHERE id = " +
                                 "(SELECT accountId FROM Admin WHERE id = ?)";
        String updateAdminSql = "UPDATE Admin SET firstName = ?, lastName = ? WHERE id = ?";
        
        try (Connection con = getConnect()) {
            con.setAutoCommit(false);  // Start transaction
            
            // Update Account table
            PreparedStatement ps1 = con.prepareStatement(updateAccountSql);
            ps1.setString(1, email);
            ps1.setString(2, phoneNumber);
            ps1.setString(3, password);
            ps1.setInt(4, id);
            ps1.executeUpdate();
            
            // Update Admin table
            PreparedStatement ps2 = con.prepareStatement(updateAdminSql);
            ps2.setString(1, firstName);
            ps2.setString(2, lastName);
            ps2.setInt(3, id);
            ps2.executeUpdate();
            
            con.commit();  // Commit transaction
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
