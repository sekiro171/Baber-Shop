
package model;

import java.time.LocalDate;
import java.time.LocalTime;

public class WorkSchedule {
     private int id;
    private User barber; 
    private LocalDate workDate;
    private LocalTime startTime;
    private LocalTime endTime;
    private String status; 

    public WorkSchedule() {
    }

    public WorkSchedule(int id, User barber, LocalDate workDate, LocalTime startTime, LocalTime endTime, String status) {
        this.id = id;
        this.barber = barber;
        this.workDate = workDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getBarber() {
        return barber;
    }

    public void setBarber(User barber) {
        this.barber = barber;
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
