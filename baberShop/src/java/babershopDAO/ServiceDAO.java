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
import model.Service;
import model.Staff;

public class ServiceDAO {

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

    public static Service getService(int id) {
        String sql = "Select name ,price ,duration ,description from Service where id= ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                double price = rs.getDouble(2);
                int duration = rs.getInt(3);
                String description = rs.getString(4);
                Service service = new Service(name, price, duration, description);
                return service;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static List<Service> getAllService() {
        List<Service> services = new ArrayList<>();
        String sql = "Select name ,price ,duration ,description from Service";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                double price = rs.getDouble(2);
                int duration = rs.getInt(3);
                String description = rs.getString(4);
                Service service = new Service(name, price, duration, description);
                services.add(service);
            }
            return services;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void insertService(String name, double price, int duration, String description) {
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

    public static void updateService(int id, String name, double price, int duration, String description) {

        String sql = "UPDATE Service SET name = ?, price = ?, duration = ?, description = ? WHERE id = ?";

        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, duration);
            ps.setString(4, description);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteService(int id) {
        String sql = "delete from Service where id=?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        System.out.println("1");
    }
}
