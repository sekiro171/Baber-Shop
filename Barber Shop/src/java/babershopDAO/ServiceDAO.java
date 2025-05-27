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
        String sql = "SELECT id, name, price, duration, description, image FROM Service WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int serviceId = rs.getInt("id");
                String name = rs.getString("name");
                float price = rs.getFloat("price");
                int duration = rs.getInt("duration");
                String description = rs.getString("description");
                String image = rs.getString("image");
                
                Service service = new Service(name, price, duration, description, image);
                service.setId(serviceId);
                return service;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static List<Service> getAllService() {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT id, name, price, duration, description, image FROM Service";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                float price = rs.getFloat("price");
                int duration = rs.getInt("duration");
                String description = rs.getString("description");
                String image = rs.getString("image");
                
                Service service = new Service(name, price, duration, description, image);
                service.setId(id);
                services.add(service);
            }
            return services;
        } catch (Exception e) {
            System.out.println(e);
        }
        return services;
    }

    public static void insertService(String name, float price, int duration, String description, String image) {
        String sql = "INSERT INTO Service (name, price, duration, description, image) VALUES (?,?,?,?,?)";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, price);
            ps.setInt(3, duration);
            ps.setString(4, description);
            ps.setString(5, image);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void updateService(int id, String name, float price, int duration, String description, String image) {
        String sql = "UPDATE Service SET name = ?, price = ?, duration = ?, description = ?, image = ? WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, price);
            ps.setInt(3, duration);
            ps.setString(4, description);
            ps.setString(5, image);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteService(int id) {
        String sql = "DELETE FROM Service WHERE id = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}