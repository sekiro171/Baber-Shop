
package model;

import java.util.Date;

public class Feedback {
    private int id;
    private int customerId;
    private int staffId;
    private int appointmentId;
    private int serviceId;
    private int rating;
    private String comment;
    private Date feedbackTime;

    private Customer customer;
    private Staff staff;
    private Appointment appointment;
    private Service service;

    // Constructor không tham số
    public Feedback() { }

    // Constructor có tham số
    public Feedback(int customerId, int staffId, int appointmentId, int serviceId, int rating, String comment, Date feedbackTime) {
        this.customerId = customerId;
        this.staffId = staffId;
        this.appointmentId = appointmentId;
        this.serviceId = serviceId;
        this.rating = rating;
        this.comment = comment;
        this.feedbackTime = feedbackTime;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Date getFeedbackTime() { return feedbackTime; }
    public void setFeedbackTime(Date feedbackTime) { this.feedbackTime = feedbackTime; }
}
