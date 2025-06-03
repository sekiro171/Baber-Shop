package model;

public class StaffSchedule {
    private int id;
    private int staffId;
    private String workDate; // YYYY-MM-DD
    private String timeSlot; // e.g. "08:30"
    private String status;   // "available" or "booked"

    public StaffSchedule() {}

    public StaffSchedule(int staffId, String workDate, String timeSlot, String status) {
        this.staffId = staffId;
        this.workDate = workDate;
        this.timeSlot = timeSlot;
        this.status = status;
    }

    public StaffSchedule(int id, int staffId, String workDate, String timeSlot, String status) {
        this.id = id;
        this.staffId = staffId;
        this.workDate = workDate;
        this.timeSlot = timeSlot;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getWorkDate() {
        return workDate;
    }

    public void setWorkDate(String workDate) {
        this.workDate = workDate;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
} 
