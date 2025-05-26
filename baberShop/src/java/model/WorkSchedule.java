package model;

/**
 *
 * @author Sekiro
 */
import java.time.LocalDate;
import java.time.LocalTime;

public class WorkSchedule {

    private int id;
    private int staffId;
    private LocalDate workDate;
    private LocalTime startTime;
    private LocalTime endTime;
    private String status;

    public WorkSchedule() {
    }

    public WorkSchedule(int staffId, LocalDate workDate, LocalTime startTime, LocalTime endTime, String status) {
        this.staffId = staffId;
        this.workDate = workDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    
    
    // Getters and Setters
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

    public LocalDate getWorkDate() {
        return workDate;
    }

    public void setWorkDate(LocalDate workDate) {
        this.workDate = workDate;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
