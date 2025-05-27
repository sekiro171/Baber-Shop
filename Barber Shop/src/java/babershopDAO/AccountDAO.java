package babershopDAO;

import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    private Connection connection;

    // Constructor to initialize database connection
    public AccountDAO(Connection connection) {
        this.connection = connection;
    }

    // Create a new account
    public void createAccount(Account account) throws SQLException {
        String sql = "INSERT INTO Account (email, phoneNumber, password, role, status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, account.getEmail());
            stmt.setString(2, account.getPhoneNumber());
            stmt.setString(3, account.getPassword());
            stmt.setString(4, account.getRole());
            stmt.setInt(5, account.getStatus());
            stmt.executeUpdate();

            // Retrieve the generated ID
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                account.setId(rs.getInt(1));
            }
        }
    }

    // Read an account by ID
    public Account getAccountById(int id) throws SQLException {
        String sql = "SELECT * FROM Account WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("password"),
                    rs.getString("role"),
                    rs.getInt("status")
                );
            }
            return null;
        }
    }

    // Read an account by email
    public Account getAccountByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Account(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("password"),
                    rs.getString("role"),
                    rs.getInt("status")
                );
            }
            return null;
        }
    }

    // Read all accounts
    public List<Account> getAllAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                accounts.add(new Account(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("password"),
                    rs.getString("role"),
                    rs.getInt("status")
                ));
            }
        }
        return accounts;
    }

    // Update an account
    public void updateAccount(Account account) throws SQLException {
        String sql = "UPDATE Account SET email = ?, phoneNumber = ?, password = ?, role = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, account.getEmail());
            stmt.setString(2, account.getPhoneNumber());
            stmt.setString(3, account.getPassword());
            stmt.setString(4, account.getRole());
            stmt.setInt(5, account.getStatus());
            stmt.setInt(6, account.getId());
            stmt.executeUpdate();
        }
    }

    // Delete an account by ID
    public void deleteAccount(int id) throws SQLException {
        String sql = "DELETE FROM Account WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}