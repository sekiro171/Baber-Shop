/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package babershopDAO;

import static babershopDAO.CustomerDAO.getConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Admin;
import model.Customer;
import model.Staff;
import org.apache.tomcat.dbcp.dbcp2.PoolingConnection;

/**
 *
 * @author Sekiro
 */
public class AccountDAO {

    public String changePassword(String email, String currentPassword, String newPassword) {
        String sql1 = "SELECT password FROM Account WHERE email = ?";
        String sql2 = "UPDATE Account SET password = ? WHERE email = ?";

        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql1);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Kiểm tra nếu mật khẩu cũ không đúng
                if (rs.getString(1).equals(currentPassword)) {
                    System.out.println(currentPassword);
                    // Kiểm tra mật khẩu mới khác với mật khẩu cũ
                    if (currentPassword.equals(newPassword)) {
                        return "Mật khẩu mới cần khác với mật khẩu hiện tại";
                    } else {
                        // Cập nhật mật khẩu mới
                        try (PreparedStatement ps2 = con.prepareStatement(sql2)) {
                            ps2.setString(1, newPassword); // Thay đổi mật khẩu
                            ps2.setString(2, email); // Điều kiện cập nhật
                            if (ps2.executeUpdate() > 0) {
                                return null; // Cập nhật thành công
                            } else {
                                return "Lỗi khi cập nhật mật khẩu";
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            return "Lỗi khi cập nhật mật khẩu";
                        }
                    }
                } else {
                    return "Mật khẩu hiện tại không đúng";
                }
            } else {
                return "Tài khoản không tồn tại";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi kết nối cơ sở dữ liệu";
        }
    }

   public String editProfile(int idAcount, String firstName, String lastName, String phoneNumber) {
    String sqlGetRole = "SELECT role FROM Account WHERE id=?";
    String sqlUpdatePhone = "UPDATE Account SET phoneNumber=? WHERE id=?";
    String sqlUpdateCustomer = "UPDATE Customer SET firstName=?, lastName=? WHERE accountID=?";
    String sqlUpdateStaff = "UPDATE Staff SET firstName=?, lastName=? WHERE accountID=?";
    String sqlUpdateAdmin = "UPDATE Admin SET firstName=?, lastName=? WHERE accountID=?";

    try (Connection con = getConnect();
         PreparedStatement psGetRole = con.prepareStatement(sqlGetRole)) {

        psGetRole.setInt(1, idAcount);
        try (ResultSet rs = psGetRole.executeQuery()) {
            if (rs.next()) {
                String role = rs.getString("role");

                try (PreparedStatement psUpdatePhone = con.prepareStatement(sqlUpdatePhone)) {
                    psUpdatePhone.setString(1, phoneNumber);
                    psUpdatePhone.setInt(2, idAcount);
                    psUpdatePhone.executeUpdate();
                }

                String updateSQL = switch (role) {
                    case "Customer" -> sqlUpdateCustomer;
                    case "Staff" -> sqlUpdateStaff;
                    case "Admin" -> sqlUpdateAdmin;
                    default -> null;
                };

                if (updateSQL != null) {
                    try (PreparedStatement psUpdate = con.prepareStatement(updateSQL)) {
                        psUpdate.setString(1, firstName);
                        psUpdate.setString(2, lastName);
                        psUpdate.setInt(3, idAcount);
                        int check = psUpdate.executeUpdate();
                        return (check > 0) ? "Change profile successful" : "Không thể edit profile";
                    }
                } else {
                    return "Không xác định được role";
                }
            } else {
                return "Không tìm thấy tài khoản";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        return "Lỗi khi cập nhật thông tin";
    }
}

    public String checkRole(int accountId) {
        String sql = "Select role from Account where id=?";
        try (Connection con = getConnect()) {

            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setInt(1, accountId);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String role = rs.getString("role");
                return role;
            }
        } catch (Exception e) {

        }
        return "Khong tim thay role";
    }
    
    public List <Customer> listCustomers (){
        String selectCustomer = "SELECT * FROM Customer c INNER JOIN Account a ON c.accountId = a.id;";
        try(Connection con = getConnect()){
            PreparedStatement ps1 = con.prepareStatement(selectCustomer);
            List<Customer> customers = new ArrayList<>();
            ResultSet rs = ps1.executeQuery();
            while(rs.next()){
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phoneNUmber");
                Customer customer = new Customer(email, phoneNumber, password, "Customer", 1, firstName, lastName);
                customers.add(customer);
            }
            return customers;
        }catch(Exception e){
            
        }
        return null;
    }
    
    public List <Staff> listStaffs (){
        String selectStaff = "SELECT * FROM Staff s INNER JOIN Account a ON s.accountId = a.id;";
        try(Connection con = getConnect()){
            PreparedStatement ps1 = con.prepareStatement(selectStaff);
            List<Staff> staffs = new ArrayList<>();
            ResultSet rs = ps1.executeQuery();
            while(rs.next()){
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phoneNUmber");
                Staff staff = new Staff(firstName, lastName, email, phoneNumber, password, email, 1);
                staffs.add(staff);
            }
            return staffs;
        }catch(Exception e){
            
        }
        return null;
    }
    
    public List <Admin> listAdmins (){
        String selectAdmin = "SELECT * FROM Admin admin INNER JOIN Account a ON admin.accountId = a.id;";
        try(Connection con = getConnect()){
            PreparedStatement ps1 = con.prepareStatement(selectAdmin);
            List<Admin> admins = new ArrayList<>();
            ResultSet rs = ps1.executeQuery();
            while(rs.next()){
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phoneNumber = rs.getString("phoneNUmber");
                Admin admin = new Admin(email, phoneNumber, password, email, 1, firstName, lastName);
                admins.add(admin);
            }
            return admins;
        }catch(Exception e){
            
        }
        return null;
    }
    
    

}
