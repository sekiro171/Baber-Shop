package model;

import java.util.Date;

public class Invoice {
    private int id;
    private int appointmentId;
    private float totalAmount;
    private String voucherCode;
    private Date receivedDate;

    private Appointment appointment;

    // Constructor không tham số
    public Invoice() { }

    // Constructor có tham số
    public Invoice(int appointmentId, float totalAmount, String voucherCode, Date receivedDate) {
        this.appointmentId = appointmentId;
        this.totalAmount = totalAmount;
        this.voucherCode = voucherCode;
        this.receivedDate = receivedDate;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }

    public String getVoucherCode() { return voucherCode; }
    public void setVoucherCode(String voucherCode) { this.voucherCode = voucherCode; }

    public Date getReceivedDate() { return receivedDate; }
    public void setReceivedDate(Date receivedDate) { this.receivedDate = receivedDate; }
}
