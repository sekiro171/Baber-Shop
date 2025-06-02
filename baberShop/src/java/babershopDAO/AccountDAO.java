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
                String phoneNumber = rs.getString("phoneNumber");
                String role = rs.getString("role");
                Account account = new Account(id, email, password, role, 1, phoneNumber);
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static boolean checkExistedEmail(String email) {
        String sql = "Select * FROM Account WHERE email = ?";
        try (Connection conn = getConnect(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, email);
            return st.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updatePassByEmail(String password, String email) {
        String sql = "Update [Account] set [password] = ? FROM [Account] WHERE email =?";
        try (Connection conn = getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, password);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int addAccount(String email, String phoneNumber) {
        String sql = "INSERT INTO [dbo].[Account] (email, phoneNumber, password, role, status) VALUES (?,?, ?, 'Customer', 1); SELECT SCOPE_IDENTITY()";
        try (Connection conn = getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, phoneNumber != null ? phoneNumber : "");
            stmt.setString(3,"google-auth"); // Gán giá trị mặc đinhj cho password khi đăng nhập = gg
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static Account getAccountByEmail(String email) {
        String sql = "SELECT * FROM [dbo].[Account] WHERE email = ? AND status = 1";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String phoneNumber = rs.getString("phoneNumber");
                String role = rs.getString("role");
                return new Account(id, email, null, role, 1, phoneNumber);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static Account getAccountById(int id) {
        String sql = "SELECT id, email, phoneNumber, password, role FROM [Account] WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String password = rs.getString("password");
                String role = rs.getString("role");
                return new Account(id, email, password, role, 1, phoneNumber);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}