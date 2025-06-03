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

    public static Customer getCustomer(int id) {
        String sql = "SELECT c.id, c.accountId, c.firstName, c.lastName, "
                + "a.email, a.phoneNumber, a.status "
                + "FROM Customer c JOIN Account a ON c.accountId = a.id WHERE c.id = ?";
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("id"),
                        rs.getInt("accountId"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getInt("status")
                );
            }
        } catch (Exception e) {
            System.out.println("🔥 ERROR in getCustomer(): " + e);
        }
        return null;
    }

    public static Customer checkCustomer(String email, String password) {
        String sql = "SELECT c.id, c.accountId, c.firstName, c.lastName, "
                + "a.email, a.phoneNumber, a.status "
                + "FROM Customer c JOIN Account a ON c.accountId = a.id "
                + "WHERE a.email = ? AND a.password = ? AND a.status = 1";
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("id"),
                        rs.getInt("accountId"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getInt("status")
                );
            }
        } catch (Exception e) {
            System.out.println("🔥 ERROR in checkCustomer(): " + e);
        }
        return null;
    }

    // ✅ GET ALL CUSTOMERS
    public static List<Customer> getAllCustomer() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT DISTINCT c.id, c.accountId, c.firstName, c.lastName, " +
             "a.email, a.phoneNumber, a.status " +
             "FROM Customer c JOIN Account a ON c.accountId = a.id";
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Customer cs = new Customer(
                        rs.getInt("id"),
                        rs.getInt("accountId"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getInt("status")
                );
                customers.add(cs);
            }
        } catch (Exception e) {
            System.out.println("🔥 ERROR in getAllCustomer(): " + e);
        }
        return customers;
    }

    public static void insertCustomer(String firstName, String lastName, String email, String password, String phoneNumber) {
    String sqlCheckAccount = "SELECT id FROM Account WHERE email = ? OR phoneNumber = ?";
    String sqlCheckCustomer = "SELECT * FROM Customer WHERE accountId = ?";
    String sqlInsertAccount = "INSERT INTO Account (email, phoneNumber, password, role, status) VALUES (?, ?, ?, 'Customer', 1)";
    String sqlGetAccountId = "SELECT id FROM Account WHERE email = ?";
    String sqlInsertCustomer = "INSERT INTO Customer (accountId, firstName, lastName) VALUES (?, ?, ?)";

    try (Connection con = getConnect()) {
        con.setAutoCommit(false);

        // Step 1: Kiểm tra email hoặc số điện thoại đã tồn tại trong Account
        PreparedStatement checkAccountPs = con.prepareStatement(sqlCheckAccount);
        checkAccountPs.setString(1, email);
        checkAccountPs.setString(2, phoneNumber);
        ResultSet checkAccountRs = checkAccountPs.executeQuery();

        if (checkAccountRs.next()) {
            int accountId = checkAccountRs.getInt("id");

            // Step 2: Kiểm tra accountId đã có trong bảng Customer chưa
            PreparedStatement checkCustomerPs = con.prepareStatement(sqlCheckCustomer);
            checkCustomerPs.setInt(1, accountId);
            ResultSet checkCustomerRs = checkCustomerPs.executeQuery();

            if (checkCustomerRs.next()) {
                System.out.println("❌ Tài khoản đã tồn tại trong Customer. Hủy thêm mới.");
                con.rollback();
                return;
            } else {
                System.out.println("⚠️ Email/số điện thoại đã tồn tại nhưng chưa tạo Customer.");
                // Nếu muốn: vẫn cho phép thêm Customer mới → bạn có thể chèn đoạn insert ở đây.
                return;
            }
        }

        // Step 3: Insert vào Account
        PreparedStatement insertAccountPs = con.prepareStatement(sqlInsertAccount);
        insertAccountPs.setString(1, email);
        insertAccountPs.setString(2, phoneNumber);
        insertAccountPs.setString(3, password);
        insertAccountPs.executeUpdate();

        // Step 4: Lấy accountId vừa insert
        PreparedStatement getIdPs = con.prepareStatement(sqlGetAccountId);
        getIdPs.setString(1, email);
        ResultSet getIdRs = getIdPs.executeQuery();

        if (getIdRs.next()) {
            int newAccountId = getIdRs.getInt("id");

            // Step 5: Insert vào Customer
            PreparedStatement insertCustomerPs = con.prepareStatement(sqlInsertCustomer);
            insertCustomerPs.setInt(1, newAccountId);
            insertCustomerPs.setString(2, firstName);
            insertCustomerPs.setString(3, lastName);
            insertCustomerPs.executeUpdate();

            con.commit();
            System.out.println("✅ Thêm khách hàng mới thành công.");
        } else {
            con.rollback();
            System.out.println("❌ Không tìm thấy accountId sau khi insert Account.");
        }

    } catch (Exception e) {
        System.out.println("🔥 ERROR in insertCustomer(): " + e);
    }
}



    // ✅ UPDATE CUSTOMER
    public static void updateCustomer(int accountId, String firstName, String lastName, String email, String password, String phoneNumber) {
        String sqlCustomer = "UPDATE Customer SET firstName = ?, lastName = ? WHERE accountId = ?";
        String sqlAccount = "UPDATE Account SET email = ?, password = ?, phoneNumber = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            con.setAutoCommit(false);

            PreparedStatement ps1 = con.prepareStatement(sqlCustomer);
            ps1.setString(1, firstName);
            ps1.setString(2, lastName);
            ps1.setInt(3, accountId);
            ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement(sqlAccount);
            ps2.setString(1, email);
            ps2.setString(2, password);
            ps2.setString(3, phoneNumber);
            ps2.setInt(4, accountId);
            ps2.executeUpdate();

            con.commit();
            System.out.println("✅ Cập nhật khách hàng thành công.");
        } catch (Exception e) {
            System.out.println("🔥 ERROR in updateCustomer(): " + e);
        }
    }

    // ✅ DELETE CUSTOMER (ẩn đi)
    public static boolean deleteCustomer(int accountId) {
        String sql = "UPDATE Account SET status = 0 WHERE id = ?";
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("🔥 ERROR in deleteCustomer(): " + e);
            return false;
        }
    }

    // ✅ BAN/UNBAN CUSTOMER
    public static boolean banCustomer(int accountId, boolean ban) {
        String sql = "UPDATE Account SET status = ? WHERE id = ?";
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, ban ? 0 : 1);
            ps.setInt(2, accountId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("🔥 ERROR in banCustomer(): " + e);
            return false;
        }
    }

}
