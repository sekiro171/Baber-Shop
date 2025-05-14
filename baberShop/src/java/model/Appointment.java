
package model;

import java.time.LocalDateTime;

public class Appointment {
    private int id;
    private LocalDateTime appointmentDateTime;
    private double totalAmount;
    private boolean isPaidInShop;

    private User customer;
    private User barber;
    private Service service;

    public Appointment() {
    }

    public Appointment(int id, LocalDateTime appointmentDateTime, double totalAmount, boolean isPaidInShop, User customer, User barber, Service service) {
        this.id = id;
        this.appointmentDateTime = appointmentDateTime;
        this.totalAmount = totalAmount;
        this.isPaidInShop = isPaidInShop;
        this.customer = customer;
        this.barber = barber;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getAppointmentDateTime() {
        return appointmentDateTime;
    }

    public void setAppointmentDateTime(LocalDateTime appointmentDateTime) {
        this.appointmentDateTime = appointmentDateTime;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public boolean isIsPaidInShop() {
        return isPaidInShop;
    }

    public void setIsPaidInShop(boolean isPaidInShop) {
        this.isPaidInShop = isPaidInShop;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public User getBarber() {
        return barber;
    }

    public void setBarber(User barber) {
        this.barber = barber;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
    
    
}
