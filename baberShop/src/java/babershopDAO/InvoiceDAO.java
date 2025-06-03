
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Invoice;
import model.Service;

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

  

  

    public static void insertInvoice(double amount, String paymentStatus, LocalDate receivedDate, int appointmentId, Integer voucherId) {
        String sql = "INSERT INTO Invloice (amount, paymentStatus, receivedDate, appointmentId, voucherId) VALUES (?,?,?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, amount);
            ps.setString(2,paymentStatus );
            String formattedDate = receivedDate.format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            ps.setString(3, formattedDate);
            ps.setInt(4, appointmentId);
            ps.setInt(4, voucherId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
