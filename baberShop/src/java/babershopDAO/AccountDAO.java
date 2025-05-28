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
import model.Account;

public class AccountDAO {

    private static String password;

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static Account checkAccount(String email, String password) {
        String sql = "SELECT * FROM dbo.Account WHERE email = ? AND password = ? AND status = 1";
        try (Connection con = getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String role = rs.getString("role");
                Account account = new Account(id, email, password, role,1);
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null; // Nếu không tìm thấy tài khoản hợp lệ
    }

    // Câu lệnh để lấy thông tin của tài khoản dựa vào id (có thể dùng khi cần)
    public static Account getAccountById(int id) {
        String sql = "SELECT id, email, password role FROM [Account] WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                String role = rs.getString("role");
                return new Account(id, email,password, role,1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
