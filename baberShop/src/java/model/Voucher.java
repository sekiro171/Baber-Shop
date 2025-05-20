package model;

/**
 *
 * @author Sekiro
 */
import java.time.LocalDate;

public class Voucher {
    private int id;
    private String code;
    private double value;
    private LocalDate expiryDate;
    private String status;
    private int adminId;

    public Voucher() {
    }

    public Voucher(String code, double value, LocalDate expiryDate, String status) {
        this.code = code;
        this.value = value;
        this.expiryDate = expiryDate;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
}
