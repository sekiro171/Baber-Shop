package model;

import java.time.LocalDate;

public class Invoice {
    private int id;
    private double amount;
    private String paymentStatus;
    private LocalDate receivedDate;
    private int appointmentId;
    private Integer voucherId;

    public Invoice() {
    }

    public Invoice(double amount, String paymentStatus, LocalDate receivedDate, int appointmentId, Integer voucherId) {
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.receivedDate = receivedDate;
        this.appointmentId = appointmentId;
        this.voucherId = voucherId;
    }

    
    
    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public LocalDate getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(LocalDate receivedDate) {
        this.receivedDate = receivedDate;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Integer getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Integer voucherId) {
        this.voucherId = voucherId;
    }
}
