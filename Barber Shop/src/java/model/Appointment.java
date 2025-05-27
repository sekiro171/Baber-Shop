
package model;

import java.util.Date;

public class Appointment {
    private int id;
    private int customerId;
    private int staffId;
    private Date appointmentTime;
    private int numberOfPeople;
    private String status;

    private Customer customer;
    private Staff staff;

    // Constructor không tham số
    public Appointment() { }

    // Constructor có tham số
    public Appointment(int customerId, int staffId, Date appointmentTime, int numberOfPeople, String status) {
        this.customerId = customerId;
        this.staffId = staffId;
        this.appointmentTime = appointmentTime;
        this.numberOfPeople = numberOfPeople;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public Date getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(Date appointmentTime) { this.appointmentTime = appointmentTime; }

    public int getNumberOfPeople() { return numberOfPeople; }
    public void setNumberOfPeople(int numberOfPeople) { this.numberOfPeople = numberOfPeople; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
