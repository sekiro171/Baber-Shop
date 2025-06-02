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

    public static Customer getCustomerByAccountId(int accountId) {
        String sql = "SELECT * FROM [Customer] WHERE accountId = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString(3);
                Customer cs = new Customer(accountId, firstName, lastName);
                System.out.println(cs);
                return cs;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer checkCustomer(int accountId, String username, String password) {
        String sql = "SELECT first_name, last_name, email, phone_number FROM Customer WHERE email = ? and password = ? and [status] = 1";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(accountId, rs.getString("first_name"), rs.getString("last_name"));
                return customer;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void insertCustomer(int accountId, String firstName, String lastName) {
        String sql = "INSERT INTO Customer (accountId, firstName, lastName) VALUES (?, ?, ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.executeUpdate();
            System.out.println("Đã thêm customer với accountId: " + accountId);
        } catch (Exception e) {
            System.out.println("Lỗi khi thêm customer: " + e);
            e.printStackTrace();
        }
    }

    public static void updateCustomer(int id, String firstName, String lastName, String email, String password, String phoneNumber) {

        String sql = "UPDATE Customer SET first_name = ?, last_name = ?, email = ?, password = ?, phone_number = ? WHERE id = ?";

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
        String sql = "UPDATE Customer SET status = 0 WHERE id =?";
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

    public static void main(String[] args) {
        System.out.println("1");
    }
}
