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
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.Service;
import model.Voucher;

public class VoucherDAO {

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




    public static void insertVouher (String name, double price, int duration, String description) {
        String sql = "INSERT INTO Service (name, price, duration, description) VALUES (?,?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, duration);
            ps.setString(4, description);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
//        public static List <Voucher> vouchers () {
//        String sql = "Select * from Voucher";
//        try (Connection con = getConnect()) {
//            List <Voucher> vouchers = new ArrayList<>();
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                String code = rs.getString("code");
//                float value = rs.getFloat("value");
//                String expiryDate = rs.getString("expiryDate");
//                String status = rs.getString("status");
//                
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }
//    

    public static void deleteVoucher(int id) {
        String sql = "delete from Voucher where id=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
