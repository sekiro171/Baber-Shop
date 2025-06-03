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
import model.Customer;

public class CustomerDAO {

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


    public static List<Customer> getAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM [Customer]";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int accountId = rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                Customer cs = new Customer(accountId, firstName, lastName);
                customers.add(cs);
            }
            return customers;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void insertCustomer(String firstName, String lastName, String email, String password, String phoneNumber) {
        String sql1 = "INSERT INTO Account (email, phoneNumber, password , role) VALUES (?,?,?,?)";
        String sql2 = "INSERT INTO Customer (accountId, firstName, lastName) VALUES (?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement accountStmt = con.prepareStatement(sql1, PreparedStatement.RETURN_GENERATED_KEYS);
            accountStmt.setString(1, email);
            accountStmt.setString(2, phoneNumber);
            accountStmt.setString(3, password);
            accountStmt.setString(4, "Customer");
            int affectedRows = accountStmt.executeUpdate();
            if (affectedRows == 0) {
                con.rollback();
            }
            ResultSet rs = accountStmt.getGeneratedKeys();
            int accountID = 0;
            if (rs.next()) {
                accountID = rs.getInt(1);
            }

            PreparedStatement customerStmt = con.prepareStatement(sql2);
            customerStmt.setInt(1, accountID);
            customerStmt.setString(2, firstName);
            customerStmt.setString(3, lastName);
            affectedRows = customerStmt.executeUpdate();
            if (affectedRows > 0) {
                // neu commit thanh cong
                con.commit();
            } else {
                con.rollback();

            }
        } catch (SQLException e) {
            try (Connection con = getConnect()) {
                con.rollback();  // Rollback nếu có lỗi
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try (Connection con = getConnect();) {
                con.setAutoCommit(true);  // Đặt lại chế độ commit tự động
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void updateCustomer(int id, String firstName, String lastName, String email, String password, String phoneNumber) {

        String sql = "UPDATE Customer SET firstName = ?, lastName = ? WHERE id = ?";

        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, phoneNumber);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static boolean deleteCustomer(int id) {
        String sql = "update status from Customer = 0 where id =?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static boolean checkEmailExist(String email) {
        String sql = "Select id from Account where email=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }
    
    
    public static boolean checkPhoneExist(String phoneNummber) {
        String sql = "Select id from Account where phoneNumber=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, phoneNummber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }
    
}
