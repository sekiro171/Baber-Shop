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

    // Method to get a customer by ID
    public static Customer getCustomer(int id) {
        String sql = "SELECT c.id, c.accountId, c.firstName, c.lastName, a.email, a.phoneNumber, a.password FROM Customer c " +
                     "JOIN Account a ON c.accountId = a.id WHERE c.id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                                 rs.getString("password"), "customer", 1, 
                                                 rs.getString("firstName"), rs.getString("lastName"));
                return customer;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to check customer credentials (login)
    public Customer checkCustomer(String username, String password) {
        String sql = "SELECT c.id, c.accountId, c.firstName, c.lastName, a.email, a.phoneNumber FROM Customer c " +
                     "JOIN Account a ON c.accountId = a.id WHERE a.email = ? AND a.password = ? AND a.status = 1";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                                 password, "customer", 1, 
                                                 rs.getString("firstName"), rs.getString("lastName"));
                return customer;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Method to get all customers
    public static List<Customer> getAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT c.id, c.accountId, c.firstName, c.lastName, a.email, a.phoneNumber, a.password FROM Customer c " +
                     "JOIN Account a ON c.accountId = a.id";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getInt("id"), rs.getString("email"), rs.getString("phoneNumber"), 
                                                 rs.getString("password"), "customer", 1, 
                                                 rs.getString("firstName"), rs.getString("lastName"));
                customers.add(customer);
            }
            return customers;
        } catch (Exception e) {
            System.out.println(e);
        }
        return customers;
    }

    // Method to insert a new customer
    public static boolean insertCustomer(String firstName, String lastName, String email, String password, String phoneNumber) {
        String insertAccountSql = "INSERT INTO Account (email, password, phoneNumber, role, status) VALUES (?,?,?,?,?)";
        String insertCustomerSql = "INSERT INTO Customer (accountId, firstName, lastName) VALUES (?,?,?)";
        try (Connection con = getConnect()) {
            con.setAutoCommit(false);

            // Insert into Account table
            PreparedStatement ps1 = con.prepareStatement(insertAccountSql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps1.setString(1, email);
            ps1.setString(2, password);
            ps1.setString(3, phoneNumber);
            ps1.setString(4, "customer");
            ps1.setInt(5, 1);
            int affectedRows = ps1.executeUpdate();

            if (affectedRows == 0) {
                con.rollback();
                return false;
            }

            // Retrieve the generated account ID
            ResultSet rs = ps1.getGeneratedKeys();
            int accountId = 0;
            if (rs.next()) {
                accountId = rs.getInt(1);
            }

            // Insert into Customer table
            PreparedStatement ps2 = con.prepareStatement(insertCustomerSql);
            ps2.setInt(1, accountId);
            ps2.setString(2, firstName);
            ps2.setString(3, lastName);
            affectedRows = ps2.executeUpdate();

            if (affectedRows > 0) {
                con.commit();
                return true;
            } else {
                con.rollback();
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    // Method to update a customer's details
    public static void updateCustomer(int id, String firstName, String lastName, String email, String password, String phoneNumber) {
        String updateAccountSql = "UPDATE Account SET email = ?, password = ?, phoneNumber = ? WHERE id = " +
                                  "(SELECT accountId FROM Customer WHERE id = ?)";
        String updateCustomerSql = "UPDATE Customer SET firstName = ?, lastName = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            con.setAutoCommit(false);

            // Update Account table
            PreparedStatement ps1 = con.prepareStatement(updateAccountSql);
            ps1.setString(1, email);
            ps1.setString(2, password);
            ps1.setString(3, phoneNumber);
            ps1.setInt(4, id);
            ps1.executeUpdate();

            // Update Customer table
            PreparedStatement ps2 = con.prepareStatement(updateCustomerSql);
            ps2.setString(1, firstName);
            ps2.setString(2, lastName);
            ps2.setInt(3, id);
            ps2.executeUpdate();

            con.commit();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Method to delete a customer (soft delete by setting status to 0)
    public static boolean deleteCustomer(int id) {
        String sql = "UPDATE Account SET status = 0 WHERE id = (SELECT accountId FROM Customer WHERE id = ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println("1");
    }
}
