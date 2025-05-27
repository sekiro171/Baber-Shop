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
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Voucher;

public class VoucherDAO {

    // Connection method
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

    // Get Voucher by ID
    public static Voucher getVoucher(int id) {
        String sql = "SELECT code, value, expiryDate, status FROM Voucher WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String code = rs.getString("code");
                float value = rs.getFloat("value");
                Date expiryDate = rs.getDate("expiryDate");
                String status = rs.getString("status");
                return new Voucher(code, value, expiryDate, status);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching voucher: " + e);
        }
        return null;
    }

    // Get all Vouchers
    public static List<Voucher> getAllVouchers() {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT id, code, value, expiryDate, status FROM Voucher";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String code = rs.getString("code");
                float value = rs.getFloat("value");
                Date expiryDate = rs.getDate("expiryDate");
                String status = rs.getString("status");
                vouchers.add(new Voucher(code, value, expiryDate, status));
            }
            return vouchers;
        } catch (SQLException e) {
            System.out.println("Error fetching all vouchers: " + e);
        }
        return null;
    }

    // Insert a new Voucher
    public static void insertVoucher(String code, float value, Date expiryDate, String status) {
        String sql = "INSERT INTO Voucher (code, value, expiryDate, status) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, code);
            ps.setFloat(2, value);
            ps.setDate(3, expiryDate);
            ps.setString(4, status);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting voucher: " + e);
        }
    }

    // Delete a Voucher by ID
    public static void deleteVoucher(int id) {
        String sql = "DELETE FROM Voucher WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting voucher: " + e);
        }
    }
}
