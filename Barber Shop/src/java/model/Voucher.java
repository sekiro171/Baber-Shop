package model;

import java.util.Date;

public class Voucher {
    private int id;
    private String code;
    private float value;
    private Date expiryDate;
    private String status;

    // Constructor không tham số
    public Voucher() { }

    // Constructor có tham số
    public Voucher(String code, float value, Date expiryDate, String status) {
        this.code = code;
        this.value = value;
        this.expiryDate = expiryDate;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public float getValue() { return value; }
    public void setValue(float value) { this.value = value; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

