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

import model.Invoice;

public class InvoiceDAO {
    
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
    
    public static Invoice getInvoice(int appointmentId) {
        String sql = "SELECT id, appointmentId, totalAmount, voucherCode, receivedDate FROM Invoice WHERE appointmentId = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                int apptId = rs.getInt("appointmentId");
                float totalAmount = rs.getFloat("totalAmount");
                String voucherCode = rs.getString("voucherCode");
                Date receivedDate = rs.getTimestamp("receivedDate");
                
                Invoice invoice = new Invoice(apptId, totalAmount, voucherCode, receivedDate);
                invoice.setId(id);
                return invoice;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static List<Invoice> getAllInvoice() {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT id, appointmentId, totalAmount, voucherCode, receivedDate FROM Invoice";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int appointmentId = rs.getInt("appointmentId");
                float totalAmount = rs.getFloat("totalAmount");
                String voucherCode = rs.getString("voucherCode");
                Date receivedDate = rs.getTimestamp("receivedDate");
                
                Invoice invoice = new Invoice(appointmentId, totalAmount, voucherCode, receivedDate);
                invoice.setId(id);
                invoices.add(invoice);
            }
            return invoices;
        } catch (Exception e) {
            System.out.println(e);
        }
        return invoices;
    }
    
    public static void insertInvoice(float totalAmount, String voucherCode, Date receivedDate, int appointmentId) {
        String sql = "INSERT INTO Invoice (appointmentId, totalAmount, voucherCode, receivedDate) VALUES (?,?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            ps.setFloat(2, totalAmount);
            ps.setString(3, voucherCode);
            ps.setTimestamp(4, new Timestamp(receivedDate.getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}